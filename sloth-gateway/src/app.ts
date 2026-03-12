import Fastify from "fastify";
import { config } from "./config";
import { fail } from "./utils/response";
import { BindStore } from "./store/bind-store";
import { SessionStore } from "./store/session-store";
import { XboardAdapter } from "./adapter/xboard-adapter";
import { registerAuthRoutes } from "./routes/auth";
import { registerBootstrapRoutes } from "./routes/bootstrap";
import { registerSubscriptionRoutes } from "./routes/subscription";
import { registerOrderRoutes } from "./routes/orders";
import { registerPaymentRoutes } from "./routes/payment";

export const buildApp = () => {
  const app = Fastify({ logger: true });

  const binds = new BindStore();
  const sessions = new SessionStore();
  const xboard = new XboardAdapter(config.xboardBaseUrl, config.xboardTimeoutMs);

  app.get("/healthz", async (_, reply) => {
    return reply.send({ ok: true, service: "sloth-gateway", ts: new Date().toISOString() });
  });

  registerAuthRoutes(app, { binds, sessions, xboard });
  registerBootstrapRoutes(app, { sessions, xboard });
  registerSubscriptionRoutes(app, { sessions, xboard });
  registerOrderRoutes(app, { sessions, xboard });
  registerPaymentRoutes(app);

  app.setErrorHandler((error, request, reply) => {
    request.log.error({ err: error }, "request failed");
    return fail(reply, error);
  });

  return app;
};
