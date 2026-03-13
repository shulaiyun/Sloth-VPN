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
  turnstileData?: string;
  hcaptchaData?: string;
};

export class XboardAdapter {
  constructor(private readonly baseUrl: string, private readonly timeoutMs: number) {}

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
    if (options?.turnstileData) body.turnstile_data = options.turnstileData;
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
    turnstileData?: string;
    hcaptchaData?: string;
  }): Promise<boolean> {
    const body: Record<string, unknown> = { email: input.email };
    if (input.captchaData) body.captcha_data = input.captchaData;
    if (input.recaptchaData) body.recaptcha_data = input.recaptchaData;
    if (input.turnstileData) body.turnstile_data = input.turnstileData;
    if (input.hcaptchaData) body.hcaptcha_data = input.hcaptchaData;
    await this.request<boolean>("POST", "/api/v1/passport/comm/sendEmailVerify", body);
    return true;
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
    const text = await this.fetchText(subscribeUrl);
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
    const controller = new AbortController();
    const timer = setTimeout(() => controller.abort(), this.timeoutMs);
    try {
      const response = await fetch(url, {
        headers: {
          "User-Agent": "SlothVPN-Gateway/0.1.0",
          Accept: "*/*",
        },
        signal: controller.signal,
      });
      if (!response.ok) {
        throw new AppError(response.status || 502, ErrorCodes.UPSTREAM_ERROR, "Subscription pull failed", {
          url,
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

  private estimateNodeCount(content: string): number {
    try {
      const parsed = JSON.parse(content) as { outbounds?: Array<{ type?: string }> };
      if (Array.isArray(parsed.outbounds)) {
        return parsed.outbounds.filter((item) => {
          const t = item.type ?? "";
          return !["selector", "urltest", "direct", "block", "dns"].includes(t);
        }).length;
      }
    } catch {
      // ignore JSON parse error
    }

    return content
      .split(/\r?\n/)
      .map((line) => line.trim())
      .filter((line) => /^(ss|vmess|vless|trojan|tuic|hy2|hysteria2|hysteria):\/\//i.test(line)).length;
  }
}
