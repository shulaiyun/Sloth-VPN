import type { FastifyInstance } from "fastify";
import { config } from "../config";
import { ok } from "../utils/response";
import { signPullToken } from "../utils/jwt";
import { requireSession } from "../plugins/auth";
import type { SessionStore } from "../store/session-store";
import type { XboardAdapter } from "../adapter/xboard-adapter";

type BootstrapDeps = {
  sessions: SessionStore;
  xboard: XboardAdapter;
};

export const registerBootstrapRoutes = (app: FastifyInstance, deps: BootstrapDeps): void => {
  app.get("/api/app/v1/bootstrap", async (request, reply) => {
    const session = requireSession(request, deps.sessions);

    const [user, subscribe] = await Promise.all([
      deps.xboard.getUserInfo(session.xboardAuthData),
      deps.xboard.getSubscribe(session.xboardAuthData),
    ]);

    const pullToken = signPullToken(session.sid);
    const pullUrl = `${config.publicBaseUrl}/api/app/v1/subscription/pull?token=${encodeURIComponent(pullToken)}`;

    return ok(reply, {
      user: {
        id: subscribe.uuid,
        email: user.email,
        plan_name: subscribe.plan?.name ?? null,
        expired_at: subscribe.expired_at ?? null,
        traffic_used: (subscribe.u ?? 0) + (subscribe.d ?? 0),
        traffic_total: subscribe.transfer_enable ?? user.transfer_enable ?? 0,
        balance: user.balance ?? 0,
      },
      subscription: {
        pull_url: pullUrl,
        last_synced_at: session.lastSyncedAt ?? null,
        version: session.subscriptionVersion ?? null,
        node_count: session.nodeCount ?? null,
        reset_day: subscribe.reset_day ?? null,
      },
      links: {
        telegram: config.defaultTelegramUrl,
        github: config.defaultGithubUrl,
      },
    });
  });
};
