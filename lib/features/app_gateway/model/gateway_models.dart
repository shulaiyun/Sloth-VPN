int _asInt(dynamic value, [int fallback = 0]) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? fallback;
  return fallback;
}

double _asDouble(dynamic value, [double fallback = 0]) {
  if (value is double) return value;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? fallback;
  return fallback;
}

String? _asNullableString(dynamic value) {
  if (value == null) return null;
  final text = value.toString().trim();
  if (text.isEmpty) return null;
  if (text == "0" || text == "0.0" || text.toLowerCase() == "null" || text == "--") return null;
  final numeric = num.tryParse(text);
  if (numeric != null && numeric <= 0) return null;
  if (text.startsWith("1970-01-01")) return null;
  return text;
}

Map<String, dynamic> _asMap(dynamic value) {
  if (value is Map<String, dynamic>) return value;
  if (value is Map) {
    return value.map((key, val) => MapEntry(key.toString(), val));
  }
  return const <String, dynamic>{};
}

class GatewayBindExchangeResult {
  GatewayBindExchangeResult({
    required this.accessToken,
    required this.refreshToken,
    required this.sessionId,
    this.userEmail,
    this.userUuid,
  });

  final String accessToken;
  final String refreshToken;
  final String sessionId;
  final String? userEmail;
  final String? userUuid;

  factory GatewayBindExchangeResult.fromMap(Map<String, dynamic> map) {
    final user = _asMap(map["user"]);
    return GatewayBindExchangeResult(
      accessToken: map["access_token"]?.toString() ?? "",
      refreshToken: map["refresh_token"]?.toString() ?? "",
      sessionId: map["session_id"]?.toString() ?? "",
      userEmail: _asNullableString(user["email"]),
      userUuid: _asNullableString(user["uuid"]),
    );
  }
}

class GatewayAuthPolicy {
  GatewayAuthPolicy({
    required this.allowedEmailSuffixes,
    required this.registerEnabled,
    required this.emailVerifyRequired,
    required this.inviteCodeRequired,
  });

  final List<String> allowedEmailSuffixes;
  final bool registerEnabled;
  final bool emailVerifyRequired;
  final bool inviteCodeRequired;

  bool get hasSuffixLimit => allowedEmailSuffixes.isNotEmpty;

  factory GatewayAuthPolicy.fromMap(Map<String, dynamic> map) {
    final raw = map["allowed_email_suffixes"];
    final suffixes = raw is List
        ? raw.map((item) => item.toString().trim()).where((item) => item.isNotEmpty).toList()
        : const <String>[];
    return GatewayAuthPolicy(
      allowedEmailSuffixes: suffixes,
      registerEnabled: map["register_enabled"] == true,
      emailVerifyRequired: map["email_verify_required"] == true,
      inviteCodeRequired: map["invite_code_required"] == true,
    );
  }
}

class GatewaySubscriptionResult {
  GatewaySubscriptionResult({required this.pullUrl, this.version, this.lastSyncedAt, this.nodeCount});

  final String pullUrl;
  final String? version;
  final String? lastSyncedAt;
  final int? nodeCount;

  factory GatewaySubscriptionResult.fromMap(Map<String, dynamic> map) {
    return GatewaySubscriptionResult(
      pullUrl: map["pull_url"]?.toString() ?? "",
      version: _asNullableString(map["version"]),
      lastSyncedAt: _asNullableString(map["last_synced_at"]),
      nodeCount: map["node_count"] == null ? null : _asInt(map["node_count"]),
    );
  }
}

class GatewayOrderStatusResult {
  GatewayOrderStatusResult({
    required this.orderNo,
    required this.status,
    required this.statusCode,
    required this.isFinal,
  });

  final String orderNo;
  final String status;
  final int statusCode;
  final bool isFinal;

  bool get isCompleted => status == "completed" || status == "discounted";

  factory GatewayOrderStatusResult.fromMap(Map<String, dynamic> map) {
    return GatewayOrderStatusResult(
      orderNo: map["order_no"]?.toString() ?? "",
      status: map["status"]?.toString() ?? "unknown",
      statusCode: _asInt(map["status_code"], -1),
      isFinal: map["is_final"] == true,
    );
  }
}

class GatewayOrderItem {
  GatewayOrderItem({
    required this.orderNo,
    required this.status,
    required this.statusCode,
    required this.isFinal,
    required this.totalAmount,
    this.planId,
    this.planName,
    this.planTransferEnable,
    this.period,
    this.createdAt,
    this.updatedAt,
    this.paidAt,
    this.balanceAmount = 0,
    this.discountAmount = 0,
    this.surplusAmount = 0,
    this.refundAmount = 0,
    this.handlingAmount = 0,
    this.type = "unknown",
    this.typeLabel = "",
    this.canCancel = false,
  });

  final String orderNo;
  final String status;
  final int statusCode;
  final bool isFinal;
  final int totalAmount;
  final int? planId;
  final String? planName;
  final int? planTransferEnable;
  final String? period;
  final String? createdAt;
  final String? updatedAt;
  final String? paidAt;
  final int balanceAmount;
  final int discountAmount;
  final int surplusAmount;
  final int refundAmount;
  final int handlingAmount;
  final String type;
  final String typeLabel;
  final bool canCancel;

  bool get isPaid => status == "completed" || status == "discounted";
  bool get isPayable => status == "pending" || status == "processing";

  factory GatewayOrderItem.fromMap(Map<String, dynamic> map) {
    return GatewayOrderItem(
      orderNo: map["order_no"]?.toString() ?? "",
      status: map["status"]?.toString() ?? "unknown",
      statusCode: _asInt(map["status_code"], -1),
      isFinal: map["is_final"] == true,
      totalAmount: _asInt(map["total_amount"]),
      planId: map["plan_id"] == null ? null : _asInt(map["plan_id"]),
      planName: _asNullableString(map["plan_name"]),
      planTransferEnable: map["plan_transfer_enable"] == null ? null : _asInt(map["plan_transfer_enable"]),
      period: _asNullableString(map["period"]),
      createdAt: _asNullableString(map["created_at"]),
      updatedAt: _asNullableString(map["updated_at"]),
      paidAt: _asNullableString(map["paid_at"]),
      balanceAmount: _asInt(map["balance_amount"]),
      discountAmount: _asInt(map["discount_amount"]),
      surplusAmount: _asInt(map["surplus_amount"]),
      refundAmount: _asInt(map["refund_amount"]),
      handlingAmount: _asInt(map["handling_amount"]),
      type: _asNullableString(map["type"]) ?? "unknown",
      typeLabel: _asNullableString(map["type_label"]) ?? "",
      canCancel: map["can_cancel"] == true,
    );
  }
}

class GatewayInviteSummary {
  GatewayInviteSummary({
    required this.supported,
    this.inviteCode,
    this.inviteUrl,
    this.inviteManageUrl,
    required this.rebateTotal,
    required this.rebatePending,
    required this.rebateAvailable,
    required this.rebateWithdrawn,
    required this.rebateRate,
    this.rebateRuleText,
    required this.canWithdraw,
    required this.invitedCount,
    this.commissionRate = 20,
    this.commissionLevel1Rate = 50,
    this.commissionLevel2Rate = 50,
    this.commissionLevel3Rate = 50,
  });

  final bool supported;
  final String? inviteCode;
  final String? inviteUrl;
  final String? inviteManageUrl;
  final double rebateTotal;
  final double rebatePending;
  final double rebateAvailable;
  final double rebateWithdrawn;
  final double rebateRate;
  final String? rebateRuleText;
  final bool canWithdraw;
  final int invitedCount;
  final double commissionRate;
  final double commissionLevel1Rate;
  final double commissionLevel2Rate;
  final double commissionLevel3Rate;

  factory GatewayInviteSummary.fromMap(Map<String, dynamic> map) {
    return GatewayInviteSummary(
      supported: map["supported"] != false,
      inviteCode: _asNullableString(map["invite_code"]),
      inviteUrl: _asNullableString(map["invite_url"]),
      inviteManageUrl: _asNullableString(map["invite_manage_url"]),
      rebateTotal: _asDouble(map["rebate_total"]),
      rebatePending: _asDouble(map["rebate_pending"]),
      rebateAvailable: _asDouble(map["rebate_available"]),
      rebateWithdrawn: _asDouble(map["rebate_withdrawn"]),
      rebateRate: _asDouble(map["rebate_rate"]),
      rebateRuleText: _asNullableString(map["rebate_rule_text"]),
      canWithdraw: map["can_withdraw"] == true,
      invitedCount: _asInt(map["invited_count"]),
      commissionRate: _asDouble(map["commission_rate"], 20),
      commissionLevel1Rate: _asDouble(map["commission_level_1_rate"], 50),
      commissionLevel2Rate: _asDouble(map["commission_level_2_rate"], 50),
      commissionLevel3Rate: _asDouble(map["commission_level_3_rate"], 50),
    );
  }
}

class GatewayAccountSummary {
  GatewayAccountSummary({
    required this.email,
    this.planName,
    this.expiredAt,
    required this.trafficUsed,
    required this.trafficTotal,
    required this.balance,
    this.subscriptionVersion,
    this.lastSyncedAt,
    this.nodeCount,
    this.pullUrl,
    this.telegramUrl,
    this.githubUrl,
    this.ticketUrl,
    this.noticeUrl,
    this.telegramBound = false,
    this.telegramUsername,
    this.telegramBotUrl,
  });

  final String email;
  final String? planName;
  final String? expiredAt;
  final int trafficUsed;
  final int trafficTotal;
  final int balance;
  final String? subscriptionVersion;
  final String? lastSyncedAt;
  final int? nodeCount;
  final String? pullUrl;
  final String? telegramUrl;
  final String? githubUrl;
  final String? ticketUrl;
  final String? noticeUrl;
  final bool telegramBound;
  final String? telegramUsername;
  final String? telegramBotUrl;

  int get trafficRemaining {
    final value = trafficTotal - trafficUsed;
    if (value <= 0) return 0;
    if (value >= trafficTotal) return trafficTotal;
    return value;
  }

  factory GatewayAccountSummary.fromMap(Map<String, dynamic> map) {
    final user = _asMap(map["user"]);
    final subscription = _asMap(map["subscription"]);
    final links = _asMap(map["links"]);

    return GatewayAccountSummary(
      email: user["email"]?.toString() ?? "",
      planName: _asNullableString(user["plan_name"]),
      expiredAt: _asNullableString(user["expired_at"]),
      trafficUsed: _asInt(user["traffic_used"]),
      trafficTotal: _asInt(user["traffic_total"]),
      balance: _asInt(user["balance"]),
      subscriptionVersion: _asNullableString(subscription["version"]),
      lastSyncedAt: _asNullableString(subscription["last_synced_at"]),
      nodeCount: subscription["node_count"] == null ? null : _asInt(subscription["node_count"]),
      pullUrl: _asNullableString(subscription["pull_url"]),
      telegramUrl: _asNullableString(links["telegram"]),
      githubUrl: _asNullableString(links["github"]),
      ticketUrl: _asNullableString(links["tickets"]),
      noticeUrl: _asNullableString(links["notices"]),
      telegramBound: user["telegram_bound"] == true,
      telegramUsername: _asNullableString(user["telegram_username"]),
      telegramBotUrl: _asNullableString(links["telegram_bot"]),
    );
  }
}

class GatewayTelegramBindingStatus {
  GatewayTelegramBindingStatus({
    required this.linked,
    this.telegramId,
    this.telegramUsername,
    required this.botUsername,
    required this.botUrl,
    required this.bindUrl,
    this.subscribeUrl,
    this.bindCommand,
    this.tips,
  });

  final bool linked;
  final String? telegramId;
  final String? telegramUsername;
  final String botUsername;
  final String botUrl;
  final String bindUrl;
  final String? subscribeUrl;
  final String? bindCommand;
  final String? tips;

  factory GatewayTelegramBindingStatus.fromMap(Map<String, dynamic> map) => GatewayTelegramBindingStatus(
    linked: map["linked"] == true,
    telegramId: _asNullableString(map["telegram_id"]),
    telegramUsername: _asNullableString(map["telegram_username"]),
    botUsername: _asNullableString(map["bot_username"]) ?? "@shulaiyun_bot",
    botUrl: _asNullableString(map["bot_url"]) ?? "https://t.me/shulaiyun_bot",
    bindUrl: _asNullableString(map["bind_url"]) ?? "https://t.me/shulaiyun_bot",
    subscribeUrl: _asNullableString(map["subscribe_url"]),
    bindCommand: _asNullableString(map["bind_command"]),
    tips: _asNullableString(map["tips"]),
  );
}

class GatewayPlanPeriod {
  GatewayPlanPeriod({required this.code, required this.label, required this.price});

  final String code;
  final String label;
  final int price;

  factory GatewayPlanPeriod.fromMap(Map<String, dynamic> map) => GatewayPlanPeriod(
    code: map["code"]?.toString() ?? "",
    label: map["label"]?.toString() ?? "",
    price: _asInt(map["price"]),
  );
}

class GatewayPlan {
  GatewayPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.transferEnable,
    this.speedLimit,
    this.deviceLimit,
    this.renewable = true,
    this.sell = true,
    required this.tags,
    required this.periods,
  });

  final int id;
  final String name;
  final String description;
  final int transferEnable;
  final int? speedLimit;
  final int? deviceLimit;
  final bool renewable;
  final bool sell;
  final List<String> tags;
  final List<GatewayPlanPeriod> periods;

  factory GatewayPlan.fromMap(Map<String, dynamic> map) {
    final rawPeriods = map["periods"];
    final periods = rawPeriods is List
        ? rawPeriods.whereType<Map>().map((item) => GatewayPlanPeriod.fromMap(item.cast<String, dynamic>())).toList()
        : const <GatewayPlanPeriod>[];
    return GatewayPlan(
      id: _asInt(map["id"]),
      name: map["name"]?.toString() ?? "",
      description: map["description"]?.toString() ?? "",
      transferEnable: _asInt(map["transfer_enable"]),
      speedLimit: map["speed_limit"] == null ? null : _asInt(map["speed_limit"]),
      deviceLimit: map["device_limit"] == null ? null : _asInt(map["device_limit"]),
      renewable: map["renewable"] != false,
      sell: map["sell"] != false,
      tags: switch (map["tags"]) {
        final List list => list.map((e) => e.toString()).toList(),
        _ => const [],
      },
      periods: periods,
    );
  }
}

class GatewayPaymentMethod {
  GatewayPaymentMethod({
    required this.id,
    required this.name,
    required this.payment,
    required this.icon,
    required this.handlingFeeFixed,
    required this.handlingFeePercent,
  });

  final int id;
  final String name;
  final String payment;
  final String icon;
  final double handlingFeeFixed;
  final double handlingFeePercent;

  factory GatewayPaymentMethod.fromMap(Map<String, dynamic> map) => GatewayPaymentMethod(
    id: _asInt(map["id"]),
    name: map["name"]?.toString() ?? "",
    payment: map["payment"]?.toString() ?? "",
    icon: map["icon"]?.toString() ?? "",
    handlingFeeFixed: _asDouble(map["handling_fee_fixed"]),
    handlingFeePercent: _asDouble(map["handling_fee_percent"]),
  );
}

class GatewayOrderPaymentResult {
  GatewayOrderPaymentResult({
    required this.orderNo,
    required this.paymentType,
    required this.paymentData,
    this.paymentUrl,
    required this.completed,
    required this.status,
  });

  final String orderNo;
  final int paymentType;
  final String paymentData;
  final String? paymentUrl;
  final bool completed;
  final String status;

  factory GatewayOrderPaymentResult.fromMap(Map<String, dynamic> map) => GatewayOrderPaymentResult(
    orderNo: map["order_no"]?.toString() ?? "",
    paymentType: _asInt(map["payment_type"], -999),
    paymentData: map["payment_data"]?.toString() ?? "",
    paymentUrl: _asNullableString(map["payment_url"]),
    completed: map["completed"] == true,
    status: map["status"]?.toString() ?? "pending",
  );
}

class GatewayCouponCheckResult {
  GatewayCouponCheckResult({
    required this.valid,
    this.code,
    this.name,
    this.typeCode = 0,
    this.typeLabel,
    this.value = 0,
    this.discountAmount = 0,
    this.startedAt,
    this.endedAt,
  });

  final bool valid;
  final String? code;
  final String? name;
  final int typeCode;
  final String? typeLabel;
  final int value;
  final int discountAmount;
  final String? startedAt;
  final String? endedAt;

  factory GatewayCouponCheckResult.fromMap(Map<String, dynamic> map) => GatewayCouponCheckResult(
    valid: map["valid"] == true,
    code: _asNullableString(map["code"]),
    name: _asNullableString(map["name"]),
    typeCode: _asInt(map["type"]),
    typeLabel: _asNullableString(map["type_label"]),
    value: _asInt(map["value"]),
    discountAmount: _asInt(map["discount_amount"]),
    startedAt: _asNullableString(map["started_at"]),
    endedAt: _asNullableString(map["ended_at"]),
  );
}

class GatewayGiftCardCheckResult {
  GatewayGiftCardCheckResult({required this.canRedeem, this.reason, this.code, this.rewardPreview, this.codeInfo});

  final bool canRedeem;
  final String? reason;
  final String? code;
  final Map<String, dynamic>? rewardPreview;
  final Map<String, dynamic>? codeInfo;

  factory GatewayGiftCardCheckResult.fromMap(Map<String, dynamic> map) => GatewayGiftCardCheckResult(
    canRedeem: map["can_redeem"] == true,
    reason: _asNullableString(map["reason"]),
    code: _asNullableString(map["code"]),
    rewardPreview: map["reward_preview"] is Map ? _asMap(map["reward_preview"]) : null,
    codeInfo: map["code_info"] is Map ? _asMap(map["code_info"]) : null,
  );
}

class GatewayGiftCardRedeemResult {
  GatewayGiftCardRedeemResult({required this.redeemed, this.code, this.redeemedAt});

  final bool redeemed;
  final String? code;
  final String? redeemedAt;

  factory GatewayGiftCardRedeemResult.fromMap(Map<String, dynamic> map) => GatewayGiftCardRedeemResult(
    redeemed: map["redeemed"] == true,
    code: _asNullableString(map["code"]),
    redeemedAt: _asNullableString(map["redeemed_at"]),
  );
}

class GatewayGiftCardHistoryItem {
  GatewayGiftCardHistoryItem({
    required this.id,
    this.code,
    this.type,
    this.status,
    this.amount = 0,
    this.createdAt,
    this.usedAt,
  });

  final int id;
  final String? code;
  final String? type;
  final String? status;
  final int amount;
  final String? createdAt;
  final String? usedAt;

  factory GatewayGiftCardHistoryItem.fromMap(Map<String, dynamic> map) => GatewayGiftCardHistoryItem(
    id: _asInt(map["id"]),
    code: _asNullableString(map["code"]),
    type: _asNullableString(map["type"]),
    status: _asNullableString(map["status"]),
    amount: _asInt(map["amount"]),
    createdAt: _asNullableString(map["created_at"]),
    usedAt: _asNullableString(map["used_at"]),
  );
}

class GatewayNoticeItem {
  GatewayNoticeItem({required this.id, required this.title, required this.content, this.createdAt, this.updatedAt});

  final int id;
  final String title;
  final String content;
  final String? createdAt;
  final String? updatedAt;

  factory GatewayNoticeItem.fromMap(Map<String, dynamic> map) => GatewayNoticeItem(
    id: _asInt(map["id"]),
    title: _asNullableString(map["title"]) ?? "",
    content: _asNullableString(map["content"]) ?? "",
    createdAt: _asNullableString(map["created_at"]),
    updatedAt: _asNullableString(map["updated_at"]),
  );
}

class GatewayKnowledgeItem {
  GatewayKnowledgeItem({
    required this.id,
    required this.category,
    required this.title,
    required this.body,
    this.updatedAt,
  });

  final int id;
  final String category;
  final String title;
  final String body;
  final String? updatedAt;

  factory GatewayKnowledgeItem.fromMap(Map<String, dynamic> map) => GatewayKnowledgeItem(
    id: _asInt(map["id"]),
    category: _asNullableString(map["category"]) ?? "general",
    title: _asNullableString(map["title"]) ?? "",
    body: _asNullableString(map["body"]) ?? "",
    updatedAt: _asNullableString(map["updated_at"]),
  );
}

class GatewayTicketEntry {
  GatewayTicketEntry({required this.url, required this.quickLogin, this.fallbackUrl});

  final String url;
  final bool quickLogin;
  final String? fallbackUrl;

  factory GatewayTicketEntry.fromMap(Map<String, dynamic> map) => GatewayTicketEntry(
    url: map["url"]?.toString() ?? "",
    quickLogin: map["quick_login"] == true,
    fallbackUrl: _asNullableString(map["fallback_url"]),
  );
}

class GatewayTicketMessage {
  GatewayTicketMessage({
    required this.id,
    required this.ticketId,
    required this.isMe,
    required this.message,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final int ticketId;
  final bool isMe;
  final String message;
  final String? createdAt;
  final String? updatedAt;

  factory GatewayTicketMessage.fromMap(Map<String, dynamic> map) => GatewayTicketMessage(
    id: _asInt(map["id"]),
    ticketId: _asInt(map["ticket_id"]),
    isMe: map["is_me"] == true,
    message: _asNullableString(map["message"]) ?? "",
    createdAt: _asNullableString(map["created_at"]),
    updatedAt: _asNullableString(map["updated_at"]),
  );
}

class GatewayTicketItem {
  GatewayTicketItem({
    required this.id,
    required this.subject,
    required this.level,
    required this.levelLabel,
    required this.statusCode,
    required this.status,
    required this.replyStatus,
    required this.replyStatusLabel,
    required this.canReply,
    required this.canClose,
    required this.messages,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String subject;
  final int level;
  final String levelLabel;
  final int statusCode;
  final String status;
  final int replyStatus;
  final String replyStatusLabel;
  final bool canReply;
  final bool canClose;
  final List<GatewayTicketMessage> messages;
  final String? createdAt;
  final String? updatedAt;

  bool get isClosed => status == "closed" || statusCode == 1;

  factory GatewayTicketItem.fromMap(Map<String, dynamic> map) {
    final rawMessages = map["messages"];
    final messages = rawMessages is List
        ? rawMessages
              .whereType<Map>()
              .map((item) => GatewayTicketMessage.fromMap(item.cast<String, dynamic>()))
              .toList()
        : const <GatewayTicketMessage>[];

    return GatewayTicketItem(
      id: _asInt(map["id"]),
      subject: _asNullableString(map["subject"]) ?? "-",
      level: _asInt(map["level"]),
      levelLabel: _asNullableString(map["level_label"]) ?? "-",
      statusCode: _asInt(map["status_code"]),
      status: _asNullableString(map["status"]) ?? "open",
      replyStatus: _asInt(map["reply_status"]),
      replyStatusLabel: _asNullableString(map["reply_status_label"]) ?? "-",
      canReply: map["can_reply"] != false,
      canClose: map["can_close"] != false,
      messages: messages,
      createdAt: _asNullableString(map["created_at"]),
      updatedAt: _asNullableString(map["updated_at"]),
    );
  }
}
