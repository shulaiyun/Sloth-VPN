import type { FastifyInstance } from "fastify";
import type { XboardAdapter } from "../adapter/xboard-adapter";
import { AppError, ErrorCodes } from "../errors";
import { requireSession } from "../plugins/auth";
import type { SessionStore } from "../store/session-store";
import { ok } from "../utils/response";

type AccountDeps = {
  sessions: SessionStore;
  xboard: XboardAdapter;
  xboardWebBaseUrl: string;
};

const mapChangePasswordError = (error: unknown): never => {
  if (!(error instanceof AppError)) {
    throw error;
  }
  if (error.code !== ErrorCodes.UPSTREAM_ERROR) {
    throw error;
  }
  const message = `${error.message} ${JSON.stringify(error.details ?? {})}`.toLowerCase();
  if (message.includes("old password") && (message.includes("wrong") || message.includes("error"))) {
    throw new AppError(400, ErrorCodes.AUTH_INVALID_CREDENTIALS, "旧密码不正确");
  }
  if (message.includes("password") && message.includes("short")) {
    throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "新密码长度不符合要求");
  }
  throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "修改密码失败，请稍后重试");
};

export const registerAccountRoutes = (app: FastifyInstance, deps: AccountDeps): void => {
  app.post("/api/app/v1/account/change-password", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const body = (request.body ?? {}) as Record<string, unknown>;
    const oldPassword = String(body.old_password ?? "").trim();
    const newPassword = String(body.new_password ?? "").trim();
    if (!oldPassword || !newPassword) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "old_password and new_password are required");
    }
    if (newPassword.length < 8) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "新密码至少 8 位");
    }
    await deps.xboard.changePassword(session.xboardAuthData, oldPassword, newPassword).catch((error): never => {
      return mapChangePasswordError(error);
    });
    return ok(reply, {
      changed: true,
      changed_at: new Date().toISOString(),
    });
  });

  app.get("/api/app/v1/support/ticket-entry", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const query = request.query as Record<string, unknown>;
    const redirect = String(query.redirect ?? "ticket").trim() || "ticket";
    const fallback = `${deps.xboardWebBaseUrl}/#/ticket`;
    const quickLoginUrl = await deps.xboard.getQuickLoginUrl(session.xboardAuthData, redirect).catch(() => "");
    return ok(reply, {
      url: quickLoginUrl || fallback,
      quick_login: quickLoginUrl.length > 0,
      fallback_url: fallback,
    });
  });
};
