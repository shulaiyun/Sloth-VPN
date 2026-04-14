import 'dart:async';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:hiddify/core/app_info/app_info_provider.dart';
import 'package:hiddify/core/db/db.dart';
import 'package:hiddify/core/notification/in_app_notification_controller.dart';
import 'package:hiddify/core/preferences/preferences_provider.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/data/gateway_session_store.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_state_bus.dart';
import 'package:hiddify/features/profile/data/profile_data_providers.dart';
import 'package:hiddify/features/profile/data/profile_repository.dart';
import 'package:hiddify/features/profile/model/profile_entity.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final slothGatewayApiProvider = Provider<SlothGatewayApi>((_) => SlothGatewayApi());
final slothGatewaySyncControllerProvider = Provider<SlothGatewaySyncController>(SlothGatewaySyncController.new);

class SlothGatewaySyncController with AppLogger {
  SlothGatewaySyncController(this._ref);

  final Ref _ref;
  bool _bootstrapped = false;
  Completer<void>? _syncing;

  SlothGatewayApi get _api => _ref.read(slothGatewayApiProvider);
  bool _isBlank(String? value) => value == null || value.trim().isEmpty;
  void _showError(String message) => _ref.read(inAppNotificationControllerProvider).showErrorToast(message);
  void _showSuccess(String message) => _ref.read(inAppNotificationControllerProvider).showSuccessToast(message);
  void _notifyUiRefresh() => bumpSlothGatewayUiRefresh(_ref);
  String _shortDevice(String value) =>
      value.length <= 12 ? value : "${value.substring(0, 8)}...${value.substring(value.length - 4)}";
  String get _platformLabel => switch ((
    PlatformUtils.isAndroid,
    PlatformUtils.isIOS,
    PlatformUtils.isWindows,
    PlatformUtils.isMacOS,
    PlatformUtils.isLinux,
  )) {
    (true, _, _, _, _) => "android",
    (_, true, _, _, _) => "ios",
    (_, _, true, _, _) => "windows",
    (_, _, _, true, _) => "macos",
    (_, _, _, _, true) => "linux",
    _ => "unknown",
  };

  Future<SlothGatewaySessionStore> _sessionStore() async {
    final preferences = await _ref.read(sharedPreferencesProvider.future);
    return SlothGatewaySessionStore(preferences);
  }

  Future<void> bootstrapIfLoggedIn() async {
    if (_bootstrapped) return;
    _bootstrapped = true;
    await _refreshAndSync(reason: 'startup');
  }

  Future<void> refreshNow({String reason = 'manual'}) async {
    await _refreshAndSync(reason: reason);
  }

  Future<void> startBindFlow() async {
    try {
      final store = await _sessionStore();
      final deviceId = await store.readOrCreateDeviceId();
      loggy.info("gateway bind/start using device_id=[$deviceId], platform=[$_platformLabel]");
      final appVersion = _ref.read(appInfoProvider).valueOrNull?.version;
      final bindStart = await _api.bindStart(deviceId: deviceId, platform: _platformLabel, appVersion: appVersion);
      final bindId = bindStart["bind_id"]?.toString() ?? "";
      final approveUrl = bindStart["approve_url"]?.toString();
      if (bindId.isNotEmpty) {
        await store.saveLastBind(bindId: bindId, deviceId: deviceId);
      }
      if (_isBlank(approveUrl)) {
        _showError("绑定链接缺失，请稍后重试");
        return;
      }
      loggy.info("gateway bind/start success, bind_id=[$bindId], approve_url=[$approveUrl]");
      _showSuccess("已发起账号绑定，设备ID：${_shortDevice(deviceId)}");
      await UriUtils.tryLaunch(Uri.parse(approveUrl!));
    } catch (error, stackTrace) {
      loggy.warning("failed to start bind flow", error, stackTrace);
      _showError("发起账号绑定失败，请稍后重试");
    }
  }

  Future<void> handleDeepLink(String rawLink) async {
    final link = rawLink.trim();
    final uri = Uri.tryParse(link);
    if (uri == null || uri.scheme != 'slothvpn') return;

    if (uri.host == 'auth' && uri.path == '/callback') {
      await _handleAuthCallback(uri);
      return;
    }

    if (uri.host == 'payment' && uri.path == '/callback') {
      await _handlePaymentCallback(uri);
      return;
    }

    if (uri.host == 'auth' && uri.path == '/captcha-complete') {
      final email = uri.queryParameters['email']?.trim();
      _showSuccess(email == null || email.isEmpty ? "人机验证已完成，请返回注册页继续操作" : "邮箱 $email 已完成人机验证，请继续发送验证码或注册");
      return;
    }
  }

  Future<void> _handleAuthCallback(Uri uri) async {
    final bindId = uri.queryParameters['bind_id']?.trim();
    final exchangeToken = uri.queryParameters['exchange_token']?.trim();
    final callbackDeviceId = uri.queryParameters['device_id']?.trim();
    if (_isBlank(bindId) || _isBlank(exchangeToken)) {
      _showError("登录回调参数不完整，请重新绑定账号");
      return;
    }

    try {
      final store = await _sessionStore();
      final localDeviceId = await store.readOrCreateDeviceId();
      final savedBindId = store.readLastBindId();
      final savedBindDeviceId = store.readLastBindDeviceId();
      final deviceId = !_isBlank(callbackDeviceId)
          ? callbackDeviceId!
          : bindId == savedBindId && !_isBlank(savedBindDeviceId)
          ? savedBindDeviceId!
          : localDeviceId;

      loggy.info(
        "gateway bind/exchange start, bind_id=[$bindId], local_device_id=[$localDeviceId], callback_device_id=[$callbackDeviceId], saved_bind_id=[$savedBindId], saved_bind_device_id=[$savedBindDeviceId], chosen_device_id=[$deviceId]",
      );

      final exchange = await _api.bindExchange(bindId: bindId!, exchangeToken: exchangeToken!, deviceId: deviceId);
      await store.saveAuth(
        accessToken: exchange.accessToken,
        refreshToken: exchange.refreshToken,
        sessionId: exchange.sessionId,
      );

      await _refreshAndSync(reason: 'auth_callback');
      loggy.info("gateway bind/exchange success, bind_id=[$bindId], device_id=[$deviceId]");
      _notifyUiRefresh();
      _showSuccess("账号绑定成功，订阅已自动同步");
    } on GatewayApiException catch (error, stackTrace) {
      loggy.warning('gateway bind/exchange api failure', error, stackTrace);
      if (error.isDeviceIdMismatch) {
        _showError("绑定失败：设备ID不一致，请在 App 内重新发起绑定");
      } else {
        _showError("账号绑定失败：${error.message}");
      }
    } catch (error, stackTrace) {
      loggy.warning('failed to handle auth callback', error, stackTrace);
      _showError("账号绑定失败，订阅未同步");
    }
  }

  Future<void> _handlePaymentCallback(Uri uri) async {
    final orderNo = uri.queryParameters['order_no'] ?? uri.queryParameters['trade_no'];
    if (_isBlank(orderNo)) {
      _showError("支付回调缺少订单号");
      return;
    }

    try {
      final store = await _sessionStore();
      final accessToken = store.readAccessToken();
      if (_isBlank(accessToken)) {
        _showError("支付回调已收到，但未检测到登录状态");
        return;
      }

      final status = await _api.orderStatus(accessToken: accessToken!, orderNo: orderNo!);
      if (status.isCompleted || status.status == 'processing') {
        await _refreshAndSync(reason: 'payment_callback');
        _notifyUiRefresh();
        _showSuccess("支付状态已更新，订阅已自动同步");
      } else {
        _showError("支付状态未完成，当前订单状态：${status.status}");
      }
    } catch (error, stackTrace) {
      loggy.warning('failed to handle payment callback', error, stackTrace);
      _showError("处理支付回调失败，请手动刷新订单状态");
    }
  }

  Future<void> _refreshAndSync({required String reason}) async {
    if (_syncing != null) {
      await _syncing!.future;
      return;
    }

    _syncing = Completer<void>();
    try {
      final store = await _sessionStore();
      final accessToken = store.readAccessToken();
      if (_isBlank(accessToken)) return;

      await _api.bootstrap(accessToken!);
      await _api.subscriptionSync(accessToken);
      final subscription = await _api.subscription(accessToken);
      if (subscription.pullUrl.isNotEmpty) {
        final managedProfileId = await _upsertManagedSubscription(subscription.pullUrl, store);
        await store.saveManagedPullUrl(subscription.pullUrl);
        if (managedProfileId != null) {
          await store.saveManagedProfileId(managedProfileId);
        }
      }
      loggy.info('gateway sync completed, reason=[$reason], pull_url=[${subscription.pullUrl}]');
      _notifyUiRefresh();
    } on GatewayApiException catch (error, stackTrace) {
      loggy.warning('gateway sync api failed, reason=[$reason]', error, stackTrace);
      final lowered = error.message.toLowerCase();
      final looksLikeNoSubscriptionYet =
          error.code == "SUBSCRIPTION_NOT_AVAILABLE" ||
          error.code == "FORBIDDEN" ||
          error.statusCode == 401 ||
          error.statusCode == 403 ||
          lowered.contains("forbidden") ||
          lowered.contains("denied") ||
          lowered.contains("当前请求被拒绝") ||
          lowered.contains("token is error") ||
          lowered.contains("暂无可用订阅");
      if (error.code == "SUBSCRIPTION_NOT_AVAILABLE") {
        if (reason.startsWith('auth_')) {
          _showSuccess("账号已登录，当前暂无可用订阅，请先购买套餐后再同步");
        } else if (reason != 'startup') {
          _showError("订阅同步失败：${error.message}");
        }
        return;
      }
      if (reason.startsWith('auth_') && looksLikeNoSubscriptionYet) {
        _showSuccess("账号已登录，套餐开通后可一键同步订阅并连接");
        return;
      }
      if (reason != 'startup') {
        _showError("订阅同步失败：${error.message}");
      }
    } on DioException catch (error, stackTrace) {
      loggy.warning('gateway sync request failed, reason=[$reason]', error, stackTrace);
      if (reason != 'startup') {
        _showError("订阅同步失败，请稍后重试");
      }
    } catch (error, stackTrace) {
      loggy.warning('gateway sync failed, reason=[$reason]', error, stackTrace);
      if (reason != 'startup') {
        _showError("订阅同步失败，请稍后重试");
      }
    } finally {
      _syncing?.complete();
      _syncing = null;
    }
  }

  Future<List<ProfileEntity>> _loadProfiles(ProfileRepository repository) async {
    final allProfilesEither = await repository.watchAll().first;
    return allProfilesEither.getOrElse((_) => const <ProfileEntity>[]);
  }

  bool _isManagedGatewayProfile(RemoteProfileEntity profile) {
    final overrideName = profile.userOverride?.name?.trim() ?? "";
    final profileName = profile.name.trim();
    if (overrideName == "树懒VPN" || profileName == "树懒VPN") return true;
    final normalized = "$overrideName $profileName".toLowerCase();
    return normalized.contains("slothvpn managed") || normalized == "slothvpn";
  }

  RemoteProfileEntity? _pickManagedProfile(List<RemoteProfileEntity> profiles, {String? preferredId}) {
    if (profiles.isEmpty) return null;
    if (!_isBlank(preferredId)) {
      for (final profile in profiles) {
        if (profile.id == preferredId) return profile;
      }
    }

    profiles.sort((a, b) {
      if (a.active != b.active) return a.active ? -1 : 1;
      return b.lastUpdate.compareTo(a.lastUpdate);
    });
    return profiles.first;
  }

  Future<String?> _upsertManagedSubscription(String pullUrl, SlothGatewaySessionStore store) async {
    final repository = await _ref.read(profileRepositoryProvider.future);
    final dataSource = _ref.read(profileDataSourceProvider);

    final knownManagedId = store.readManagedProfileId();
    final profilesBefore = await _loadProfiles(repository);
    final managedBefore = profilesBefore.whereType<RemoteProfileEntity>().where(_isManagedGatewayProfile).toList();
    final targetBefore = _pickManagedProfile(managedBefore, preferredId: knownManagedId);

    // pull_url can rotate token; force managed row to follow latest url before upsert.
    if (targetBefore != null && targetBefore.url != pullUrl) {
      await dataSource.edit(targetBefore.id, ProfileEntriesCompanion(url: Value(pullUrl)));
    }

    final result = await repository
        .upsertRemote(
          pullUrl,
          userOverride: const UserOverride(name: '树懒VPN', updateInterval: 6),
        )
        .run();

    result.match(
      (failure) => loggy.warning('failed to upsert managed subscription', failure),
      (_) => loggy.info('managed subscription upserted'),
    );

    final profilesAfter = await _loadProfiles(repository);
    final managedAfter = profilesAfter.whereType<RemoteProfileEntity>().where(_isManagedGatewayProfile).toList();
    final matchedByUrl = managedAfter.where((profile) => profile.url == pullUrl).toList();
    final keep = _pickManagedProfile(
      matchedByUrl.isNotEmpty ? matchedByUrl : managedAfter,
      preferredId: targetBefore?.id ?? knownManagedId,
    );
    if (keep == null) return null;

    for (final profile in managedAfter) {
      if (profile.id == keep.id) continue;
      final delete = await repository.deleteById(profile.id, profile.active).run();
      delete.match(
        (failure) => loggy.warning('failed to delete duplicated managed subscription', failure),
        (_) => loggy.info('deleted duplicated managed subscription [${profile.id}]'),
      );
    }

    await repository.setAsActive(keep.id).run();
    return keep.id;
  }
}
