import type { FastifyInstance } from "fastify";
import type { XboardAdapter } from "../adapter/xboard-adapter";
import { config } from "../config";
import { AppError, ErrorCodes } from "../errors";
import { requireSession } from "../plugins/auth";
import type { SessionStore } from "../store/session-store";
import { ok } from "../utils/response";

type AssistantDeps = {
  sessions: SessionStore;
  xboard: XboardAdapter;
};

type ChatMessage = {
  role: "system" | "user" | "assistant";
  content: string;
};

const toRecord = (value: unknown): Record<string, unknown> =>
  value && typeof value === "object" && !Array.isArray(value) ? (value as Record<string, unknown>) : {};

const toText = (value: unknown): string => String(value ?? "").trim();

const toMessageList = (value: unknown): ChatMessage[] => {
  if (!Array.isArray(value)) return [];
  const normalized = value
    .map((item) => toRecord(item))
    .map((item) => ({
      role: toText(item.role).toLowerCase(),
      content: toText(item.content),
    }))
    .filter(
      (item): item is ChatMessage =>
        (item.role === "system" || item.role === "user" || item.role === "assistant") &&
        item.content.length > 0,
    );

  return normalized.slice(-14);
};

const normalizeKnowledgeItems = (
  groups: Record<string, Array<Record<string, unknown>>>,
): Array<{ title: string; body: string; category: string }> => {
  const output: Array<{ title: string; body: string; category: string }> = [];
  for (const [category, list] of Object.entries(groups)) {
    for (const raw of list) {
      const title = toText(raw.title);
      const body = toText(raw.body).replace(/\s+/g, " ");
      if (!title && !body) continue;
      output.push({ title, body, category });
      if (output.length >= 20) return output;
    }
  }
  return output;
};

const compactText = (value: string, limit: number): string => {
  const normalized = value.replace(/\s+/g, " ").trim();
  if (normalized.length <= limit) return normalized;
  return `${normalized.slice(0, limit)}...`;
};

const fallbackAnswer = (
  question: string,
  knowledge: Array<{ title: string; body: string; category: string }>,
): string => {
  const normalized = question.trim().toLowerCase();
  if (!normalized) {
    return "我可以帮你处理套餐购买、支付、订阅导入、分流模式与 iOS 下载教程。请直接描述你遇到的问题。";
  }

  const scored = knowledge
    .map((item) => {
      const title = item.title.toLowerCase();
      const body = item.body.toLowerCase();
      let score = 0;
      if (title.includes(normalized) || body.includes(normalized)) score += 12;
      for (const token of normalized.split(/\s+/).filter((part) => part.length > 0)) {
        if (title.includes(token)) score += 5;
        if (body.includes(token)) score += 2;
      }
      return { item, score };
    })
    .filter((entry) => entry.score > 0)
    .sort((a, b) => b.score - a.score);

  if (scored.length > 0) {
    const top = scored[0].item;
    return `${top.title || "参考说明"}：${compactText(top.body || "请在工单里提交更具体信息，我们会继续跟进。", 320)}`;
  }

  return "暂时没有命中准确知识。请补充你使用的平台、报错截图或订单号；我可以继续定位，必要时也可一键转工单。";
};

const fetchWithTimeout = async (
  url: string,
  init: RequestInit,
  timeoutMs: number,
): Promise<Response> => {
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), timeoutMs);
  try {
    return await fetch(url, { ...init, signal: controller.signal });
  } finally {
    clearTimeout(timer);
  }
};

const callAssistantProvider = async (
  messages: ChatMessage[],
): Promise<{ answer: string; model: string; raw?: Record<string, unknown> }> => {
  if (!config.assistantEnabled) {
    throw new AppError(503, ErrorCodes.UPSTREAM_ERROR, "Assistant is disabled");
  }
  if (!config.assistantApiKey) {
    throw new AppError(500, ErrorCodes.INVALID_ARGUMENT, "assistant api key is not configured");
  }

  const endpoint = `${config.assistantBaseUrl}/v1/chat/completions`;
  const response = await fetchWithTimeout(
    endpoint,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: `Bearer ${config.assistantApiKey}`,
      },
      body: JSON.stringify({
        model: config.assistantModel,
        messages: messages.map((item) => ({ role: item.role, content: item.content })),
        stream: false,
        temperature: config.assistantTemperature,
        max_tokens: config.assistantMaxTokens,
      }),
    },
    config.assistantTimeoutMs,
  );

  const payload = (await response.json().catch(() => ({}))) as Record<string, unknown>;
  if (!response.ok) {
    const message = toText(toRecord(payload.error).message) || toText(payload.message) || "assistant upstream failed";
    throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, message, {
      upstream_status: response.status,
      upstream_payload: payload,
    });
  }

  const choices = Array.isArray(payload.choices) ? payload.choices : [];
  const first = choices.length > 0 ? toRecord(choices[0]) : {};
  const messageObj = toRecord(first.message);
  const content = toText(messageObj.content);
  if (!content) {
    throw new AppError(502, ErrorCodes.UPSTREAM_ERROR, "assistant response is empty");
  }

  return {
    answer: content,
    model: toText(payload.model) || config.assistantModel,
    raw: payload,
  };
};

export const registerAssistantRoutes = (app: FastifyInstance, deps: AssistantDeps): void => {
  app.post("/api/app/v1/assistant/chat", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    const body = toRecord(request.body);
    const query = toText(body.query);
    const incomingMessages = toMessageList(body.messages);

    const latestUserMessage =
      [...incomingMessages].reverse().find((item) => item.role === "user")?.content ??
      query;
    if (!latestUserMessage) {
      throw new AppError(400, ErrorCodes.INVALID_ARGUMENT, "query or messages is required");
    }

    let knowledgeItems: Array<{ title: string; body: string; category: string }> = [];
    try {
      const groups = await deps.xboard.getKnowledgeList(session.xboardAuthData, {
        language: "zh-CN",
        keyword: latestUserMessage.slice(0, 36),
      });
      knowledgeItems = normalizeKnowledgeItems(groups);
    } catch {
      knowledgeItems = [];
    }

    const systemKnowledge = knowledgeItems
      .slice(0, 6)
      .map((item, index) => `${index + 1}. [${item.category}] ${item.title}: ${compactText(item.body, 220)}`)
      .join("\n");

    const promptMessages: ChatMessage[] = [
      { role: "system", content: config.assistantSystemPrompt },
      {
        role: "system",
        content:
          "回复要求：1)先给结论 2)给2-4步可执行操作 3)如涉及支付/订单/订阅同步请提醒可提交工单。请保持简洁专业。",
      },
      ...(systemKnowledge
        ? [
            {
              role: "system" as const,
              content: `站点知识摘要（优先参考）:\n${systemKnowledge}`,
            },
          ]
        : []),
      ...incomingMessages,
      ...(incomingMessages.length === 0 ? [{ role: "user" as const, content: latestUserMessage }] : []),
    ];

    try {
      const providerResult = await callAssistantProvider(promptMessages);
      return ok(reply, {
        answer: providerResult.answer,
        provider: config.assistantProvider,
        model: providerResult.model,
        fallback: false,
        ticket_handoff_enabled: config.assistantTicketHandoffEnabled,
        created_at: new Date().toISOString(),
      });
    } catch (error) {
      if (!config.assistantFallbackEnabled) {
        throw error;
      }
      return ok(reply, {
        answer: fallbackAnswer(latestUserMessage, knowledgeItems),
        provider: "knowledge_fallback",
        model: null,
        fallback: true,
        ticket_handoff_enabled: config.assistantTicketHandoffEnabled,
        created_at: new Date().toISOString(),
      });
    }
  });

  app.post("/api/app/v1/assistant/ticket-handoff", async (request, reply) => {
    const session = requireSession(request, deps.sessions);
    if (!config.assistantTicketHandoffEnabled) {
      throw new AppError(403, ErrorCodes.FORBIDDEN, "ticket handoff is disabled");
    }

    const body = toRecord(request.body);
    const question = toText(body.question);
    const assistantAnswer = toText(body.answer);
    const extraContext = toText(body.context);

    const subjectCore = question || "助手未能解决的问题";
    const subject = subjectCore.length > 48 ? `${subjectCore.slice(0, 48)}...` : subjectCore;
    const message = [
      "用户通过智能助手转人工工单。",
      question ? `问题：${question}` : "问题：未提供",
      assistantAnswer ? `助手答复：${assistantAnswer}` : "助手答复：未提供",
      extraContext ? `补充信息：${extraContext}` : "",
    ]
      .filter((item) => item.length > 0)
      .join("\n\n");

    const created = await deps.xboard.createTicket({
      authData: session.xboardAuthData,
      subject,
      message,
      level: 1,
    });

    return ok(reply, {
      created: created.created,
      ticket_id: created.ticketId,
      subject,
      message_preview: compactText(message, 240),
      created_at: new Date().toISOString(),
    });
  });
};

