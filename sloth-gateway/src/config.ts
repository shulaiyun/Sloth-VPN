import dotenv from "dotenv";

dotenv.config();

const num = (v: string | undefined, d: number): number => {
  const parsed = Number(v);
  return Number.isFinite(parsed) ? parsed : d;
};

const normalizeBaseUrl = (value: string | undefined, fallback: string): string => {
  const raw = (value ?? fallback).trim().replace(/\/$/, "");
  // Accept both host root and accidentally provided /api/v1,/api/v2 suffixes.
  return raw.replace(/\/api\/v\d+$/i, "");
};

export const config = {
  port: num(process.env.PORT, 8787),
  host: process.env.HOST ?? "0.0.0.0",
  publicBaseUrl: (process.env.PUBLIC_BASE_URL ?? "http://127.0.0.1:8787").replace(/\/$/, ""),
  jwtSecret: process.env.JWT_SECRET ?? "replace-with-a-strong-secret",
  accessTokenExpires: process.env.ACCESS_TOKEN_EXPIRES ?? "30d",
  refreshTokenExpires: process.env.REFRESH_TOKEN_EXPIRES ?? "90d",
  pullTokenExpires: process.env.PULL_TOKEN_EXPIRES ?? "30d",
  bindTokenExpires: process.env.BIND_TOKEN_EXPIRES ?? "10m",
  bindTtlSeconds: num(process.env.BIND_TTL_SECONDS, 600),
  xboardBaseUrl: normalizeBaseUrl(process.env.XBOARD_BASE_URL, "http://127.0.0.1"),
  xboardWebBaseUrl: normalizeBaseUrl(process.env.XBOARD_WEB_BASE_URL ?? process.env.XBOARD_BASE_URL, "http://127.0.0.1"),
  xboardTimeoutMs: num(process.env.XBOARD_TIMEOUT_MS, 15000),
  defaultTelegramUrl: process.env.DEFAULT_TELEGRAM_URL ?? "https://t.me/shulai2026",
  defaultGithubUrl: process.env.DEFAULT_GITHUB_URL ?? "https://github.com/shulaiyun/shulai-VPN",
  defaultTicketUrl: process.env.DEFAULT_TICKET_URL ?? "",
  defaultNoticeUrl: process.env.DEFAULT_NOTICE_URL ?? "",
  debugBindCode: (process.env.DEBUG_BIND_CODE ?? "false").toLowerCase() === "true",
};
