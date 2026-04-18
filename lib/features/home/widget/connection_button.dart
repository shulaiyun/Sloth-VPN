import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/router/bottom_sheets/bottom_sheets_notifier.dart';
import 'package:hiddify/core/router/dialog/dialog_notifier.dart';
import 'package:hiddify/core/theme/sloth_design_tokens.dart';
import 'package:hiddify/core/theme/theme_extensions.dart';
import 'package:hiddify/core/widget/animated_text.dart';
import 'package:hiddify/core/widget/sloth_icon.dart';
import 'package:hiddify/features/connection/model/connection_status.dart';
import 'package:hiddify/features/connection/notifier/connection_notifier.dart';
import 'package:hiddify/features/profile/notifier/active_profile_notifier.dart';
import 'package:hiddify/features/proxy/active/active_proxy_notifier.dart';
import 'package:hiddify/features/settings/data/config_option_repository.dart';
import 'package:hiddify/features/settings/notifier/config_option/config_option_notifier.dart';
import 'package:hiddify/singbox/model/singbox_config_enum.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnectionButton extends HookConsumerWidget {
  const ConnectionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider).requireValue;
    final connectionStatus = ref.watch(connectionNotifierProvider);
    final activeProxy = ref.watch(activeProxyNotifierProvider);
    final delay = activeProxy.valueOrNull?.urlTestDelay ?? 0;
    final requiresReconnect = ref.watch(configOptionNotifierProvider).valueOrNull;
    final buttonTheme = Theme.of(context).extension<ConnectionButtonTheme>() ?? ConnectionButtonTheme.light;

    var secureLabel =
        (ref.watch(ConfigOptions.enableWarp) && ref.watch(ConfigOptions.warpDetourMode) == WarpDetourMode.warpOverProxy)
        ? t.connection.secure
        : "";
    if (delay <= 0 || delay > 65000 || connectionStatus.value != const Connected()) {
      secureLabel = "";
    }
    return _ConnectionButton(
      onTap: switch (connectionStatus) {
        AsyncData(value: Connected()) when requiresReconnect == true => () async {
          final activeProfile = await ref.read(activeProfileProvider.future);
          return await ref.read(connectionNotifierProvider.notifier).reconnect(activeProfile);
        },
        AsyncData(value: Disconnected()) || AsyncError() => () async {
          if (ref.read(activeProfileProvider).valueOrNull == null) {
            await ref.read(dialogNotifierProvider.notifier).showNoActiveProfile();
            ref.read(bottomSheetsNotifierProvider.notifier).showAddProfile();
          }
          if (await ref.read(dialogNotifierProvider.notifier).showExperimentalFeatureNotice()) {
            return await ref.read(connectionNotifierProvider.notifier).toggleConnection();
          }
        },
        AsyncData(value: Connected()) => () async {
          if (requiresReconnect == true &&
              await ref.read(dialogNotifierProvider.notifier).showExperimentalFeatureNotice()) {
            return await ref
                .read(connectionNotifierProvider.notifier)
                .reconnect(await ref.read(activeProfileProvider.future));
          }
          return await ref.read(connectionNotifierProvider.notifier).toggleConnection();
        },
        _ => () {},
      },
      enabled: switch (connectionStatus) {
        AsyncData(value: Connected()) || AsyncData(value: Disconnected()) || AsyncError() => true,
        _ => false,
      },
      label: switch (connectionStatus) {
        AsyncData(value: Connected()) when requiresReconnect == true => t.connection.reconnect,
        AsyncData(value: Connected()) when delay <= 0 || delay >= 65000 => t.connection.connecting,
        AsyncData(value: final status) => status.present(t),
        _ => "",
      },
      buttonColor: switch (connectionStatus) {
        AsyncData(value: Connected()) when requiresReconnect == true => Colors.teal,
        AsyncData(value: Connected()) when delay <= 0 || delay >= 65000 => SlothPalette.warning,
        AsyncData(value: Connected()) => buttonTheme.connectedColor!,
        AsyncData(value: _) => buttonTheme.idleColor!,
        _ => SlothPalette.danger,
      },
      animated: switch (connectionStatus) {
        AsyncData(value: Connected()) when requiresReconnect == true => false,
        AsyncData(value: Connected()) when delay <= 0 || delay >= 65000 => false,
        AsyncData(value: Connected()) => true,
        AsyncData(value: _) => true,
        _ => false,
      },
      secureLabel: secureLabel,
      connected: connectionStatus.valueOrNull == const Connected(),
    );
  }
}

class _ConnectionButton extends StatelessWidget {
  const _ConnectionButton({
    required this.onTap,
    required this.enabled,
    required this.label,
    required this.buttonColor,
    required this.animated,
    required this.secureLabel,
    required this.connected,
  });

  final VoidCallback onTap;
  final bool enabled;
  final String label;
  final Color buttonColor;
  final String secureLabel;
  final bool animated;
  final bool connected;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final size = MediaQuery.sizeOf(context);
    final ultraCompact = size.width < 360 || size.height < 740;
    final compact = ultraCompact || size.width < 390 || size.height < 820;
    final outerSize = ultraCompact
        ? 118.0
        : compact
        ? 130.0
        : 148.0;
    final innerSize = ultraCompact
        ? 76.0
        : compact
        ? 86.0
        : 96.0;
    final iconSize = ultraCompact
        ? 34.0
        : compact
        ? 40.0
        : 44.0;
    final iconPadding = ultraCompact
        ? 22.0
        : compact
        ? 26.0
        : 30.0;
    final labelGap = ultraCompact ? 6.0 : 10.0;
    Widget button = Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(blurRadius: compact ? 20 : 28, color: buttonColor.withValues(alpha: 0.44))],
      ),
      width: outerSize,
      height: outerSize,
      child: Material(
        key: const ValueKey("home_connection_button"),
        shape: const CircleBorder(),
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          focusColor: Colors.grey,
          onTap: onTap,
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(end: buttonColor),
            duration: const Duration(milliseconds: 260),
            builder: (context, value, child) {
              final color = value ?? buttonColor;
              return DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      color.withValues(alpha: 0.18),
                      color.withValues(alpha: 0.08),
                      scheme.surface.withValues(alpha: 0.92),
                    ],
                  ),
                  border: Border.all(color: color.withValues(alpha: 0.5), width: 1.2),
                ),
                child: Center(
                  child: Container(
                    width: innerSize,
                    height: innerSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.white.withValues(alpha: 0.96), color.withValues(alpha: 0.12)],
                      ),
                    ),
                    padding: EdgeInsets.all(iconPadding),
                    child: child,
                  ),
                ),
              );
            },
            child: SlothIcon(
              connected ? SlothIconType.connect : SlothIconType.sloth,
              size: iconSize,
              color: buttonColor,
            ),
          ),
        ),
      ).animate(target: enabled ? 0 : 1).blurXY(end: 1),
    ).animate(target: enabled ? 0 : 1).scaleXY(end: .88, curve: Curves.easeIn);
    if (animated) {
      button = button
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .scaleXY(begin: 0.98, end: 1.02, duration: 1500.ms, curve: Curves.easeInOut);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Semantics(button: true, enabled: enabled, label: label, child: button),
        Gap(labelGap),
        ExcludeSemantics(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedText(
                label,
                style: compact ? Theme.of(context).textTheme.titleSmall : Theme.of(context).textTheme.titleMedium,
              ),
              if (secureLabel.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlothIcon(SlothIconType.security, size: 16, color: Theme.of(context).colorScheme.secondary),
                    const Gap(4),
                    Text(
                      secureLabel,
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
