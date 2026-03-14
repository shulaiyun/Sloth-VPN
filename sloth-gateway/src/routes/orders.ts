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
    case 5:
      return { status: "expired", isFinal: true };
    default:
      return { status: "unknown", isFinal: false };
  }
};

const mapOrderType = (type: number): { key: string; label: string } => {
  switch (type) {
    case 1:
      return { key: "new_purchase", label: "新购" };
    case 2:
      return { key: "renewal", label: "续费" };
    case 3:
      return { key: "upgrade_or_downgrade", label: "套餐变更" };
    case 4:
      return { key: "reset_traffic", label: "重置流量" };
    default:
      return { key: "unknown", label: "未知" };
  }
};

const parseNumber = (value: unknown): number => {
  if (typeof value === "number" && Number.isFinite(value)) return value;
  if (typeof value === "string") {
    const parsed = Number(value);
    if (Number.isFinite(parsed)) return parsed;
  }
  return 0;
};

const toIsoTime = (value: unknown): string | null => {
  if (value == null) return null;
  if (typeof value === "number") {
    const ts = value > 9_999_999_999 ? value : value * 1000;
    return new Date(ts).toISOString();
  }
  const text = String(value).trim();
  if (!text) return null;
  const numeric = Number(text);
  if (Number.isFinite(numeric)) {
    const ts = numeric > 9_999_999_999 ? numeric : numeric * 1000;
    return new Date(ts).toISOString();
  }
  const parsed = new Date(text);
  if (Number.isNaN(parsed.getTime())) return null;
  return parsed.toISOString();
};

const normalizeOrder = (raw: Record<string, unknown>) => {
  const orderNo = String(raw.trade_no ?? raw.order_no ?? raw.orderNo ?? "").trim();
  const statusCode = parseNumber(raw.status);
  const statusMapped = mapOrderStatus(statusCode);
  const orderTypeCode = parseNumber(raw.type);
  const orderType = mapOrderType(orderTypeCode);
  const rawPlan = typeof raw.plan === "object" && raw.plan !== null ? (raw.plan as Record<string, unknown>) : null;
  return {
    order_no: orderNo,
    status_code: statusCode,
    status: statusMapped.status,
    is_final: statusMapped.isFinal,
    can_cancel: statusCode === 0,
    total_amount: parseNumber(raw.total_amount ?? raw.total_amount_cny ?? raw.total),
    handling_amount: parseNumber(raw.handling_amount),
    balance_amount: parseNumber(raw.balance_amount),
    discount_amount: parseNumber(raw.discount_amount),
    surplus_amount: parseNumber(raw.surplus_amount),
    refund_amount: parseNumber(raw.refund_amount),
    plan_id: parseNumber(raw.plan_id),
    plan_name: String(raw.plan_name ?? rawPlan?.name ?? "").trim(),
    period: String(raw.period ?? raw.billing_cycle ?? "").trim(),
    type_code: orderTypeCode,
    type: orderType.key,
    type_label: orderType.label,
    created_at: toIsoTime(raw.created_at),
    updated_at: toIsoTime(raw.updated_at),
    paid_at: toIsoTime(raw.paid_at),
    surplus_order_ids: Array.isArray(raw.surplus_order_ids) ? raw.surplus_order_ids : [],
  };
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

  app.get("/api/app/v1/orders", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const query = request.query as Record<string, unknown>;
    const statusFilter = typeof query.status === "string" ? query.status.trim().toLowerCase() : "all";
    const orderNoFilter = typeof query.order_no === "string" ? query.order_no.trim() : "";
    const rawOrders = await deps.xboard.getOrders(session.xboardAuthData);
    const normalized = rawOrders
      .map(normalizeOrder)
      .filter((item) => item.order_no.length > 0)
      .filter((item) => {
        if (orderNoFilter && !item.order_no.includes(orderNoFilter)) return false;
        if (!statusFilter || statusFilter === "all") return true;
        if (statusFilter === "paid") return item.status === "completed" || item.status === "discounted";
        if (statusFilter === "closed") return item.status === "cancelled";
        return item.status === statusFilter;
      });

    return ok(reply, {
      orders: normalized,
      total: normalized.length,
      fetched_at: new Date().toISOString(),
    });
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

  app.get("/api/app/v1/orders/:orderNo/detail", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const params = request.params as { orderNo: string };
    const raw = await deps.xboard.getOrderDetail(session.xboardAuthData, params.orderNo);
    const normalized = normalizeOrder(raw);
    if (!normalized.order_no) {
      throw new AppError(404, ErrorCodes.NOT_FOUND, "Order does not exist");
    }

    return ok(reply, {
      order: normalized,
      fetched_at: new Date().toISOString(),
    });
  });

  app.post("/api/app/v1/orders/:orderNo/cancel", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const params = request.params as { orderNo: string };
    const cancelled = await deps.xboard.cancelOrder(session.xboardAuthData, params.orderNo).catch((error): never => {
      if (error instanceof AppError && error.code === ErrorCodes.UPSTREAM_ERROR) {
        throw new AppError(400, ErrorCodes.ORDER_NOT_CANCELLABLE, "当前订单状态不可取消");
      }
      throw error;
    });
    return ok(reply, {
      order_no: params.orderNo,
      cancelled: cancelled === true,
      cancelled_at: new Date().toISOString(),
    });
  });
};

