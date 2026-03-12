import { randomUUID } from "node:crypto";

export type SessionRecord = {
  sid: string;
  xboardAuthData: string;
  xboardToken?: string;
  userEmail?: string;
  userUuid?: string;
  createdAt: number;
  updatedAt: number;
  lastSyncedAt?: string;
  subscriptionVersion?: string;
  nodeCount?: number;
};

export class SessionStore {
  private readonly data = new Map<string, SessionRecord>();

  create(input: Omit<SessionRecord, "sid" | "createdAt" | "updatedAt">): SessionRecord {
    const now = Date.now();
    const rec: SessionRecord = {
      sid: randomUUID(),
      createdAt: now,
      updatedAt: now,
      ...input,
    };
    this.data.set(rec.sid, rec);
    return rec;
  }

  get(sid: string): SessionRecord | undefined {
    return this.data.get(sid);
  }

  update(sid: string, patch: Partial<SessionRecord>): SessionRecord | undefined {
    const current = this.data.get(sid);
    if (!current) return undefined;
    const next = { ...current, ...patch, updatedAt: Date.now() };
    this.data.set(sid, next);
    return next;
  }
}
