import type { FastifyInstance } from "fastify";
import type { XboardAdapter } from "../adapter/xboard-adapter";
import { config } from "../config";
import { requireSession } from "../plugins/auth";
import type { SessionStore } from "../store/session-store";
import { ok } from "../utils/response";
import { normalizeTrafficQuota } from "../utils/traffic";

type PlanDeps = {
  sessions: SessionStore;
  xboard: XboardAdapter;
};

const toText = (value: unknown): string => String(value ?? "").trim();

const cleanSummary = (raw: unknown, limit = 220): string => {
  const normalized = toText(raw)
    .replace(/<br\s*\/?>/gi, " ")
    .replace(/<\/p>/gi, " ")
    .replace(/<[^>]*>/g, " ")
    .replace(/\[(.*?)\]\((.*?)\)/g, "$1")
    .replace(/[*_`~>#]+/g, " ")
    .replace(/\s+/g, " ")
    .trim();
  if (!normalized) return "";
  return normalized.length > limit ? `${normalized.slice(0, limit)}...` : normalized;
};

const toHighlights = (value: unknown): string[] => {
  if (Array.isArray(value)) {
    return value.map((item) => cleanSummary(item, 48)).filter((item) => item.length > 0).slice(0, 6);
  }
  const raw = toText(value);
  if (!raw) return [];
  try {
    const parsed = JSON.parse(raw) as unknown;
    if (Array.isArray(parsed)) {
      return parsed.map((item) => cleanSummary(item, 48)).filter((item) => item.length > 0).slice(0, 6);
    }
  } catch {
    // ignore parse error and fallback to split by separators
  }
  return raw
    .split(/[\n;|]/g)
    .map((item) => cleanSummary(item, 48))
    .filter((item) => item.length > 0)
    .slice(0, 6);
};

const periodLabels: Record<string, string> = {
  month_price: "月付",
  quarter_price: "季付",
  half_year_price: "半年",
  year_price: "年付",
  two_year_price: "两年",
  three_year_price: "三年",
  onetime_price: "一次性",
  reset_price: "重置流量",
};

const periodSortOrder = [
  "month_price",
  "quarter_price",
  "half_year_price",
  "year_price",
  "two_year_price",
  "three_year_price",
  "onetime_price",
  "reset_price",
];

export const registerPlanRoutes = (app: FastifyInstance, deps: PlanDeps): void => {
  app.get("/api/app/v1/plans", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const plans = await deps.xboard.getPlans(session.xboardAuthData);

    const normalized = plans
      .map((plan) => {
        const periods = periodSortOrder
          .map((code) => {
            const raw = plan[code];
            const price = typeof raw === "number" ? raw : Number(raw ?? 0);
            if (!Number.isFinite(price) || price <= 0) return null;
            return { code, label: periodLabels[code] ?? code, price };
          })
          .filter((item): item is { code: string; label: string; price: number } => item !== null);

        const tags = Array.isArray(plan.tags) ? plan.tags.map((t) => String(t)) : [];
        const traffic = normalizeTrafficQuota(plan.transfer_enable, config.xboardTrafficUnit);
        const summaryFromDisplay = cleanSummary((plan as Record<string, unknown>).display_summary);
        const summaryFromContent = cleanSummary(plan.content, 220);
        const displaySummary = summaryFromDisplay || summaryFromContent;
        const displayHighlights = toHighlights(
          (plan as Record<string, unknown>).display_highlights_json ??
            (plan as Record<string, unknown>).display_highlights,
        );
        const capacityLimit = toText((plan as Record<string, unknown>).capacity_limit).toLowerCase();
        const hiddenReason = !periods.length
          ? "no_period"
          : plan.sell == null
          ? null
          : plan.sell === true || String(plan.sell) === "1"
          ? null
          : "sell_disabled";

        return {
          id: Number(plan.id ?? 0),
          name: String(plan.name ?? ""),
          description: plan.content == null ? "" : String(plan.content),
          display_summary: displaySummary,
          display_highlights_json: displayHighlights,
          display_badge: toText((plan as Record<string, unknown>).display_badge) || null,
          display_sort:
            Number.isFinite(Number((plan as Record<string, unknown>).display_sort)) &&
            Number((plan as Record<string, unknown>).display_sort) > 0
              ? Number((plan as Record<string, unknown>).display_sort)
              : Number(plan.sort ?? 0),
          hidden_reason:
            hiddenReason ??
            (capacityLimit.includes("sold out") || capacityLimit.includes("售罄") ? "capacity_limit" : null),
          transfer_enable: traffic.bytes,
          transfer_enable_raw: traffic.raw,
          transfer_unit_detected: traffic.unit,
          speed_limit: plan.speed_limit == null ? null : Number(plan.speed_limit),
          device_limit: plan.device_limit == null ? null : Number(plan.device_limit),
          renewable: plan.renew == null ? true : plan.renew === true || String(plan.renew) === "1",
          sell: plan.sell == null ? true : plan.sell === true || String(plan.sell) === "1",
          tags,
          periods,
        };
      })
      .filter((plan) => plan.id > 0 && plan.name.length > 0);

    return ok(reply, {
      plans: normalized,
      currency: "CNY",
      fetched_at: new Date().toISOString(),
    });
  });
};
