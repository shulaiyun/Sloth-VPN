import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/core/model/constants.dart';
import 'package:hiddify/core/theme/sloth_design_tokens.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/model/gateway_l10n.dart';
import 'package:hiddify/features/app_gateway/model/gateway_models.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_portal_controller.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_state_bus.dart';
import 'package:hiddify/gen/assets.gen.dart';
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

  bool _looksMojibake(String? value) {
    if (value == null || value.trim().isEmpty) return false;
    return RegExp('[杩锛缁€镐]').hasMatch(value);
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
          SnackBar(
            content: Text(
              ok ? (isZh ? '\u9080\u8bf7\u7801\u5df2\u751f\u6210' : 'Invite code generated') : g.inviteNotAvailable,
            ),
          ),
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
          title: Text(isZh ? '\u7533\u8bf7\u63d0\u73b0' : 'Withdraw'),
          content: TextField(
            controller: amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: isZh ? '\u63d0\u73b0\u91d1\u989d(CNY)' : 'Amount (CNY)',
              border: const OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: Text(isZh ? '\u53d6\u6d88' : 'Cancel')),
            FilledButton(onPressed: () => Navigator.pop(context, true), child: Text(isZh ? '\u63d0\u4ea4' : 'Submit')),
          ],
        ),
      );
      if (confirmed != true) return;

      final amountYuan = double.tryParse(amountController.text.trim());
      if (amountYuan == null || amountYuan <= 0) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(isZh ? '\u91d1\u989d\u683c\u5f0f\u4e0d\u6b63\u786e' : 'Invalid amount')));
        return;
      }

      try {
        await ref.read(slothGatewayPortalControllerProvider).requestInviteWithdraw(amountYuan * 100);
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(isZh ? '\u63d0\u73b0\u7533\u8bf7\u5df2\u63d0\u4ea4' : 'Withdraw request submitted')),
        );
        await load();
      } on GatewayApiException catch (error) {
        if (!context.mounted) return;
        final manageUrl = invite.inviteManageUrl;
        final msg = error.message.toLowerCase();
        final shouldFallbackWeb =
            (manageUrl != null && manageUrl.isNotEmpty) &&
            (msg.contains('\u6682\u4e0d\u652f\u6301') ||
                msg.contains('not support') ||
                msg.contains('unsupported') ||
                error.code == 'UPSTREAM_ERROR');
        if (shouldFallbackWeb) {
          await context.push(
            '/gateway-account/webview',
            extra: <String, String>{
              'url': manageUrl,
              'title': isZh ? '\u8fd4\u5229\u4e0e\u63d0\u73b0' : 'Rebate & Withdraw',
            },
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
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF1E376F), Color(0xFF3E66C7), Color(0xFF46C9C9)],
                          ),
                          boxShadow: SlothShadows.card,
                        ),
                        padding: const EdgeInsets.all(7),
                        child: Assets.images.logo.svg(),
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
                        ? '\u6d41\u91cf\u4f7f\u7528\u8fdb\u5ea6\uff1a${(usageRate * 100).toStringAsFixed(1)}%'
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
                  _GatewayGlowActionButton(
                    onPressed: syncNow,
                    icon: const Icon(Icons.sync_rounded),
                    label: g.syncSubscriptionNow,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF0E3B82), Color(0xFF2A6ED2), Color(0xFF24B7D0)],
                    ),
                  ),
                  _GatewayOutlineActionButton(
                    onPressed: () => context.go('/gateway-plans'),
                    icon: const Icon(Icons.shopping_cart_checkout_rounded),
                    label: g.openPlansAndPurchase,
                  ),
                  _GatewayOutlineActionButton(
                    onPressed: () => context.push('/gateway-account/change-password'),
                    icon: const Icon(Icons.lock_reset_rounded),
                    label: g.changePassword,
                  ),
                  _GatewayOutlineActionButton(
                    onPressed: openTicket,
                    icon: const Icon(Icons.support_agent_rounded),
                    label: g.ticket,
                  ),
                  _GatewayOutlineActionButton(
                    onPressed: () => context.push('/gateway-account/knowledge'),
                    icon: const Icon(Icons.menu_book_rounded),
                    label: g.openKnowledge,
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
                      Text(g.telegram, style: theme.textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    tg?.linked == true || s.telegramBound
                        ? (isZh
                              ? '\u5df2\u7ed1\u5b9a\uff1a${tg?.telegramUsername ?? s.telegramUsername ?? tg?.telegramId ?? '--'}'
                              : 'Bound')
                        : (tg?.tips ??
                              (isZh
                                  ? '\u672a\u7ed1\u5b9a\uff0c\u70b9\u51fb\u201c\u6253\u5f00\u673a\u5668\u4eba\u201d\u540e\u53d1\u9001 /bind \u8ba2\u9605\u94fe\u63a5'
                                  : 'Not linked yet')),
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
                      _GatewayGlowActionButton(
                        onPressed: openTelegramBot,
                        icon: const Icon(Icons.smart_toy_rounded),
                        label: isZh ? '\u6253\u5f00\u673a\u5668\u4eba' : 'Open Bot',
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF0B4A86), Color(0xFF229ED9)],
                        ),
                      ),
                      if ((tg?.bindCommand ?? '').isNotEmpty)
                        _GatewayOutlineActionButton(
                          onPressed: () async {
                            final command = tg?.bindCommand;
                            if (command == null || command.isEmpty) return;
                            await Clipboard.setData(ClipboardData(text: command));
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.copied)));
                          },
                          icon: const Icon(Icons.copy_rounded),
                          label: isZh ? '\u590d\u5236\u7ed1\u5b9a\u547d\u4ee4' : 'Copy bind command',
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
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF8E2DE2), Color(0xFFE94CC0), Color(0xFFFF7A59)],
                            ),
                          ),
                          child: const Icon(Icons.rocket_launch_rounded, color: Colors.white, size: 17),
                        ),
                        const SizedBox(width: 6),
                        Text(g.inviteCenterTitle, style: theme.textTheme.titleMedium),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0x1AFF79C6), Color(0x22F06292), Color(0x1AFF8C42)],
                        ),
                        border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.22)),
                      ),
                      child: Text(
                        isZh
                            ? '\u52a0\u5165\u63a8\u5e7f\u5408\u4f5c\u8ba1\u5212\uff0c\u652f\u6301\u591a\u7ea7\u8fd4\u5229\u5206\u6210\u3002'
                            : 'Join affiliate partner program and earn multi-level rebates.',
                        style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('${g.inviteCode}: ${invite.inviteCode ?? '--'}'),
                    Text('${g.inviteLink}: ${invite.inviteUrl ?? '--'}'),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _GatewayOutlineActionButton(
                          onPressed: () => context.push('/gateway-account/invite'),
                          icon: const Icon(Icons.stacked_bar_chart_rounded),
                          label: isZh ? '\u67e5\u770b\u8fd4\u5229\u8be6\u60c5' : 'View details',
                        ),
                        if ((invite.inviteCode ?? '').isEmpty)
                          _GatewayGlowActionButton(
                            onPressed: ensureInviteCode,
                            icon: const Icon(Icons.auto_awesome_rounded),
                            label: isZh ? '\u751f\u6210\u9080\u8bf7\u7801' : 'Generate invite',
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF7A29FF), Color(0xFFFF5CAD)],
                            ),
                          ),
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
                      Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF7A29FF), Color(0xFFFF5CAD)],
                          ),
                        ),
                        child: const Icon(Icons.campaign_rounded, color: Colors.white, size: 16),
                      ),
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
                      child: Text(isZh ? '\u5c1d\u8bd5\u751f\u6210\u9080\u8bf7\u7801' : 'Try generate invite code'),
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
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _KvChip(label: g.inviteRebateTotal, value: _formatMoneyFromCent(invite.rebateTotal)),
                        _KvChip(label: g.inviteRebatePending, value: _formatMoneyFromCent(invite.rebatePending)),
                        _KvChip(
                          label: isZh ? '\u53ef\u63d0\u73b0\u4f63\u91d1' : 'Withdrawable rebate',
                          value: _formatMoneyFromCent(invite.rebateAvailable),
                        ),
                        _KvChip(
                          label: isZh ? '\u5df2\u63d0\u73b0\u4f63\u91d1' : 'Withdrawn rebate',
                          value: _formatMoneyFromCent(invite.rebateWithdrawn),
                        ),
                        _KvChip(
                          label: isZh ? '\u9080\u8bf7\u4eba\u6570' : 'Invited users',
                          value: invite.invitedCount.toString(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            theme.colorScheme.primaryContainer.withValues(alpha: 0.22),
                            theme.colorScheme.secondaryContainer.withValues(alpha: 0.16),
                          ],
                        ),
                        border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isZh
                                ? '返利规则：总佣金比例 ${_formatPercent(invite.commissionRate)}，三级分销比例 L1 ${_formatPercent(invite.commissionLevel1Rate)} / L2 ${_formatPercent(invite.commissionLevel2Rate)} / L3 ${_formatPercent(invite.commissionLevel3Rate)}'
                                : 'Commission: ${_formatPercent(invite.commissionRate)}, L1 ${_formatPercent(invite.commissionLevel1Rate)} / L2 ${_formatPercent(invite.commissionLevel2Rate)} / L3 ${_formatPercent(invite.commissionLevel3Rate)}',
                            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          if ((invite.rebateRuleText ?? '').isNotEmpty && !_looksMojibake(invite.rebateRuleText)) ...[
                            const SizedBox(height: 6),
                            Text('${isZh ? '\u8fd4\u5229\u89c4\u5219\uff1a' : 'Rules: '}${invite.rebateRuleText!}'),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _GatewayGlowActionButton(
                          onPressed: requestWithdraw,
                          icon: const Icon(Icons.account_balance_wallet_rounded),
                          label: isZh ? '\u7533\u8bf7\u63d0\u73b0' : 'Withdraw',
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF09396A), Color(0xFF14B8C4)],
                          ),
                        ),
                        if ((invite.inviteCode ?? '').isEmpty)
                          _GatewayOutlineActionButton(
                            onPressed: ensureInviteCode,
                            icon: const Icon(Icons.auto_awesome_rounded),
                            label: isZh ? '\u751f\u6210\u9080\u8bf7\u7801' : 'Generate invite',
                          ),
                        _GatewayOutlineActionButton(
                          onPressed: () => context.push('/gateway-account/invite'),
                          icon: const Icon(Icons.stacked_bar_chart_rounded),
                          label: isZh ? '\u8fd4\u5229\u8be6\u60c5' : 'Details',
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
                    Text(isZh ? '\u6682\u65e0\u516c\u544a' : 'No notices')
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
                    isZh
                        ? '\u5b89\u5353 / iPhone / Windows / macOS / Linux'
                        : 'Android / iOS / Windows / macOS / Linux',
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
      final errLower = (errorText.value ?? '').toLowerCase();
      final authExpired =
          (errorText.value?.contains('\u767b\u5f55\u72b6\u6001\u5df2\u5931\u6548') ?? false) ||
          errLower.contains('unauthorized') ||
          errLower.contains('invalid access token') ||
          errLower.contains('token expired') ||
          errLower.contains('session');
      content = ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('${g.viewAccountFailed}: ${errorText.value ?? g.unknownError}'),
          const SizedBox(height: 12),
          FilledButton(onPressed: load, child: Text(g.retry)),
          if (authExpired) ...[
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => context.push('/home/gateway-login'),
              child: Text(isZh ? '\u91cd\u65b0\u767b\u5f55' : 'Login Again'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () async {
                await ref.read(slothGatewayPortalControllerProvider).logout();
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(isZh ? '\u5df2\u9000\u51fa\u5f53\u524d\u8d26\u53f7' : 'Logged out')),
                );
                await load();
              },
              child: Text(isZh ? '\u9000\u51fa\u5f53\u524d\u8d26\u53f7' : 'Logout'),
            ),
          ],
        ],
      );
    } else {
      content = DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.42),
                border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.28)),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF6C2BD9), Color(0xFFD946EF), Color(0xFFFF6A4D)],
                  ),
                  boxShadow: SlothShadows.card,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                labelStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                unselectedLabelStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                tabs: [
                  Tab(
                    icon: SizedBox(width: 18, height: 18, child: Assets.images.logo.svg()),
                    text: isZh ? '\u8d26\u6237\u9875' : 'Account',
                  ),
                  Tab(icon: const Icon(Icons.local_offer_rounded), text: isZh ? '\u670d\u52a1\u9875' : 'Service'),
                ],
              ),
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
            SizedBox(width: 20, height: 20, child: Assets.images.logo.svg()),
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

class _GatewayGlowActionButton extends StatelessWidget {
  const _GatewayGlowActionButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.gradient,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final String label;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: disabled ? null : gradient,
        color: disabled ? Theme.of(context).colorScheme.surfaceContainerHighest : null,
        boxShadow: disabled ? null : SlothShadows.card,
      ),
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class _GatewayOutlineActionButton extends StatelessWidget {
  const _GatewayOutlineActionButton({required this.onPressed, required this.icon, required this.label});

  final VoidCallback? onPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
      style: OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
        side: BorderSide(color: theme.colorScheme.primary.withValues(alpha: 0.24)),
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
    final theme = Theme.of(context);
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
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _KvChip(label: g.inviteRebateTotal, value: _formatMoneyFromCent(i.rebateTotal)),
                      _KvChip(label: g.inviteRebatePending, value: _formatMoneyFromCent(i.rebatePending)),
                      _KvChip(
                        label: isZh ? '\u53ef\u63d0\u73b0\u4f63\u91d1' : 'Withdrawable rebate',
                        value: _formatMoneyFromCent(i.rebateAvailable),
                      ),
                      _KvChip(
                        label: isZh ? '\u5df2\u63d0\u73b0\u4f63\u91d1' : 'Withdrawn rebate',
                        value: _formatMoneyFromCent(i.rebateWithdrawn),
                      ),
                      _KvChip(label: g.inviteCount, value: i.invitedCount.toString()),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          theme.colorScheme.primaryContainer.withValues(alpha: 0.22),
                          theme.colorScheme.secondaryContainer.withValues(alpha: 0.16),
                        ],
                      ),
                      border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
                    ),
                    child: Text(
                      isZh
                          ? '返利规则：总佣金比例 ${_formatPercent(i.commissionRate)}，三级分销比例 L1 ${_formatPercent(i.commissionLevel1Rate)} / L2 ${_formatPercent(i.commissionLevel2Rate)} / L3 ${_formatPercent(i.commissionLevel3Rate)}'
                          : 'Commission: ${_formatPercent(i.commissionRate)}, L1 ${_formatPercent(i.commissionLevel1Rate)} / L2 ${_formatPercent(i.commissionLevel2Rate)} / L3 ${_formatPercent(i.commissionLevel3Rate)}',
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
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
                                generated
                                    ? (isZh ? '\u9080\u8bf7\u7801\u5df2\u751f\u6210' : 'Invite code generated')
                                    : g.inviteNotAvailable,
                              ),
                            ),
                          );
                          await load();
                        } on GatewayApiException catch (error) {
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message)));
                        }
                      },
                      child: Text(isZh ? '\u751f\u6210\u9080\u8bf7\u7801' : 'Generate invite code'),
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
