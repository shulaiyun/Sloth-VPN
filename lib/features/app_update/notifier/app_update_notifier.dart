import 'package:flutter/foundation.dart';
import 'package:hiddify/core/app_info/app_info_provider.dart';
import 'package:hiddify/core/localization/locale_preferences.dart';
import 'package:hiddify/core/model/constants.dart';
import 'package:hiddify/core/preferences/preferences_provider.dart';
import 'package:hiddify/core/utils/preferences_utils.dart';
import 'package:hiddify/features/app_update/data/app_update_data_providers.dart';
import 'package:hiddify/features/app_update/model/remote_version_entity.dart';
import 'package:hiddify/features/app_update/notifier/app_update_state.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:upgrader/upgrader.dart';
import 'package:version/version.dart';

part 'app_update_notifier.g.dart';

const _debugUpgrader = true;

@riverpod
Upgrader upgrader(Ref ref) => Upgrader(
  storeController: UpgraderStoreController(
    onAndroid: () => ref.read(appInfoProvider).requireValue.release.allowCustomUpdateChecker
        ? UpgraderAppcastStore(appcastURL: Constants.appCastUrl)
        : UpgraderPlayStore(),
    oniOS: () => UpgraderAppStore(),
    onLinux: () => UpgraderAppcastStore(appcastURL: Constants.appCastUrl),
    onWindows: () => UpgraderAppcastStore(appcastURL: Constants.appCastUrl),
    onMacOS: () => UpgraderAppcastStore(appcastURL: Constants.appCastUrl),
    onWeb: () => UpgraderAppcastStore(appcastURL: Constants.appCastUrl),
  ),
  debugLogging: false && _debugUpgrader && kDebugMode,
  // durationUntilAlertAgain: const Duration(hours: 12),
  messages: UpgraderMessages(code: ref.watch(localePreferencesProvider).languageCode),
);

@Riverpod(keepAlive: true)
class AppUpdateNotifier extends _$AppUpdateNotifier with AppLogger {
  bool _forceUpdate = false;

  bool get forceUpdate => _forceUpdate;

  @override
  AppUpdateState build() => const AppUpdateState.initial();

  PreferencesEntry<String?, dynamic> get _ignoreReleasePref => PreferencesEntry(
    preferences: ref.read(sharedPreferencesProvider).requireValue,
    key: 'ignored_release_version',
    defaultValue: null,
  );

  Future<AppUpdateState> check() async {
    loggy.debug("checking for update");
    state = const AppUpdateState.checking();
    _forceUpdate = false;
    final appInfo = await ref.read(appInfoProvider.future);
    if (!appInfo.release.allowCustomUpdateChecker) {
      loggy.debug("custom update checkers are not allowed for [${appInfo.release.name}] release");
      return state = const AppUpdateState.disabled();
    }
    final repository = ref.read(appUpdateRepositoryProvider);
    final currentBuild = int.tryParse(appInfo.buildNumber) ?? 0;
    final gatewayPolicy = await repository.getGatewayUpdatePolicy(
      platform: appInfo.operatingSystem,
      version: appInfo.version,
      buildNumber: appInfo.buildNumber,
    );

    if (gatewayPolicy != null && gatewayPolicy.enabled) {
      final minSupportedBuild = gatewayPolicy.minSupportedBuild ?? 0;
      final latestBuild = gatewayPolicy.latestBuild ?? 0;
      final latestVersionText = gatewayPolicy.latestVersion ?? appInfo.version;

      Version? latestVersion;
      Version? currentVersion;
      try {
        latestVersion = Version.parse(latestVersionText);
        currentVersion = Version.parse(appInfo.version);
      } catch (_) {}

      final shouldForce =
          gatewayPolicy.force || (minSupportedBuild > 0 && currentBuild > 0 && currentBuild < minSupportedBuild);
      final hasNewBuild = latestBuild > 0 && currentBuild > 0 && latestBuild > currentBuild;
      final hasNewVersion = latestVersion != null && currentVersion != null && latestVersion > currentVersion;

      if (shouldForce || hasNewBuild || hasNewVersion) {
        _forceUpdate = shouldForce;
        final remote = RemoteVersionEntity(
          version: latestVersionText,
          buildNumber: latestBuild > 0 ? latestBuild.toString() : appInfo.buildNumber,
          releaseTag: "gateway-policy-${latestVersionText.replaceAll('+', '-')}",
          preRelease: false,
          url: gatewayPolicy.downloadUrl ?? Constants.githubLatestReleaseUrl,
          publishedAt: DateTime.now().toUtc(),
          flavor: appInfo.environment,
        );

        if (!_forceUpdate && remote.version == _ignoreReleasePref.read()) {
          loggy.debug("ignored gateway release [${remote.version}]");
          return state = AppUpdateStateIgnored(remote);
        }

        loggy.info(
          "gateway update available: latest=[$latestVersionText+$latestBuild], current=[${appInfo.version}+${appInfo.buildNumber}], force=[$_forceUpdate]",
        );
        return state = AppUpdateState.available(remote);
      }
    }

    return ref
        .watch(appUpdateRepositoryProvider)
        .getLatestVersion()
        .match(
          (err) {
            loggy.warning("failed to get latest version", err);
            return state = AppUpdateState.error(err);
          },
          (remote) {
            try {
              final latestVersion = Version.parse(remote.version);
              final currentVersion = Version.parse(appInfo.version);
              if (latestVersion > currentVersion) {
                if (remote.version == _ignoreReleasePref.read()) {
                  loggy.debug("ignored release [${remote.version}]");
                  return state = AppUpdateStateIgnored(remote);
                }
                loggy.debug("new version available: $remote");
                return state = AppUpdateState.available(remote);
              }
              loggy.info("already using latest version[$currentVersion], remote: [${remote.version}]");
              return state = const AppUpdateState.notAvailable();
            } catch (error, stackTrace) {
              loggy.warning("error parsing versions", error, stackTrace);
              return state = const AppUpdateState.notAvailable();
            }
          },
        )
        .run();
  }

  Future<void> ignoreRelease(RemoteVersionEntity version) async {
    if (_forceUpdate) return;
    loggy.debug("ignoring release [${version.version}]");
    await _ignoreReleasePref.write(version.version);
    state = AppUpdateStateIgnored(version);
  }
}
