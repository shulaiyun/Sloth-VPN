import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/core/app_info/app_info_provider.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/model/constants.dart';
import 'package:hiddify/core/router/bottom_sheets/bottom_sheets_notifier.dart';
import 'package:hiddify/core/theme/sloth_design_tokens.dart';
import 'package:hiddify/core/widget/sloth_icon.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/model/gateway_l10n.dart';
import 'package:hiddify/features/app_gateway/model/gateway_models.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_portal_controller.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_state_bus.dart';
import 'package:hiddify/features/connection/model/connection_status.dart';
import 'package:hiddify/features/connection/notifier/connection_notifier.dart';
import 'package:hiddify/features/home/widget/connection_button.dart';
import 'package:hiddify/features/profile/notifier/active_profile_notifier.dart';
import 'package:hiddify/features/profile/widget/profile_tile.dart';
import 'package:hiddify/features/proxy/active/active_proxy_card.dart';
import 'package:hiddify/features/proxy/active/active_proxy_delay_indicator.dart';
import 'package:hiddify/features/proxy/active/active_proxy_notifier.dart';
import 'package:hiddify/features/proxy/active/ip_widget.dart';
import 'package:hiddify/features/proxy/model/proxy_display_name.dart';
import 'package:hiddify/gen/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final t = ref.watch(translationsProvider).requireValue;
    final gatewayRefreshTick = ref.watch(slothGatewayUiRefreshTickProvider);
    final activeProfile = ref.watch(activeProfileProvider);
    final connectionStatus = ref.watch(connectionNotifierProvider);
    final activeProxy = ref.watch(activeProxyNotifierProvider).valueOrNull;
    final delay = activeProxy?.urlTestDelay ?? 0;
    final statusText = switch (connectionStatus.valueOrNull) {
      final ConnectionStatus status => status.present(t),
      _ => t.connection.connecting,
    };

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Assets.images.logo.svg(height: 34, width: 34),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Constants.appName, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                Text(
                  Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh')
                      ? '\u5b89\u5168 / \u7a33\u5b9a / \u5feb\u901f'
                      : 'Secure / Stable / Fast',
                  style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
            const Gap(8),
            const Flexible(child: AppVersionLabel()),
          ],
        ),
        actions: [
          Semantics(
            key: const ValueKey("profile_quick_settings"),
            label: t.pages.home.quickSettings,
            child: IconButton(
              icon: const SlothIcon(SlothIconType.settings),
              onPressed: () => ref.read(bottomSheetsNotifierProvider.notifier).showQuickSettings(),
            ),
          ),
          Semantics(
            key: const ValueKey("profile_add_button"),
            label: t.pages.profiles.add,
            child: IconButton(
              icon: const SlothIcon(SlothIconType.subscription),
              onPressed: () => ref.read(bottomSheetsNotifierProvider.notifier).showAddProfile(),
            ),
          ),
          const Gap(10),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [theme.colorScheme.surfaceContainerLow, theme.scaffoldBackgroundColor],
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/world_map.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment(1.04, -0.28),
                  opacity: 0.058,
                ),
              ),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
                      child: _ConnectionHeaderCard(
                        title: statusText,
                        connected: connectionStatus.valueOrNull == const Connected(),
                        delay: delay,
                        activeNode: activeProxy?.tagDisplay ?? t.pages.proxies.empty,
                        activeCountryCode: activeProxy?.ipinfo.countryCode,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
                      child: _GatewayEntryCard(refreshSignal: gatewayRefreshTick),
                    ),
                  ),
                  switch (activeProfile) {
                    AsyncData(value: final profile?) => SliverToBoxAdapter(
                      child: ProfileTile(
                        profile: profile,
                        isMain: true,
                        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                        color: theme.colorScheme.surfaceContainer,
                      ),
                    ),
                    _ => const SliverToBoxAdapter(),
                  },
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ConnectionButton(),
                          SizedBox(height: 1),
                          ActiveProxyDelayIndicator(),
                          SizedBox(height: 1),
                          ActiveProxyFooter(),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 4)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppVersionLabel extends HookConsumerWidget {
  const AppVersionLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider).requireValue;
    final theme = Theme.of(context);
    final version = ref.watch(appInfoProvider).requireValue.presentVersion;
    if (version.isBlank) return const SizedBox();

    return Semantics(
      label: t.common.version,
      button: false,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(999),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Text(
          version,
          textDirection: TextDirection.ltr,
          style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary),
        ),
      ),
    );
  }
}

class _ConnectionHeaderCard extends StatelessWidget {
  const _ConnectionHeaderCard({
    required this.title,
    required this.connected,
    required this.delay,
    required this.activeNode,
    this.activeCountryCode,
  });

  final String title;
  final bool connected;
  final int delay;
  final String activeNode;
  final String? activeCountryCode;

  String _cleanNodeLabel(String value, {required bool isZh}) {
    final withoutRegionalFlags = value.replaceAll(RegExp(r'[\u{1F1E6}-\u{1F1FF}]{2}', unicode: true), '');
    final withoutLeadingSymbols = withoutRegionalFlags.replaceAll(RegExp(r'^\s*[^\w\u4e00-\u9fa5]+\s*'), '');
    final normalized = withoutLeadingSymbols.replaceAll(RegExp(r'\s+'), ' ').trim();
    final cleaned = normalized.isEmpty ? value : normalized;
    return localizeProxyDisplay(cleaned, isZh: isZh);
  }

  @override
  Widget build(BuildContext context) {
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    final theme = Theme.of(context);
    final statusColor = connected ? SlothPalette.success : theme.colorScheme.primary;
    final delayText = delay <= 0
        ? "--"
        : delay > 65000
        ? (isZh ? "超时" : "timeout")
        : "${delay}ms";

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SlothRadii.lg),
        gradient: SlothGradients.heroBackground,
        boxShadow: SlothShadows.card,
      ),
      padding: const EdgeInsets.fromLTRB(12, 9, 12, 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const SlothIcon(SlothIconType.sloth, color: Colors.white),
              ),
              const Gap(6),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: statusColor.withValues(alpha: 0.2),
                ),
                child: Text(
                  connected ? (isZh ? "\u5df2\u8fde\u63a5" : "Connected") : (isZh ? "\u672a\u8fde\u63a5" : "Offline"),
                  style: theme.textTheme.labelSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const Gap(8),
          Row(
            children: [
              Expanded(
                child: _StatMini(
                  icon: SlothIconType.server,
                  label: isZh ? "节点" : "Node",
                  value: _cleanNodeLabel(activeNode, isZh: isZh),
                  leading: activeCountryCode == null || activeCountryCode!.trim().isEmpty
                      ? null
                      : IPCountryFlag(countryCode: activeCountryCode),
                ),
              ),
              const Gap(8),
              Expanded(
                child: _StatMini(icon: SlothIconType.latency, label: isZh ? "延迟" : "Latency", value: delayText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatMini extends StatelessWidget {
  const _StatMini({required this.icon, required this.label, required this.value, this.leading});

  final SlothIconType icon;
  final String label;
  final String value;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white.withValues(alpha: 0.13)),
      child: Row(
        children: [
          SlothIcon(icon, size: 16, color: Colors.white),
          const Gap(4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: theme.textTheme.labelSmall?.copyWith(color: Colors.white.withValues(alpha: 0.8))),
                Row(
                  children: [
                    if (leading != null) ...[leading!, const Gap(4)],
                    Expanded(
                      child: Text(
                        value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GatewayEntryCard extends ConsumerStatefulWidget {
  const _GatewayEntryCard({required this.refreshSignal});

  final int refreshSignal;

  @override
  ConsumerState<_GatewayEntryCard> createState() => _GatewayEntryCardState();
}

class _GatewayEntryCardState extends ConsumerState<_GatewayEntryCard> {
  bool _loading = true;
  bool _syncing = false;
  bool _loggedIn = false;
  GatewayAccountSummary? _summary;

  String _formatTraffic(int bytes) {
    const gb = 1024 * 1024 * 1024;
    const mb = 1024 * 1024;
    if (bytes >= gb) return "${(bytes / gb).toStringAsFixed(2)} GB";
    return "${(bytes / mb).toStringAsFixed(2)} MB";
  }

  String _formatIsoTime(String? value) {
    if (value == null || value.isEmpty) return "--";
    DateTime? dt = DateTime.tryParse(value);
    if (dt == null) {
      final numeric = num.tryParse(value);
      if (numeric != null && numeric > 0) {
        final millis = numeric > 9999999999 ? numeric.toInt() : (numeric * 1000).toInt();
        dt = DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true);
      }
    }
    if (dt == null || dt.year <= 1970) return "--";
    final local = dt.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return "${local.year}-${two(local.month)}-${two(local.day)} ${two(local.hour)}:${two(local.minute)}";
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  void didUpdateWidget(covariant _GatewayEntryCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.refreshSignal != widget.refreshSignal) {
      _refresh();
    }
  }

  Future<void> _refresh() async {
    try {
      final portal = ref.read(slothGatewayPortalControllerProvider);
      final loggedIn = await portal.isLoggedIn();
      GatewayAccountSummary? summary;
      if (loggedIn) {
        try {
          summary = await portal.fetchAccountSummary();
        } catch (_) {
          summary = null;
        }
      }
      if (!mounted) return;
      setState(() {
        _loggedIn = loggedIn;
        _summary = summary;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loggedIn = false;
        _summary = null;
        _loading = false;
      });
    }
  }

  Future<void> _syncNow() async {
    setState(() => _syncing = true);
    final g = GatewayL10n.of(context);
    final theme = Theme.of(context);

    void showReadableTip(String message) {
      final messenger = ScaffoldMessenger.of(context);
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 14),
          backgroundColor: theme.brightness == Brightness.dark ? const Color(0xFF133564) : const Color(0xFF1C4DA1),
          content: Text(
            message,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          duration: const Duration(seconds: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }

    try {
      await ref.read(slothGatewayPortalControllerProvider).syncNow();
      await _refresh();
      if (!mounted) return;
      showReadableTip(g.syncCompleted);
    } on GatewayApiException catch (error) {
      if (!mounted) return;
      showReadableTip(g.syncFailed(error.message));
    } catch (_) {
      if (!mounted) return;
      showReadableTip(g.syncFailed("unknown"));
    } finally {
      if (mounted) setState(() => _syncing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final g = GatewayL10n.of(context);
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    final theme = Theme.of(context);
    final trafficRemaining = _summary?.trafficRemaining ?? 0;
    final trafficTotal = _summary?.trafficTotal ?? 0;
    final trafficRemainingRate = trafficTotal <= 0 ? 0.0 : (trafficRemaining / trafficTotal).clamp(0.0, 1.0);

    if (_loading) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2)),
              const Gap(10),
              Text(g.checkingAccountStatus),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  g.accountAndPlanSectionTitle,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Text(
                  _loggedIn ? g.statusLoggedIn(_summary?.email ?? "--") : g.statusNotLoggedIn,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 4),
            if (_loggedIn) ...[
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _MiniStatusTile(label: g.homeCurrentPlan, value: _summary?.planName ?? "--"),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    flex: 4,
                    child: _MiniStatusTile(label: g.homeExpireAt, value: _formatIsoTime(_summary?.expiredAt)),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    flex: 3,
                    child: _TrafficMiniStatusTile(
                      label: g.homeRemainingTraffic,
                      value: _formatTraffic(trafficRemaining),
                      remainingRate: trafficRemainingRate,
                    ),
                  ),
                ],
              ),
            ] else ...[
              Text(g.homeGuide, style: theme.textTheme.bodySmall),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primaryContainer.withValues(alpha: 0.9),
                      theme.colorScheme.secondaryContainer.withValues(alpha: 0.72),
                    ],
                  ),
                  border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.45)),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.2),
                      blurRadius: 14,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF2254C9), Color(0xFF5D7BFF), Color(0xFF34C3D0)],
                        ),
                        boxShadow: SlothShadows.card,
                      ),
                      child: const Icon(Icons.campaign_rounded, size: 21, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        isZh
                            ? '新用户专享：注册后免费送三天的使用时长，登录后会自动同步节点'
                            : 'New users get a 3-day free trial after registration, then auto sync starts after login.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 4),
            if (_loggedIn)
              Row(
                children: [
                  Expanded(
                    child: _GatewayEntryPrimaryAction(
                      onPressed: () => context.go("/gateway-account"),
                      icon: const Icon(Icons.account_circle_rounded),
                      label: g.myAccount,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: _GatewayEntryOutlineAction(
                      onPressed: () => context.go("/gateway-plans"),
                      icon: const Icon(Icons.shopping_bag_rounded),
                      label: isZh ? '查看套餐/续费' : 'Plans / Renew',
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: _GatewayEntryOutlineAction(
                      onPressed: _syncing ? null : _syncNow,
                      icon: _syncing
                          ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Icons.sync_rounded),
                      label: _syncing ? g.processing : g.syncNow,
                    ),
                  ),
                ],
              )
            else
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  _GatewayEntryLoginAction(
                    onPressed: () => context.push("/home/gateway-login"),
                    icon: const Icon(Icons.login_rounded),
                    label: g.login,
                  ),
                  OutlinedButton(onPressed: () => context.push("/home/gateway-register"), child: Text(g.register)),
                  TextButton(onPressed: () => context.go("/gateway-plans"), child: Text(g.viewPlans)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _GatewayEntryPrimaryAction extends StatelessWidget {
  const _GatewayEntryPrimaryAction({required this.onPressed, required this.icon, required this.label});

  final VoidCallback? onPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: disabled
            ? null
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFFA7C7), Color(0xFFF277A9), Color(0xFFCF5B96)],
              ),
        color: disabled ? Theme.of(context).colorScheme.surfaceContainerHighest : null,
        boxShadow: disabled ? null : SlothShadows.card,
      ),
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}

class _GatewayEntryOutlineAction extends StatelessWidget {
  const _GatewayEntryOutlineAction({required this.onPressed, required this.icon, required this.label});

  final VoidCallback? onPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final disabled = onPressed == null;
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: IconTheme(
        data: IconThemeData(size: 17, color: disabled ? theme.disabledColor : null),
        child: icon,
      ),
      label: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
        side: BorderSide(color: theme.colorScheme.outlineVariant.withValues(alpha: disabled ? 0.35 : 0.85)),
        backgroundColor: theme.colorScheme.surfaceContainerHigh.withValues(
          alpha: theme.brightness == Brightness.dark ? 0.36 : 0.62,
        ),
        foregroundColor: disabled ? theme.disabledColor : theme.colorScheme.onSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _GatewayEntryLoginAction extends StatelessWidget {
  const _GatewayEntryLoginAction({required this.onPressed, required this.icon, required this.label});

  final VoidCallback? onPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: disabled
            ? null
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF113D84), Color(0xFF2F72D4), Color(0xFF34BFD0)],
              ),
        color: disabled ? Theme.of(context).colorScheme.surfaceContainerHighest : null,
        boxShadow: disabled ? null : SlothShadows.card,
      ),
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}

class _MiniStatusTile extends StatelessWidget {
  const _MiniStatusTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: theme.colorScheme.surfaceContainerHigh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.textTheme.labelSmall),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _TrafficMiniStatusTile extends StatelessWidget {
  const _TrafficMiniStatusTile({required this.label, required this.value, required this.remainingRate});

  final String label;
  final String value;
  final double remainingRate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final safeRate = remainingRate.clamp(0.0, 1.0);
    final isLight = theme.brightness == Brightness.light;
    final tileBgColor = isLight
        ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.9)
        : theme.colorScheme.surfaceContainerHigh;
    final fillColor = Color.lerp(
      isLight ? Colors.orange.shade600.withValues(alpha: 0.45) : Colors.orange.shade500.withValues(alpha: 0.22),
      isLight ? Colors.green.shade600.withValues(alpha: 0.6) : Colors.green.shade500.withValues(alpha: 0.26),
      safeRate,
    )!;
    final textColor = isLight
        ? theme.colorScheme.onSurface
        : (safeRate >= 0.78 ? Colors.white : theme.colorScheme.onSurface);
    final labelColor = isLight
        ? theme.colorScheme.onSurfaceVariant
        : (safeRate >= 0.78 ? Colors.white.withValues(alpha: 0.88) : theme.textTheme.labelSmall?.color);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: tileBgColor,
          border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: isLight ? 0.6 : 0.25)),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: safeRate,
                child: ColoredBox(color: fillColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: theme.textTheme.labelSmall?.copyWith(color: labelColor)),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700, color: textColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


