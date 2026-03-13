import type { FastifyInstance } from "fastify";
import type { XboardAdapter } from "../adapter/xboard-adapter";
import { AppError, ErrorCodes } from "../errors";
import { requireSession } from "../plugins/auth";
import type { SessionStore } from "../store/session-store";
import { ok } from "../utils/response";

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
  app.get("/api/app/v1/orders/payment-methods", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const methods = await deps.xboard.getPaymentMethods(session.xboardAuthData);
    const normalized = methods.map((item) => ({
      id: Number(item.id ?? 0),
      name: String(item.name ?? ""),
      payment: String(item.payment ?? ""),
      icon: String(item.icon ?? ""),
      handling_fee_fixed: Number(item.handling_fee_fixed ?? 0),
      handling_fee_percent: Number(item.handling_fee_percent ?? 0),
    }));
    return ok(reply, { methods: normalized });
  });

  app.post("/api/app/v1/orders", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const body = (request.body ?? {}) as Record<string, unknown>;
    const planId = Number(body.plan_id);
    const period = String(body.period ?? "").trim();
    if (!Number.isFinite(planId) || planId <= 0 || !period) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "plan_id and period are required");
    }

    const orderNo = await deps.xboard.createOrder({
      authData: session.xboardAuthData,
      planId,
      period,
      couponCode: typeof body.coupon_code === "string" ? body.coupon_code : undefined,
    });

    return ok(reply, {
      order_no: orderNo,
      created_at: new Date().toISOString(),
    });
  });

  app.post("/api/app/v1/orders/:orderNo/pay", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const params = request.params as { orderNo: string };
    const body = (request.body ?? {}) as Record<string, unknown>;
    const paymentMethodId = Number(body.payment_method_id ?? body.method_id ?? body.method);
    if (!Number.isFinite(paymentMethodId) || paymentMethodId <= 0) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "payment_method_id is required");
    }

    const checkout = await deps.xboard.checkoutOrder({
      authData: session.xboardAuthData,
      orderNo: params.orderNo,
      paymentMethodId,
      token: typeof body.token === "string" ? body.token : undefined,
    });
    const paymentData = checkout.data == null ? "" : String(checkout.data);
    const paymentUrl = /^https?:\/\//i.test(paymentData) ? paymentData : null;
    const completed = checkout.type === -1;

    return ok(reply, {
      order_no: params.orderNo,
      payment_type: checkout.type,
      payment_data: paymentData,
      payment_url: paymentUrl,
      completed,
      status: completed ? "completed" : "pending",
    });
  });

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
