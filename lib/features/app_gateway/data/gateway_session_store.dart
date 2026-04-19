import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SlothGatewaySessionStore {
  SlothGatewaySessionStore(this._preferences);

  final SharedPreferences _preferences;

  static const _accessTokenKey = "sloth_gateway.access_token";
  static const _refreshTokenKey = "sloth_gateway.refresh_token";
  static const _sessionIdKey = "sloth_gateway.session_id";
  static const _deviceIdKey = "sloth_gateway.device_id";
  static const _managedPullUrlKey = "sloth_gateway.managed_pull_url";
  static const _managedProfileIdKey = "sloth_gateway.managed_profile_id";
  static const _lastBindIdKey = "sloth_gateway.last_bind_id";
  static const _lastBindDeviceIdKey = "sloth_gateway.last_bind_device_id";
  static const _referralClaimIdKey = "sloth_gateway.referral_claim_id";
  static const _pendingInviteCodeKey = "sloth_gateway.pending_invite_code";

  String? readAccessToken() => _preferences.getString(_accessTokenKey);
  String? readRefreshToken() => _preferences.getString(_refreshTokenKey);
  String? readSessionId() => _preferences.getString(_sessionIdKey);
  String? readManagedPullUrl() => _preferences.getString(_managedPullUrlKey);
  String? readManagedProfileId() => _preferences.getString(_managedProfileIdKey);
  String? readLastBindId() => _preferences.getString(_lastBindIdKey);
  String? readLastBindDeviceId() => _preferences.getString(_lastBindDeviceIdKey);
  String? readReferralClaimId() => _preferences.getString(_referralClaimIdKey);
  String? readPendingInviteCode() => _preferences.getString(_pendingInviteCodeKey);

  Future<void> saveAuth({required String accessToken, required String refreshToken, required String sessionId}) async {
    await _preferences.setString(_accessTokenKey, accessToken);
    await _preferences.setString(_refreshTokenKey, refreshToken);
    await _preferences.setString(_sessionIdKey, sessionId);
  }

  Future<void> saveManagedPullUrl(String url) => _preferences.setString(_managedPullUrlKey, url);
  Future<void> saveManagedProfileId(String id) => _preferences.setString(_managedProfileIdKey, id);
  Future<void> saveReferralClaimId(String claimId) => _preferences.setString(_referralClaimIdKey, claimId);
  Future<void> savePendingInviteCode(String inviteCode) => _preferences.setString(_pendingInviteCodeKey, inviteCode);
  Future<void> clearReferralClaimId() => _preferences.remove(_referralClaimIdKey);
  Future<void> clearPendingInviteCode() => _preferences.remove(_pendingInviteCodeKey);

  Future<void> clearAuth() async {
    await _preferences.remove(_accessTokenKey);
    await _preferences.remove(_refreshTokenKey);
    await _preferences.remove(_sessionIdKey);
    await _preferences.remove(_managedPullUrlKey);
    await _preferences.remove(_managedProfileIdKey);
    await _preferences.remove(_lastBindIdKey);
    await _preferences.remove(_lastBindDeviceIdKey);
  }

  Future<void> saveLastBind({required String bindId, required String deviceId}) async {
    await _preferences.setString(_lastBindIdKey, bindId);
    await _preferences.setString(_lastBindDeviceIdKey, deviceId);
  }

  Future<String> readOrCreateDeviceId() async {
    final existing = _preferences.getString(_deviceIdKey);
    if (existing != null && existing.isNotEmpty) return existing;

    final generated = const Uuid().v4();
    await _preferences.setString(_deviceIdKey, generated);
    return generated;
  }
}
