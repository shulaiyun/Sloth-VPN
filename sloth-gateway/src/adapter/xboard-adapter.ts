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

export class XboardAdapter {
  constructor(private readonly baseUrl: string, private readonly timeoutMs: number) {}

  async login(email: string, password: string): Promise<{ authData: string; token?: string }> {
    const data = await this.request<{ auth_data: string; token?: string }>("POST", "/api/v1/passport/auth/login", {
      email,
      password,
    });

    if (!data?.auth_data) {
      throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "XBoard login response missing auth_data");
    }

    return { authData: data.auth_data, token: data.token };
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

      const payload = (await response.json().catch(() => ({}))) as XboardResponse<T>;
      if (!response.ok || payload.status === "fail") {
        throw new AppError(
          response.status || 502,
          ErrorCodes.UPSTREAM_ERROR,
          payload.message || "XBoard request failed",
          payload.error ?? payload,
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
    } finally {
      clearTimeout(timer);
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
