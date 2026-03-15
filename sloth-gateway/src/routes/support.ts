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

const pickMostRecentTicket = (tickets: Array<Record<string, unknown>>): Record<string, unknown> | undefined => {
  if (tickets.length === 0) return undefined;
  const sorted = [...tickets];
  sorted.sort((a, b) => {
    const idA = toNumber(a.id);
    const idB = toNumber(b.id);
    if (idA !== idB) return idB - idA;
    const aUpdated = toText(a.updated_at);
    const bUpdated = toText(b.updated_at);
    const aCreated = toText(a.created_at);
    const bCreated = toText(b.created_at);
    const atA = Date.parse(aUpdated || aCreated);
    const atB = Date.parse(bUpdated || bCreated);
    const msA = Number.isFinite(atA) ? atA : 0;
    const msB = Number.isFinite(atB) ? atB : 0;
    return msB - msA;
  });
  return sorted[0];
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

const sleep = (ms: number): Promise<void> => new Promise((resolve) => setTimeout(resolve, ms));

export const registerSupportRoutes = (app: FastifyInstance, deps: SupportDeps): void => {
  app.get("/api/app/v1/support/tickets", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const tickets = await deps.xboard
      .getTickets(session.xboardAuthData)
      .catch((error: unknown): never => mapTicketError(error));
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
      .catch((error: unknown): never => mapTicketError(error));
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
    const created = await deps.xboard
      .createTicket({ authData: session.xboardAuthData, subject, message, level })
      .catch((error: unknown): never => mapTicketError(error));

    if (!created.created) {
      throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "工单提交失败，请稍后重试");
    }

    let tickets = await deps.xboard
      .getTickets(session.xboardAuthData)
      .catch((error: unknown): never => mapTicketError(error));

    let createdTicket =
      created.ticketId != null
        ? tickets.find((item) => toNumber(item.id) === created.ticketId || toNumber(item.ticket_id) === created.ticketId)
        : pickMostRecentTicket(tickets);

    // Some XBoard deployments create ticket asynchronously. Poll briefly to get the real ticket id for immediate chat.
    if (!createdTicket) {
      for (const delayMs of [350, 850, 1500]) {
        await sleep(delayMs);
        tickets = await deps.xboard
          .getTickets(session.xboardAuthData)
          .catch((error: unknown): never => mapTicketError(error));
        createdTicket =
          (created.ticketId != null
            ? tickets.find(
                (item) =>
                  toNumber(item.id) === created.ticketId || toNumber(item.ticket_id) === created.ticketId,
              )
            : undefined) ?? pickMostRecentTicket(tickets);
        if (createdTicket) break;
      }
    }

    if (!createdTicket && created.ticketId != null) {
      createdTicket = (await deps.xboard
        .getTicketDetail(session.xboardAuthData, created.ticketId)
        .catch(() => null)) ?? undefined;
    }

    const syntheticTicket = {
      id: created.ticketId ?? Date.now() * -1,
      subject,
      level,
      status: 0,
      reply_status: 0,
      created_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
      message: [
        {
          id: 1,
          ticket_id: created.ticketId ?? 0,
          is_me: true,
          message,
          created_at: new Date().toISOString(),
        },
      ],
    } as Record<string, unknown>;

    return ok(reply, {
      created: true,
      latest_ticket_id: created.ticketId ?? (tickets.length > 0 ? toNumber(tickets[0].id) : null),
      ticket: normalizeTicket(createdTicket ?? syntheticTicket),
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
      .catch((error: unknown): never => mapTicketError(error));
    const detail = await deps.xboard
      .getTicketDetail(session.xboardAuthData, id)
      .catch((error: unknown): never => mapTicketError(error));
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
      .catch((error: unknown): never => mapTicketError(error));
    let detail = await deps.xboard
      .getTicketDetail(session.xboardAuthData, id)
      .catch(() => null);
    if (detail != null && toNumber(detail.status) != 1) {
      for (const delayMs of [300, 700, 1200]) {
        await sleep(delayMs);
        detail = await deps.xboard
          .getTicketDetail(session.xboardAuthData, id)
          .catch(() => null);
        if (detail != null && toNumber(detail.status) == 1) {
          break;
        }
      }
    }
    return ok(reply, {
      closed: true,
      ticket: detail == null ? null : normalizeTicket(detail),
      closed_at: new Date().toISOString(),
    });
  });
};
