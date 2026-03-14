import type { FastifyInstance } from "fastify";
import type { XboardAdapter } from "../adapter/xboard-adapter";
import { requireSession } from "../plugins/auth";
import type { SessionStore } from "../store/session-store";
import { ok } from "../utils/response";

type ContentDeps = {
  sessions: SessionStore;
  xboard: XboardAdapter;
};

type KnowledgeItem = {
  id: number;
  category: string;
  title: string;
  body: string;
  updated_at: string | null;
};

const toIsoTime = (value: unknown): string | null => {
  if (value == null) return null;
  if (typeof value === "number") {
    const ts = value > 9_999_999_999 ? value : value * 1000;
    return new Date(ts).toISOString();
  }
  const text = String(value).trim();
  if (!text) return null;
  const numeric = Number(text);
  if (Number.isFinite(numeric)) {
    const ts = numeric > 9_999_999_999 ? numeric : numeric * 1000;
    return new Date(ts).toISOString();
  }
  const parsed = new Date(text);
  if (Number.isNaN(parsed.getTime())) return null;
  return parsed.toISOString();
};

const pickText = (source: Record<string, unknown>, keys: string[]): string => {
  for (const key of keys) {
    if (!(key in source)) continue;
    const text = String(source[key] ?? "").trim();
    if (text.length > 0) return text;
  }
  return "";
};

const normalizeCategory = (value: string): string => {
  const lower = value.toLowerCase();
  if (lower.includes("android") || lower.includes("安卓")) return "android";
  if (lower.includes("ios") || lower.includes("iphone")) return "ios";
  if (lower.includes("windows") || lower.includes("win")) return "windows";
  if (lower.includes("mac") || lower.includes("osx")) return "macos";
  if (lower.includes("linux")) return "linux";
  return value.length <= 0 ? "general" : value;
};

const fallbackKnowledge = (): KnowledgeItem[] => {
  const now = new Date().toISOString();
  return [
    {
      id: 900001,
      category: "android",
      title: "安卓使用教程（待补充）",
      body: "请在 XBoard 后台知识库中补充安卓教程内容，App 将自动展示。",
      updated_at: now,
    },
    {
      id: 900002,
      category: "ios",
      title: "iPhone / iOS 使用教程（待补充）",
      body: "请在 XBoard 后台知识库中补充 iOS 教程内容，App 将自动展示。",
      updated_at: now,
    },
    {
      id: 900003,
      category: "windows",
      title: "Windows 使用教程（待补充）",
      body: "请在 XBoard 后台知识库中补充 Windows 教程内容，App 将自动展示。",
      updated_at: now,
    },
    {
      id: 900004,
      category: "macos",
      title: "macOS 使用教程（待补充）",
      body: "请在 XBoard 后台知识库中补充 macOS 教程内容，App 将自动展示。",
      updated_at: now,
    },
    {
      id: 900005,
      category: "linux",
      title: "Linux 使用教程（待补充）",
      body: "请在 XBoard 后台知识库中补充 Linux 教程内容，App 将自动展示。",
      updated_at: now,
    },
  ];
};

export const registerContentRoutes = (app: FastifyInstance, deps: ContentDeps): void => {
  app.get("/api/app/v1/content/notices", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const query = request.query as Record<string, unknown>;
    const current = Number(query.current ?? 1);
    const pageSize = Number(query.page_size ?? 10);

    const notices = await deps.xboard.getNotices(
      session.xboardAuthData,
      Number.isFinite(current) && current > 0 ? current : 1,
      Number.isFinite(pageSize) && pageSize > 0 ? pageSize : 10,
    );

    const items = notices.items.map((item) => ({
      id: Number(item.id ?? 0),
      title: pickText(item, ["title", "subject", "name"]),
      content: pickText(item, ["content", "body", "message"]),
      created_at: toIsoTime(item.created_at),
      updated_at: toIsoTime(item.updated_at),
    }));

    return ok(reply, {
      items,
      total: notices.total,
      fetched_at: new Date().toISOString(),
    });
  });

  app.get("/api/app/v1/content/knowledge", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const query = request.query as Record<string, unknown>;
    const language = String(query.language ?? "").trim();
    const keyword = String(query.keyword ?? "").trim();
    const grouped = await deps.xboard.getKnowledgeList(session.xboardAuthData, {
      language: language || undefined,
      keyword: keyword || undefined,
    });

    const list: KnowledgeItem[] = [];
    for (const [categoryRaw, items] of Object.entries(grouped)) {
      const category = normalizeCategory(categoryRaw);
      for (const item of items) {
        list.push({
          id: Number(item.id ?? 0),
          category,
          title: pickText(item, ["title", "name"]),
          body: pickText(item, ["body", "content"]),
          updated_at: toIsoTime(item.updated_at),
        });
      }
    }

    const finalList = list.length > 0 ? list : fallbackKnowledge();
    return ok(reply, {
      items: finalList,
      categories: ["android", "ios", "windows", "macos", "linux"],
      fetched_at: new Date().toISOString(),
    });
  });

  app.get("/api/app/v1/content/knowledge/:id", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const params = request.params as { id: string };
    const id = Number(params.id);
    if (!Number.isFinite(id) || id <= 0) {
      return ok(reply, {
        item: null,
      });
    }

    if (id >= 900001 && id <= 900005) {
      const item = fallbackKnowledge().find((entry) => entry.id === id) ?? null;
      return ok(reply, { item });
    }

    const raw = await deps.xboard.getKnowledgeDetail(session.xboardAuthData, id);
    const category = normalizeCategory(pickText(raw, ["category"]));
    const item = {
      id: Number(raw.id ?? id),
      category,
      title: pickText(raw, ["title", "name"]),
      body: pickText(raw, ["body", "content"]),
      updated_at: toIsoTime(raw.updated_at),
    };
    return ok(reply, { item });
  });
};

