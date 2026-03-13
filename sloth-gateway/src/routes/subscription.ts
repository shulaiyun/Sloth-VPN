import type { FastifyInstance } from "fastify";
import { createHash } from "node:crypto";
import { config } from "../config";
import { AppError, ErrorCodes } from "../errors";
import { requireSession } from "../plugins/auth";
import type { SessionStore } from "../store/session-store";
import { signPullToken, verifyPullToken } from "../utils/jwt";
import { ok } from "../utils/response";
import type { XboardAdapter } from "../adapter/xboard-adapter";

type SubscriptionDeps = {
  sessions: SessionStore;
  xboard: XboardAdapter;
};

const getSessionByQueryToken = (token: string | undefined, sessions: SessionStore) => {
  if (!token) return undefined;
  const payload = verifyPullToken(token);
  const session = sessions.get(payload.sid);
  if (!session) throw new AppError(401, ErrorCodes.UNAUTHORIZED, "Session expired or not found");
  return session;
};

export const registerSubscriptionRoutes = (app: FastifyInstance, deps: SubscriptionDeps): void => {
  app.get("/api/app/v1/subscription", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const subscribe = await deps.xboard.getSubscribe(session.xboardAuthData);
    const pullToken = signPullToken(session.sid);
    const pullUrl = `${config.publicBaseUrl}/api/app/v1/subscription/pull?token=${encodeURIComponent(pullToken)}`;

    return ok(reply, {
      pull_url: pullUrl,
      version: session.subscriptionVersion ?? null,
      last_synced_at: session.lastSyncedAt ?? null,
      node_count: session.nodeCount ?? null,
      expired_at: subscribe.expired_at ?? null,
      reset_day: subscribe.reset_day ?? null,
      plan_name: subscribe.plan?.name ?? null,
    });
  });

  app.post("/api/app/v1/subscription/sync", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const body = (request.body ?? {}) as Record<string, unknown>;
    const force = body.force === true;
    request.log.info({ evt: "subscription_sync", sid: session.sid, force });

    const subscribe = await deps.xboard.getSubscribe(session.xboardAuthData);
    const pulled = await deps.xboard.fetchSubscriptionContent(subscribe.subscribe_url);

    const prevVersion = session.subscriptionVersion;
    const changed = prevVersion !== pulled.version;

    deps.sessions.update(session.sid, {
      subscriptionVersion: pulled.version,
      nodeCount: pulled.nodeCount,
      lastSyncedAt: new Date().toISOString(),
    });

    const pullToken = signPullToken(session.sid);
    const pullUrl = `${config.publicBaseUrl}/api/app/v1/subscription/pull?token=${encodeURIComponent(pullToken)}`;

    return ok(reply, {
      changed,
      version: pulled.version,
      node_count: pulled.nodeCount,
      last_synced_at: new Date().toISOString(),
      pull_url: pullUrl,
    });
  });

  app.get("/api/app/v1/subscription/pull", async (request, reply) => {
    const query = request.query as Record<string, unknown>;
    const queryToken = typeof query.token === "string" ? query.token : undefined;
    const session = getSessionByQueryToken(queryToken, deps.sessions) ?? requireSession(request, deps.sessions);

    const subscribe = await deps.xboard.getSubscribe(session.xboardAuthData);
    const pulled = await deps.xboard.fetchSubscriptionContent(subscribe.subscribe_url);

    deps.sessions.update(session.sid, {
      subscriptionVersion: pulled.version,
      nodeCount: pulled.nodeCount,
      lastSyncedAt: new Date().toISOString(),
    });

    reply.header("content-type", "text/plain; charset=utf-8");
    reply.header("x-sloth-sub-version", pulled.version);
    reply.header("cache-control", "no-store, no-cache, must-revalidate");
    return reply.send(pulled.raw);
  });
};
