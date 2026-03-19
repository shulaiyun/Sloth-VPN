import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/router/dialog/dialog_notifier.dart';
import 'package:hiddify/core/theme/sloth_design_tokens.dart';
import 'package:hiddify/core/widget/sloth_icon.dart';
import 'package:hiddify/features/connection/model/connection_status.dart';
import 'package:hiddify/features/connection/notifier/connection_notifier.dart';
import 'package:hiddify/features/proxy/active/active_proxy_notifier.dart';
import 'package:hiddify/features/proxy/active/ip_widget.dart';
import 'package:hiddify/features/proxy/model/proxy_display_name.dart';
import 'package:hiddify/hiddifycore/generated/v2/hcore/hcore.pb.dart';
import 'package:hiddify/utils/custom_loggers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActiveProxyFooter extends ConsumerWidget with InfraLogger {
  const ActiveProxyFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    final connectionState = ref.watch(
      connectionNotifierProvider.select((value) => value.valueOrNull ?? const Disconnected()),
    );
    final activeProxy = ref.watch(activeProxyNotifierProvider.select((value) => value.valueOrNull));
    final t = ref.watch(translationsProvider).requireValue;
    final activeTag = localizeProxyDisplay(activeProxy?.tagDisplay ?? '', isZh: isZh);
    final activeType = localizeProxyDisplay(activeProxy?.type ?? '', isZh: isZh);

    if (connectionState != const Connected() || activeProxy == null) return const SizedBox.shrink();
    final theme = Theme.of(context);

    Future<void> handleUrlTest() async {
      try {
        if (!context.mounted) return;
        await ref.read(activeProxyNotifierProvider.notifier).urlTest("");
      } catch (e) {
        loggy.error("Error during URL test: $e");
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(SlothRadii.lg),
        border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.85)),
        boxShadow: SlothShadows.card,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(SlothRadii.lg),
        onTap: () => context.goNamed('proxies'),
        child: Row(
          children: [
            InkWell(
              onTap: () async {
                await handleUrlTest();
                await ref.read(dialogNotifierProvider.notifier).showProxyInfo(outboundInfo: activeProxy);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: IPCountryFlag(
                  countryCode: activeProxy.ipinfo.countryCode,
                  organization: activeProxy.ipinfo.org,
                  size: 44,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    label: t.pages.proxies.activeProxy,
                    child: Text(
                      activeTag,
                      style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (activeProxy.ipinfo.ip.isNotEmpty)
                        IPText(ip: activeProxy.ipinfo.ip, onLongPress: handleUrlTest, constrained: true)
                      else
                        UnknownIPText(text: t.pages.proxies.unknownIp, onTap: handleUrlTest),
                      const Spacer(),
                      const SlothIcon(SlothIconType.server, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        activeType,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(Icons.arrow_forward_ios_rounded, color: theme.colorScheme.primary, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}
