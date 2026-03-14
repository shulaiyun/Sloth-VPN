import 'package:hiddify/core/app_info/app_info_provider.dart';
import 'package:hiddify/core/preferences/preferences_provider.dart';
import 'package:hiddify/features/app_gateway/data/gateway_api.dart';
import 'package:hiddify/features/app_gateway/data/gateway_session_store.dart';
import 'package:hiddify/features/app_gateway/model/gateway_models.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_state_bus.dart';
import 'package:hiddify/features/app_gateway/notifier/gateway_sync_controller.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final slothGatewayPortalControllerProvider = Provider<SlothGatewayPortalController>(SlothGatewayPortalController.new);

class SlothGatewayPortalController with AppLogger {
  SlothGatewayPortalController(this._ref);

  final Ref _ref;

  SlothGatewayApi get _api => _ref.read(slothGatewayApiProvider);

  bool _isBlank(String? value) => value == null || value.trim().isEmpty;

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

  Future<SlothGatewaySessionStore> _store() async {
    final preferences = await _ref.read(sharedPreferencesProvider.future);
    return SlothGatewaySessionStore(preferences);
  }

  Future<String?> _accessToken() async {
    final store = await _store();
    return store.readAccessToken();
  }

  void _notifyUiRefresh() {
    bumpSlothGatewayUiRefresh(_ref);
  }

  Future<void> _tryAutoSync(String reason) async {
    try {
      await _ref.read(slothGatewaySyncControllerProvider).refreshNow(reason: reason);
    } catch (error, stackTrace) {
      loggy.warning("gateway auto sync failed after auth, keep login session", error, stackTrace);
    } finally {
      _notifyUiRefresh();
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await _accessToken();
    return !_isBlank(token);
  }

  Future<GatewayAuthPolicy> fetchAuthPolicy() {
    return _api.authPolicy();
  }

  Future<GatewayAccountSummary?> fetchAccountSummary() async {
    final token = await _accessToken();
    if (_isBlank(token)) return null;
    return _api.accountSummary(token!);
  }

  Future<GatewayInviteSummary?> fetchInviteSummary() async {
    final token = await _accessToken();
    if (_isBlank(token)) return null;
    return _api.inviteSummary(token!);
  }

  Future<bool> requestInviteWithdraw(double amount) async {
    final token = await _accessToken();
    if (_isBlank(token)) {
      throw GatewayApiException(message: "请先登录后再发起提现");
    }
    return _api.inviteWithdraw(accessToken: token!, amount: amount);
  }

  Future<bool> sendEmailVerify(String email) {
    return _api.sendEmailVerify(email);
  }

  Future<void> login({required String email, required String password}) async {
    final store = await _store();
    final deviceId = await store.readOrCreateDeviceId();
    final appVersion = _ref.read(appInfoProvider).valueOrNull?.version;
    final result = await _api.login(
      email: email,
      password: password,
      deviceId: deviceId,
      platform: _platformLabel,
      appVersion: appVersion,
    );
    await store.saveAuth(
      accessToken: result.accessToken,
      refreshToken: result.refreshToken,
      sessionId: result.sessionId,
    );
    _notifyUiRefresh();
    await _tryAutoSync("auth_login");
  }

  Future<void> register({
    required String email,
    required String password,
    String? emailCode,
    String? inviteCode,
  }) async {
    final store = await _store();
    final deviceId = await store.readOrCreateDeviceId();
    final appVersion = _ref.read(appInfoProvider).valueOrNull?.version;
    final result = await _api.register(
      email: email,
      password: password,
      deviceId: deviceId,
      platform: _platformLabel,
      appVersion: appVersion,
      emailCode: emailCode,
      inviteCode: inviteCode,
    );
    await store.saveAuth(
      accessToken: result.accessToken,
      refreshToken: result.refreshToken,
      sessionId: result.sessionId,
    );
    _notifyUiRefresh();
    await _tryAutoSync("auth_register");
  }

  Future<void> logout() async {
    final store = await _store();
    await store.clearAuth();
    _notifyUiRefresh();
  }

  Future<void> syncNow() async {
    await _ref.read(slothGatewaySyncControllerProvider).refreshNow(reason: "manual_sync");
    _notifyUiRefresh();
  }

  Future<List<GatewayPlan>> fetchPlans() async {
    final token = await _accessToken();
    if (_isBlank(token)) return const [];
    return _api.plans(token!);
  }

  Future<List<GatewayOrderItem>> fetchOrders({String? status}) async {
    final token = await _accessToken();
    if (_isBlank(token)) return const [];
    return _api.orders(token!, status: status);
  }

  Future<List<GatewayPaymentMethod>> fetchPaymentMethods() async {
    final token = await _accessToken();
    if (_isBlank(token)) return const [];
    return _api.paymentMethods(token!);
  }

  Future<String> createOrder({required int planId, required String period, String? couponCode}) async {
    final token = await _accessToken();
    if (_isBlank(token)) {
      throw GatewayApiException(message: "请先登录后再下单");
    }
    return _api.createOrder(accessToken: token!, planId: planId, period: period, couponCode: couponCode);
  }

  Future<GatewayOrderPaymentResult> payOrder({required String orderNo, required int paymentMethodId}) async {
    final token = await _accessToken();
    if (_isBlank(token)) {
      throw GatewayApiException(message: "请先登录后再支付");
    }
    return _api.payOrder(accessToken: token!, orderNo: orderNo, paymentMethodId: paymentMethodId);
  }

  Future<GatewayOrderStatusResult> orderStatus(String orderNo) async {
    final token = await _accessToken();
    if (_isBlank(token)) {
      throw GatewayApiException(message: "请先登录后再查看订单");
    }
    return _api.orderStatus(accessToken: token!, orderNo: orderNo);
  }

  Future<GatewayOrderItem?> orderDetail(String orderNo) async {
    final token = await _accessToken();
    if (_isBlank(token)) {
      throw GatewayApiException(message: "请先登录后再查看订单");
    }
    return _api.orderDetail(accessToken: token!, orderNo: orderNo);
  }

  Future<bool> cancelOrder(String orderNo) async {
    final token = await _accessToken();
    if (_isBlank(token)) {
      throw GatewayApiException(message: "请先登录后再管理订单");
    }
    return _api.cancelOrder(accessToken: token!, orderNo: orderNo);
  }

  Future<List<GatewayNoticeItem>> fetchNotices({int current = 1, int pageSize = 10}) async {
    final token = await _accessToken();
    if (_isBlank(token)) return const [];
    return _api.notices(token!, current: current, pageSize: pageSize);
  }

  Future<List<GatewayKnowledgeItem>> fetchKnowledge({String? language, String? keyword}) async {
    final token = await _accessToken();
    if (_isBlank(token)) return const [];
    return _api.knowledge(token!, language: language, keyword: keyword);
  }

  Future<GatewayKnowledgeItem?> fetchKnowledgeDetail(int id) async {
    final token = await _accessToken();
    if (_isBlank(token)) return null;
    return _api.knowledgeDetail(token!, id);
  }

  Future<void> changePassword({required String oldPassword, required String newPassword}) async {
    final token = await _accessToken();
    if (_isBlank(token)) {
      throw GatewayApiException(message: "请先登录后再修改密码");
    }
    await _api.changePassword(accessToken: token!, oldPassword: oldPassword, newPassword: newPassword);
  }

  Future<GatewayTicketEntry> fetchTicketEntry() async {
    final token = await _accessToken();
    if (_isBlank(token)) {
      throw GatewayApiException(message: "请先登录后再打开工单");
    }
    return _api.ticketEntry(token!);
  }

  Future<GatewayTelegramBindingStatus> fetchTelegramBinding() async {
    final token = await _accessToken();
    if (_isBlank(token)) {
      throw GatewayApiException(message: "请先登录后再查看 Telegram 绑定");
    }
    return _api.telegramBinding(token!);
  }
}
