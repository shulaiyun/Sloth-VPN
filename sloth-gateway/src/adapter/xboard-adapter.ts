import { createHash } from "node:crypto";
import { AppError, ErrorCodes } from "../errors";

type XboardResponse<T> = {
  status?: "success" | "fail";
  message?: string;
  data?: T;
  error?: unknown;
};

type XboardUserInfo = {
  email: string;
  transfer_enable: number;
  expired_at?: number;
  balance?: number;
  uuid?: string;
  plan_id?: number;
  telegram_id?: string | number;
  telegram_username?: string;
};

type XboardPlan = {
  id: number;
  name: string;
};

type XboardSubscribe = {
  email: string;
  uuid: string;
  token: string;
  u: number;
  d: number;
  transfer_enable: number;
  expired_at?: number;
  reset_day?: number;
  subscribe_url: string;
  plan?: XboardPlan;
};

type XboardAuthResult = {
  auth_data: string;
  token?: string;
};

type XboardRegisterOptions = {
  emailCode?: string;
  inviteCode?: string;
  captchaData?: string;
  recaptchaData?: string;
  recaptchaV3Token?: string;
  turnstileData?: string;
  turnstileToken?: string;
  hcaptchaData?: string;
};

type XboardForgotPasswordOptions = {
  emailCode?: string;
  captchaData?: string;
  recaptchaData?: string;
  recaptchaV3Token?: string;
  turnstileData?: string;
  turnstileToken?: string;
  hcaptchaData?: string;
};

type XboardGuestConfig = {
  is_email_verify?: unknown;
  is_invite_force?: unknown;
  is_register?: unknown;
  email_whitelist_suffix?: unknown;
  email_suffix?: unknown;
};

type XboardNoticePayload = {
  data?: unknown;
  total?: unknown;
};

export class XboardAdapter {
  constructor(private readonly baseUrl: string, private readonly timeoutMs: number) {}

  private static readonly subscriptionClientCandidates: Array<{ ua: string; flag?: string }> = [
    { ua: "sing-box 1.10.0", flag: "sing-box" },
    { ua: "Hiddify/2.0", flag: "hiddify" },
    { ua: "v2rayNG/1.10.0", flag: "v2rayng" },
    { ua: "Clash.Meta/1.18.0", flag: "clash-meta" },
    { ua: "SlothVPN-Gateway/0.1.0" },
  ];

  private async fetchJson(
    method: "GET" | "POST",
    path: string,
    body?: unknown,
    authData?: string,
  ): Promise<{ response: Response; payload: Record<string, unknown> }> {
    const url = `${this.baseUrl}${path}`;
    const controller = new AbortController();
    const timer = setTimeout(() => controller.abort(), this.timeoutMs);
    try {
      const response = await fetch(url, {
        method,
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          ...(authData ? { Authorization: authData } : {}),
        },
        body: method === "POST" ? JSON.stringify(body ?? {}) : undefined,
        signal: controller.signal,
      });
      const payload = (await response.json().catch(() => ({}))) as Record<string, unknown>;
      return { response, payload };
    } finally {
      clearTimeout(timer);
    }
  }

  private async fetchJsonWithVersionFallback(
    method: "GET" | "POST",
    path: string,
    body?: unknown,
    authData?: string,
  ): Promise<{ response: Response; payload: Record<string, unknown>; finalPath: string }> {
    const first = await this.fetchJson(method, path, body, authData);
    if (first.response.status !== 404 || !path.includes("/api/v1/")) {
      return { ...first, finalPath: path };
    }
    const fallbackPath = path.replace("/api/v1/", "/api/v2/");
    const second = await this.fetchJson(method, fallbackPath, body, authData);
    return { ...second, finalPath: fallbackPath };
  }

  async login(email: string, password: string): Promise<{ authData: string; token?: string }> {
    const data = await this.request<XboardAuthResult>("POST", "/api/v1/passport/auth/login", {
      email,
      password,
    });

    if (!data?.auth_data) {
      throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "XBoard login response missing auth_data");
    }

    return { authData: data.auth_data, token: data.token };
  }

  async register(email: string, password: string, options?: XboardRegisterOptions): Promise<{ authData: string; token?: string }> {
    const body: Record<string, unknown> = { email, password };
    if (options?.emailCode) body.email_code = options.emailCode;
    if (options?.inviteCode) body.invite_code = options.inviteCode;
    if (options?.captchaData) body.captcha_data = options.captchaData;
    if (options?.recaptchaData) body.recaptcha_data = options.recaptchaData;
    if (options?.recaptchaData) body.recaptcha_token = options.recaptchaData;
    if (options?.recaptchaV3Token) body.recaptcha_v3_token = options.recaptchaV3Token;
    if (options?.turnstileData) body.turnstile_data = options.turnstileData;
    if (options?.turnstileData) body.turnstile_token = options.turnstileData;
    if (options?.turnstileToken) body.turnstile_token = options.turnstileToken;
    if (options?.hcaptchaData) body.hcaptcha_data = options.hcaptchaData;

    const data = await this.request<XboardAuthResult>("POST", "/api/v1/passport/auth/register", body);
    if (!data?.auth_data) {
      throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "XBoard register response missing auth_data");
    }

    return { authData: data.auth_data, token: data.token };
  }

  async sendEmailVerify(input: {
    email: string;
    captchaData?: string;
    recaptchaData?: string;
    recaptchaV3Token?: string;
    turnstileData?: string;
    turnstileToken?: string;
    hcaptchaData?: string;
  }): Promise<boolean> {
    const body: Record<string, unknown> = { email: input.email };
    if (input.captchaData) body.captcha_data = input.captchaData;
    if (input.recaptchaData) body.recaptcha_data = input.recaptchaData;
    if (input.recaptchaData) body.recaptcha_token = input.recaptchaData;
    if (input.recaptchaV3Token) body.recaptcha_v3_token = input.recaptchaV3Token;
    if (input.turnstileData) body.turnstile_data = input.turnstileData;
    if (input.turnstileData) body.turnstile_token = input.turnstileData;
    if (input.turnstileToken) body.turnstile_token = input.turnstileToken;
    if (input.hcaptchaData) body.hcaptcha_data = input.hcaptchaData;
    await this.request<boolean>("POST", "/api/v1/passport/comm/sendEmailVerify", body);
    return true;
  }

  async forgotPassword(email: string, newPassword: string, options?: XboardForgotPasswordOptions): Promise<boolean> {
    const body: Record<string, unknown> = {
      email,
      password: newPassword,
    };
    if (options?.emailCode) body.email_code = options.emailCode;
    if (options?.captchaData) body.captcha_data = options.captchaData;
    if (options?.recaptchaData) body.recaptcha_data = options.recaptchaData;
    if (options?.recaptchaData) body.recaptcha_token = options.recaptchaData;
    if (options?.recaptchaV3Token) body.recaptcha_v3_token = options.recaptchaV3Token;
    if (options?.turnstileData) body.turnstile_data = options.turnstileData;
    if (options?.turnstileData) body.turnstile_token = options.turnstileData;
    if (options?.turnstileToken) body.turnstile_token = options.turnstileToken;
    if (options?.hcaptchaData) body.hcaptcha_data = options.hcaptchaData;

    const paths = [
      "/api/v1/passport/auth/forget",
      "/api/v1/passport/auth/forgot",
      "/api/v1/passport/auth/reset",
      "/api/v2/passport/auth/forget",
      "/api/v2/passport/auth/forgot",
      "/api/v2/passport/auth/reset",
    ];

    let lastError: unknown;
    for (const path of paths) {
      try {
        await this.request<unknown>("POST", path, body);
        return true;
      } catch (error) {
        lastError = error;
        if (error instanceof AppError && error.code === ErrorCodes.UPSTREAM_ERROR) {
          const details = this.toRecord(error.details);
          const upstreamStatus = this.toNumber(details.upstream_status);
          if (upstreamStatus === 404) {
            continue;
          }
        }
        throw error;
      }
    }

    if (lastError) throw lastError;
    return false;
  }

  async getAuthPolicy(): Promise<{
    isEmailVerifyEnabled: boolean;
    isInviteForce: boolean;
    isRegisterEnabled: boolean;
    allowedEmailSuffixes: string[];
  }> {
    const config = await this.request<XboardGuestConfig>("GET", "/api/v1/guest/comm/config");
    const suffixRaw = this.pick(config, ["email_whitelist_suffix", "email_suffix"]);
    const suffixes = this.normalizeEmailSuffixes(suffixRaw);
    return {
      isEmailVerifyEnabled: this.toBool(config.is_email_verify),
      isInviteForce: this.toBool(config.is_invite_force),
      isRegisterEnabled: config.is_register == null ? true : this.toBool(config.is_register),
      allowedEmailSuffixes: suffixes,
    };
  }

  async getUserInfo(authData: string): Promise<XboardUserInfo> {
    return this.request<XboardUserInfo>("GET", "/api/v1/user/info", undefined, authData);
  }

  async getSubscribe(authData: string): Promise<XboardSubscribe> {
    return this.request<XboardSubscribe>("GET", "/api/v1/user/getSubscribe", undefined, authData);
  }

  async getOrderStatus(authData: string, orderNo: string): Promise<number> {
    return this.request<number>("GET", `/api/v1/user/order/check?trade_no=${encodeURIComponent(orderNo)}`, undefined, authData);
  }

  async getPlans(authData: string): Promise<Array<Record<string, unknown>>> {
    return this.request<Array<Record<string, unknown>>>("GET", "/api/v1/user/plan/fetch", undefined, authData);
  }

  async getPaymentMethods(authData: string): Promise<Array<Record<string, unknown>>> {
    return this.request<Array<Record<string, unknown>>>("GET", "/api/v1/user/order/getPaymentMethod", undefined, authData);
  }

  async getOrders(authData: string): Promise<Array<Record<string, unknown>>> {
    const result = await this.request<unknown>("GET", "/api/v1/user/order/fetch", undefined, authData);
    if (Array.isArray(result)) {
      return result.filter((item): item is Record<string, unknown> => typeof item === "object" && item !== null);
    }
    return [];
  }

  async getOrderDetail(authData: string, orderNo: string): Promise<Record<string, unknown>> {
    return this.request<Record<string, unknown>>(
      "GET",
      `/api/v1/user/order/detail?trade_no=${encodeURIComponent(orderNo)}`,
      undefined,
      authData,
    );
  }

  async cancelOrder(authData: string, orderNo: string): Promise<boolean> {
    return this.request<boolean>(
      "POST",
      "/api/v1/user/order/cancel",
      { trade_no: orderNo },
      authData,
    );
  }

  async getInviteSummary(authData: string): Promise<{
    inviteCode: string | null;
    inviteUrl: string | null;
    rebateTotal: number;
    rebatePending: number;
    rebateAvailable: number;
    rebateWithdrawn: number;
    rebateRate: number;
    rebateRuleText: string | null;
    canWithdraw: boolean;
    invitedCount: number;
  }> {
    const rawUnknown = await this.request<unknown>("GET", "/api/v1/user/invite/fetch", undefined, authData);
    const raw = this.toRecord(rawUnknown);
    const statRows = this.recordList(raw["stat"]);
    const codeRows = this.recordList(raw["codes"]);
    const statRow = statRows[0] ?? this.firstRecord(raw["stat"]);
    const codeRow = codeRows[0] ?? this.firstRecord(raw["codes"]);
    const allSources: Array<Record<string, unknown> | null> = [raw, statRow, codeRow, ...statRows, ...codeRows];

    const inviteCode = this.toStringOrNull(
      this.pickFrom(allSources, ["invite_code", "code", "inviteCode", "inviteCodeValue"]),
    );
    const inviteUrl = this.toStringOrNull(
      this.pickFrom(allSources, ["invite_url", "invite_link", "inviteLink", "url", "link", "inviteURL"]),
    );

    return {
      inviteCode,
      inviteUrl,
      rebateTotal: this.toNumber(
        this.pickFrom(allSources, ["rebate_total", "commission_total", "total_rebate", "total_amount"]),
      ),
      rebatePending: this.toNumber(
        this.pickFrom(allSources, ["rebate_pending", "commission_pending", "pending_amount"]),
      ),
      rebateAvailable: this.toNumber(
        this.pickFrom(allSources, ["rebate_available", "commission_available", "can_withdraw_amount", "available_amount"]),
      ),
      rebateWithdrawn: this.toNumber(
        this.pickFrom(allSources, ["rebate_withdrawn", "commission_withdrawn", "withdrawn_amount", "withdraw_amount"]),
      ),
      rebateRate: this.toNumber(
        this.pickFrom(allSources, ["rebate_rate", "commission_rate", "invite_rate"]),
      ),
      rebateRuleText: this.toStringOrNull(
        this.pickFrom(allSources, ["rebate_rule", "commission_rule", "rule", "description"]),
      ),
      canWithdraw: this.toBool(
        this.pickFrom(allSources, ["can_withdraw", "withdraw_enable", "is_withdraw_enable", "enable_withdraw"]),
      ),
      invitedCount: this.toNumber(this.pickFrom(allSources, ["invited_count", "invite_count", "user_count"])),
    };
  }

  async submitInviteWithdraw(authData: string, amount: number): Promise<boolean> {
    const payload = { amount };
    try {
      await this.request<boolean>("POST", "/api/v1/user/invite/withdraw", payload, authData);
      return true;
    } catch (error) {
      if (error instanceof AppError && error.code === ErrorCodes.UPSTREAM_ERROR) {
        const fallbacks = [
          "/api/v1/user/invite/save",
          "/api/v1/user/invite/withdraw/save",
          "/api/v1/user/commission/withdraw",
          "/api/v1/user/commission/save",
        ];
        for (const path of fallbacks) {
          try {
            await this.request<boolean>("POST", path, payload, authData);
            return true;
          } catch (fallbackError) {
            if (!(fallbackError instanceof AppError) || fallbackError.code !== ErrorCodes.UPSTREAM_ERROR) {
              throw fallbackError;
            }
          }
        }
      }
      throw error;
    }
  }

  async generateInviteCode(authData: string): Promise<boolean> {
    const attempts: Array<{ method: "GET" | "POST"; path: string; body?: Record<string, unknown> }> = [
      { method: "POST", path: "/api/v1/user/invite/save", body: {} },
      { method: "GET", path: "/api/v1/user/invite/save" },
      { method: "POST", path: "/api/v2/user/invite/save", body: {} },
      { method: "GET", path: "/api/v2/user/invite/save" },
    ];
    let lastError: unknown;
    for (const attempt of attempts) {
      try {
        await this.request<unknown>(attempt.method, attempt.path, attempt.body, authData);
        return true;
      } catch (error) {
        lastError = error;
      }
    }
    if (lastError) throw lastError;
    return false;
  }

  async getTickets(authData: string): Promise<Array<Record<string, unknown>>> {
    const raw = await this.request<unknown>("GET", "/api/v1/user/ticket/fetch", undefined, authData);
    return this.extractTickets(raw);
  }

  async getTicketDetail(authData: string, id: number): Promise<Record<string, unknown> | null> {
    const raw = await this.request<unknown>(
      "GET",
      `/api/v1/user/ticket/fetch?id=${encodeURIComponent(String(id))}`,
      undefined,
      authData,
    );
    if (raw && typeof raw === "object" && !Array.isArray(raw)) {
      return raw as Record<string, unknown>;
    }
    if (Array.isArray(raw)) {
      const first = raw.find((item) => item && typeof item === "object" && !Array.isArray(item));
      return first ? (first as Record<string, unknown>) : null;
    }
    return null;
  }

  async createTicket(input: {
    authData: string;
    subject: string;
    message: string;
    level?: number;
  }): Promise<{ created: boolean; ticketId: number | null; raw?: Record<string, unknown> }> {
    const level = Number.isFinite(input.level) ? Number(input.level) : 1;
    const result = await this.request<unknown>(
      "POST",
      "/api/v1/user/ticket/save",
      { subject: input.subject, message: input.message, level },
      input.authData,
    );
    if (typeof result === "number" && Number.isFinite(result) && result > 0) {
      return { created: true, ticketId: Math.floor(result) };
    }
    if (typeof result === "string") {
      const parsed = Number(result);
      if (Number.isFinite(parsed) && parsed > 0) {
        return { created: true, ticketId: Math.floor(parsed) };
      }
      return { created: result.trim().length > 0, ticketId: null };
    }
    const mapped = this.toRecord(result);
    const id = this.toNumber(this.pickFrom([mapped], ["id", "ticket_id", "ticketId"]));
    return {
      created: true,
      ticketId: id > 0 ? id : null,
      raw: Object.keys(mapped).length > 0 ? mapped : undefined,
    };
  }

  async replyTicket(input: { authData: string; id: number; message: string }): Promise<boolean> {
    return this.request<boolean>(
      "POST",
      "/api/v1/user/ticket/reply",
      { id: input.id, message: input.message },
      input.authData,
    );
  }

  async closeTicket(input: { authData: string; id: number }): Promise<boolean> {
    return this.request<boolean>(
      "POST",
      "/api/v1/user/ticket/close",
      { id: input.id },
      input.authData,
    );
  }

  async getNotices(authData: string, current = 1, pageSize = 10): Promise<{
    items: Array<Record<string, unknown>>;
    total: number;
  }> {
    const payload = await this.requestUnwrapped<XboardNoticePayload>(
      "GET",
      `/api/v1/user/notice/fetch?current=${encodeURIComponent(String(current))}&page_size=${encodeURIComponent(
        String(pageSize),
      )}`,
      undefined,
      authData,
    );

    const list = Array.isArray(payload.data)
      ? payload.data.filter((item): item is Record<string, unknown> => typeof item === "object" && item !== null)
      : [];
    return {
      items: list,
      total: this.toNumber(payload.total),
    };
  }

  async getKnowledgeList(
    authData: string,
    input?: { language?: string; keyword?: string },
  ): Promise<Record<string, Array<Record<string, unknown>>>> {
    const query = new URLSearchParams();
    if (input?.language) query.set("language", input.language);
    if (input?.keyword) query.set("keyword", input.keyword);
    const suffix = query.toString();
    const data = await this.request<unknown>(
      "GET",
      `/api/v1/user/knowledge/fetch${suffix ? `?${suffix}` : ""}`,
      undefined,
      authData,
    );

    if (!data || typeof data !== "object") return {};
    const source = data as Record<string, unknown>;
    const normalized: Record<string, Array<Record<string, unknown>>> = {};
    for (const [category, value] of Object.entries(source)) {
      if (!Array.isArray(value)) continue;
      normalized[category] = value.filter(
        (item): item is Record<string, unknown> => typeof item === "object" && item !== null,
      );
    }
    return normalized;
  }

  async getKnowledgeDetail(authData: string, id: number): Promise<Record<string, unknown>> {
    return this.request<Record<string, unknown>>(
      "GET",
      `/api/v1/user/knowledge/fetch?id=${encodeURIComponent(String(id))}`,
      undefined,
      authData,
    );
  }

  async changePassword(authData: string, oldPassword: string, newPassword: string): Promise<boolean> {
    return this.request<boolean>(
      "POST",
      "/api/v1/user/changePassword",
      { old_password: oldPassword, new_password: newPassword },
      authData,
    );
  }

  async getQuickLoginUrl(authData: string, redirect = "ticket"): Promise<string> {
    const raw = await this.request<unknown>(
      "POST",
      "/api/v1/user/getQuickLoginUrl",
      { redirect },
      authData,
    );
    if (typeof raw === "string") return raw;
    if (Array.isArray(raw)) {
      const firstString = raw.find((item) => typeof item === "string" && item.trim().length > 0);
      if (typeof firstString === "string") return firstString.trim();
    }
    const mapped = this.toRecord(raw);
    const nested = this.toRecord(this.pick(mapped, ["data", "result", "payload"]));
    const direct =
      this.toStringOrNull(this.pick(mapped, ["url", "login_url", "quick_login_url", "redirect_url", "link"])) ?? "";
    if (direct.length > 0) return direct;
    return this.toStringOrNull(this.pick(nested, ["url", "login_url", "quick_login_url", "redirect_url", "link"])) ?? "";
  }

  async createOrder(input: {
    authData: string;
    planId: number;
    period: string;
    couponCode?: string;
  }): Promise<string> {
    const body: Record<string, unknown> = { plan_id: input.planId, period: input.period };
    if (input.couponCode) body.coupon_code = input.couponCode;
    const tradeNo = await this.request<string>("POST", "/api/v1/user/order/save", body, input.authData);
    if (!tradeNo || !tradeNo.toString().trim()) {
      throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "XBoard order save response missing trade number");
    }
    return tradeNo.toString().trim();
  }

  async checkCoupon(input: {
    authData: string;
    code: string;
    planId?: number;
    period?: string;
  }): Promise<Record<string, unknown>> {
    const body: Record<string, unknown> = { code: input.code };
    if (Number.isFinite(input.planId) && (input.planId ?? 0) > 0) {
      body.plan_id = input.planId;
    }
    if (input.period && input.period.trim().length > 0) {
      body.period = input.period.trim();
    }
    const raw = await this.request<unknown>("POST", "/api/v1/user/coupon/check", body, input.authData);
    return this.toRecord(raw);
  }

  async checkGiftCard(input: {
    authData: string;
    code: string;
  }): Promise<Record<string, unknown>> {
    const raw = await this.request<unknown>(
      "POST",
      "/api/v1/user/gift-card/check",
      { code: input.code },
      input.authData,
    );
    return this.toRecord(raw);
  }

  async redeemGiftCard(input: {
    authData: string;
    code: string;
  }): Promise<Record<string, unknown>> {
    const raw = await this.request<unknown>(
      "POST",
      "/api/v1/user/gift-card/redeem",
      { code: input.code },
      input.authData,
    );
    return this.toRecord(raw);
  }

  async getGiftCardHistory(authData: string): Promise<Array<Record<string, unknown>>> {
    const raw = await this.request<unknown>("GET", "/api/v1/user/gift-card/history", undefined, authData);
    if (Array.isArray(raw)) {
      return raw.filter(
        (item): item is Record<string, unknown> => typeof item === "object" && item !== null && !Array.isArray(item),
      );
    }
    if (raw && typeof raw === "object") {
      const mapped = raw as Record<string, unknown>;
      const list = mapped["list"] ?? mapped["items"] ?? mapped["data"] ?? mapped["records"];
      if (Array.isArray(list)) {
        return list.filter(
          (item): item is Record<string, unknown> => typeof item === "object" && item !== null && !Array.isArray(item),
        );
      }
    }
    return [];
  }

  async checkoutOrder(input: {
    authData: string;
    orderNo: string;
    paymentMethodId: number;
    token?: string;
  }): Promise<{ type: number; data: unknown }> {
    const body: Record<string, unknown> = {
      trade_no: input.orderNo,
      method: input.paymentMethodId,
    };
    if (input.token) body.token = input.token;

    const payload = await this.requestUnwrapped<{ type?: unknown; data?: unknown; message?: unknown }>(
      "POST",
      "/api/v1/user/order/checkout",
      body,
      input.authData,
    );
    const type = typeof payload.type === "number" ? payload.type : Number(payload.type);
    if (!Number.isFinite(type)) {
      throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "XBoard order checkout response missing payment type", payload);
    }
    return { type, data: payload.data };
  }

  async fetchSubscriptionContent(subscribeUrl: string): Promise<{ raw: string; version: string; nodeCount: number }> {
    const text = await this.fetchBestSubscriptionText(subscribeUrl);
    const normalized = text.replace(/^\uFEFF/, "").trim();
    if (!normalized) {
      throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "Subscription content is empty");
    }

    const version = createHash("sha256").update(normalized).digest("hex").slice(0, 16);
    return {
      raw: normalized,
      version,
      nodeCount: this.estimateNodeCount(normalized),
    };
  }

  private pick(source: Record<string, unknown>, keys: string[]): unknown {
    for (const key of keys) {
      if (key in source) return source[key];
    }
    return undefined;
  }

  private pickFrom(sources: Array<Record<string, unknown> | null>, keys: string[]): unknown {
    for (const source of sources) {
      if (!source) continue;
      const found = this.pick(source, keys);
      if (found !== undefined) return found;
    }
    return undefined;
  }

  private toRecord(value: unknown): Record<string, unknown> {
    if (value && typeof value === "object" && !Array.isArray(value)) {
      return value as Record<string, unknown>;
    }
    return {};
  }

  private firstRecord(value: unknown): Record<string, unknown> | null {
    if (!Array.isArray(value)) return null;
    const first = value.find((item) => item && typeof item === "object" && !Array.isArray(item));
    return first ? (first as Record<string, unknown>) : null;
  }

  private recordList(value: unknown): Array<Record<string, unknown>> {
    if (!Array.isArray(value)) {
      if (value && typeof value === "object" && !Array.isArray(value)) {
        return [value as Record<string, unknown>];
      }
      return [];
    }
    return value.filter((item): item is Record<string, unknown> => item && typeof item === "object" && !Array.isArray(item));
  }

  private extractTickets(value: unknown): Array<Record<string, unknown>> {
    if (Array.isArray(value)) {
      return value.filter(
        (item): item is Record<string, unknown> => item && typeof item === "object" && !Array.isArray(item),
      );
    }
    if (!value || typeof value !== "object" || Array.isArray(value)) {
      return [];
    }

    const root = value as Record<string, unknown>;
    if ("id" in root || "ticket_id" in root) {
      return [root];
    }

    const keys = ["tickets", "list", "items", "records", "data", "result", "payload"];
    for (const key of keys) {
      const child = root[key];
      if (!child) continue;
      if (Array.isArray(child)) {
        const list = child.filter(
          (item): item is Record<string, unknown> => item && typeof item === "object" && !Array.isArray(item),
        );
        if (list.length > 0) return list;
      } else if (typeof child === "object") {
        const nested = this.extractTickets(child);
        if (nested.length > 0) return nested;
      }
    }
    return [];
  }

  private toBool(value: unknown): boolean {
    if (typeof value === "boolean") return value;
    if (typeof value === "number") return value > 0;
    if (typeof value === "string") {
      const normalized = value.trim().toLowerCase();
      return ["1", "true", "yes", "on"].includes(normalized);
    }
    return false;
  }

  private toNumber(value: unknown): number {
    if (typeof value === "number" && Number.isFinite(value)) return value;
    if (typeof value === "string") {
      const parsed = Number(value);
      if (Number.isFinite(parsed)) return parsed;
    }
    return 0;
  }

  private toStringOrNull(value: unknown): string | null {
    if (value == null) return null;
    const text = String(value).trim();
    return text.length > 0 ? text : null;
  }

  private normalizeEmailSuffixes(value: unknown): string[] {
    const raw = Array.isArray(value) ? value.map((item) => String(item)) : String(value ?? "").split(/[,\s]+/g);
    return raw
      .map((item) => item.trim().toLowerCase())
      .filter((item) => item.length > 0)
      .map((item) => (item.startsWith("@") ? item : `@${item}`));
  }

  private async request<T>(method: "GET" | "POST", path: string, body?: unknown, authData?: string): Promise<T> {
    try {
      const { response, payload: rawPayload, finalPath } = await this.fetchJsonWithVersionFallback(
        method,
        path,
        body,
        authData,
      );
      const payload = rawPayload as XboardResponse<T>;
      if (!response.ok || payload.status === "fail") {
        const upstreamStatus = response.status || 0;
        const upstreamMessage = payload.message || "XBoard request failed";
        throw new AppError(
          502,
          ErrorCodes.UPSTREAM_ERROR,
          `${upstreamMessage} (upstream ${upstreamStatus} ${finalPath})`,
          {
            upstream_status: upstreamStatus,
            upstream_path: finalPath,
            upstream_error: payload.error ?? payload,
          },
        );
      }

      if (payload.data === undefined) {
        throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "XBoard response missing data", payload);
      }

      return payload.data;
    } catch (error) {
      if (error instanceof AppError) throw error;
      if (error instanceof Error && error.name === "AbortError") {
        throw new AppError(504, ErrorCodes.UPSTREAM_TIMEOUT, "XBoard request timeout", { method, path });
      }
      throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "XBoard request error", error);
    }
  }

  private async requestUnwrapped<T extends Record<string, unknown>>(
    method: "GET" | "POST",
    path: string,
    body?: unknown,
    authData?: string,
  ): Promise<T> {
    try {
      const { response, payload, finalPath } = await this.fetchJsonWithVersionFallback(method, path, body, authData);

      if (!response.ok) {
        const upstreamStatus = response.status || 0;
        const message =
          typeof payload.message === "string" && payload.message.trim().length > 0
            ? payload.message
            : "XBoard request failed";
        throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, `${message} (upstream ${upstreamStatus} ${finalPath})`, {
          upstream_status: upstreamStatus,
          upstream_path: finalPath,
          upstream_error: payload,
        });
      }

      return payload as T;
    } catch (error) {
      if (error instanceof AppError) throw error;
      if (error instanceof Error && error.name === "AbortError") {
        throw new AppError(504, ErrorCodes.UPSTREAM_TIMEOUT, "XBoard request timeout", { method, path });
      }
      throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "XBoard request error", error);
    }
  }

  private async fetchText(url: string): Promise<string> {
    return this.fetchTextWithUa(url, "SlothVPN-Gateway/0.1.0");
  }

  private async fetchTextWithUa(url: string, userAgent: string, flag?: string): Promise<string> {
    const controller = new AbortController();
    const timer = setTimeout(() => controller.abort(), this.timeoutMs);
    try {
      const requestUrl = this.withClientFlag(url, flag);
      const response = await fetch(requestUrl, {
        headers: {
          "User-Agent": userAgent,
          Accept: "*/*",
        },
        signal: controller.signal,
      });
      if (!response.ok) {
        throw new AppError(response.status || 502, ErrorCodes.UPSTREAM_ERROR, "Subscription pull failed", {
          url: requestUrl,
          status: response.status,
        });
      }
      return await response.text();
    } catch (error) {
      if (error instanceof AppError) throw error;
      if (error instanceof Error && error.name === "AbortError") {
        throw new AppError(504, ErrorCodes.UPSTREAM_TIMEOUT, "Subscription pull timeout", { url });
      }
      throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "Subscription pull error", error);
    } finally {
      clearTimeout(timer);
    }
  }

  private async fetchBestSubscriptionText(url: string): Promise<string> {
    let best: {
      text: string;
      ua: string;
      nodeCount: number;
      schemeCount: number;
      score: number;
      looksJson: boolean;
    } | null = null;
    let lastError: unknown;

    for (const candidateSpec of XboardAdapter.subscriptionClientCandidates) {
      const { ua, flag } = candidateSpec;
      try {
        const text = await this.fetchTextWithUa(url, ua, flag);
        const analyzed = this.analyzeSubscriptionText(text);
        const candidate = { text, ua, ...analyzed };
        if (this.isBetterSubscriptionCandidate(candidate, best)) {
          best = candidate;
        }

        // Good-enough early stop to reduce provider rate-limit pressure.
        if (
          candidate.nodeCount >= 16 ||
          (candidate.nodeCount >= 8 && (candidate.schemeCount >= 2 || candidate.looksJson))
        ) {
          break;
        }
      } catch (error) {
        lastError = error;
      }
    }

    if (best) return best.text;
    if (lastError instanceof AppError) throw lastError;
    throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "Subscription pull error", lastError ?? { url });
  }

  private analyzeSubscriptionText(text: string): {
    nodeCount: number;
    schemeCount: number;
    score: number;
    looksJson: boolean;
  } {
    const normalized = text.replace(/^\uFEFF/, "").trim();
    if (!normalized) {
      return { nodeCount: 0, schemeCount: 0, score: 0, looksJson: false };
    }

    const direct = this.scanSubscriptionText(normalized);
    if (direct.nodeCount > 0 || direct.looksJson) return direct;

    const decoded = this.tryDecodeBase64(normalized);
    if (!decoded) return direct;
    const decodedScan = this.scanSubscriptionText(decoded);
    // Prefer decoded metrics if they reveal actual node content.
    if (decodedScan.nodeCount > 0 || decodedScan.looksJson) {
      return {
        ...decodedScan,
        score: decodedScan.score + 8,
      };
    }
    return direct;
  }

  private scanSubscriptionText(text: string): {
    nodeCount: number;
    schemeCount: number;
    score: number;
    looksJson: boolean;
  } {
    const proxySchemes = new Set<string>();
    let looksJson = false;
    let nodeCount = 0;

    try {
      const parsed = JSON.parse(text) as { outbounds?: Array<{ type?: string }> };
      if (Array.isArray(parsed.outbounds)) {
        looksJson = true;
        for (const item of parsed.outbounds) {
          const type = (item?.type ?? "").toLowerCase();
          if (!type || ["selector", "urltest", "direct", "block", "dns"].includes(type)) continue;
          nodeCount += 1;
          proxySchemes.add(type);
        }
      }
    } catch {
      // keep fallback line scan
    }

    if (nodeCount === 0) {
      const lines = text.split(/\r?\n/).map((line) => line.trim());
      for (const line of lines) {
        if (!line || line.startsWith("#") || line.startsWith("//")) continue;
        const m = /^([a-zA-Z0-9+.-]+):\/\//.exec(line);
        if (!m) continue;
        const scheme = m[1].toLowerCase();
        if (
          [
            "ss",
            "ssr",
            "vmess",
            "vless",
            "trojan",
            "tuic",
            "hy2",
            "hysteria2",
            "hysteria",
            "hy",
            "shadowtls",
            "wg",
            "wireguard",
            "ssh",
            "naive",
            "anytls",
            "mieru",
            "warp",
            "socks",
            "socks5",
            "http",
            "https",
          ].includes(scheme)
        ) {
          nodeCount += 1;
          proxySchemes.add(scheme);
        }
      }
    }

    const schemeCount = proxySchemes.size;
    const looksLikeHtml = /^<!doctype html|^<html/i.test(text.trimLeft());
    let score = nodeCount * 10 + schemeCount * 5;
    if (looksJson) score += 4;
    if (looksLikeHtml) score -= 1000;

    return { nodeCount, schemeCount, score, looksJson };
  }

  private isBetterSubscriptionCandidate(
    candidate: { nodeCount: number; schemeCount: number; score: number; text: string },
    current: { nodeCount: number; schemeCount: number; score: number; text: string } | null,
  ): boolean {
    if (!current) return true;
    if (candidate.nodeCount !== current.nodeCount) return candidate.nodeCount > current.nodeCount;
    if (candidate.schemeCount !== current.schemeCount) return candidate.schemeCount > current.schemeCount;
    if (candidate.score !== current.score) return candidate.score > current.score;
    return candidate.text.length > current.text.length;
  }

  private tryDecodeBase64(value: string): string | null {
    const compact = value.replace(/\s+/g, "");
    if (compact.length < 24) return null;
    if (compact.length % 4 !== 0) return null;
    if (!/^[A-Za-z0-9+/=]+$/.test(compact)) return null;
    try {
      const decoded = Buffer.from(compact, "base64").toString("utf8").trim();
      return decoded.length > 0 ? decoded : null;
    } catch {
      return null;
    }
  }

  private withClientFlag(url: string, flag?: string): string {
    if (!flag) return url;
    try {
      const parsed = new URL(url);
      if (!parsed.searchParams.has("flag")) {
        parsed.searchParams.set("flag", flag);
      }
      return parsed.toString();
    } catch {
      return url;
    }
  }

  private estimateNodeCount(content: string): number {
    return this.analyzeSubscriptionText(content).nodeCount;
  }
}
