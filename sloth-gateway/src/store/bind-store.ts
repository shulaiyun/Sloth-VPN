import { randomUUID } from "node:crypto";

export type BindStatus = "pending" | "approved" | "consumed";

export type BindRecord = {
  bindId: string;
  deviceId: string;
  platform?: string;
  appVersion?: string;
  bindCode: string;
  status: BindStatus;
  createdAt: number;
  expiresAt: number;
  exchangeToken?: string;
};

export class BindStore {
  private readonly data = new Map<string, BindRecord>();

  create(input: { deviceId: string; platform?: string; appVersion?: string; ttlSeconds: number }): BindRecord {
    this.cleanup();
    const bindId = randomUUID();
    const bindCode = String(Math.floor(100000 + Math.random() * 900000));
    const now = Date.now();
    const record: BindRecord = {
      bindId,
      deviceId: input.deviceId,
      platform: input.platform,
      appVersion: input.appVersion,
      bindCode,
      status: "pending",
      createdAt: now,
      expiresAt: now + input.ttlSeconds * 1000,
    };
    this.data.set(bindId, record);
    return record;
  }

  get(bindId: string): BindRecord | undefined {
    this.cleanup();
    return this.data.get(bindId);
  }

  approve(bindId: string, exchangeToken: string): BindRecord | undefined {
    const current = this.get(bindId);
    if (!current) return undefined;
    const next: BindRecord = { ...current, status: "approved", exchangeToken };
    this.data.set(bindId, next);
    return next;
  }

  consume(bindId: string): BindRecord | undefined {
    const current = this.get(bindId);
    if (!current) return undefined;
    const next: BindRecord = { ...current, status: "consumed" };
    this.data.set(bindId, next);
    return next;
  }

  private cleanup(): void {
    const now = Date.now();
    for (const [key, value] of this.data.entries()) {
      if (value.expiresAt <= now) this.data.delete(key);
    }
  }
}
