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
        return {
          id: Number(plan.id ?? 0),
          name: String(plan.name ?? ""),
          description: plan.content == null ? "" : String(plan.content),
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
