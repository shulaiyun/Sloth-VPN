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
            Assets.images.logo.svg(height: 36, width: 36),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Constants.appName, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                Text(
                  Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh')
                      ? '安全 / 稳定 / 快速'
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
                  opacity: 0.08,
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
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                      child: _ConnectionHeaderCard(
                        title: statusText,
                        connected: connectionStatus.valueOrNull == const Connected(),
                        delay: delay,
                        activeNode: activeProxy?.tagDisplay ?? t.pages.proxies.empty,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: _GatewayEntryCard(refreshSignal: gatewayRefreshTick),
                    ),
                  ),
                  switch (activeProfile) {
                    AsyncData(value: final profile?) => SliverToBoxAdapter(
                      child: ProfileTile(
                        profile: profile,
                        isMain: true,
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        color: theme.colorScheme.surfaceContainer,
                      ),
                    ),
                    _ => const SliverToBoxAdapter(),
                  },
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: _GatewaySubscriptionHint(refreshSignal: gatewayRefreshTick),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 6, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ConnectionButton(),
                          SizedBox(height: 6),
                          ActiveProxyDelayIndicator(),
                          SizedBox(height: 6),
                          ActiveProxyFooter(),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 18)),
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
  });

  final String title;
  final bool connected;
  final int delay;
  final String activeNode;

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
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const SlothIcon(SlothIconType.sloth, color: Colors.white),
              ),
              const Gap(8),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: statusColor.withValues(alpha: 0.2),
                ),
                child: Text(
                  connected ? (isZh ? "已连接" : "Connected") : (isZh ? "未连接" : "Offline"),
                  style: theme.textTheme.labelSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const Gap(10),
          Row(
            children: [
              Expanded(
                child: _StatMini(icon: SlothIconType.server, label: isZh ? "节点" : "Node", value: activeNode),
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
  const _StatMini({required this.icon, required this.label, required this.value});

  final SlothIconType icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white.withValues(alpha: 0.13)),
      child: Row(
        children: [
          SlothIcon(icon, size: 16, color: Colors.white),
          const Gap(6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: theme.textTheme.labelSmall?.copyWith(color: Colors.white.withValues(alpha: 0.8))),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
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
        summary = await portal.fetchAccountSummary();
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
    try {
      await ref.read(slothGatewayPortalControllerProvider).syncNow();
      await _refresh();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.syncCompleted)));
    } on GatewayApiException catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.syncFailed(error.message))));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(g.syncFailed("unknown"))));
    } finally {
      if (mounted) {
        setState(() => _syncing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final g = GatewayL10n.of(context);
    final theme = Theme.of(context);
    if (_loading) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
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
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              g.accountAndPlanSectionTitle,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            if (_loggedIn) ...[
              Text(g.statusLoggedIn(_summary?.email ?? "--")),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _MiniStatusTile(label: g.homeCurrentPlan, value: _summary?.planName ?? "--"),
                ],
              ),
            ] else ...[
              Text(g.statusNotLoggedIn),
              const SizedBox(height: 4),
              Text(g.homeGuide),
            ],
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (_loggedIn)
                  FilledButton(onPressed: () => context.go("/gateway-account"), child: Text(g.myAccount))
                else
                  FilledButton(onPressed: () => context.push("/home/gateway-login"), child: Text(g.login)),
                if (_loggedIn)
                  OutlinedButton(onPressed: () => context.go("/gateway-plans"), child: Text(g.quickRenew))
                else
                  OutlinedButton(onPressed: () => context.push("/home/gateway-register"), child: Text(g.register)),
                TextButton(onPressed: () => context.go("/gateway-plans"), child: Text(g.viewPlans)),
                if (_loggedIn)
                  TextButton(onPressed: _syncing ? null : _syncNow, child: Text(_syncing ? g.processing : g.syncNow)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GatewaySubscriptionHint extends ConsumerStatefulWidget {
  const _GatewaySubscriptionHint({required this.refreshSignal});

  final int refreshSignal;

  @override
  ConsumerState<_GatewaySubscriptionHint> createState() => _GatewaySubscriptionHintState();
}

class _GatewaySubscriptionHintState extends ConsumerState<_GatewaySubscriptionHint> {
  GatewayAccountSummary? _summary;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  void didUpdateWidget(covariant _GatewaySubscriptionHint oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.refreshSignal != widget.refreshSignal) {
      _refresh();
    }
  }

  String _formatTraffic(int bytes) {
    const gb = 1024 * 1024 * 1024;
    const mb = 1024 * 1024;
    if (bytes >= gb) return "${(bytes / gb).toStringAsFixed(2)} GB";
    return "${(bytes / mb).toStringAsFixed(2)} MB";
  }

  Future<void> _refresh() async {
    setState(() => _loading = true);
    try {
      final portal = ref.read(slothGatewayPortalControllerProvider);
      final loggedIn = await portal.isLoggedIn();
      if (!loggedIn) {
        if (!mounted) return;
        setState(() {
          _summary = null;
          _loading = false;
        });
        return;
      }
      final summary = await portal.fetchAccountSummary();
      if (!mounted) return;
      setState(() {
        _summary = summary;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _summary = null;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final g = GatewayL10n.of(context);
    final theme = Theme.of(context);
    if (_loading || _summary == null) return const SizedBox.shrink();
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.colorScheme.surfaceContainerLow,
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "${g.homeExpireAt}: ${_summary?.expiredAt ?? '--'}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Gap(10),
          Expanded(
            child: Text(
              "${g.homeRemainingTraffic}: ${_formatTraffic(_summary?.trafficRemaining ?? 0)}",
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: theme.colorScheme.surfaceContainerHigh),
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
