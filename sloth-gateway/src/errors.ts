export const ErrorCodes = {
  INVALID_ARGUMENT: "INVALID_ARGUMENT",
  UNAUTHORIZED: "UNAUTHORIZED",
  FORBIDDEN: "FORBIDDEN",
  NOT_FOUND: "NOT_FOUND",
  BIND_EXPIRED: "BIND_EXPIRED",
  BIND_ALREADY_USED: "BIND_ALREADY_USED",
  BIND_NOT_APPROVED: "BIND_NOT_APPROVED",
  UPSTREAM_ERROR: "UPSTREAM_ERROR",
  UPSTREAM_TIMEOUT: "UPSTREAM_TIMEOUT",
  INTERNAL_ERROR: "INTERNAL_ERROR",
} as const;

export type ErrorCode = (typeof ErrorCodes)[keyof typeof ErrorCodes];

export class AppError extends Error {
  public readonly statusCode: number;
  public readonly code: ErrorCode;
  public readonly details?: unknown;

  constructor(statusCode: number, code: ErrorCode, message: string, details?: unknown) {
    super(message);
    this.statusCode = statusCode;
    this.code = code;
    this.details = details;
  }
}
