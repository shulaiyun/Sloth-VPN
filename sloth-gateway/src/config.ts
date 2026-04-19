import dotenv from "dotenv";
import path from "node:path";

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

const bool = (v: string | undefined, d: boolean): boolean => {
  if (v == null) return d;
  const normalized = v.trim().toLowerCase();
  if (["1", "true", "yes", "on"].includes(normalized)) return true;
  if (["0", "false", "no", "off"].includes(normalized)) return false;
  return d;
};

const json = <T>(v: string | undefined, fallback: T): T => {
  if (!v) return fallback;
  try {
    return JSON.parse(v) as T;
  } catch {
    return fallback;
  }
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
  telegramGroupUrl: process.env.TELEGRAM_GROUP_URL ?? "https://t.me/+DWcAXq0TIO41OThl",
  telegramBotUsername: process.env.TELEGRAM_BOT_USERNAME ?? "shulaiyun_bot",
  telegramBotUrl: process.env.TELEGRAM_BOT_URL ?? "https://t.me/shulaiyun_bot",
  defaultGithubUrl: process.env.DEFAULT_GITHUB_URL ?? "https://github.com/shulaiyun/Sloth-VPN",
  defaultTicketUrl: process.env.DEFAULT_TICKET_URL ?? "",
  defaultNoticeUrl: process.env.DEFAULT_NOTICE_URL ?? "",
  brandId: (process.env.BRAND_ID ?? "slothvpn").trim() || "slothvpn",
  brandCode: (process.env.BRAND_CODE ?? "slothvpn").trim() || "slothvpn",
  brandName: (process.env.BRAND_NAME ?? "树懒VPN").trim() || "树懒VPN",
  brandTagline: (process.env.BRAND_TAGLINE ?? "安全 / 稳定 / 快速").trim() || "安全 / 稳定 / 快速",
  brandDescription:
    (process.env.BRAND_DESCRIPTION ?? "面向机场主和终端用户的一体化 VPN 服务面板").trim() ||
    "面向机场主和终端用户的一体化 VPN 服务面板",
  brandLogoUrl: (process.env.BRAND_LOGO_URL ?? "").trim(),
  brandPrimaryColor: (process.env.BRAND_PRIMARY_COLOR ?? "#0F4D9B").trim() || "#0F4D9B",
  brandSecondaryColor: (process.env.BRAND_SECONDARY_COLOR ?? "#0BB8D0").trim() || "#0BB8D0",
  brandAccentColor: (process.env.BRAND_ACCENT_COLOR ?? "#27D1B1").trim() || "#27D1B1",
  brandFontFamily: (process.env.BRAND_FONT_FAMILY ?? "Sora, Noto Sans SC, PingFang SC, Microsoft YaHei, sans-serif")
    .trim() || "Sora, Noto Sans SC, PingFang SC, Microsoft YaHei, sans-serif",
  deploymentMode: (process.env.DEPLOYMENT_MODE ?? "self_hosted").trim().toLowerCase() || "self_hosted",
  supportEmail: (process.env.BRAND_SUPPORT_EMAIL ?? "").trim(),
  supportTelegram: (process.env.BRAND_SUPPORT_TELEGRAM ?? process.env.DEFAULT_TELEGRAM_URL ?? "").trim(),
  portalSchema: json(
    process.env.PORTAL_SCHEMA_JSON,
    {
      public_sections: ["hero", "modes", "plans", "downloads", "operators", "support"],
      portal_sections: ["overview", "plans", "downloads", "growth", "support", "security"],
      operator_sections: [
        "overview",
        "brand",
        "portal",
        "plans",
        "network",
        "growth",
        "support",
        "release",
        "monitoring",
      ],
    },
  ),
  featureFlags: json(
    process.env.FEATURE_FLAGS_JSON,
    {
      invite_enabled: true,
      ticket_enabled: true,
      telegram_enabled: true,
      knowledge_enabled: true,
      notice_enabled: true,
      payment_enabled: true,
      diagnostics_enabled: true,
      operator_console_enabled: true,
      custom_branding_enabled: true,
      managed_hosting_enabled: true,
      self_hosted_enabled: true,
      app_split_tunnel_enabled: true,
    },
  ),
  routingPresets: json(
    process.env.ROUTING_PRESETS_JSON,
    [
      {
        key: "global",
        title: "全局模式",
        description: "代理所有应用，适合稳定出海和全局保护",
        app_mode: "all",
      },
      {
        key: "smart_split",
        title: "智能分流",
        description: "自动绕过常见本地应用，只代理需要加速的流量",
        app_mode: "bypass_selected",
      },
      {
        key: "custom_split",
        title: "自定义分流",
        description: "按应用自定义代理和旁路策略",
        app_mode: "custom",
      },
      {
        key: "temporary_bypass",
        title: "临时旁路",
        description: "临时关闭当前连接，快速恢复直连排查问题",
        app_mode: "pause",
      },
    ],
  ),
  referralStoragePath:
    (process.env.REFERRAL_STORAGE_PATH ?? path.join(process.cwd(), "data", "referral-claims.json")).trim() ||
    path.join(process.cwd(), "data", "referral-claims.json"),
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
  newUserDiscountEnabled: (process.env.NEW_USER_DISCOUNT_ENABLED ?? "false").toLowerCase() === "true",
  newUserDiscountPercent: num(process.env.NEW_USER_DISCOUNT_PERCENT, 15),
  newUserDiscountWindowDays: num(process.env.NEW_USER_DISCOUNT_WINDOW_DAYS, 3),
  newUserDiscountCouponCode: (process.env.NEW_USER_DISCOUNT_COUPON_CODE ?? "").trim(),
  newUserDiscountText:
    process.env.NEW_USER_DISCOUNT_TEXT ?? "新用户注册 3 天内购买套餐可享 15% 优惠",
  appUpdateLatestVersion: (process.env.APP_UPDATE_LATEST_VERSION ?? "").trim(),
  appUpdateLatestBuild: num(process.env.APP_UPDATE_LATEST_BUILD, 0),
  appUpdateMinSupportedBuild: num(process.env.APP_UPDATE_MIN_SUPPORTED_BUILD, 0),
  appUpdateForce: (process.env.APP_UPDATE_FORCE ?? "false").toLowerCase() === "true",
  appUpdateTitle: (process.env.APP_UPDATE_TITLE ?? "").trim(),
  appUpdateMessage: (process.env.APP_UPDATE_MESSAGE ?? "").trim(),
  appUpdateDownloadUrl:
    (process.env.APP_UPDATE_DOWNLOAD_URL ?? "https://github.com/shulaiyun/Sloth-VPN/releases/latest").trim(),
  assistantEnabled: bool(process.env.ASSISTANT_ENABLED, true),
  assistantProvider: (process.env.ASSISTANT_PROVIDER ?? "cliproxyapi").trim().toLowerCase() || "cliproxyapi",
  assistantBaseUrl: (process.env.ASSISTANT_BASE_URL ?? process.env.CLIPROXYAPI_BASE_URL ?? "http://127.0.0.1:3000")
    .trim()
    .replace(/\/$/, ""),
  assistantApiKey: (process.env.ASSISTANT_API_KEY ?? process.env.CLIPROXYAPI_API_KEY ?? "").trim(),
  assistantModel: (process.env.ASSISTANT_MODEL ?? process.env.CLIPROXYAPI_MODEL ?? "gpt-4o-mini").trim(),
  assistantSystemPrompt:
    (
      process.env.ASSISTANT_SYSTEM_PROMPT ??
      "你是 SlothVPN 的专业业务助手。请用简洁、可执行的步骤回答用户问题，优先解释购买、支付、订阅导入、分流与全局模式、iOS 下载教程、异常恢复。不要编造不存在的功能。"
    ).trim(),
  assistantTimeoutMs: num(process.env.ASSISTANT_TIMEOUT_MS, 30000),
  assistantTemperature: num(process.env.ASSISTANT_TEMPERATURE, 0.2),
  assistantMaxTokens: num(process.env.ASSISTANT_MAX_TOKENS, 600),
  assistantFallbackEnabled: bool(process.env.ASSISTANT_FALLBACK_ENABLED, true),
  assistantTicketHandoffEnabled: bool(process.env.ASSISTANT_TICKET_HANDOFF_ENABLED, true),
  iosGuideTitle: (process.env.IOS_GUIDE_TITLE ?? "iOS 安装教程").trim() || "iOS 安装教程",
  iosGuideUrl: (process.env.IOS_GUIDE_URL ?? "").trim(),
  iosGuideMarkdown: (process.env.IOS_GUIDE_MARKDOWN ?? "").trim(),
  allowedEmailSuffixes: csv(process.env.AUTH_ALLOWED_EMAIL_SUFFIXES),
  debugBindCode: (process.env.DEBUG_BIND_CODE ?? "false").toLowerCase() === "true",
  referralEnabled: bool(process.env.REFERRAL_ENABLED, true),
};

