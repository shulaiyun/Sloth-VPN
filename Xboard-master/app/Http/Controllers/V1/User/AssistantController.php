<?php

namespace App\Http\Controllers\V1\User;

use App\Http\Controllers\Controller;
use App\Models\Knowledge;
use App\Services\TicketService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;

class AssistantController extends Controller
{
    public function chat(Request $request)
    {
        $request->validate([
            'query' => 'nullable|string|max:2000',
            'messages' => 'nullable|array|max:20',
            'messages.*.role' => 'nullable|string|in:user,assistant,system',
            'messages.*.content' => 'nullable|string|max:4000',
        ]);

        $messages = collect($request->input('messages', []))
            ->filter(fn($item) => is_array($item))
            ->map(function ($item) {
                return [
                    'role' => in_array(($item['role'] ?? ''), ['user', 'assistant', 'system']) ? $item['role'] : 'user',
                    'content' => trim((string) ($item['content'] ?? '')),
                ];
            })
            ->filter(fn($item) => $item['content'] !== '')
            ->values()
            ->all();

        $query = trim((string) $request->input('query', ''));
        if ($query === '') {
            $lastUser = collect($messages)->reverse()->first(fn($item) => ($item['role'] ?? '') === 'user');
            $query = trim((string) ($lastUser['content'] ?? ''));
        }

        if ($query === '') {
            return $this->fail([422, 'query is required']);
        }

        $assistantEnabled = (bool) admin_setting('assistant_enabled', true);
        $provider = (string) admin_setting('assistant_provider', 'cliproxyapi');
        $model = (string) admin_setting('assistant_model', 'gpt-4o-mini');
        $baseUrl = rtrim((string) admin_setting('assistant_base_url', ''), '/');
        $apiKey = (string) admin_setting('assistant_api_key', '');
        $ticketHandoffEnabled = (bool) admin_setting('assistant_ticket_handoff_enable', true);
        $fallbackEnabled = true;

        $knowledgeSummary = $this->buildKnowledgeSummary($request->input('language', 'zh-CN'), $query);
        $fallbackAnswer = $this->fallbackAnswer($query, $knowledgeSummary);

        if (!$assistantEnabled || $baseUrl === '' || $apiKey === '') {
            return $this->success([
                'answer' => $fallbackAnswer,
                'provider' => 'knowledge_fallback',
                'model' => null,
                'fallback' => true,
                'ticket_handoff_enabled' => $ticketHandoffEnabled,
                'created_at' => date('c'),
            ]);
        }

        $defaultPrompt = (string) admin_setting(
            'assistant_system_prompt',
            '你是 SlothVPN 的业务助手。先给结论，再给可执行步骤。优先回答套餐、支付、订阅导入、分流与全局模式、iOS 下载教程。',
        );

        $payloadMessages = [
            ['role' => 'system', 'content' => $defaultPrompt],
            ['role' => 'system', 'content' => '回复要求：简洁明确，优先提供 2-4 步可执行动作，必要时建议用户提交工单。'],
        ];
        if ($knowledgeSummary !== '') {
            $payloadMessages[] = ['role' => 'system', 'content' => "站点知识摘要：\n{$knowledgeSummary}"];
        }
        foreach ($messages as $item) {
            $payloadMessages[] = $item;
        }
        if (empty($messages)) {
            $payloadMessages[] = ['role' => 'user', 'content' => $query];
        }

        try {
            $response = Http::timeout(30)
                ->withToken($apiKey)
                ->acceptJson()
                ->post("{$baseUrl}/v1/chat/completions", [
                    'model' => $model,
                    'messages' => $payloadMessages,
                    'stream' => false,
                    'temperature' => 0.2,
                    'max_tokens' => 700,
                ]);

            if (!$response->ok()) {
                throw new \RuntimeException("assistant upstream error: {$response->status()}");
            }

            $json = $response->json();
            $answer = trim((string) data_get($json, 'choices.0.message.content', ''));
            if ($answer === '') {
                throw new \RuntimeException('assistant empty response');
            }

            return $this->success([
                'answer' => $answer,
                'provider' => $provider,
                'model' => (string) data_get($json, 'model', $model),
                'fallback' => false,
                'ticket_handoff_enabled' => $ticketHandoffEnabled,
                'created_at' => date('c'),
            ]);
        } catch (\Throwable $e) {
            if (!$fallbackEnabled) {
                return $this->fail([500, $e->getMessage()]);
            }
            return $this->success([
                'answer' => $fallbackAnswer,
                'provider' => 'knowledge_fallback',
                'model' => null,
                'fallback' => true,
                'ticket_handoff_enabled' => $ticketHandoffEnabled,
                'created_at' => date('c'),
            ]);
        }
    }

    public function ticketHandoff(Request $request)
    {
        $request->validate([
            'question' => 'nullable|string|max:2000',
            'answer' => 'nullable|string|max:8000',
            'context' => 'nullable|string|max:4000',
        ]);

        if (!(bool) admin_setting('assistant_ticket_handoff_enable', true)) {
            return $this->fail([403, 'Ticket handoff is disabled']);
        }

        $question = trim((string) $request->input('question', ''));
        $answer = trim((string) $request->input('answer', ''));
        $context = trim((string) $request->input('context', ''));
        $subjectSeed = $question !== '' ? $question : '助手转人工支持';
        $subject = Str::limit($subjectSeed, 48, '...');
        $message = collect([
            "用户通过智能助手转人工工单。",
            $question !== '' ? "问题：{$question}" : "问题：未提供",
            $answer !== '' ? "助手答复：{$answer}" : "助手答复：未提供",
            $context !== '' ? "补充信息：{$context}" : null,
        ])->filter()->implode("\n\n");

        $ticketService = new TicketService();
        $ticket = $ticketService->createTicket(
            $request->user()->id,
            $subject,
            1,
            $message
        );

        return $this->success([
            'created' => true,
            'ticket_id' => $ticket->id ?? null,
            'subject' => $subject,
            'created_at' => date('c'),
        ]);
    }

    protected function buildKnowledgeSummary(string $language, string $keyword): string
    {
        $query = Knowledge::query()
            ->select(['category', 'title', 'body'])
            ->where('show', 1)
            ->where('language', $language)
            ->orderBy('sort', 'ASC');

        if (trim($keyword) !== '') {
            $query->where(function ($q) use ($keyword) {
                $q->where('title', 'LIKE', "%{$keyword}%")
                    ->orWhere('body', 'LIKE', "%{$keyword}%");
            });
        }

        $items = $query->limit(8)->get();
        if ($items->isEmpty()) return '';

        return $items->map(function ($item, $index) {
            $title = trim((string) $item->title);
            $body = $this->cleanText((string) $item->body, 220);
            $category = trim((string) $item->category);
            return ($index + 1) . ". [{$category}] {$title}: {$body}";
        })->implode("\n");
    }

    protected function fallbackAnswer(string $question, string $knowledgeSummary): string
    {
        $q = Str::lower($question);
        if (Str::contains($q, ['分流', 'global', 'split'])) {
            return '全局模式：除直连白名单外全部流量走代理。分流模式：仅命中规则或指定应用走代理，其余直连。';
        }
        if (Str::contains($q, ['ios', '苹果'])) {
            return 'iOS 下载请先打开下载中心的 iOS 教程入口，按教程完成账号准备后再安装并一键导入订阅。';
        }
        if (Str::contains($q, ['支付', '订单', 'pay'])) {
            return '下单后在结算步骤选择支付方式。若支付成功未生效，请先刷新订单状态，再执行订阅同步。';
        }
        if ($knowledgeSummary !== '') {
            return '我先给出知识库建议：' . $this->cleanText($knowledgeSummary, 280);
        }
        return '请补充设备系统、具体报错与操作步骤，我可以继续定位；若仍无法解决可直接提交工单。';
    }

    protected function cleanText(string $raw, int $limit = 220): string
    {
        $text = trim((string) preg_replace('/\s+/u', ' ', strip_tags($raw)));
        if ($text === '') return '';
        if (mb_strlen($text) <= $limit) return $text;
        return mb_substr($text, 0, $limit) . '...';
    }
}

