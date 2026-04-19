import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/model/gateway_models.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_portal_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GatewayAssistantFab extends ConsumerStatefulWidget {
  const GatewayAssistantFab({super.key, required this.heroTag, this.ticketRoute = '/gateway-account/tickets'});

  final String heroTag;
  final String ticketRoute;

  @override
  ConsumerState<GatewayAssistantFab> createState() => _GatewayAssistantFabState();
}

class _GatewayAssistantFabState extends ConsumerState<GatewayAssistantFab> {
  Offset _dragOffset = Offset.zero;
  Offset _dragStartOffset = Offset.zero;
  bool _justDragged = false;
  Timer? _dragFlagTimer;

  @override
  void dispose() {
    _dragFlagTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    final size = MediaQuery.sizeOf(context);

    Future<void> openAssistantSheet() async {
      await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        useSafeArea: true,
        builder: (_) {
          return FractionallySizedBox(
            heightFactor: 0.88,
            child: _GatewayAssistantSheet(ticketRoute: widget.ticketRoute),
          );
        },
      );
    }

    void clampAndSet(Offset next) {
      final minX = -size.width + 68;
      const maxX = 0.0;
      final minY = -size.height + 168;
      const maxY = 0.0;
      final x = next.dx.clamp(minX, maxX);
      final y = next.dy.clamp(minY, maxY);
      if (!mounted) return;
      setState(() => _dragOffset = Offset(x, y));
    }

    return Transform.translate(
      offset: _dragOffset,
      child: GestureDetector(
        onLongPressStart: (_) {
          _dragStartOffset = _dragOffset;
        },
        onLongPressMoveUpdate: (details) {
          clampAndSet(_dragStartOffset + details.offsetFromOrigin);
        },
        onLongPressEnd: (_) {
          final snapX = _dragOffset.dx < -MediaQuery.sizeOf(context).width * 0.42
              ? -MediaQuery.sizeOf(context).width + 76
              : 0.0;
          clampAndSet(Offset(snapX, _dragOffset.dy));
          _dragStartOffset = _dragOffset;
          _justDragged = true;
          _dragFlagTimer?.cancel();
          _dragFlagTimer = Timer(const Duration(milliseconds: 220), () => _justDragged = false);
        },
        child: FloatingActionButton.small(
          heroTag: widget.heroTag,
          tooltip: isZh ? 'AI 业务助手（长按拖动）' : 'AI assistant (long press to drag)',
          onPressed: () async {
            if (_justDragged) return;
            await openAssistantSheet();
          },
          child: const Icon(Icons.smart_toy_rounded),
        ),
      ),
    );
  }
}

class _AssistantBubble {
  const _AssistantBubble({required this.role, required this.content, this.error = false});

  final String role;
  final String content;
  final bool error;
}

class _GatewayAssistantSheet extends ConsumerStatefulWidget {
  const _GatewayAssistantSheet({required this.ticketRoute});

  final String ticketRoute;

  @override
  ConsumerState<_GatewayAssistantSheet> createState() => _GatewayAssistantSheetState();
}

class _GatewayAssistantSheetState extends ConsumerState<_GatewayAssistantSheet> {
  late final TextEditingController _controller;
  late final ScrollController _scrollController;
  bool _loading = true;
  bool _sending = false;
  bool _loggedIn = false;
  bool _assistantEnabled = true;
  bool _ticketHandoffEnabled = true;
  String _provider = 'knowledge_fallback';
  String _lastQuestion = '';
  String _lastAnswer = '';
  final List<_AssistantBubble> _messages = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _scrollController = ScrollController();
    _bootstrap();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _bootstrap() async {
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    try {
      final portal = ref.read(slothGatewayPortalControllerProvider);
      final loggedIn = await portal.isLoggedIn();
      GatewayAccountSummary? summary;
      if (loggedIn) {
        summary = await portal.fetchAccountSummary();
      }
      final config = summary?.assistantConfig;
      if (!mounted) return;
      setState(() {
        _loggedIn = loggedIn;
        _assistantEnabled = config?.enabled ?? true;
        _ticketHandoffEnabled = config?.ticketHandoffEnabled ?? true;
        _provider = config?.provider ?? 'knowledge_fallback';
        _messages
          ..clear()
          ..add(
            _AssistantBubble(
              role: 'assistant',
              content: loggedIn
                  ? (isZh
                        ? '你好，我可以帮你处理套餐、支付、订阅导入、分流模式和 iOS 安装问题。'
                        : 'Hi, I can help with plans, payments, subscription import, routing modes, and iOS install.')
                  : (isZh
                        ? '请先登录账号，我会根据你的套餐和订单状态给出更准确的答复。'
                        : 'Please sign in first so I can answer based on your account and order status.'),
            ),
          );
        _loading = false;
      });
      _scrollToBottom();
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _messages
          ..clear()
          ..add(
            _AssistantBubble(
              role: 'assistant',
              content: isZh ? '助手初始化失败，请稍后重试。' : 'Assistant failed to initialize. Please try again later.',
              error: true,
            ),
          );
      });
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 46,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
      );
    });
  }

  List<Map<String, String>> _historyForRequest() {
    final normalized = _messages
        .where((item) => item.content.trim().isNotEmpty)
        .map((item) => {'role': item.role, 'content': item.content.trim()})
        .toList();
    if (normalized.length <= 12) return normalized;
    return normalized.sublist(normalized.length - 12);
  }

  String _fallbackReply(String question, bool isZh) {
    final q = question.toLowerCase();
    if (q.contains('分流') || q.contains('global') || q.contains('split')) {
      return isZh
          ? '全局模式：除直连白名单外全部流量走代理。分流模式：仅命中规则或指定应用走代理，其余直连。'
          : 'Global mode proxies all traffic except direct allowlist. Split mode proxies matched rules/apps only.';
    }
    if (q.contains('ios')) {
      return isZh
          ? 'iOS 需要按下载中心教程准备账号或外区下载方式，安装后再一键导入订阅。'
          : 'For iOS, follow the download-center guide first, then import subscription in one tap.';
    }
    if (q.contains('支付') || q.contains('订单') || q.contains('pay')) {
      return isZh
          ? '下单后会在结算步骤选择支付方式。若支付成功未生效，请先刷新订单状态，再同步订阅。'
          : 'Payment method is chosen at checkout. If paid but not active, refresh order status then sync subscription.';
    }
    return isZh
        ? '我先帮你定位：请补充设备系统、具体报错和操作步骤；我可以继续排查或转工单。'
        : 'Please share your platform, exact error, and steps so I can diagnose further or hand off to ticket.';
  }

  Future<void> _send() async {
    final question = _controller.text.trim();
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    if (question.isEmpty || _sending) return;

    _controller.clear();
    setState(() {
      _messages.add(_AssistantBubble(role: 'user', content: question));
      _sending = true;
    });
    _scrollToBottom();

    if (!_loggedIn) {
      if (!mounted) return;
      setState(() {
        _messages.add(
          _AssistantBubble(
            role: 'assistant',
            content: isZh
                ? '请先登录后再提问，这样我可以读取你的套餐和订单信息。'
                : 'Please sign in first so I can use your account and order context.',
          ),
        );
        _sending = false;
      });
      _scrollToBottom();
      return;
    }

    try {
      final portal = ref.read(slothGatewayPortalControllerProvider);
      String answer;
      if (_assistantEnabled) {
        final result = await portal.assistantChat(query: question, messages: _historyForRequest());
        _provider = result.provider;
        answer = result.answer.trim().isEmpty ? _fallbackReply(question, isZh) : result.answer.trim();
        _ticketHandoffEnabled = result.ticketHandoffEnabled;
      } else {
        answer = _fallbackReply(question, isZh);
      }

      if (!mounted) return;
      setState(() {
        _lastQuestion = question;
        _lastAnswer = answer;
        _messages.add(_AssistantBubble(role: 'assistant', content: answer));
        _sending = false;
      });
      _scrollToBottom();
    } on GatewayApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _lastQuestion = question;
        _lastAnswer = _fallbackReply(question, isZh);
        _messages.add(_AssistantBubble(role: 'assistant', content: _lastAnswer));
        _messages.add(
          _AssistantBubble(
            role: 'assistant',
            content: isZh
                ? '模型连接异常，已使用本地业务兜底。详细错误：${e.message}'
                : 'Model upstream unavailable, switched to fallback. Error: ${e.message}',
            error: true,
          ),
        );
        _sending = false;
      });
      _scrollToBottom();
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _lastQuestion = question;
        _lastAnswer = _fallbackReply(question, isZh);
        _messages.add(_AssistantBubble(role: 'assistant', content: _lastAnswer));
        _sending = false;
      });
      _scrollToBottom();
    }
  }

  Future<void> _handoffToTicket() async {
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    if (!_loggedIn) {
      final encoded = Uri.encodeComponent(widget.ticketRoute);
      await context.push('/home/gateway-login?redirect=$encoded');
      return;
    }

    if (!_ticketHandoffEnabled) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(isZh ? '当前站点未开启助手转工单' : 'Ticket handoff is not enabled on this site')));
      return;
    }

    try {
      final portal = ref.read(slothGatewayPortalControllerProvider);
      final question = _lastQuestion.isNotEmpty ? _lastQuestion : (isZh ? '助手转人工支持' : 'Assistant handoff');
      final answer = _lastAnswer.isNotEmpty ? _lastAnswer : (isZh ? '用户请求人工支持' : 'User requested human support');
      await portal.assistantTicketHandoff(question: question, answer: answer, context: 'provider=$_provider');
      if (!mounted) return;
      await context.push(widget.ticketRoute);
    } on GatewayApiException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    final theme = Theme.of(context);

    Widget bubble(_AssistantBubble message) {
      final isUser = message.role == 'user';
      final align = isUser ? Alignment.centerRight : Alignment.centerLeft;
      final bg = isUser
          ? theme.colorScheme.primary.withValues(alpha: 0.16)
          : message.error
          ? theme.colorScheme.errorContainer.withValues(alpha: 0.28)
          : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4);
      final textColor = message.error ? theme.colorScheme.error : theme.colorScheme.onSurface;
      return Align(
        alignment: align,
        child: Container(
          constraints: BoxConstraints(maxWidth: math.max(180, MediaQuery.sizeOf(context).width * 0.78)),
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5)),
          ),
          child: Text(message.content, style: theme.textTheme.bodyMedium?.copyWith(height: 1.45, color: textColor)),
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isZh ? '智能业务助手' : 'Business assistant',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            Text(
              isZh
                  ? '可直接咨询套餐、订单、支付、订阅导入、分流模式和 iOS 教程。'
                  : 'Ask about plans, orders, payment, subscription import, routing mode and iOS guide.',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 10),
            if (_loading)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else
              Expanded(
                child: ListView(controller: _scrollController, children: _messages.map(bubble).toList()),
              ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    maxLines: 3,
                    minLines: 1,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _send(),
                    decoration: InputDecoration(
                      hintText: isZh
                          ? '输入你的问题，例如：支付成功未开通怎么办'
                          : 'Ask anything, e.g. payment done but plan not activated',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: _sending ? null : _send,
                  child: _sending
                      ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.send_rounded),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _handoffToTicket,
                icon: const Icon(Icons.support_agent_rounded),
                label: Text(isZh ? '提交工单' : 'Submit ticket'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
