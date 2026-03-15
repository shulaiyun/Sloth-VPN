import type { FastifyInstance } from "fastify";
import type { XboardAdapter } from "../adapter/xboard-adapter";
import { AppError, ErrorCodes } from "../errors";
import { requireSession } from "../plugins/auth";
import type { SessionStore } from "../store/session-store";
import { ok } from "../utils/response";
import { toIsoTimeOrNull } from "../utils/time";

type OrderDeps = {
  sessions: SessionStore;
  xboard: XboardAdapter;
};

const parseNumber = (value: unknown): number => {
  if (typeof value === "number" && Number.isFinite(value)) return value;
  if (typeof value === "string") {
    const parsed = Number(value);
    if (Number.isFinite(parsed)) return parsed;
  }
  return 0;
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

const normalizeOrder = (raw: Record<string, unknown>) => {
  const orderNo = String(raw.trade_no ?? raw.order_no ?? raw.orderNo ?? "").trim();
  const statusCode = parseNumber(raw.status);
  const mappedStatus = mapOrderStatus(statusCode);
  const typeCode = parseNumber(raw.type);
  const mappedType = mapOrderType(typeCode);
  const rawPlan = typeof raw.plan === "object" && raw.plan !== null ? (raw.plan as Record<string, unknown>) : null;

  return {
    order_no: orderNo,
    status_code: statusCode,
    status: mappedStatus.status,
    is_final: mappedStatus.isFinal,
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
    type_code: typeCode,
    type: mappedType.key,
    type_label: mappedType.label,
    created_at: toIsoTimeOrNull(raw.created_at),
    updated_at: toIsoTimeOrNull(raw.updated_at),
    paid_at: toIsoTimeOrNull(raw.paid_at),
    surplus_order_ids: Array.isArray(raw.surplus_order_ids) ? raw.surplus_order_ids : [],
  };
};

const extractOrderError = (error: AppError): {
  status: number;
  path: string;
  text: string;
  upstreamMessage: string;
} => {
  const details = (error.details ?? {}) as Record<string, unknown>;
  const upstreamStatusRaw = details.upstream_status;
  const upstreamPath = String(details.upstream_path ?? "").trim();
  const upstreamError = details.upstream_error;

  let upstreamMessage = "";
  if (upstreamError && typeof upstreamError === "object") {
    const mapped = upstreamError as Record<string, unknown>;
    upstreamMessage = String(mapped.message ?? "").trim();
  } else if (typeof upstreamError === "string") {
    upstreamMessage = upstreamError.trim();
  }

  const status =
    typeof upstreamStatusRaw === "number"
      ? upstreamStatusRaw
      : Number.isFinite(Number(upstreamStatusRaw))
      ? Number(upstreamStatusRaw)
      : 0;

  const mergedText = `${error.message} ${upstreamMessage} ${JSON.stringify(details)}`.toLowerCase();

  return { status, path: upstreamPath, text: mergedText, upstreamMessage };
};

const containsAny = (text: string, patterns: string[]): boolean => patterns.some((item) => text.includes(item));

const mapUpstreamOrderError = (error: unknown): never => {
  if (!(error instanceof AppError)) {
    throw error;
  }
  if (error.code !== ErrorCodes.UPSTREAM_ERROR) {
    throw error;
  }

  const extracted = extractOrderError(error);
  const { status, path, text, upstreamMessage } = extracted;

  const isCreate = path.endsWith("/api/v1/user/order/save") || path.endsWith("/api/v2/user/order/save");
  const isCheckout = path.endsWith("/api/v1/user/order/checkout") || path.endsWith("/api/v2/user/order/checkout");
  const isCancel = path.endsWith("/api/v1/user/order/cancel") || path.endsWith("/api/v2/user/order/cancel");

  if (
    (isCreate && status === 400) ||
    containsAny(text, [
      "未付款或开通中的订单",
      "未付款订单",
      "未支付订单",
      "pending order",
      "unpaid order",
      "pending payment",
    ])
  ) {
    throw new AppError(409, ErrorCodes.ORDER_PENDING_EXISTS, "您有未付款订单，请先支付或取消当前订单");
  }

  if (
    containsAny(text, [
      "待生效",
      "开通中的订单",
      "waiting effective",
      "wait effective",
      "activating",
    ])
  ) {
    throw new AppError(409, ErrorCodes.ORDER_WAITING_EFFECTIVE, "您有待生效订单，请稍后再试");
  }

  if (
    (isCheckout && status === 400 && containsAny(text, ["paid", "已支付", "已经支付"])) ||
    containsAny(text, ["already paid", "已支付", "已经支付"])
  ) {
    throw new AppError(409, ErrorCodes.ORDER_ALREADY_PAID, "该订单已支付，无需重复支付");
  }

  if (
    (isCancel && status === 400) ||
    containsAny(text, ["cannot cancel", "不可取消", "不能取消", "已取消", "already cancelled", "already canceled"])
  ) {
    throw new AppError(400, ErrorCodes.ORDER_NOT_CANCELLABLE, "当前订单状态不可取消");
  }

  if (status >= 400 && status < 500 && upstreamMessage.trim().length > 0) {
    throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, upstreamMessage.trim());
  }

  throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "订单服务暂时不可用，请稍后重试");
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

    let orderNo = "";
    try {
      orderNo = await deps.xboard.createOrder({
        authData: session.xboardAuthData,
        planId,
        period,
        couponCode: typeof body.coupon_code === "string" ? body.coupon_code : undefined,
      });
    } catch (err) {
      try {
        mapUpstreamOrderError(err);
      } catch (mapped) {
        if (
          mapped instanceof AppError &&
          (mapped.code === ErrorCodes.ORDER_PENDING_EXISTS || mapped.code === ErrorCodes.ORDER_WAITING_EFFECTIVE)
        ) {
          const rawOrders = await deps.xboard.getOrders(session.xboardAuthData).catch(() => []);
          const normalizedOrders = Array.isArray(rawOrders) ? rawOrders.map(normalizeOrder) : [];
          const pendingLike = normalizedOrders.find(
            (item) => item.status === "pending" || item.status === "processing",
          );
          throw new AppError(
            mapped.statusCode ?? 409,
            mapped.code,
            mapped.message,
            pendingLike
              ? {
                  ...(mapped.details ?? {}),
                  existing_order_no: pendingLike.order_no,
                  existing_order_status: pendingLike.status,
                }
              : mapped.details,
          );
        }
        throw mapped;
      }
    }

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

    const checkout = await deps.xboard
      .checkoutOrder({
        authData: session.xboardAuthData,
        orderNo: params.orderNo,
        paymentMethodId,
        token: typeof body.token === "string" ? body.token : undefined,
      })
      .catch((err): never => mapUpstreamOrderError(err));

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
    const cancelled = await deps.xboard
      .cancelOrder(session.xboardAuthData, params.orderNo)
      .catch((err): never => mapUpstreamOrderError(err));

    return ok(reply, {
      order_no: params.orderNo,
      cancelled: cancelled === true,
      cancelled_at: new Date().toISOString(),
    });
  });
};
