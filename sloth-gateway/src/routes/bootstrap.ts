import type { FastifyInstance, FastifyReply, FastifyRequest } from "fastify";
import { config } from "../config";
import { requireSession } from "../plugins/auth";
import type { SessionStore } from "../store/session-store";
import type { XboardAdapter } from "../adapter/xboard-adapter";
import { signPullToken } from "../utils/jwt";
import { ok } from "../utils/response";

type BootstrapDeps = {
  sessions: SessionStore;
  xboard: XboardAdapter;
};

const buildAccountSummary = async (
  deps: BootstrapDeps,
  sid: string,
  xboardAuthData: string,
  session: ReturnType<SessionStore["get"]>,
) => {
  const [user, subscribe] = await Promise.all([
    deps.xboard.getUserInfo(xboardAuthData),
    deps.xboard.getSubscribe(xboardAuthData),
  ]);

  const pullToken = signPullToken(sid);
  const pullUrl = `${config.publicBaseUrl}/api/app/v1/subscription/pull?token=${encodeURIComponent(pullToken)}`;
  const ticketUrl = config.defaultTicketUrl || `${config.xboardWebBaseUrl}/#/ticket`;
  const noticeUrl = config.defaultNoticeUrl || `${config.xboardWebBaseUrl}/#/notice`;

  const toIsoTime = (value: unknown): string | null => {
    if (value == null) return null;
    if (typeof value === "number") {
      const ts = value > 9_999_999_999 ? value : value * 1000;
      return new Date(ts).toISOString();
    }
    const text = String(value).trim();
    if (!text) return null;
    const parsed = Number(text);
    if (Number.isFinite(parsed)) {
      const ts = parsed > 9_999_999_999 ? parsed : parsed * 1000;
      return new Date(ts).toISOString();
    }
    const date = new Date(text);
    return Number.isNaN(date.getTime()) ? text : date.toISOString();
  };

  return {
    user: {
      id: subscribe.uuid,
      email: user.email,
      plan_name: subscribe.plan?.name ?? null,
      expired_at: toIsoTime(subscribe.expired_at),
      traffic_used: (subscribe.u ?? 0) + (subscribe.d ?? 0),
      traffic_total: subscribe.transfer_enable ?? user.transfer_enable ?? 0,
      balance: user.balance ?? 0,
    },
    subscription: {
      pull_url: pullUrl,
      last_synced_at: session?.lastSyncedAt ?? null,
      version: session?.subscriptionVersion ?? null,
      node_count: session?.nodeCount ?? null,
      reset_day: subscribe.reset_day ?? null,
    },
    links: {
      telegram: config.defaultTelegramUrl,
      github: config.defaultGithubUrl,
      tickets: ticketUrl,
      notices: noticeUrl,
    },
  };
};

const readInviteSummarySafe = async (deps: BootstrapDeps, authData: string, subscribeUrl: string) => {
  try {
    const summary = await deps.xboard.getInviteSummary(authData);
    return {
      invite_code: summary.inviteCode,
      invite_url: summary.inviteUrl ?? (summary.inviteCode ? `${subscribeUrl}&code=${encodeURIComponent(summary.inviteCode)}` : null),
      rebate_total: summary.rebateTotal,
      rebate_pending: summary.rebatePending,
      invited_count: summary.invitedCount,
      supported: true,
    };
  } catch {
    return {
      invite_code: null,
      invite_url: null,
      rebate_total: 0,
      rebate_pending: 0,
      invited_count: 0,
      supported: false,
    };
  }
};

export const registerBootstrapRoutes = (app: FastifyInstance, deps: BootstrapDeps): void => {
  const handleSummary = async (request: FastifyRequest, reply: FastifyReply) => {
    const session = requireSession(request, deps.sessions);
    const data = await buildAccountSummary(deps, session.sid, session.xboardAuthData, session);
    return ok(reply, data);
  };

  app.get("/api/app/v1/bootstrap", async (request, reply) => {
    return handleSummary(request, reply);
  });

  app.get("/api/app/v1/account/summary", async (request, reply) => {
    return handleSummary(request, reply);
  });

  app.get("/api/app/v1/invite/summary", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const subscribe = await deps.xboard.getSubscribe(session.xboardAuthData);
    const data = await readInviteSummarySafe(deps, session.xboardAuthData, subscribe.subscribe_url);
    return ok(reply, data);
  });
};
