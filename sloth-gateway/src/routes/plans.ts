import type { FastifyInstance } from "fastify";
import type { XboardAdapter } from "../adapter/xboard-adapter";
import { requireSession } from "../plugins/auth";
import type { SessionStore } from "../store/session-store";
import { ok } from "../utils/response";

type PlanDeps = {
  sessions: SessionStore;
  xboard: XboardAdapter;
};

const periodLabels: Record<string, string> = {
  month_price: "Monthly",
  quarter_price: "Quarterly",
  half_year_price: "Semiannual",
  year_price: "Yearly",
  two_year_price: "2 Years",
  three_year_price: "3 Years",
  onetime_price: "One-time",
  reset_price: "Data Reset",
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
        return {
          id: Number(plan.id ?? 0),
          name: String(plan.name ?? ""),
          description: plan.content == null ? "" : String(plan.content),
          transfer_enable: Number(plan.transfer_enable ?? 0),
          speed_limit: plan.speed_limit == null ? null : Number(plan.speed_limit),
          device_limit: plan.device_limit == null ? null : Number(plan.device_limit),
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
