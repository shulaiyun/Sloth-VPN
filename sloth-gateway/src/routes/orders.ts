import type { FastifyInstance } from "fastify";
import { requireSession } from "../plugins/auth";
import { ok } from "../utils/response";
import type { SessionStore } from "../store/session-store";
import type { XboardAdapter } from "../adapter/xboard-adapter";

type OrderDeps = {
  sessions: SessionStore;
  xboard: XboardAdapter;
};

const mapOrderStatus = (code: number): { status: string; isFinal: boolean } => {
  switch (code) {
    case 0:
      return { status: "pending", isFinal: false };
    case 1:
      return { status: "processing", isFinal: false };
    case 2:
      return { status: "cancelled", isFinal: true };
    case 3:
      return { status: "completed", isFinal: true };
    case 4:
      return { status: "discounted", isFinal: true };
    default:
      return { status: "unknown", isFinal: false };
  }
};

export const registerOrderRoutes = (app: FastifyInstance, deps: OrderDeps): void => {
  app.get("/api/app/v1/orders/:orderNo/status", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const params = request.params as { orderNo: string };
    const statusCode = await deps.xboard.getOrderStatus(session.xboardAuthData, params.orderNo);
    const mapped = mapOrderStatus(statusCode);

    return ok(reply, {
      order_no: params.orderNo,
      status_code: statusCode,
      status: mapped.status,
      is_final: mapped.isFinal,
      checked_at: new Date().toISOString(),
    });
  });
};
