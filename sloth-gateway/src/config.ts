import dotenv from "dotenv";

dotenv.config();

const num = (v: string | undefined, d: number): number => {
  const parsed = Number(v);
  return Number.isFinite(parsed) ? parsed : d;
};

const csv = (v: string | undefined): string[] => {
  if (!v) return [];
  return v
    .split(",")
    .map((item) => item.trim().toLowerCase())
    .filter((item) => item.length > 0);
};

const csvRaw = (v: string | undefined): string[] => {
  if (!v) return [];
  return v
    .split(",")
    .map((item) => item.trim())
    .filter((item) => item.length > 0);
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
  xboardTrafficUnit: (process.env.XBOARD_TRAFFIC_UNIT ?? "auto").trim().toLowerCase(),
  defaultTelegramUrl: process.env.DEFAULT_TELEGRAM_URL ?? "https://t.me/shulai2026",
  telegramBotUsername: process.env.TELEGRAM_BOT_USERNAME ?? "shulaiyun_bot",
  telegramBotUrl: process.env.TELEGRAM_BOT_URL ?? "https://t.me/shulaiyun_bot",
  defaultGithubUrl: process.env.DEFAULT_GITHUB_URL ?? "https://github.com/shulaiyun/Sloth-VPN",
  defaultTicketUrl: process.env.DEFAULT_TICKET_URL ?? "",
  defaultNoticeUrl: process.env.DEFAULT_NOTICE_URL ?? "",
  inviteCommissionRate: num(process.env.INVITE_COMMISSION_RATE, 20),
  inviteLevel1Rate: num(process.env.INVITE_LEVEL1_RATE, 50),
  inviteLevel2Rate: num(process.env.INVITE_LEVEL2_RATE, 50),
  inviteLevel3Rate: num(process.env.INVITE_LEVEL3_RATE, 50),
  inviteSignupRewardEnabled: (process.env.INVITE_SIGNUP_REWARD_ENABLED ?? "false").toLowerCase() === "true",
  inviteSignupRewardRequireInviteCode: (process.env.INVITE_SIGNUP_REWARD_REQUIRE_INVITE_CODE ?? "true").toLowerCase() !== "false",
  inviteSignupRewardGiftCardCodes: csvRaw(process.env.INVITE_SIGNUP_REWARD_GIFT_CARD_CODES),
  inviteSignupRewardSuccessText:
    process.env.INVITE_SIGNUP_REWARD_SUCCESS_TEXT ?? "邀请注册奖励已到账：赠送 3 天时长与 10GB 流量（以站点实际礼品卡配置为准）",
  inviteSignupRewardFallbackText:
    process.env.INVITE_SIGNUP_REWARD_FALLBACK_TEXT ?? "邀请码注册成功，奖励发放中，请稍后在账户中心刷新查看",
  allowedEmailSuffixes: csv(process.env.AUTH_ALLOWED_EMAIL_SUFFIXES),
  debugBindCode: (process.env.DEBUG_BIND_CODE ?? "false").toLowerCase() === "true",
};

