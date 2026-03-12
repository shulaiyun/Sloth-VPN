import type { FastifyRequest } from "fastify";
import { AppError, ErrorCodes } from "../errors";
import { verifyAccessToken } from "../utils/jwt";
import type { SessionStore } from "../store/session-store";

export const parseBearerToken = (request: FastifyRequest): string => {
  const auth = request.headers.authorization;
  if (!auth) throw new AppError(401, ErrorCodes.UNAUTHORIZED, "Missing authorization header");
  const match = auth.match(/^Bearer\s+(.+)$/i);
  if (!match) throw new AppError(401, ErrorCodes.UNAUTHORIZED, "Invalid authorization header format");
  return match[1];
};

export const requireSession = (request: FastifyRequest, sessions: SessionStore) => {
  const token = parseBearerToken(request);
  const payload = verifyAccessToken(token);
  const session = sessions.get(payload.sid);
  if (!session) {
    throw new AppError(401, ErrorCodes.UNAUTHORIZED, "Session expired or not found");
  }
  return session;
};
