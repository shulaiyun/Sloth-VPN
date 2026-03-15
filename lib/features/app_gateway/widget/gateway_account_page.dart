import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/core/model/constants.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/model/gateway_l10n.dart';
import 'package:hiddify/features/app_gateway/model/gateway_models.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_portal_controller.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_state_bus.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GatewayAccountPage extends HookConsumerWidget {
  const GatewayAccountPage({super.key});

  String _formatTraffic(int bytes) {
    const gb = 1024 * 1024 * 1024;
    const mb = 1024 * 1024;
    if (bytes >= gb) return '${(bytes / gb).toStringAsFixed(2)} GB';
    return '${(bytes / mb).toStringAsFixed(2)} MB';
  }

  String _formatMoneyFromCent(num value) => 'CNY ${(value / 100).toStringAsFixed(2)}';

  String _formatPercent(double rate) {
    final normalized = rate <= 0 ? 0 : (rate <= 1 ? rate * 100 : rate);
    return '${normalized.toStringAsFixed(2)}%';
  }

  String _formatIsoTime(String? value) {
    if (value == null || value.isEmpty) return '--';
    DateTime? dt = DateTime.tryParse(value);
    if (dt == null) {
      final numeric = num.tryParse(value);
      if (numeric != null && numeric > 0) {
        final millis = numeric > 9999999999 ? numeric.toInt() : (numeric * 1000).toInt();
        dt = DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true);
      }
    }
    if (dt == null || dt.year <= 1970) return '--';
    final local = dt.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${local.year}-${two(local.month)}-${two(local.day)} ${two(local.hour)}:${two(local.minute)}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = GatewayL10n.of(context);
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    final refreshTick = ref.watch(slothGatewayUiRefreshTickProvider);
    final theme = Theme.of(context);

    final loading = useState(true);
    final summary = useState<GatewayAccountSummary?>(null);
    final inviteSummary = useState<GatewayInviteSummary?>(null);
    final telegramBinding = useState<GatewayTelegramBindingStatus?>(null);
    final notices = useState<List<GatewayNoticeItem>>(<GatewayNoticeItem>[]);
    final errorText = useState<String?>(null);
    final loggedIn = useState(false);

    Future<void> load() async {
      loading.value = true;
      errorText.value = null;
      try {
        final portal = ref.read(slothGatewayPortalControllerProvider);
        loggedIn.value = await portal.isLoggedIn();
        if (!loggedIn.value) {
          summary.value = null;
          inviteSummary.value = null;
          telegramBinding.value = null;
          notices.value = const [];
          return;
        }
        summary.value = await portal.fetchAccountSummary();
        try {
          inviteSummary.value = await portal.fetchInviteSummary();
        } catch (_) {
          inviteSummary.value = null;
        }
        try {
          telegramBinding.value = await portal.fetchTelegramBinding();
        } catch (_) {
          telegramBinding.value = null;
        }
        try {
          notices.value = await portal.fetchNotices(pageSize: 3);
        } catch (_) {
          notices.value = const [];
        }
      } on GatewayApiException catch (error) {
        errorText.value = error.message;
      } catch (_) {
        errorText.value = g.unknownError;
      } finally {
        loading.value = false;
      }
    }

    useEffect(() {
      Future.microtask(load);
      return null;
    }, [refreshTick]);

    Future<void> syncNow() async {
      try {
        await ref.read(slothGatewayPortalControllerProvider).syncNow();
        await load();
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.syncCompleted)));
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.syncFailed(error.message))));
      } catch (_) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.syncFailed(g.unknownError))));
      }
    }

    Future<void> logout() async {
      await ref.read(slothGatewayPortalControllerProvider).logout();
      if (!context.mounted) return;
      await load();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.loggedOut)));
    }

    Future<void> openTicket() async {
      await context.push('/gateway-account/tickets');
    }

    Future<void> ensureInviteCode() async {
      try {
        final ok = await ref.read(slothGatewayPortalControllerProvider).generateInviteCode();
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ok ? (isZh ? '邀请码已生成' : 'Invite code generated') : g.inviteNotAvailable)),
        );
        await load();
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message)));
      } catch (_) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.inviteNotAvailable)));
      }
    }

    Future<void> openTelegramBot() async {
      final status = telegramBinding.value;
      final url = status?.bindUrl.isNotEmpty == true
          ? status!.bindUrl
          : (status?.botUrl ?? summary.value?.telegramBotUrl ?? 'https://t.me/shulaiyun_bot');
      await UriUtils.tryLaunch(Uri.parse(url));
    }

    Future<void> requestWithdraw() async {
      final invite = inviteSummary.value;
      if (invite == null || !invite.supported) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.inviteNotAvailable)));
        return;
      }

      final amountController = TextEditingController();
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(isZh ? '申请提现' : 'Withdraw'),
          content: TextField(
            controller: amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: isZh ? '提现金额（元）' : 'Amount (CNY)',
              border: const OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: Text(isZh ? '取消' : 'Cancel')),
            FilledButton(onPressed: () => Navigator.pop(context, true), child: Text(isZh ? '提交' : 'Submit')),
          ],
        ),
      );
      if (confirmed != true) return;

      final amountYuan = double.tryParse(amountController.text.trim());
      if (amountYuan == null || amountYuan <= 0) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isZh ? '请输入正确金额' : 'Invalid amount')));
        return;
      }

      try {
        await ref.read(slothGatewayPortalControllerProvider).requestInviteWithdraw(amountYuan * 100);
        if (!context.mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(isZh ? '提现申请已提交，请等待审核' : 'Withdraw request submitted')));
        await load();
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        final manageUrl = invite.inviteManageUrl;
        final msg = error.message.toLowerCase();
        final shouldFallbackWeb =
            (manageUrl != null && manageUrl.isNotEmpty) &&
            (msg.contains('暂不支持') ||
                msg.contains('not support') ||
                msg.contains('unsupported') ||
                error.code == 'UPSTREAM_ERROR');
        if (shouldFallbackWeb) {
          await context.push(
            '/gateway-account/webview',
            extra: <String, String>{'url': manageUrl, 'title': isZh ? '返利与提现' : 'Rebate & Withdraw'},
          );
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message)));
      }
    }

    Widget accountTab(GatewayAccountSummary s) {
      final invite = inviteSummary.value;
      final tg = telegramBinding.value;
      final usageRate = s.trafficTotal <= 0 ? 0.0 : (s.trafficUsed / s.trafficTotal).clamp(0.0, 1.0);

      return ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.colorScheme.primary.withValues(alpha: 0.14),
                        ),
                        child: Icon(Icons.account_circle_rounded, color: theme.colorScheme.primary),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${g.accountEmail}: ${s.email}',
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Icon(Icons.verified_user_rounded, color: theme.colorScheme.primary),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 8,
                    children: [
                      _KvChip(label: g.accountPlan, value: s.planName ?? '--'),
                      _KvChip(label: g.accountExpire, value: _formatIsoTime(s.expiredAt)),
                      _KvChip(label: g.accountRemainingTraffic, value: _formatTraffic(s.trafficRemaining)),
                      _KvChip(label: g.accountUsedTraffic, value: _formatTraffic(s.trafficUsed)),
                      _KvChip(label: g.accountBalance, value: _formatMoneyFromCent(s.balance)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: usageRate,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(999),
                    color: Colors.green.shade500,
                    backgroundColor: Colors.green.shade100.withValues(alpha: 0.55),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isZh
                        ? '流量使用进度：${(usageRate * 100).toStringAsFixed(1)}%'
                        : 'Traffic usage: ${(usageRate * 100).toStringAsFixed(1)}%',
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 10),
                  Text('${g.accountSubVersion}: ${s.subscriptionVersion ?? '--'}'),
                  Text('${g.accountLastSynced}: ${_formatIsoTime(s.lastSyncedAt)}'),
                  Text('${g.accountNodeCount}: ${s.nodeCount?.toString() ?? '--'}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilledButton.icon(
                    onPressed: syncNow,
                    icon: const Icon(Icons.sync),
                    label: Text(g.syncSubscriptionNow),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => context.go('/gateway-plans'),
                    icon: const Icon(Icons.shopping_cart_outlined),
                    label: Text(g.openPlansAndPurchase),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => context.push('/gateway-account/change-password'),
                    icon: const Icon(Icons.lock_reset),
                    label: Text(g.changePassword),
                  ),
                  OutlinedButton.icon(
                    onPressed: openTicket,
                    icon: const Icon(Icons.support_agent),
                    label: Text(g.ticket),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => context.push('/gateway-account/knowledge'),
                    icon: const Icon(Icons.menu_book_outlined),
                    label: Text(g.openKnowledge),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.telegram_rounded, color: theme.colorScheme.primary),
                      const SizedBox(width: 6),
                      Text(isZh ? 'Telegram 绑定' : 'Telegram Binding', style: theme.textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    tg?.linked == true || s.telegramBound
                        ? (isZh
                              ? '已绑定：${tg?.telegramUsername ?? s.telegramUsername ?? tg?.telegramId ?? '--'}'
                              : 'Bound')
                        : (tg?.tips ?? (isZh ? '未绑定，点击“打开机器人”后发送 /bind 订阅链接' : 'Not linked yet')),
                  ),
                  if ((tg?.bindCommand ?? '').isNotEmpty) ...[
                    const SizedBox(height: 8),
                    SelectableText(
                      tg!.bindCommand!,
                      style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilledButton(onPressed: openTelegramBot, child: Text(isZh ? '打开机器人' : 'Open Bot')),
                      if ((tg?.bindCommand ?? '').isNotEmpty)
                        OutlinedButton(
                          onPressed: () async {
                            final command = tg?.bindCommand;
                            if (command == null || command.isEmpty) return;
                            await Clipboard.setData(ClipboardData(text: command));
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.copied)));
                          },
                          child: Text(isZh ? '复制绑定命令' : 'Copy bind command'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (invite != null) ...[
            const SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.people_alt_rounded, color: theme.colorScheme.primary),
                        const SizedBox(width: 6),
                        Text(g.inviteCenterTitle, style: theme.textTheme.titleMedium),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('${g.inviteCode}: ${invite.inviteCode ?? '--'}'),
                    Text('${g.inviteLink}: ${invite.inviteUrl ?? '--'}'),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        OutlinedButton(
                          onPressed: () => context.push('/gateway-account/invite'),
                          child: Text(isZh ? '查看返利详情' : 'View details'),
                        ),
                        if ((invite.inviteCode ?? '').isEmpty)
                          FilledButton(onPressed: ensureInviteCode, child: Text(isZh ? '生成邀请码' : 'Generate invite')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 12),
          OutlinedButton(onPressed: logout, child: Text(g.logout)),
        ],
      );
    }

    Widget serviceTab() {
      final invite = inviteSummary.value;
      return ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.campaign_outlined),
                      const SizedBox(width: 6),
                      Text(g.inviteCenterTitle, style: theme.textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (invite == null) ...[
                    Text(g.inviteNotAvailable),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: ensureInviteCode,
                      child: Text(isZh ? '尝试生成邀请码' : 'Try generate invite code'),
                    ),
                  ] else ...[
                    Text('${g.inviteCode}: ${invite.inviteCode ?? '--'}'),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(child: Text('${g.inviteLink}: ${invite.inviteUrl ?? '--'}')),
                        IconButton(
                          onPressed: () async {
                            final url = invite.inviteUrl;
                            if (url == null || url.isEmpty) return;
                            await Clipboard.setData(ClipboardData(text: url));
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.copied)));
                          },
                          icon: const Icon(Icons.copy),
                        ),
                      ],
                    ),
                    Text('${g.inviteRebateTotal}: ${_formatMoneyFromCent(invite.rebateTotal)}'),
                    Text('${g.inviteRebatePending}: ${_formatMoneyFromCent(invite.rebatePending)}'),
                    Text('${isZh ? '可提现佣金' : 'Withdrawable rebate'}: ${_formatMoneyFromCent(invite.rebateAvailable)}'),
                    Text('${isZh ? '已提现佣金' : 'Withdrawn rebate'}: ${_formatMoneyFromCent(invite.rebateWithdrawn)}'),
                    Text('${isZh ? '邀请码人数' : 'Invited users'}: ${invite.invitedCount}'),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isZh
                                ? '返利规则：总佣金比例 ${_formatPercent(invite.commissionRate)}，三级分销比例 L1 ${_formatPercent(invite.commissionLevel1Rate)} / L2 ${_formatPercent(invite.commissionLevel2Rate)} / L3 ${_formatPercent(invite.commissionLevel3Rate)}'
                                : 'Commission: ${_formatPercent(invite.commissionRate)}, L1 ${_formatPercent(invite.commissionLevel1Rate)} / L2 ${_formatPercent(invite.commissionLevel2Rate)} / L3 ${_formatPercent(invite.commissionLevel3Rate)}',
                          ),
                          if ((invite.rebateRuleText ?? '').isNotEmpty) ...[
                            const SizedBox(height: 6),
                            Text('${isZh ? '补充说明：' : 'Rules: '}${invite.rebateRuleText!}'),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        FilledButton(onPressed: requestWithdraw, child: Text(isZh ? '申请提现' : 'Withdraw')),
                        if ((invite.inviteCode ?? '').isEmpty)
                          OutlinedButton(onPressed: ensureInviteCode, child: Text(isZh ? '生成邀请码' : 'Generate invite')),
                        OutlinedButton(
                          onPressed: () => context.push('/gateway-account/invite'),
                          child: Text(isZh ? '返利详情' : 'Details'),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.notifications_active_rounded, color: theme.colorScheme.primary),
                      const SizedBox(width: 6),
                      Text(g.noticesTitle, style: theme.textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (notices.value.isEmpty)
                    Text(isZh ? '暂无公告' : 'No notices')
                  else
                    ...notices.value.map(
                      (item) => ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(item.title),
                        subtitle: item.updatedAt == null ? null : Text(item.updatedAt!),
                        onTap: () => context.push('/gateway-account/notices'),
                      ),
                    ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => context.push('/gateway-account/notices'),
                      child: Text(g.openNotices),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.school_rounded),
                  title: Text(g.openKnowledge),
                  subtitle: Text(
                    isZh ? '安卓 / iPhone / Windows / macOS / Linux' : 'Android / iOS / Windows / macOS / Linux',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.push('/gateway-account/knowledge'),
                ),
                ListTile(
                  leading: const Icon(Icons.support_agent_rounded),
                  title: Text(g.ticket),
                  subtitle: Text(g.openTicketInApp),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: openTicket,
                ),
                ListTile(
                  leading: const Icon(Icons.telegram_rounded),
                  title: Text(g.telegram),
                  subtitle: Text(summary.value?.telegramUrl ?? Constants.telegramChannelUrl),
                  onTap: () =>
                      UriUtils.tryLaunch(Uri.parse(summary.value?.telegramUrl ?? Constants.telegramChannelUrl)),
                ),
                ListTile(
                  leading: const Icon(Icons.code_rounded),
                  title: Text(g.github),
                  subtitle: Text(summary.value?.githubUrl ?? Constants.githubUrl),
                  onTap: () => UriUtils.tryLaunch(Uri.parse(summary.value?.githubUrl ?? Constants.githubUrl)),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget content;
    if (loading.value) {
      content = const Center(child: CircularProgressIndicator());
    } else if (!loggedIn.value) {
      content = ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(g.notLoggedIn),
          const SizedBox(height: 12),
          FilledButton(onPressed: () => context.push('/home/gateway-login'), child: Text(g.login)),
          const SizedBox(height: 8),
          OutlinedButton(onPressed: () => context.push('/home/gateway-register'), child: Text(g.register)),
          const SizedBox(height: 8),
          TextButton(onPressed: () => context.go('/gateway-plans'), child: Text(g.goPurchase)),
        ],
      );
    } else if (summary.value == null) {
      content = ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('${g.viewAccountFailed}: ${errorText.value ?? g.unknownError}'),
          const SizedBox(height: 12),
          FilledButton(onPressed: load, child: Text(g.retry)),
        ],
      );
    } else {
      content = DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const SizedBox(height: 8),
            TabBar(
              tabs: [
                Tab(icon: const Icon(Icons.account_circle_rounded), text: isZh ? '账户页' : 'Account'),
                Tab(icon: const Icon(Icons.local_offer_rounded), text: isZh ? '服务页' : 'Service'),
              ],
            ),
            Expanded(child: TabBarView(children: [accountTab(summary.value!), serviceTab()])),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.manage_accounts_rounded, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            Text(g.accountCenterTitle),
          ],
        ),
        actions: [IconButton(onPressed: load, icon: const Icon(Icons.refresh))],
      ),
      body: content,
    );
  }
}

class _KvChip extends StatelessWidget {
  const _KvChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.textTheme.labelSmall),
          Text(value, style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class GatewayInvitePage extends HookConsumerWidget {
  const GatewayInvitePage({super.key});

  String _formatMoneyFromCent(double value) => 'CNY ${(value / 100).toStringAsFixed(2)}';

  String _formatPercent(double rate) {
    final normalized = rate <= 0 ? 0 : (rate <= 1 ? rate * 100 : rate);
    return '${normalized.toStringAsFixed(2)}%';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = GatewayL10n.of(context);
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    final loading = useState(true);
    final invite = useState<GatewayInviteSummary?>(null);
    final error = useState<String?>(null);

    Future<void> load() async {
      loading.value = true;
      error.value = null;
      try {
        invite.value = await ref.read(slothGatewayPortalControllerProvider).fetchInviteSummary();
      } on GatewayApiException catch (e) {
        error.value = e.message;
      } catch (_) {
        error.value = g.unknownError;
      } finally {
        loading.value = false;
      }
    }

    useEffect(() {
      Future.microtask(load);
      return null;
    }, const []);

    Future<void> copyText(String? text) async {
      if (text == null || text.isEmpty) return;
      await Clipboard.setData(ClipboardData(text: text));
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.copied)));
    }

    Widget body;
    if (loading.value) {
      body = const Center(child: CircularProgressIndicator());
    } else if (invite.value == null) {
      body = ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(error.value ?? g.inviteNotAvailable),
          const SizedBox(height: 10),
          FilledButton(onPressed: load, child: Text(g.retry)),
        ],
      );
    } else {
      final i = invite.value!;
      body = ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${g.inviteCode}: ${i.inviteCode ?? '--'}'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(child: Text('${g.inviteLink}: ${i.inviteUrl ?? '--'}')),
                      IconButton(onPressed: () => copyText(i.inviteUrl), icon: const Icon(Icons.copy)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('${g.inviteRebateTotal}: ${_formatMoneyFromCent(i.rebateTotal)}'),
                  Text('${g.inviteRebatePending}: ${_formatMoneyFromCent(i.rebatePending)}'),
                  Text('${isZh ? '可提现佣金' : 'Withdrawable rebate'}: ${_formatMoneyFromCent(i.rebateAvailable)}'),
                  Text('${isZh ? '已提现佣金' : 'Withdrawn rebate'}: ${_formatMoneyFromCent(i.rebateWithdrawn)}'),
                  Text('${g.inviteCount}: ${i.invitedCount}'),
                  const SizedBox(height: 8),
                  Text(
                    isZh
                        ? '返利规则：总佣金比例 ${_formatPercent(i.commissionRate)}，三级分销比例 L1 ${_formatPercent(i.commissionLevel1Rate)} / L2 ${_formatPercent(i.commissionLevel2Rate)} / L3 ${_formatPercent(i.commissionLevel3Rate)}'
                        : 'Commission: ${_formatPercent(i.commissionRate)}, L1 ${_formatPercent(i.commissionLevel1Rate)} / L2 ${_formatPercent(i.commissionLevel2Rate)} / L3 ${_formatPercent(i.commissionLevel3Rate)}',
                  ),
                  const SizedBox(height: 8),
                  if ((i.inviteCode ?? '').isEmpty)
                    FilledButton(
                      onPressed: () async {
                        try {
                          final generated = await ref.read(slothGatewayPortalControllerProvider).generateInviteCode();
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                generated ? (isZh ? '邀请码已生成' : 'Invite code generated') : g.inviteNotAvailable,
                              ),
                            ),
                          );
                          await load();
                        } on GatewayApiException catch (error) {
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message)));
                        }
                      },
                      child: Text(isZh ? '生成邀请码' : 'Generate invite code'),
                    ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(g.inviteCenterTitle)),
      body: body,
    );
  }
}
