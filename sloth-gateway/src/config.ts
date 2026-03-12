import dotenv from "dotenv";

dotenv.config();

const num = (v: string | undefined, d: number): number => {
  const parsed = Number(v);
  return Number.isFinite(parsed) ? parsed : d;
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
  xboardBaseUrl: (process.env.XBOARD_BASE_URL ?? "http://127.0.0.1").replace(/\/$/, ""),
  xboardTimeoutMs: num(process.env.XBOARD_TIMEOUT_MS, 15000),
  defaultTelegramUrl: process.env.DEFAULT_TELEGRAM_URL ?? "https://t.me/shulai2026",
  defaultGithubUrl: process.env.DEFAULT_GITHUB_URL ?? "https://github.com/shulaiyun/shulai-VPN",
  debugBindCode: (process.env.DEBUG_BIND_CODE ?? "false").toLowerCase() === "true",
};
