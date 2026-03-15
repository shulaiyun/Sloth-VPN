import 'package:dio/dio.dart';
import 'package:hiddify/core/model/constants.dart';
import 'package:hiddify/features/app_gateway/model/gateway_models.dart';
import 'package:hiddify/utils/custom_loggers.dart';

class GatewayApiException implements Exception {
  GatewayApiException({required this.message, this.code, this.statusCode, this.path, this.method, this.details});

  final String message;
  final String? code;
  final int? statusCode;
  final String? path;
  final String? method;
  final Map<String, dynamic>? details;

  bool get isDeviceIdMismatch =>
      (code == "FORBIDDEN" || statusCode == 403) && message.toLowerCase().contains("device_id does not match bind");

  bool get requiresCaptcha => code == "CAPTCHA_REQUIRED";

  String? _detailString(String key) {
    final raw = details?[key];
    if (raw == null) return null;
    final text = raw.toString().trim();
    return text.isEmpty ? null : text;
  }

  String? get captchaActionUrl => _detailString("action_url");
  String? get captchaRegisterUrl => _detailString("xboard_register_url");
  String? get captchaReturnUrl => _detailString("app_return_url");

  @override
  String toString() => "GatewayApiException(code: $code, status: $statusCode, message: $message)";
}

class SlothGatewayApi with InfraLogger {
  SlothGatewayApi({Dio? dio}) : _dio = dio ?? Dio(_defaultOptions);

  final Dio _dio;

  static final _defaultOptions = BaseOptions(
    baseUrl: Constants.gatewayBaseUrl,
    connectTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 30),
    headers: const {"Content-Type": "application/json", "Accept": "application/json"},
  );

  static final RegExp _hasChinese = RegExp(r'[\u4e00-\u9fff]');

  Map<String, dynamic> _asStringKeyedMap(dynamic value) {
    if (value is Map) {
      return value.map((key, val) => MapEntry(key.toString(), val));
    }
    return const <String, dynamic>{};
  }

  Map<String, dynamic> _normalizeError(dynamic rawError, Map<String, dynamic> payload) {
    if (rawError is Map) {
      return rawError.map((key, value) => MapEntry(key.toString(), value));
    }
    if (rawError is String && rawError.trim().isNotEmpty) {
      return <String, dynamic>{"message": rawError};
    }
    final topMessage = payload["message"]?.toString();
    if (topMessage != null && topMessage.trim().isNotEmpty) {
      return <String, dynamic>{"message": topMessage};
    }
    return const <String, dynamic>{};
  }

  String _friendlyMessage({required String raw, String? code, int? statusCode, String? path}) {
    final message = raw.trim();
    final lower = message.toLowerCase();
    final lowerPath = (path ?? "").toLowerCase();

    int? inferStatus() {
      if (statusCode != null) return statusCode;
      final match = RegExp(r"status code of (\d{3})").firstMatch(lower);
      if (match == null) return null;
      return int.tryParse(match.group(1)!);
    }

    String fallbackByStatus(int? status) {
      switch (status) {
        case 400:
        case 422:
          return "请求参数不正确，请检查输入信息";
        case 401:
          return "登录状态已失效，请重新登录";
        case 403:
          return "当前请求被拒绝，请检查账号权限";
        case 404:
          return "请求接口不存在，请更新服务器版本";
        default:
          if (status != null && status >= 500) {
            return "网关服务暂时不可用，请稍后重试";
          }
          return "请求失败，请稍后重试";
      }
    }

    final finalStatus = inferStatus();
    final looksHtml = lower.contains("<html") || lower.contains("<!doctype") || lower.contains("<body");
    if (looksHtml) return fallbackByStatus(finalStatus);

    final isSubscriptionPath = lowerPath.contains("/subscription");
    if (isSubscriptionPath &&
        (code == "SUBSCRIPTION_NOT_AVAILABLE" ||
            code == "FORBIDDEN" ||
            finalStatus == 401 ||
            finalStatus == 403 ||
            lower.contains("token is error") ||
            lower.contains("forbidden") ||
            lower.contains("denied"))) {
      return "当前账户暂无可用订阅，请先购买套餐后再同步";
    }

    switch (code) {
      case "EMAIL_SUFFIX_NOT_ALLOWED":
        return "仅支持指定邮箱后缀注册";
      case "BAD_EMAIL_FORMAT":
        return "邮箱格式不正确，请检查邮箱是否正确";
      case "AUTH_INVALID_CREDENTIALS":
        return "邮箱或密码错误";
      case "REGISTER_CLOSED":
        return "当前站点已关闭注册";
      case "EMAIL_VERIFY_REQUIRED":
        return "当前站点要求邮箱验证码";
      case "EMAIL_CODE_INVALID":
        return "邮箱验证码错误或已过期";
      case "CAPTCHA_REQUIRED":
        return "当前站点要求人机验证，请先在网页完成验证后再继续";
      case "INVITE_CODE_REQUIRED":
        return "当前站点要求填写邀请码";
      case "ORDER_PENDING_EXISTS":
        return "您有未付款订单，请先支付或取消当前订单";
      case "ORDER_WAITING_EFFECTIVE":
        return "您有待生效订单，请稍后再试";
      case "ORDER_ALREADY_PAID":
        return "该订单已支付，无需重复支付";
      case "ORDER_PAYMENT_CHANNEL_EXPIRED":
        return "该订单支付通道已失效，请关闭当前订单并重建后再支付";
      case "ORDER_NOT_CANCELLABLE":
        return "当前订单状态不可取消";
      case "COUPON_INVALID":
        return "优惠券不可用，请检查后重试";
      case "GIFT_CARD_INVALID":
        return "礼品卡不可用，请检查后重试";
      case "TICKET_UNAVAILABLE":
        return "工单服务暂时不可用，请稍后重试";
      case "UNAUTHORIZED":
        return "登录状态已失效，请重新登录";
      case "SUBSCRIPTION_NOT_AVAILABLE":
        return "当前账户暂无可用订阅，请先购买套餐后再同步";
      default:
        break;
    }

    if (lower.contains("route") && lower.contains("not found")) {
      return "网关接口未部署完整，请更新服务器版本";
    }
    if (lower.contains("device_id") && lower.contains("mismatch")) {
      return "设备绑定校验失败，请在 App 内重新发起绑定";
    }
    if (lower.contains("token is error") || lower.contains("jwt malformed")) {
      return "登录态无效，请重新登录";
    }
    if (lower.contains("coupon") || lower.contains("优惠券") || lower.contains("折扣码")) {
      return "优惠券不可用，请检查后重试";
    }
    if (lower.contains("gift card") || lower.contains("gift-card") || lower.contains("礼品卡")) {
      return "礼品卡不可用，请检查后重试";
    }
    if (lower.contains("timeout")) return "请求超时，请稍后重试";
    if (lower.contains("network") || lower.contains("socket")) return "网络异常，请检查网络后重试";

    if (_hasChinese.hasMatch(message) && message.isNotEmpty) return message;
    return fallbackByStatus(finalStatus);
  }

  Future<GatewayBindExchangeResult> bindExchange({
    required String bindId,
    required String exchangeToken,
    required String deviceId,
  }) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/auth/bind/exchange",
      body: {"bind_id": bindId, "exchange_token": exchangeToken, "device_id": deviceId},
    );
    return GatewayBindExchangeResult.fromMap(data);
  }

  Future<GatewayAuthPolicy> authPolicy() async {
    final data = await _request(method: "GET", path: "/api/app/v1/auth/policy");
    return GatewayAuthPolicy.fromMap(data);
  }

  Future<GatewayBindExchangeResult> login({
    required String email,
    required String password,
    required String deviceId,
    required String platform,
    String? appVersion,
  }) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/auth/login",
      body: {
        "email": email,
        "password": password,
        "device_id": deviceId,
        "platform": platform,
        if (appVersion != null && appVersion.isNotEmpty) "app_version": appVersion,
      },
    );
    return GatewayBindExchangeResult.fromMap(data);
  }

  Future<GatewayBindExchangeResult> register({
    required String email,
    required String password,
    required String deviceId,
    required String platform,
    String? appVersion,
    String? emailCode,
    String? inviteCode,
  }) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/auth/register",
      body: {
        "email": email,
        "password": password,
        "device_id": deviceId,
        "platform": platform,
        if (appVersion != null && appVersion.isNotEmpty) "app_version": appVersion,
        if (emailCode != null && emailCode.isNotEmpty) "email_code": emailCode,
        if (inviteCode != null && inviteCode.isNotEmpty) "invite_code": inviteCode,
      },
    );
    return GatewayBindExchangeResult.fromMap(data);
  }

  Future<bool> sendEmailVerify(String email) async {
    final data = await _request(method: "POST", path: "/api/app/v1/auth/send-email-verify", body: {"email": email});
    return data["sent"] == true;
  }

  Future<GatewayBindExchangeResult?> forgotPassword({
    required String email,
    required String newPassword,
    required String emailCode,
  }) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/auth/forgot-password",
      body: {"email": email, "new_password": newPassword, "email_code": emailCode},
    );
    final accessToken = data["access_token"]?.toString() ?? "";
    if (accessToken.isNotEmpty) {
      return GatewayBindExchangeResult.fromMap(data);
    }
    return null;
  }

  Future<Map<String, dynamic>> bindStart({required String deviceId, required String platform, String? appVersion}) {
    return _request(
      method: "POST",
      path: "/api/app/v1/auth/bind/start",
      body: {
        "device_id": deviceId,
        "platform": platform,
        if (appVersion != null && appVersion.isNotEmpty) "app_version": appVersion,
      },
    );
  }

  Future<Map<String, dynamic>> bootstrap(String accessToken) {
    return _request(method: "GET", path: "/api/app/v1/bootstrap", accessToken: accessToken);
  }

  Future<GatewayAccountSummary> accountSummary(String accessToken) async {
    final data = await _request(method: "GET", path: "/api/app/v1/account/summary", accessToken: accessToken);
    return GatewayAccountSummary.fromMap(data);
  }

  Future<GatewayInviteSummary> inviteSummary(String accessToken) async {
    final data = await _request(method: "GET", path: "/api/app/v1/invite/summary", accessToken: accessToken);
    return GatewayInviteSummary.fromMap(data);
  }

  Future<bool> inviteGenerate(String accessToken) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/invite/generate",
      accessToken: accessToken,
      body: const {},
    );
    final inviteCode = data["invite_code"]?.toString().trim() ?? "";
    return inviteCode.isNotEmpty || data["generated"] == true;
  }

  Future<bool> inviteWithdraw({required String accessToken, required double amount}) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/invite/withdraw",
      accessToken: accessToken,
      body: {"amount": amount},
    );
    return data["requested"] == true;
  }

  Future<GatewaySubscriptionResult> subscription(String accessToken) async {
    final data = await _request(method: "GET", path: "/api/app/v1/subscription", accessToken: accessToken);
    return GatewaySubscriptionResult.fromMap(data);
  }

  Future<GatewaySubscriptionResult> subscriptionSync(String accessToken) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/subscription/sync",
      accessToken: accessToken,
      body: const {"force": false},
    );
    return GatewaySubscriptionResult.fromMap(data);
  }

  Future<GatewayOrderStatusResult> orderStatus({required String accessToken, required String orderNo}) async {
    final data = await _request(method: "GET", path: "/api/app/v1/orders/$orderNo/status", accessToken: accessToken);
    return GatewayOrderStatusResult.fromMap(data);
  }

  Future<GatewayOrderItem?> orderDetail({required String accessToken, required String orderNo}) async {
    final data = await _request(method: "GET", path: "/api/app/v1/orders/$orderNo/detail", accessToken: accessToken);
    final raw = data["order"];
    if (raw is! Map) return null;
    return GatewayOrderItem.fromMap(raw.cast<String, dynamic>());
  }

  Future<bool> cancelOrder({required String accessToken, required String orderNo}) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/orders/$orderNo/cancel",
      accessToken: accessToken,
      body: const <String, dynamic>{},
    );
    return data["cancelled"] == true;
  }

  Future<List<GatewayOrderItem>> orders(String accessToken, {String? status}) async {
    final query = status == null || status.trim().isEmpty ? "" : "?status=${Uri.encodeQueryComponent(status)}";
    final data = await _request(method: "GET", path: "/api/app/v1/orders$query", accessToken: accessToken);
    final rawOrders = data["orders"];
    if (rawOrders is! List) return const [];
    return rawOrders.whereType<Map>().map((item) => GatewayOrderItem.fromMap(item.cast<String, dynamic>())).toList();
  }

  Future<List<GatewayPlan>> plans(String accessToken) async {
    final data = await _request(method: "GET", path: "/api/app/v1/plans", accessToken: accessToken);
    final rawPlans = data["plans"];
    if (rawPlans is! List) return const [];
    return rawPlans.whereType<Map>().map((item) => GatewayPlan.fromMap(item.cast<String, dynamic>())).toList();
  }

  Future<List<GatewayPaymentMethod>> paymentMethods(String accessToken) async {
    final data = await _request(method: "GET", path: "/api/app/v1/orders/payment-methods", accessToken: accessToken);
    final rawMethods = data["methods"];
    if (rawMethods is! List) return const [];
    return rawMethods
        .whereType<Map>()
        .map((item) => GatewayPaymentMethod.fromMap(item.cast<String, dynamic>()))
        .toList();
  }

  Future<String> createOrder({
    required String accessToken,
    required int planId,
    required String period,
    String? couponCode,
  }) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/orders",
      accessToken: accessToken,
      body: {
        "plan_id": planId,
        "period": period,
        if (couponCode != null && couponCode.isNotEmpty) "coupon_code": couponCode,
      },
    );
    return data["order_no"]?.toString() ?? "";
  }

  Future<GatewayCouponCheckResult> checkCoupon({
    required String accessToken,
    required String code,
    required int planId,
    required String period,
  }) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/orders/coupon/check",
      accessToken: accessToken,
      body: {"code": code, "plan_id": planId, "period": period},
    );
    return GatewayCouponCheckResult.fromMap(data);
  }

  Future<GatewayGiftCardCheckResult> checkGiftCard({required String accessToken, required String code}) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/orders/gift-card/check",
      accessToken: accessToken,
      body: {"code": code},
    );
    return GatewayGiftCardCheckResult.fromMap(data);
  }

  Future<GatewayGiftCardRedeemResult> redeemGiftCard({required String accessToken, required String code}) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/orders/gift-card/redeem",
      accessToken: accessToken,
      body: {"code": code},
    );
    return GatewayGiftCardRedeemResult.fromMap(data);
  }

  Future<List<GatewayGiftCardHistoryItem>> giftCardHistory(String accessToken) async {
    final data = await _request(method: "GET", path: "/api/app/v1/orders/gift-card/history", accessToken: accessToken);
    final raw = data["items"];
    if (raw is! List) return const [];
    return raw
        .whereType<Map>()
        .map((item) => GatewayGiftCardHistoryItem.fromMap(item.cast<String, dynamic>()))
        .toList();
  }

  Future<GatewayOrderPaymentResult> payOrder({
    required String accessToken,
    required String orderNo,
    required int paymentMethodId,
  }) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/orders/$orderNo/pay",
      accessToken: accessToken,
      body: {"payment_method_id": paymentMethodId},
    );
    return GatewayOrderPaymentResult.fromMap(data);
  }

  Future<List<GatewayNoticeItem>> notices(String accessToken, {int current = 1, int pageSize = 10}) async {
    final data = await _request(
      method: "GET",
      path: "/api/app/v1/content/notices?current=$current&page_size=$pageSize",
      accessToken: accessToken,
    );
    final raw = data["items"];
    if (raw is! List) return const [];
    return raw.whereType<Map>().map((item) => GatewayNoticeItem.fromMap(item.cast<String, dynamic>())).toList();
  }

  Future<List<GatewayKnowledgeItem>> knowledge(String accessToken, {String? language, String? keyword}) async {
    final query = <String>[
      if (language != null && language.trim().isNotEmpty) "language=${Uri.encodeQueryComponent(language.trim())}",
      if (keyword != null && keyword.trim().isNotEmpty) "keyword=${Uri.encodeQueryComponent(keyword.trim())}",
    ].join("&");
    final data = await _request(
      method: "GET",
      path: "/api/app/v1/content/knowledge${query.isEmpty ? "" : "?$query"}",
      accessToken: accessToken,
    );
    final raw = data["items"];
    if (raw is! List) return const [];
    return raw.whereType<Map>().map((item) => GatewayKnowledgeItem.fromMap(item.cast<String, dynamic>())).toList();
  }

  Future<GatewayKnowledgeItem?> knowledgeDetail(String accessToken, int id) async {
    final data = await _request(method: "GET", path: "/api/app/v1/content/knowledge/$id", accessToken: accessToken);
    final raw = data["item"];
    if (raw is! Map) return null;
    return GatewayKnowledgeItem.fromMap(raw.cast<String, dynamic>());
  }

  Future<bool> changePassword({
    required String accessToken,
    required String oldPassword,
    required String newPassword,
  }) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/account/change-password",
      accessToken: accessToken,
      body: {"old_password": oldPassword, "new_password": newPassword},
    );
    return data["changed"] == true;
  }

  Future<GatewayTicketEntry> ticketEntry(String accessToken) async {
    final data = await _request(
      method: "GET",
      path: "/api/app/v1/support/ticket-entry?redirect=ticket",
      accessToken: accessToken,
    );
    return GatewayTicketEntry.fromMap(data);
  }

  Future<List<GatewayTicketItem>> tickets(String accessToken) async {
    final data = await _request(method: "GET", path: "/api/app/v1/support/tickets", accessToken: accessToken);
    final raw = data["tickets"];
    if (raw is! List) return const [];
    return raw.whereType<Map>().map((item) => GatewayTicketItem.fromMap(item.cast<String, dynamic>())).toList();
  }

  Future<GatewayTicketItem?> ticketDetail({required String accessToken, required int id}) async {
    final data = await _request(method: "GET", path: "/api/app/v1/support/tickets/$id", accessToken: accessToken);
    final raw = data["ticket"];
    if (raw is! Map) return null;
    return GatewayTicketItem.fromMap(raw.cast<String, dynamic>());
  }

  Future<GatewayTicketItem?> createTicket({
    required String accessToken,
    required String subject,
    required String message,
    int level = 1,
  }) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/support/tickets",
      accessToken: accessToken,
      body: {"subject": subject, "message": message, "level": level},
    );
    if (data["created"] != true) return null;
    final rawTicket = data["ticket"];
    if (rawTicket is Map) {
      return GatewayTicketItem.fromMap(rawTicket.cast<String, dynamic>());
    }
    return null;
  }

  Future<GatewayTicketItem?> replyTicket({
    required String accessToken,
    required int id,
    required String message,
  }) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/support/tickets/$id/reply",
      accessToken: accessToken,
      body: {"message": message},
    );
    final raw = data["ticket"];
    if (raw is! Map) return null;
    return GatewayTicketItem.fromMap(raw.cast<String, dynamic>());
  }

  Future<bool> closeTicket({required String accessToken, required int id}) async {
    final data = await _request(
      method: "POST",
      path: "/api/app/v1/support/tickets/$id/close",
      accessToken: accessToken,
      body: const {},
    );
    return data["closed"] == true;
  }

  Future<GatewayTelegramBindingStatus> telegramBinding(String accessToken) async {
    final data = await _request(method: "GET", path: "/api/app/v1/account/telegram-binding", accessToken: accessToken);
    return GatewayTelegramBindingStatus.fromMap(data);
  }

  Future<Map<String, dynamic>> _request({
    required String method,
    required String path,
    Map<String, dynamic>? body,
    String? accessToken,
  }) async {
    try {
      final response = await _dio.request<dynamic>(
        path,
        data: body,
        options: Options(method: method, headers: {if (accessToken != null) "Authorization": "Bearer $accessToken"}),
      );

      final payload = _asStringKeyedMap(response.data);
      final success = payload["success"] == true;
      if (!success) {
        final err = _normalizeError(payload["error"], payload);
        final code = err["code"]?.toString();
        final rawMessage = err["message"]?.toString() ?? payload["message"]?.toString() ?? "Gateway request failed";
        throw GatewayApiException(
          code: code,
          statusCode: response.statusCode,
          message: _friendlyMessage(raw: rawMessage, code: code, statusCode: response.statusCode, path: path),
          path: path,
          method: method,
          details: _asStringKeyedMap(err["details"]),
        );
      }

      final data = payload["data"];
      if (data is Map<String, dynamic>) return data;
      return const <String, dynamic>{};
    } on DioException catch (error, stackTrace) {
      loggy.warning("gateway request failed [$method $path]", error, stackTrace);
      final data = error.response?.data;
      if (data is Map || data is String) {
        final mapped = _asStringKeyedMap(data);
        final err = _normalizeError(data is String ? data : mapped["error"], mapped);
        final code = err["code"]?.toString();
        final rawMessage =
            err["message"]?.toString() ?? mapped["message"]?.toString() ?? error.message ?? "Gateway request failed";
        throw GatewayApiException(
          code: code,
          statusCode: error.response?.statusCode,
          message: _friendlyMessage(raw: rawMessage, code: code, statusCode: error.response?.statusCode, path: path),
          path: path,
          method: method,
          details: _asStringKeyedMap(err["details"]),
        );
      }
      throw GatewayApiException(
        statusCode: error.response?.statusCode,
        message: _friendlyMessage(
          raw: error.message ?? "Gateway request failed",
          statusCode: error.response?.statusCode,
          path: path,
        ),
        path: path,
        method: method,
      );
    } catch (error, stackTrace) {
      loggy.warning("gateway response parse failed [$method $path]", error, stackTrace);
      if (error is GatewayApiException) rethrow;
      throw GatewayApiException(
        message: _friendlyMessage(raw: error.toString()),
        path: path,
        method: method,
      );
    }
  }
}
