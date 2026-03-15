import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/model/gateway_models.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_portal_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GatewayTicketPage extends HookConsumerWidget {
  const GatewayTicketPage({super.key});

  bool _isZh(BuildContext context) => Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');

  String _formatTime(String? value) {
    if (value == null || value.isEmpty) return '--';
    final dt = DateTime.tryParse(value);
    if (dt == null) return value;
    final local = dt.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${local.year}-${two(local.month)}-${two(local.day)} ${two(local.hour)}:${two(local.minute)}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isZh = _isZh(context);
    final loading = useState(true);
    final error = useState<String?>(null);
    final tickets = useState<List<GatewayTicketItem>>(<GatewayTicketItem>[]);

    List<GatewayTicketItem> mergeTickets(List<GatewayTicketItem> remote, List<GatewayTicketItem> local) {
      if (local.isEmpty) return remote;
      final merged = [...remote];
      bool existsBySubject(GatewayTicketItem item) {
        return merged.any((remoteItem) {
          if (remoteItem.id > 0 && item.id > 0) return remoteItem.id == item.id;
          return remoteItem.subject.trim() == item.subject.trim();
        });
      }

      for (final item in local) {
        if (!existsBySubject(item)) {
          merged.insert(0, item);
        }
      }
      return merged;
    }

    Future<void> load() async {
      loading.value = true;
      error.value = null;
      try {
        final remote = await ref.read(slothGatewayPortalControllerProvider).fetchTickets();
        final now = DateTime.now();
        final localRecent = tickets.value.where((item) {
          if (item.id <= 0) return true;
          final updatedAt = DateTime.tryParse(item.updatedAt ?? item.createdAt ?? "");
          if (updatedAt == null) return false;
          return now.difference(updatedAt).inSeconds <= 180;
        }).toList();
        tickets.value = mergeTickets(remote, localRecent);
      } on GatewayApiException catch (e) {
        error.value = e.message;
      } catch (_) {
        error.value = isZh ? '加载工单失败' : 'Failed to load tickets';
      } finally {
        loading.value = false;
      }
    }

    Future<void> openDetail(GatewayTicketItem base, {bool fetchRemote = true}) async {
      GatewayTicketItem ticket = base;
      if (fetchRemote && base.id > 0) {
        try {
          ticket = await ref.read(slothGatewayPortalControllerProvider).fetchTicketDetail(base.id) ?? base;
        } catch (_) {
          ticket = base;
        }
      }
      if (!context.mounted) return;

      final replyController = TextEditingController();
      await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (sheetContext) {
          Future<void> sendReply() async {
            final text = replyController.text.trim();
            if (text.isEmpty) return;
            if (ticket.id <= 0) {
              ScaffoldMessenger.of(
                sheetContext,
              ).showSnackBar(SnackBar(content: Text(isZh ? '工单编号同步中，请稍后重试' : 'Ticket is syncing, try again later')));
              return;
            }
            try {
              final updated = await ref
                  .read(slothGatewayPortalControllerProvider)
                  .replyTicket(id: ticket.id, message: text);
              if (!sheetContext.mounted) return;
              Navigator.pop(sheetContext);
              if (updated != null) {
                tickets.value = [updated, ...tickets.value.where((item) => item.id != updated.id)];
              } else {
                await load();
              }
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isZh ? '回复已发送' : 'Reply sent')));
            } on GatewayApiException catch (e) {
              if (!sheetContext.mounted) return;
              ScaffoldMessenger.of(sheetContext).showSnackBar(SnackBar(content: Text(e.message)));
            }
          }

          Future<void> closeTicket() async {
            if (ticket.id <= 0) {
              ScaffoldMessenger.of(
                sheetContext,
              ).showSnackBar(SnackBar(content: Text(isZh ? '工单编号同步中，请稍后重试' : 'Ticket is syncing, try again later')));
              return;
            }
            try {
              await ref.read(slothGatewayPortalControllerProvider).closeTicket(ticket.id);
              final nowIso = DateTime.now().toIso8601String();
              tickets.value = tickets.value
                  .map(
                    (item) => item.id == ticket.id
                        ? GatewayTicketItem(
                            id: item.id,
                            subject: item.subject,
                            level: item.level,
                            levelLabel: item.levelLabel,
                            statusCode: 1,
                            status: 'closed',
                            replyStatus: item.replyStatus,
                            replyStatusLabel: item.replyStatusLabel,
                            canReply: false,
                            canClose: false,
                            messages: item.messages,
                            createdAt: item.createdAt,
                            updatedAt: nowIso,
                          )
                        : item,
                  )
                  .toList();
              if (!sheetContext.mounted) return;
              Navigator.pop(sheetContext);
              await load();
              await Future.delayed(const Duration(milliseconds: 900));
              if (context.mounted) {
                await load();
              }
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isZh ? '工单已关闭' : 'Ticket closed')));
            } on GatewayApiException catch (e) {
              if (!sheetContext.mounted) return;
              ScaffoldMessenger.of(sheetContext).showSnackBar(SnackBar(content: Text(e.message)));
            }
          }

          return Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, MediaQuery.of(sheetContext).viewInsets.bottom + 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticket.subject,
                  style: Theme.of(sheetContext).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text(
                  '${isZh ? '状态' : 'Status'}: ${ticket.isClosed ? (isZh ? '已关闭' : 'Closed') : (isZh ? '处理中' : 'Open')}',
                ),
                Text('${isZh ? '优先级' : 'Priority'}: ${ticket.levelLabel}'),
                if (ticket.updatedAt != null) Text('${isZh ? '更新时间' : 'Updated'}: ${_formatTime(ticket.updatedAt)}'),
                const SizedBox(height: 10),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 320),
                  child: ListView(
                    shrinkWrap: true,
                    children: ticket.messages.isEmpty
                        ? [Text(isZh ? '暂无消息记录' : 'No messages yet')]
                        : ticket.messages
                              .map(
                                (msg) => Align(
                                  alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    padding: const EdgeInsets.all(10),
                                    constraints: const BoxConstraints(maxWidth: 420),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: msg.isMe
                                          ? Theme.of(sheetContext).colorScheme.primaryContainer
                                          : Theme.of(sheetContext).colorScheme.surfaceContainerHighest,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          msg.isMe ? (isZh ? '我' : 'Me') : (isZh ? '客服' : 'Support'),
                                          style: Theme.of(sheetContext).textTheme.labelSmall,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(msg.message),
                                        const SizedBox(height: 4),
                                        Text(
                                          _formatTime(msg.createdAt),
                                          style: Theme.of(sheetContext).textTheme.labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                  ),
                ),
                const SizedBox(height: 10),
                if (!ticket.isClosed) ...[
                  TextField(
                    controller: replyController,
                    minLines: 2,
                    maxLines: 5,
                    decoration: InputDecoration(labelText: isZh ? '回复内容' : 'Reply', border: const OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilledButton(onPressed: sendReply, child: Text(isZh ? '发送回复' : 'Send Reply')),
                      OutlinedButton(onPressed: closeTicket, child: Text(isZh ? '关闭工单' : 'Close Ticket')),
                    ],
                  ),
                ],
              ],
            ),
          );
        },
      );
    }

    Future<void> createTicket() async {
      final subjectController = TextEditingController();
      final messageController = TextEditingController();
      final level = ValueNotifier<int>(1);

      final ok = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(isZh ? '提交工单' : 'Create Ticket'),
          content: SizedBox(
            width: 420,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: subjectController,
                  decoration: InputDecoration(labelText: isZh ? '主题' : 'Subject', border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: messageController,
                  minLines: 4,
                  maxLines: 8,
                  decoration: InputDecoration(labelText: isZh ? '问题描述' : 'Message', border: const OutlineInputBorder()),
                ),
                const SizedBox(height: 10),
                ValueListenableBuilder<int>(
                  valueListenable: level,
                  builder: (ctx, value, child) => SegmentedButton<int>(
                    segments: [
                      ButtonSegment<int>(value: 0, label: Text(isZh ? '低' : 'Low')),
                      ButtonSegment<int>(value: 1, label: Text(isZh ? '中' : 'Medium')),
                      ButtonSegment<int>(value: 2, label: Text(isZh ? '高' : 'High')),
                    ],
                    selected: {value},
                    onSelectionChanged: (set) {
                      if (set.isNotEmpty) level.value = set.first;
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: Text(isZh ? '取消' : 'Cancel')),
            FilledButton(onPressed: () => Navigator.pop(dialogContext, true), child: Text(isZh ? '提交' : 'Submit')),
          ],
        ),
      );
      if (ok != true) return;

      final message = messageController.text.trim();
      final subject = subjectController.text.trim().isEmpty
          ? (isZh ? 'App 工单' : 'App Ticket')
          : subjectController.text.trim();
      if (message.isEmpty) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isZh ? '请输入问题描述' : 'Please input message')));
        return;
      }

      try {
        final created = await ref
            .read(slothGatewayPortalControllerProvider)
            .createTicket(subject: subject, message: message, level: level.value);
        if (!context.mounted) return;

        if (created != null) {
          tickets.value = [created, ...tickets.value.where((item) => item.id != created.id)];
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(isZh ? '工单已提交，已加入会话列表' : 'Ticket submitted')));
          if (created.id > 0) {
            await openDetail(created);
          }
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(isZh ? '工单已提交，正在刷新列表' : 'Ticket submitted, refreshing list')));
        }

        Future.delayed(const Duration(seconds: 2), () async {
          if (!context.mounted) return;
          await load();
        });
        Future.delayed(const Duration(seconds: 6), () async {
          if (!context.mounted) return;
          await load();
        });
      } on GatewayApiException catch (e) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      }
    }

    useEffect(() {
      Future.microtask(load);
      return null;
    }, const []);

    Widget body;
    if (loading.value) {
      body = const Center(child: CircularProgressIndicator());
    } else if (error.value != null) {
      body = ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(error.value!),
          const SizedBox(height: 10),
          FilledButton(onPressed: load, child: Text(isZh ? '重试' : 'Retry')),
        ],
      );
    } else if (tickets.value.isEmpty) {
      body = ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(isZh ? '暂无工单，点击下方按钮提交新工单' : 'No tickets yet'),
          const SizedBox(height: 10),
          FilledButton(onPressed: createTicket, child: Text(isZh ? '提交工单' : 'Create Ticket')),
        ],
      );
    } else {
      body = ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: tickets.value.length,
        itemBuilder: (context, index) {
          final ticket = tickets.value[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text(ticket.subject),
              subtitle: Text(
                '${isZh ? '状态' : 'Status'}: ${ticket.isClosed ? (isZh ? '已关闭' : 'Closed') : (isZh ? '处理中' : 'Open')}  |  ${_formatTime(ticket.updatedAt)}',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => openDetail(ticket),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isZh ? '工单' : 'Tickets'),
        actions: [IconButton(onPressed: load, icon: const Icon(Icons.refresh))],
      ),
      body: body,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: createTicket,
        icon: const Icon(Icons.add),
        label: Text(isZh ? '提交工单' : 'Create'),
      ),
    );
  }
}
