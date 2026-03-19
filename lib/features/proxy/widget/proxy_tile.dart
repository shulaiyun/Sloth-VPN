import 'package:flutter/material.dart';
import 'package:hiddify/core/router/dialog/dialog_notifier.dart';
import 'package:hiddify/core/theme/sloth_design_tokens.dart';
import 'package:hiddify/core/widget/sloth_icon.dart';
import 'package:hiddify/features/proxy/active/ip_widget.dart';
import 'package:hiddify/features/proxy/model/proxy_display_name.dart';
import 'package:hiddify/gen/fonts.gen.dart';
import 'package:hiddify/hiddifycore/generated/v2/hcore/hcore.pb.dart';
import 'package:hiddify/utils/platform_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProxyTile extends HookConsumerWidget {
  const ProxyTile(this.proxy, {super.key, required this.selected, required this.onTap});

  final OutboundInfo proxy;
  final bool selected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    final theme = Theme.of(context);
    final delay = proxy.urlTestDelay;
    final hasDelay = delay > 0;
    final timeout = delay > 65000;
    final delayText = timeout ? (isZh ? "\u8d85\u65f6" : "timeout") : "$delay ms";
    final delayColor = _delayColor(theme, delay);
    final tagDisplay = localizeProxyDisplay(proxy.tagDisplay, isZh: isZh);
    final typeDisplay = localizeProxyDisplay(proxy.type, isZh: isZh);
    final groupSelected = localizeProxyDisplay(proxy.groupSelectedTagDisplay.trim(), isZh: isZh);

    return Material(
      color: selected ? theme.colorScheme.primary.withValues(alpha: 0.12) : theme.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(SlothRadii.md),
      child: InkWell(
        borderRadius: BorderRadius.circular(SlothRadii.md),
        onTap: onTap,
        onLongPress: () async => await ref.read(dialogNotifierProvider.notifier).showProxyInfo(outboundInfo: proxy),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SlothRadii.md),
            border: Border.all(
              color: selected
                  ? theme.colorScheme.primary.withValues(alpha: 0.8)
                  : theme.colorScheme.outlineVariant.withValues(alpha: 0.8),
            ),
            boxShadow: SlothShadows.card,
          ),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: [
              IPCountryFlag(
                countryCode: proxy.ipinfo.countryCode,
                organization: proxy.ipinfo.org,
                size: 36,
                padding: const EdgeInsetsDirectional.only(end: 6),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tagDisplay,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontFamily: PlatformUtils.isWindows ? FontFamily.emoji : null,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const SlothIcon(SlothIconType.server, size: 14),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            proxy.isGroup ? "$typeDisplay · $groupSelected" : typeDisplay,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (hasDelay)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: delayColor.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SlothIcon(SlothIconType.latency, size: 12, color: delayColor),
                      const SizedBox(width: 3),
                      Text(
                        delayText,
                        style: theme.textTheme.labelSmall?.copyWith(color: delayColor, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _delayColor(ThemeData theme, int delay) {
    if (delay <= 0) return theme.colorScheme.onSurfaceVariant;
    if (delay > 65000) return theme.colorScheme.error;
    return switch (delay) {
      < 700 => SlothPalette.success,
      < 1500 => SlothPalette.warning,
      _ => SlothPalette.danger,
    };
  }
}
