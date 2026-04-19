import type { FastifyInstance, FastifyReply, FastifyRequest } from "fastify";
import { config } from "../config";
import { AppError, ErrorCodes } from "../errors";
import { requireSession } from "../plugins/auth";
import type { ReferralClaimStore } from "../store/referral-claim-store";
import type { SessionStore } from "../store/session-store";
import type { XboardAdapter } from "../adapter/xboard-adapter";
import { signPullToken } from "../utils/jwt";
import {
  buildBrandProfile,
  buildFeatureFlags,
  buildGrowthCenterSummary,
  buildHomeSurface,
  buildNetworkDiagnostics,
  buildPortalSchema,
  buildRoutingPresets,
} from "../utils/product-surface";
import { ok } from "../utils/response";
import { toIsoTimeOrNull } from "../utils/time";
import { normalizeTrafficSummary } from "../utils/traffic";

type BootstrapDeps = {
  sessions: SessionStore;
  claims: ReferralClaimStore;
  xboard: XboardAdapter;
};

const formatTrafficText = (bytes: number): string => {
  const value = Math.max(0, Number(bytes || 0));
  if (value <= 0) return "0 B";
  const units = ["B", "KB", "MB", "GB", "TB", "PB"];
  const index = Math.min(Math.floor(Math.log(value) / Math.log(1024)), units.length - 1);
  const divisor = Math.pow(1024, index);
  const precision = index <= 1 ? 0 : 1;
  return `${(value / divisor).toFixed(precision)} ${units[index]}`;
};

const buildAccountSummary = async (
  deps: BootstrapDeps,
  sid: string,
  xboardAuthData: string,
  session: ReturnType<SessionStore["get"]>,
) => {
  const user = await deps.xboard.getUserInfo(xboardAuthData);
  const registeredAt = toIsoTimeOrNull(user.created_at ?? null);
  const newUserDiscountEligible = (() => {
    if (!config.newUserDiscountEnabled || !registeredAt) return false;
    const created = Date.parse(registeredAt);
    if (!Number.isFinite(created)) return false;
    const elapsed = Date.now() - created;
    const windowMs = Math.max(1, config.newUserDiscountWindowDays) * 24 * 60 * 60 * 1000;
    return elapsed >= 0 && elapsed <= windowMs;
  })();
  let subscribe: Awaited<ReturnType<XboardAdapter["getSubscribe"]>> | null = null;
  try {
    subscribe = await deps.xboard.getSubscribe(xboardAuthData);
  } catch {
    subscribe = null;
  }
  const rawPlanName = String(subscribe?.plan?.name ?? "").trim();
  const userPlanId = Number(user.plan_id ?? subscribe?.plan?.id ?? 0);
  const looksLikeOnlyId = rawPlanName.length > 0 && /^[0-9]+$/.test(rawPlanName);
  let resolvedPlanName: string | null = rawPlanName.length > 0 && !looksLikeOnlyId ? rawPlanName : null;
  if (!resolvedPlanName && Number.isFinite(userPlanId) && userPlanId > 0) {
    try {
      const plans = await deps.xboard.getPlans(xboardAuthData);
      const matched = plans.find((item) => Number(item.id ?? 0) === userPlanId);
      const mapped = String(matched?.name ?? "").trim();
      if (mapped.length > 0) {
        resolvedPlanName = mapped;
      }
    } catch {
      // ignore mapping error and keep null plan name
    }
  }

  const trafficSummary = normalizeTrafficSummary(
    subscribe?.transfer_enable ?? user.transfer_enable ?? 0,
    subscribe ? (subscribe.u ?? 0) + (subscribe.d ?? 0) : 0,
    config.xboardTrafficUnit,
  );

  const pullToken = signPullToken(sid);
  const pullUrl = `${config.publicBaseUrl}/api/app/v1/subscription/pull?token=${encodeURIComponent(pullToken)}`;
  const ticketUrl = config.defaultTicketUrl || `${config.xboardBaseUrl}/#/ticket`;
  const noticeUrl = config.defaultNoticeUrl || `${config.xboardBaseUrl}/#/notice`;
  const expiredAt = toIsoTimeOrNull(subscribe?.expired_at ?? user.expired_at ?? null);

  let pendingOrderCount = 0;
  try {
    const orders = await deps.xboard.getOrders(xboardAuthData);
    pendingOrderCount = Array.isArray(orders)
      ? orders.filter((item) => {
          const status = Number(item?.status ?? -1);
          return status === 0 || status === 1;
        }).length
      : 0;
  } catch {
    pendingOrderCount = 0;
  }

  const inviteSummary = await readInviteSummarySafe(deps, xboardAuthData);
  const claim = session?.referralClaimId ? deps.claims.get(session.referralClaimId) : undefined;
  const nodeCount = session?.nodeCount ?? null;
  const featureFlags = buildFeatureFlags();

  return {
    brand_profile: buildBrandProfile(),
    feature_flags: featureFlags,
    portal_schema: buildPortalSchema(),
    assistant_config: {
      enabled: config.assistantEnabled,
      provider: config.assistantProvider,
      model: config.assistantModel,
      fallback_enabled: config.assistantFallbackEnabled,
      ticket_handoff_enabled: config.assistantTicketHandoffEnabled,
    },
    ios_guide: {
      title: config.iosGuideTitle,
      url: config.iosGuideUrl || null,
      markdown: config.iosGuideMarkdown || null,
    },
    user: {
      id: subscribe?.uuid ?? String(user.uuid ?? ""),
      email: user.email,
      plan_name: resolvedPlanName,
      registered_at: registeredAt,
      expired_at: expiredAt,
      traffic_used: trafficSummary.usedBytes,
      traffic_total: trafficSummary.totalBytes,
      traffic_unit_detected: trafficSummary.unit,
      traffic_used_raw: trafficSummary.usedRaw,
      traffic_total_raw: trafficSummary.totalRaw,
      balance: user.balance ?? 0,
      telegram_bound: user.telegram_id != null || String(user.telegram_username ?? "").trim().length > 0,
      telegram_username: String(user.telegram_username ?? "").trim() || null,
    },
    subscription: {
      pull_url: pullUrl,
      last_synced_at: session?.lastSyncedAt ?? null,
      version: session?.subscriptionVersion ?? null,
      node_count: nodeCount,
      reset_day: subscribe?.reset_day ?? null,
    },
    links: {
      telegram: config.defaultTelegramUrl,
      telegram_group: config.telegramGroupUrl,
      telegram_bot: config.telegramBotUrl,
      github: config.defaultGithubUrl,
      tickets: ticketUrl,
      notices: noticeUrl,
    },
    promo: {
      new_user_discount: {
        enabled: config.newUserDiscountEnabled,
        eligible: newUserDiscountEligible,
        percent: config.newUserDiscountPercent,
        window_days: config.newUserDiscountWindowDays,
        text: config.newUserDiscountText,
      },
    },
    routing_presets: buildRoutingPresets(),
    network_diagnostics: buildNetworkDiagnostics({
      expiredAt,
      nodeCount,
      lastSyncedAt: session?.lastSyncedAt ?? null,
      hasPullUrl: pullUrl.length > 0,
      pendingOrderCount,
    }),
    home_surface: buildHomeSurface({
      planName: resolvedPlanName,
      nodeCount,
      trafficRemainingText: formatTrafficText(Math.max(0, trafficSummary.totalBytes - trafficSummary.usedBytes)),
      expireAtText: expiredAt,
    }),
    growth_center_summary: buildGrowthCenterSummary({
      inviteCode: claim?.inviteCode ?? inviteSummary.invite_code,
      claimId: claim?.claimId ?? null,
      invitedCount: inviteSummary.invited_count,
      rebateAvailable: inviteSummary.rebate_available,
    }),
    referral_claim: claim
      ? {
          claim_id: claim.claimId,
          invite_code: claim.inviteCode,
          channel: claim.channel,
          campaign: claim.campaign,
          install_claim_status: claim.installClaimStatus,
          signup_status: claim.signupStatus,
          first_paid_order_status: claim.firstPaidOrderStatus,
        }
      : null,
  };
};

const readInviteSummarySafe = async (deps: BootstrapDeps, authData: string) => {
  const inviteManageUrl = `${config.xboardWebBaseUrl}/#/invite`;
  const registerWithCodeUrl = (code: string) =>
    `${config.xboardWebBaseUrl}/#/register?code=${encodeURIComponent(code)}`;
  const normalizeQuickUrl = (candidate: string, fallback: string): string => {
    const raw = String(candidate ?? "").trim();
    if (!raw) return fallback;
    try {
      const fallbackUrl = new URL(fallback);
      const targetUrl = new URL(raw);
      if (targetUrl.host !== fallbackUrl.host) {
        targetUrl.protocol = fallbackUrl.protocol;
        targetUrl.host = fallbackUrl.host;
      }
      return targetUrl.toString();
    } catch {
      return fallback;
    }
  };
  const normalizeInviteUrl = (raw: string | null, code: string | null): string | null => {
    const trimmed = String(raw ?? "").trim();
    if (trimmed.length > 0) {
      const lower = trimmed.toLowerCase();
      // Some upstream panels return subscribe URL as invite URL, which is invalid for invite flow in App.
      if (
        !lower.includes("/api/subscribe/") &&
        !lower.includes("/api/v1/subscribe/") &&
        !lower.includes("token is error")
      ) {
        return trimmed;
      }
    }
    if (code && code.trim().length > 0) {
      return registerWithCodeUrl(code.trim());
    }
    return null;
  };
  try {
    const summary = await deps.xboard.getInviteSummary(authData);
    const quickInviteUrl = await deps.xboard.getQuickLoginUrl(authData, "invite").catch(() => "");
    const manageUrl =
      quickInviteUrl.trim().length > 0
        ? normalizeQuickUrl(quickInviteUrl, inviteManageUrl)
        : inviteManageUrl;
    const normalizedInviteUrl = normalizeInviteUrl(summary.inviteUrl, summary.inviteCode);
    return {
      invite_code: summary.inviteCode,
      invite_url: normalizedInviteUrl,
      rebate_total: summary.rebateTotal,
      rebate_pending: summary.rebatePending,
      rebate_available: summary.rebateAvailable,
      rebate_withdrawn: summary.rebateWithdrawn,
      rebate_rate: summary.rebateRate,
      rebate_rule_text: summary.rebateRuleText,
      can_withdraw: summary.canWithdraw,
      invited_count: summary.invitedCount,
      invite_manage_url: manageUrl,
      commission_rate: config.inviteCommissionRate,
      commission_level_1_rate: config.inviteLevel1Rate,
      commission_level_2_rate: config.inviteLevel2Rate,
      commission_level_3_rate: config.inviteLevel3Rate,
      supported: true,
    };
  } catch {
    return {
      invite_code: null,
      invite_url: null,
      rebate_total: 0,
      rebate_pending: 0,
      rebate_available: 0,
      rebate_withdrawn: 0,
      rebate_rate: 0,
      rebate_rule_text: null,
      can_withdraw: false,
      invited_count: 0,
      invite_manage_url: inviteManageUrl,
      commission_rate: config.inviteCommissionRate,
      commission_level_1_rate: config.inviteLevel1Rate,
      commission_level_2_rate: config.inviteLevel2Rate,
      commission_level_3_rate: config.inviteLevel3Rate,
      supported: false,
    };
  }
};

export const registerBootstrapRoutes = (app: FastifyInstance, deps: BootstrapDeps): void => {
  const handleSummary = async (request: FastifyRequest, reply: FastifyReply) => {
    const session = requireSession(request, deps.sessions);
    const data = await buildAccountSummary(deps, session.sid, session.xboardAuthData, session);
    return ok(reply, data);
  };

  app.get("/api/app/v1/bootstrap", async (request, reply) => {
    return handleSummary(request, reply);
  });

  app.get("/api/app/v1/account/summary", async (request, reply) => {
    return handleSummary(request, reply);
  });

  app.get("/api/app/v1/invite/summary", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const data = await readInviteSummarySafe(deps, session.xboardAuthData);
    return ok(reply, data);
  });

  app.post("/api/app/v1/invite/generate", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const generated = await deps.xboard.generateInviteCode(session.xboardAuthData);
    const summary = await readInviteSummarySafe(deps, session.xboardAuthData);
    return ok(reply, {
      generated,
      invite_code: summary.invite_code,
      invite_url: summary.invite_url,
      invite_manage_url: summary.invite_manage_url,
      fetched_at: new Date().toISOString(),
    });
  });

  app.post("/api/app/v1/invite/withdraw", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const body = (request.body ?? {}) as Record<string, unknown>;
    const amount = Number(body.amount ?? 0);

    if (!Number.isFinite(amount) || amount <= 0) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "amount is required and must be greater than 0");
    }

    try {
      await deps.xboard.submitInviteWithdraw(session.xboardAuthData, amount);
    } catch (error) {
      if (error instanceof AppError && error.code === ErrorCodes.UPSTREAM_ERROR) {
        throw new AppError(400, ErrorCodes.UPSTREAM_ERROR, "当前站点暂不支持在 App 内提现，请前往网页端处理");
      }
      throw error;
    }

    return ok(reply, {
      requested: true,
      amount,
      requested_at: new Date().toISOString(),
    });
  });
};
