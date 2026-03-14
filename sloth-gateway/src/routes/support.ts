import type { FastifyInstance } from "fastify";
import type { XboardAdapter } from "../adapter/xboard-adapter";
import { AppError, ErrorCodes } from "../errors";
import { requireSession } from "../plugins/auth";
import type { SessionStore } from "../store/session-store";
import { ok } from "../utils/response";
import { toIsoTimeOrNull } from "../utils/time";

type SupportDeps = {
  sessions: SessionStore;
  xboard: XboardAdapter;
};

const toNumber = (value: unknown): number => {
  if (typeof value === "number" && Number.isFinite(value)) return value;
  const parsed = Number(value);
  return Number.isFinite(parsed) ? parsed : 0;
};

const toText = (value: unknown): string => String(value ?? "").trim();

const toRecord = (value: unknown): Record<string, unknown> =>
  value && typeof value === "object" && !Array.isArray(value) ? (value as Record<string, unknown>) : {};

const toRecordList = (value: unknown): Array<Record<string, unknown>> =>
  Array.isArray(value)
    ? value.filter(
        (item): item is Record<string, unknown> =>
          item && typeof item === "object" && !Array.isArray(item),
      )
    : [];

const levelLabel = (level: number): string => {
  switch (level) {
    case 0:
      return "低";
    case 2:
      return "高";
    default:
      return "中";
  }
};

const replyStatusLabel = (status: number): string => {
  switch (status) {
    case 1:
      return "客服待回复";
    default:
      return "等待用户回复";
  }
};

const normalizeMessage = (raw: Record<string, unknown>) => ({
  id: toNumber(raw.id),
  ticket_id: toNumber(raw.ticket_id),
  is_me: raw.is_me === true || raw.is_from_user === true,
  message: toText(raw.message),
  created_at: toIsoTimeOrNull(raw.created_at),
  updated_at: toIsoTimeOrNull(raw.updated_at),
});

const normalizeTicket = (raw: Record<string, unknown>) => {
  const statusCode = toNumber(raw.status);
  const replyStatus = toNumber(raw.reply_status);
  const messages = toRecordList(raw.message).map(normalizeMessage);
  const level = toNumber(raw.level);

  return {
    id: toNumber(raw.id),
    subject: toText(raw.subject),
    level,
    level_label: levelLabel(level),
    status_code: statusCode,
    status: statusCode === 1 ? "closed" : "open",
    reply_status: replyStatus,
    reply_status_label: replyStatusLabel(replyStatus),
    can_reply: statusCode !== 1,
    can_close: statusCode !== 1,
    created_at: toIsoTimeOrNull(raw.created_at),
    updated_at: toIsoTimeOrNull(raw.updated_at),
    messages,
  };
};

const mapTicketError = (error: unknown): never => {
  if (!(error instanceof AppError)) throw error;
  if (error.code !== ErrorCodes.UPSTREAM_ERROR) throw error;

  const details = toRecord(error.details);
  const status = toNumber(details.upstream_status);
  const upstreamPath = toText(details.upstream_path).toLowerCase();
  const upstreamError = details.upstream_error;
  const upstreamMessage =
    upstreamError && typeof upstreamError === "object"
      ? toText((upstreamError as Record<string, unknown>).message)
      : toText(upstreamError);
  const mergedText = `${error.message} ${upstreamMessage} ${JSON.stringify(details)}`.toLowerCase();

  if (status === 401 || status === 403) {
    throw new AppError(401, ErrorCodes.UNAUTHORIZED, "登录状态已失效，请重新登录");
  }
  if (
    status === 404 ||
    mergedText.includes("ticket does not exist") ||
    mergedText.includes("ticket not found") ||
    mergedText.includes("工单不存在")
  ) {
    throw new AppError(404, ErrorCodes.NOT_FOUND, "工单不存在");
  }
  if (mergedText.includes("closed") && mergedText.includes("cannot be replied")) {
    throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "工单已关闭，无法继续回复");
  }
  if (
    mergedText.includes("message cannot be empty") ||
    mergedText.includes("内容不能为空") ||
    mergedText.includes("message is required")
  ) {
    throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "回复内容不能为空");
  }
  if (status >= 400 && status < 500) {
    throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, upstreamMessage || "工单请求参数不正确", {
      upstream_path: upstreamPath,
      upstream_status: status,
    });
  }

  throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "工单服务暂时不可用，请稍后重试");
};

export const registerSupportRoutes = (app: FastifyInstance, deps: SupportDeps): void => {
  app.get("/api/app/v1/support/tickets", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const tickets = await deps.xboard
      .getTickets(session.xboardAuthData)
      .catch((error): never => mapTicketError(error));
    return ok(reply, {
      tickets: tickets.map(normalizeTicket),
      total: tickets.length,
      fetched_at: new Date().toISOString(),
    });
  });

  app.get("/api/app/v1/support/tickets/:id", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const params = request.params as { id: string };
    const id = Number(params.id);
    if (!Number.isFinite(id) || id <= 0) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "id is required");
    }
    const detail = await deps.xboard
      .getTicketDetail(session.xboardAuthData, id)
      .catch((error): never => mapTicketError(error));
    if (!detail) {
      throw new AppError(404, ErrorCodes.NOT_FOUND, "工单不存在");
    }
    return ok(reply, {
      ticket: normalizeTicket(detail),
      fetched_at: new Date().toISOString(),
    });
  });

  app.post("/api/app/v1/support/tickets", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const body = (request.body ?? {}) as Record<string, unknown>;
    const subject = toText(body.subject || "App 工单");
    const message = toText(body.message);
    const level = toNumber(body.level);
    if (!message) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "message is required");
    }
    await deps.xboard
      .createTicket({ authData: session.xboardAuthData, subject, message, level })
      .catch((error): never => mapTicketError(error));
    const tickets = await deps.xboard
      .getTickets(session.xboardAuthData)
      .catch((error): never => mapTicketError(error));
    return ok(reply, {
      created: true,
      latest_ticket_id: tickets.length > 0 ? toNumber(tickets[0].id) : null,
      fetched_at: new Date().toISOString(),
    });
  });

  app.post("/api/app/v1/support/tickets/:id/reply", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const params = request.params as { id: string };
    const body = (request.body ?? {}) as Record<string, unknown>;
    const id = Number(params.id);
    const message = toText(body.message);
    if (!Number.isFinite(id) || id <= 0 || !message) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "id and message are required");
    }
    await deps.xboard
      .replyTicket({ authData: session.xboardAuthData, id, message })
      .catch((error): never => mapTicketError(error));
    const detail = await deps.xboard
      .getTicketDetail(session.xboardAuthData, id)
      .catch((error): never => mapTicketError(error));
    return ok(reply, {
      replied: true,
      ticket: detail ? normalizeTicket(detail) : null,
      replied_at: new Date().toISOString(),
    });
  });

  app.post("/api/app/v1/support/tickets/:id/close", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const params = request.params as { id: string };
    const id = Number(params.id);
    if (!Number.isFinite(id) || id <= 0) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "id is required");
    }
    await deps.xboard
      .closeTicket({ authData: session.xboardAuthData, id })
      .catch((error): never => mapTicketError(error));
    return ok(reply, {
      closed: true,
      closed_at: new Date().toISOString(),
    });
  });
};
