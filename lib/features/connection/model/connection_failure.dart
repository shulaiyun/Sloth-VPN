import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/model/failures.dart';
import 'package:hiddify/features/settings/model/config_option_failure.dart';

part 'connection_failure.freezed.dart';

String? _normalizeUnexpectedConnectivityMessage(Object? error) {
  if (error == null) return null;
  final raw = error.toString();
  final text = raw.toLowerCase();

  if (text.contains("tun permission denied") ||
      text.contains("vpn permission denied") ||
      (text.contains("permission denied") && text.contains("tun"))) {
    return "需要系统授权才能连接。请先在系统弹窗中点击允许；若未弹窗，请到 设置 > VPN > 树懒VPN 开启后重试。";
  }

  if (text.contains("failed to start background core") ||
      text.contains("background core is not started yet") ||
      text.contains("createservice - null") ||
      text.contains("createservice")) {
    return "后台服务启动失败，请重试；如仍失败请重启应用";
  }

  if (text.contains("profile not found") ||
      text.contains("empty outbound") ||
      text.contains("no profile") ||
      text.contains("subscription content is empty")) {
    return "当前节点为空，请先同步订阅或购买套餐";
  }

  if (text.contains("failed to connect")) {
    return "连接节点失败，请切换节点后重试";
  }

  if (text.contains("unexpected failure") || text.contains("unexpected")) {
    return "连接失败，请稍后重试";
  }

  return "连接失败，请检查网络与节点状态后重试";
}

@freezed
sealed class ConnectionFailure with _$ConnectionFailure, Failure {
  const ConnectionFailure._();

  @With<UnexpectedFailure>()
  const factory ConnectionFailure.unexpected([Object? error, StackTrace? stackTrace]) = UnexpectedConnectionFailure;

  @With<ExpectedMeasuredFailure>()
  const factory ConnectionFailure.missingVpnPermission([String? message]) = MissingVpnPermission;

  @With<ExpectedMeasuredFailure>()
  const factory ConnectionFailure.missingNotificationPermission([String? message]) = MissingNotificationPermission;

  @With<ExpectedMeasuredFailure>()
  const factory ConnectionFailure.missingPrivilege() = MissingPrivilege;

  @With<ExpectedMeasuredFailure>()
  const factory ConnectionFailure.invalidConfigOption([String? message, ConfigOptionFailure? configOptionFailure]) =
      InvalidConfigOption;

  @With<ExpectedMeasuredFailure>()
  const factory ConnectionFailure.invalidConfig([String? message]) = InvalidConfig;

  @With<ExpectedMeasuredFailure>()
  const factory ConnectionFailure.backgroundCoreNotAvailable([String? message]) = BackgroundCoreNotAvailable;

  @With<ExpectedMeasuredFailure>()
  const factory ConnectionFailure.missiingWarpLicense() = MissingWarpLicense;

  @override
  ({String type, String? message}) present(TranslationsEn t) {
    return switch (this) {
      UnexpectedConnectionFailure(:final error) when error != null => (
        type: t.errors.connectivity.unexpected,
        message: _normalizeUnexpectedConnectivityMessage(error),
      ),
      UnexpectedConnectionFailure() => (type: t.errors.connectivity.unexpected, message: null),
      MissingVpnPermission(:final message) => (type: t.errors.connectivity.missingVpnPermission, message: message),
      MissingNotificationPermission(:final message) => (
        type: t.errors.connectivity.missingNotificationPermission,
        message: message,
      ),
      MissingPrivilege() => (type: t.errors.singbox.missingPrivilege, message: t.errors.singbox.missingPrivilegeMsg),
      InvalidConfigOption(:final message, :final configOptionFailure) =>
        configOptionFailure?.present(t) ?? (type: t.errors.singbox.invalidConfigOptions, message: message),
      InvalidConfig(:final message) => (type: t.errors.singbox.invalidConfig, message: message),
      BackgroundCoreNotAvailable(:final message) => (type: t.errors.connectivity.core, message: message),
      MissingWarpLicense() => (type: t.errors.warp.missingLicense, message: t.errors.warp.missingLicenseMsg),
    };
  }
}
