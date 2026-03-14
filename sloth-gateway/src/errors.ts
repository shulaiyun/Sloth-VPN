export const ErrorCodes = {
  INVALID_ARGUMENT: "INVALID_ARGUMENT",
  BAD_EMAIL_FORMAT: "BAD_EMAIL_FORMAT",
  EMAIL_SUFFIX_NOT_ALLOWED: "EMAIL_SUFFIX_NOT_ALLOWED",
  AUTH_INVALID_CREDENTIALS: "AUTH_INVALID_CREDENTIALS",
  REGISTER_CLOSED: "REGISTER_CLOSED",
  EMAIL_VERIFY_REQUIRED: "EMAIL_VERIFY_REQUIRED",
  EMAIL_CODE_INVALID: "EMAIL_CODE_INVALID",
  CAPTCHA_REQUIRED: "CAPTCHA_REQUIRED",
  INVITE_CODE_REQUIRED: "INVITE_CODE_REQUIRED",
  ORDER_NOT_CANCELLABLE: "ORDER_NOT_CANCELLABLE",
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
