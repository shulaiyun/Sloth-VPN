import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/model/region.dart';
import 'package:hiddify/core/preferences/general_preferences.dart';
import 'package:hiddify/core/router/dialog/dialog_notifier.dart';
import 'package:hiddify/features/per_app_proxy/model/per_app_proxy_mode.dart';
import 'package:hiddify/features/per_app_proxy/overview/per_app_proxy_notifier.dart';
import 'package:hiddify/features/settings/data/config_option_repository.dart';
import 'package:hiddify/features/settings/widget/preference_tile.dart';
import 'package:hiddify/features/settings/widget/sloth_settings_list.dart';
import 'package:hiddify/singbox/model/singbox_config_enum.dart';
import 'package:hiddify/utils/platform_utils.dart';
import 'package:hiddify/utils/validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RouteOptionsPage extends HookConsumerWidget {
  const RouteOptionsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsProvider).requireValue;
    final isZh = Localizations.localeOf(context).languageCode.toLowerCase().startsWith('zh');
    final perAppProxy = ref.watch(Preferences.perAppProxyMode).enabled;
    final desktopTunDirectIps = ref.watch(ConfigOptions.desktopTunDirectIps);
    final desktopTunDirectPorts = ref.watch(ConfigOptions.desktopTunDirectPorts);

    List<String> splitInput(String input) =>
        input.split(RegExp(r'[\s,;]+')).map((item) => item.trim()).where((item) => item.isNotEmpty).toList();
    String normalizeInput(String input) => splitInput(input).join(',');

    bool validateIpList(String input) {
      final items = splitInput(input);
      return items.isEmpty || items.every(isIpCidr);
    }

    bool validatePortList(String input) {
      final items = splitInput(input);
      return items.isEmpty || items.every(isPortOrPortRange);
    }

    String presentListOrUnset(String value, String unsetLabel) {
      final items = splitInput(value);
      return items.isEmpty ? unsetLabel : items.join(', ');
    }

    Future<void> quickAddDirectTarget() async {
      final ipController = TextEditingController();
      final portController = TextEditingController(text: desktopTunDirectPorts);
      final clipboard = await Clipboard.getData(Clipboard.kTextPlain);
      final clipboardText = clipboard?.text?.trim() ?? '';
      if (!context.mounted) return;
      if (clipboardText.isNotEmpty && validateIpList(clipboardText) && splitInput(clipboardText).length == 1) {
        ipController.text = normalizeInput(clipboardText);
      }

      final confirmed = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(isZh ? '快速添加直连目标' : 'Quick add direct target'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: ipController,
                decoration: InputDecoration(
                  labelText: isZh ? 'IP 或 CIDR' : 'IP or CIDR',
                  hintText: '38.80.189.137',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: portController,
                decoration: InputDecoration(
                  labelText: isZh ? '端口列表' : 'Ports',
                  hintText: '22,19575',
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: Text(isZh ? '取消' : 'Cancel')),
            FilledButton(onPressed: () => Navigator.pop(dialogContext, true), child: Text(isZh ? '保存' : 'Save')),
          ],
        ),
      );
      if (confirmed != true) return;

      final normalizedIps = normalizeInput(ipController.text);
      final normalizedPorts = normalizeInput(portController.text);
      if (splitInput(normalizedIps).isEmpty || !validateIpList(normalizedIps)) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(isZh ? '请输入有效的 IP 或 CIDR' : 'Enter a valid IP or CIDR.')));
        return;
      }
      if (normalizedPorts.isNotEmpty && !validatePortList(normalizedPorts)) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(isZh ? '端口格式不正确' : 'Port format is invalid.')));
        return;
      }

      final nextIps = {...splitInput(desktopTunDirectIps), ...splitInput(normalizedIps)}.join(',');
      final nextPorts = {...splitInput(desktopTunDirectPorts), ...splitInput(normalizedPorts)}.join(',');
      await ref.read(ConfigOptions.desktopTunDirectIps.notifier).update(nextIps);
      await ref.read(ConfigOptions.desktopTunDirectPorts.notifier).update(nextPorts);
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(isZh ? '已加入桌面 TUN 直连白名单' : 'Added to desktop TUN bypass list.')));
    }

    return Scaffold(
      appBar: AppBar(title: Text(t.pages.settings.routing.title)),
      body: SlothSettingsList(
        children: [
          if (PlatformUtils.isAndroid)
            ListTile(
              title: Text(t.pages.settings.routing.perAppProxy.title),
              leading: const Icon(Icons.apps_rounded),
              trailing: Switch(
                value: perAppProxy,
                onChanged: (value) async {
                  final newMode = perAppProxy ? PerAppProxyMode.off : PerAppProxyMode.exclude;
                  await ref.read(Preferences.perAppProxyMode.notifier).update(newMode);
                  if (!perAppProxy && context.mounted) {
                    context.goNamed('perAppProxy');
                  }
                },
              ),
              onTap: () async {
                if (!perAppProxy) {
                  await ref.read(Preferences.perAppProxyMode.notifier).update(PerAppProxyMode.exclude);
                }
                if (context.mounted) context.goNamed('perAppProxy');
              },
            ),
          if (PlatformUtils.isDesktop) ...[
            ListTile(
              title: Text(isZh ? '桌面TUN模式 SSH 直连' : 'Desktop TUN SSH direct'),
              subtitle: Text(
                isZh
                    ? '在 TUN 模式下，对这些 IP/CIDR + 端口走直连，避免远程服务器 SSH 被代理中断。'
                    : 'In TUN mode, these IP/CIDR + ports bypass proxy to keep SSH reachable.',
              ),
              leading: const Icon(Icons.lan_rounded),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilledButton.tonalIcon(
                    onPressed: quickAddDirectTarget,
                    icon: const Icon(Icons.add_link_rounded),
                    label: Text(isZh ? '快速添加服务器 IP' : 'Quick add server IP'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () async {
                      await ref.read(ConfigOptions.desktopTunDirectPorts.notifier).update("22,19575");
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(isZh ? '已恢复默认 SSH 端口' : 'Default SSH ports restored.')));
                    },
                    icon: const Icon(Icons.restart_alt_rounded),
                    label: Text(isZh ? '恢复默认端口' : 'Restore default ports'),
                  ),
                ],
              ),
            ),
            ValuePreferenceWidget<String>(
              value: desktopTunDirectIps,
              preferences: ref.watch(ConfigOptions.desktopTunDirectIps.notifier),
              title: isZh ? '直连 IP/CIDR 列表' : 'Direct IP/CIDR list',
              icon: Icons.dns_rounded,
              presentValue: (value) => presentListOrUnset(value, isZh ? '未设置' : 'Not set'),
              formatInputValue: (value) => value,
              validateInput: validateIpList,
              inputToValue: (input) => normalizeInput(input),
            ),
            ValuePreferenceWidget<String>(
              value: desktopTunDirectPorts,
              preferences: ref.watch(ConfigOptions.desktopTunDirectPorts.notifier),
              title: isZh ? '直连端口列表' : 'Direct ports',
              icon: Icons.settings_ethernet_rounded,
              presentValue: (value) => presentListOrUnset(value, isZh ? '未设置' : 'Not set'),
              formatInputValue: (value) => value,
              validateInput: validatePortList,
              inputToValue: (input) => normalizeInput(input),
            ),
          ],
          ChoicePreferenceWidget(
            selected: ref.watch(ConfigOptions.region),
            preferences: ref.watch(ConfigOptions.region.notifier),
            choices: Region.values,
            title: t.pages.settings.routing.region,
            showFlag: true,
            icon: Icons.place_rounded,
            presentChoice: (value) => value.present(t),
            onChanged: (val) async {
              await ref.read(ConfigOptions.directDnsAddress.notifier).reset();
              final autoRegion = ref.read(Preferences.autoAppsSelectionRegion);
              final mode = ref.read(Preferences.perAppProxyMode).toAppProxy();
              if (autoRegion != val &&
                  autoRegion != null &&
                  val != Region.other &&
                  mode != null &&
                  PlatformUtils.isAndroid) {
                await ref
                    .read(dialogNotifierProvider.notifier)
                    .showOk(
                      t.pages.settings.routing.perAppProxy.autoSelection.dialog.title,
                      t.pages.settings.routing.perAppProxy.autoSelection.dialog.msg(region: val.name),
                    );
                await ref.read(PerAppProxyProvider(mode).notifier).clearAutoSelected();
              }
            },
          ),
          ChoicePreferenceWidget(
            title: t.pages.settings.routing.balancerStrategy.title,
            icon: Icons.balance_rounded,
            selected: ref.watch(ConfigOptions.balancerStrategy),
            preferences: ref.watch(ConfigOptions.balancerStrategy.notifier),
            choices: BalancerStrategy.values,
            presentChoice: (value) => value.present(t),
          ),
          SwitchListTile.adaptive(
            title: Text(t.pages.settings.routing.blockAds),
            secondary: const Icon(Icons.block_rounded),
            value: ref.watch(ConfigOptions.blockAds),
            onChanged: ref.read(ConfigOptions.blockAds.notifier).update,
          ),
          SwitchListTile.adaptive(
            title: Text(t.pages.settings.routing.bypassLan),
            secondary: const Icon(Icons.call_split_rounded),
            value: ref.watch(ConfigOptions.bypassLan),
            onChanged: ref.read(ConfigOptions.bypassLan.notifier).update,
          ),
          SwitchListTile.adaptive(
            title: Text(t.pages.settings.routing.resolveDestination),
            secondary: const Icon(Icons.security_rounded),
            value: ref.watch(ConfigOptions.resolveDestination),
            onChanged: ref.read(ConfigOptions.resolveDestination.notifier).update,
          ),
          ChoicePreferenceWidget(
            selected: ref.watch(ConfigOptions.ipv6Mode),
            preferences: ref.watch(ConfigOptions.ipv6Mode.notifier),
            choices: IPv6Mode.values,
            title: t.pages.settings.routing.ipv6Route,
            icon: Icons.looks_6_rounded,
            presentChoice: (value) => value.present(t),
          ),
        ],
      ),
    );
  }
}
