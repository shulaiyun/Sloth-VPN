import Fastify from "fastify";
import { config } from "./config";
import { AppError, ErrorCodes } from "./errors";
import { fail } from "./utils/response";
import { BindStore } from "./store/bind-store";
import { SessionStore } from "./store/session-store";
import { XboardAdapter } from "./adapter/xboard-adapter";
import { registerAuthRoutes } from "./routes/auth";
import { registerBootstrapRoutes } from "./routes/bootstrap";
import { registerSubscriptionRoutes } from "./routes/subscription";
import { registerOrderRoutes } from "./routes/orders";
import { registerPaymentRoutes } from "./routes/payment";
import { registerPlanRoutes } from "./routes/plans";
import { registerAccountRoutes } from "./routes/account";
import { registerContentRoutes } from "./routes/content";

export const buildApp = () => {
  const app = Fastify({
    logger: true,
    routerOptions: {
      ignoreTrailingSlash: true,
    },
  });

  app.removeContentTypeParser("application/json");
  app.addContentTypeParser("application/json", { parseAs: "string" }, (request, body, done) => {
    const payload = typeof body === "string" ? body.trim() : "";
    if (!payload) {
      done(null, {});
      return;
    }
    try {
      done(null, JSON.parse(payload));
    } catch (error) {
      request.log.warn({ err: error }, "invalid json payload");
      done(error as Error);
    }
  });

  const binds = new BindStore();
  const sessions = new SessionStore();
  const xboard = new XboardAdapter(config.xboardBaseUrl, config.xboardTimeoutMs);

  app.get("/healthz", async (_, reply) => {
    return reply.send({ ok: true, service: "sloth-gateway", ts: new Date().toISOString() });
  });

  registerAuthRoutes(app, { binds, sessions, xboard });
  registerBootstrapRoutes(app, { sessions, xboard });
  registerSubscriptionRoutes(app, { sessions, xboard });
  registerPlanRoutes(app, { sessions, xboard });
  registerOrderRoutes(app, { sessions, xboard });
  registerAccountRoutes(app, { sessions, xboard, xboardWebBaseUrl: config.xboardWebBaseUrl });
  registerContentRoutes(app, { sessions, xboard });
  registerPaymentRoutes(app);

  app.setNotFoundHandler((request, reply) => {
    return fail(
      reply,
      new AppError(404, ErrorCodes.NOT_FOUND, `Route not found: ${request.method} ${request.url}`),
    );
  });

  app.setErrorHandler((error, request, reply) => {
    request.log.error({ err: error }, "request failed");
    return fail(reply, error);
  });

  return app;
};
