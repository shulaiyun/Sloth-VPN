import type { FastifyReply } from "fastify";
import { AppError, ErrorCodes } from "../errors";

export const ok = (reply: FastifyReply, data: unknown, meta?: Record<string, unknown>) => {
  return reply.send({
    success: true,
    data,
    error: null,
    meta: {
      timestamp: new Date().toISOString(),
      ...(meta ?? {}),
    },
  });
};

export const fail = (reply: FastifyReply, err: unknown) => {
  if (err instanceof AppError) {
    return reply.status(err.statusCode).send({
      success: false,
      data: null,
      error: {
        code: err.code,
        message: err.message,
        details: err.details ?? null,
      },
      meta: {
        timestamp: new Date().toISOString(),
      },
    });
  }

  return reply.status(500).send({
    success: false,
    data: null,
    error: {
      code: ErrorCodes.INTERNAL_ERROR,
      message: "Internal server error",
      details: null,
    },
    meta: {
      timestamp: new Date().toISOString(),
    },
  });
};
