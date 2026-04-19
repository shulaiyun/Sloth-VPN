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

bool _asBool(dynamic value, [bool fallback = false]) {
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    final normalized = value.trim().toLowerCase();
    if (normalized == "true" || normalized == "1" || normalized == "yes" || normalized == "on") return true;
    if (normalized == "false" || normalized == "0" || normalized == "no" || normalized == "off") return false;
  }
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

List<String> _asStringList(dynamic value) {
  if (value is! List) return const <String>[];
  return value.map((item) => item.toString().trim()).where((item) => item.isNotEmpty).toList();
}

class GatewayBindExchangeResult {
  GatewayBindExchangeResult({
    required this.accessToken,
    required this.refreshToken,
    required this.sessionId,
    this.userEmail,
    this.userUuid,
    this.inviteReward,
    this.referralClaim,
  });

  final String accessToken;
  final String refreshToken;
  final String sessionId;
  final String? userEmail;
  final String? userUuid;
  final GatewayInviteRewardResult? inviteReward;
  final GatewayReferralClaim? referralClaim;

  factory GatewayBindExchangeResult.fromMap(Map<String, dynamic> map) {
    final user = _asMap(map["user"]);
    final inviteRewardRaw = map["invite_reward"];
    final referralClaimRaw = map["referral_claim"];
    return GatewayBindExchangeResult(
      accessToken: map["access_token"]?.toString() ?? "",
      refreshToken: map["refresh_token"]?.toString() ?? "",
      sessionId: map["session_id"]?.toString() ?? "",
      userEmail: _asNullableString(user["email"]),
      userUuid: _asNullableString(user["uuid"]),
      inviteReward: inviteRewardRaw is Map ? GatewayInviteRewardResult.fromMap(_asMap(inviteRewardRaw)) : null,
      referralClaim: referralClaimRaw is Map ? GatewayReferralClaim.fromMap(_asMap(referralClaimRaw)) : null,
    );
  }
}

class GatewayInviteRewardResult {
  GatewayInviteRewardResult({
    required this.enabled,
    required this.attempted,
    required this.granted,
    required this.message,
    required this.mode,
    this.giftCardCodeMasked,
  });

  final bool enabled;
  final bool attempted;
  final bool granted;
  final String message;
  final String mode;
  final String? giftCardCodeMasked;

  factory GatewayInviteRewardResult.fromMap(Map<String, dynamic> map) {
    return GatewayInviteRewardResult(
      enabled: map["enabled"] == true,
      attempted: map["attempted"] == true,
      granted: map["granted"] == true,
      message: map["message"]?.toString().trim() ?? "",
      mode: map["mode"]?.toString().trim() ?? "none",
      giftCardCodeMasked: _asNullableString(map["gift_card_code_masked"]),
    );
  }
}

class GatewayReferralClaim {
  GatewayReferralClaim({
    required this.claimId,
    this.inviteCode,
    required this.channel,
    this.campaign,
    required this.installClaimStatus,
    required this.signupStatus,
    required this.firstPaidOrderStatus,
    this.createdAt,
    this.updatedAt,
    this.appClaimUrl,
  });

  final String claimId;
  final String? inviteCode;
  final String channel;
  final String? campaign;
  final String installClaimStatus;
  final String signupStatus;
  final String firstPaidOrderStatus;
  final String? createdAt;
  final String? updatedAt;
  final String? appClaimUrl;

  factory GatewayReferralClaim.fromMap(Map<String, dynamic> map) {
    final links = _asMap(map["growth_links"]);
    return GatewayReferralClaim(
      claimId: map["claim_id"]?.toString() ?? "",
      inviteCode: _asNullableString(map["invite_code"]),
      channel: _asNullableString(map["channel"]) ?? "direct",
      campaign: _asNullableString(map["campaign"]),
      installClaimStatus: _asNullableString(map["install_claim_status"]) ?? "pending",
      signupStatus: _asNullableString(map["signup_status"]) ?? "pending",
      firstPaidOrderStatus: _asNullableString(map["first_paid_order_status"]) ?? "pending",
      createdAt: _asNullableString(map["created_at"]),
      updatedAt: _asNullableString(map["updated_at"]),
      appClaimUrl: _asNullableString(links["app_claim_url"]),
    );
  }
}

class GatewayBrandProfile {
  GatewayBrandProfile({
    required this.brandId,
    required this.brandCode,
    required this.name,
    this.tagline,
    this.description,
    this.logoUrl,
    this.supportEmail,
    this.supportTelegram,
    this.primaryColor,
    this.secondaryColor,
    this.accentColor,
    this.fontFamily,
    this.defaultLocale,
    this.deploymentMode,
  });

  final String brandId;
  final String brandCode;
  final String name;
  final String? tagline;
  final String? description;
  final String? logoUrl;
  final String? supportEmail;
  final String? supportTelegram;
  final String? primaryColor;
  final String? secondaryColor;
  final String? accentColor;
  final String? fontFamily;
  final String? defaultLocale;
  final String? deploymentMode;

  factory GatewayBrandProfile.fromMap(Map<String, dynamic> map) => GatewayBrandProfile(
    brandId: _asNullableString(map["brand_id"]) ?? "slothvpn",
    brandCode: _asNullableString(map["brand_code"]) ?? "slothvpn",
    name: _asNullableString(map["name"]) ?? "SlothVPN",
    tagline: _asNullableString(map["tagline"]),
    description: _asNullableString(map["description"]),
    logoUrl: _asNullableString(map["logo_url"]),
    supportEmail: _asNullableString(map["support_email"]),
    supportTelegram: _asNullableString(map["support_telegram"]),
    primaryColor: _asNullableString(map["primary_color"]),
    secondaryColor: _asNullableString(map["secondary_color"]),
    accentColor: _asNullableString(map["accent_color"]),
    fontFamily: _asNullableString(map["font_family"]),
    defaultLocale: _asNullableString(map["default_locale"]),
    deploymentMode: _asNullableString(map["deployment_mode"]),
  );
}

class GatewayFeatureFlags {
  GatewayFeatureFlags({required this.flags});

  final Map<String, bool> flags;

  bool isEnabled(String key, [bool fallback = false]) => flags[key] ?? fallback;

  bool get splitTunnelEnabled => isEnabled("app_split_tunnel_enabled", true);
  bool get diagnosticsEnabled => isEnabled("diagnostics_enabled", true);
  bool get inviteEnabled => isEnabled("invite_enabled", true);
  bool get operatorConsoleEnabled => isEnabled("operator_console_enabled", false);

  factory GatewayFeatureFlags.fromMap(Map<String, dynamic> map) => GatewayFeatureFlags(
    flags: map.map((key, value) => MapEntry(key, _asBool(value))),
  );
}

class GatewayPortalSchema {
  GatewayPortalSchema({
    required this.publicSections,
    required this.portalSections,
    required this.operatorSections,
  });

  final List<String> publicSections;
  final List<String> portalSections;
  final List<String> operatorSections;

  factory GatewayPortalSchema.fromMap(Map<String, dynamic> map) => GatewayPortalSchema(
    publicSections: (map["public_sections"] as List? ?? const [])
        .map((item) => item.toString().trim())
        .where((item) => item.isNotEmpty)
        .toList(),
    portalSections: (map["portal_sections"] as List? ?? const [])
        .map((item) => item.toString().trim())
        .where((item) => item.isNotEmpty)
        .toList(),
    operatorSections: (map["operator_sections"] as List? ?? const [])
        .map((item) => item.toString().trim())
        .where((item) => item.isNotEmpty)
        .toList(),
  );
}

class GatewayRoutingPreset {
  GatewayRoutingPreset({
    required this.key,
    required this.title,
    required this.description,
    required this.appMode,
  });

  final String key;
  final String title;
  final String description;
  final String appMode;

  factory GatewayRoutingPreset.fromMap(Map<String, dynamic> map) => GatewayRoutingPreset(
    key: _asNullableString(map["key"]) ?? "global",
    title: _asNullableString(map["title"]) ?? "",
    description: _asNullableString(map["description"]) ?? "",
    appMode: _asNullableString(map["app_mode"]) ?? "all",
  );
}

class GatewayNetworkDiagnostic {
  GatewayNetworkDiagnostic({
    required this.key,
    required this.label,
    required this.status,
    required this.message,
    this.action,
  });

  final String key;
  final String label;
  final String status;
  final String message;
  final String? action;

  bool get isHealthy => status == "healthy";

  factory GatewayNetworkDiagnostic.fromMap(Map<String, dynamic> map) => GatewayNetworkDiagnostic(
    key: _asNullableString(map["key"]) ?? "",
    label: _asNullableString(map["label"]) ?? "",
    status: _asNullableString(map["status"]) ?? "unknown",
    message: _asNullableString(map["message"]) ?? "",
    action: _asNullableString(map["action"]),
  );
}

class GatewayHomeSurface {
  GatewayHomeSurface({
    this.heroTitle,
    this.heroLead,
    required this.promiseItems,
    this.primaryAction,
    this.secondaryAction,
  });

  final String? heroTitle;
  final String? heroLead;
  final List<String> promiseItems;
  final String? primaryAction;
  final String? secondaryAction;

  factory GatewayHomeSurface.fromMap(Map<String, dynamic> map) => GatewayHomeSurface(
    heroTitle: _asNullableString(map["hero_title"]),
    heroLead: _asNullableString(map["hero_lead"]),
    promiseItems: (map["promise_items"] as List? ?? const [])
        .map((item) => item.toString().trim())
        .where((item) => item.isNotEmpty)
        .toList(),
    primaryAction: _asNullableString(map["primary_action"]),
    secondaryAction: _asNullableString(map["secondary_action"]),
  );
}

class GatewayGrowthCenterSummary {
  GatewayGrowthCenterSummary({
    this.inviteCode,
    required this.invitedCount,
    required this.rebateAvailable,
    this.landingUrl,
    this.registerUrl,
    this.downloadUrl,
    this.appClaimUrl,
  });

  final String? inviteCode;
  final int invitedCount;
  final double rebateAvailable;
  final String? landingUrl;
  final String? registerUrl;
  final String? downloadUrl;
  final String? appClaimUrl;

  factory GatewayGrowthCenterSummary.fromMap(Map<String, dynamic> map) {
    final shareTemplates = _asMap(map["share_templates"]);
    return GatewayGrowthCenterSummary(
      inviteCode: _asNullableString(map["invite_code"]),
      invitedCount: _asInt(map["invited_count"]),
      rebateAvailable: _asDouble(map["rebate_available"]),
      landingUrl: _asNullableString(shareTemplates["landing_url"]),
      registerUrl: _asNullableString(shareTemplates["register_url"]),
      downloadUrl: _asNullableString(shareTemplates["download_url"]),
      appClaimUrl: _asNullableString(shareTemplates["app_claim_url"]),
    );
  }
}

class GatewayAssistantConfig {
  GatewayAssistantConfig({
    required this.enabled,
    required this.provider,
    this.model,
    required this.fallbackEnabled,
    required this.ticketHandoffEnabled,
  });

  final bool enabled;
  final String provider;
  final String? model;
  final bool fallbackEnabled;
  final bool ticketHandoffEnabled;

  factory GatewayAssistantConfig.fromMap(Map<String, dynamic> map) => GatewayAssistantConfig(
    enabled: _asBool(map["enabled"], true),
    provider: _asNullableString(map["provider"]) ?? "knowledge_fallback",
    model: _asNullableString(map["model"]),
    fallbackEnabled: _asBool(map["fallback_enabled"], true),
    ticketHandoffEnabled: _asBool(map["ticket_handoff_enabled"], true),
  );
}

class GatewayIosGuide {
  GatewayIosGuide({this.title, this.url, this.markdown});

  final String? title;
  final String? url;
  final String? markdown;

  factory GatewayIosGuide.fromMap(Map<String, dynamic> map) => GatewayIosGuide(
    title: _asNullableString(map["title"]),
    url: _asNullableString(map["url"]),
    markdown: _asNullableString(map["markdown"]),
  );
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
  int get effectiveSurplusDeduction {
    final value = surplusAmount - refundAmount;
    return value > 0 ? value : 0;
  }

  int get originalAmount {
    final value = totalAmount + balanceAmount + discountAmount + effectiveSurplusDeduction;
    return value > 0 ? value : totalAmount;
  }

  bool get hasPromoDiscount => discountAmount > 0;
  bool get hasGiftOrBalanceDeduction => balanceAmount > 0;
  bool get hasOldPlanOffset => effectiveSurplusDeduction > 0;

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
    this.registeredAt,
    this.expiredAt,
    required this.trafficUsed,
    required this.trafficTotal,
    required this.balance,
    this.subscriptionVersion,
    this.lastSyncedAt,
    this.nodeCount,
    this.pullUrl,
    this.telegramUrl,
    this.telegramGroupUrl,
    this.githubUrl,
    this.ticketUrl,
    this.noticeUrl,
    this.telegramBound = false,
    this.telegramUsername,
    this.telegramBotUrl,
    this.newUserDiscountEnabled = false,
    this.newUserDiscountEligible = false,
    this.newUserDiscountPercent = 0,
    this.newUserDiscountWindowDays = 0,
    this.newUserDiscountText,
    this.brandProfile,
    this.featureFlags,
    this.portalSchema,
    this.routingPresets = const [],
    this.diagnostics = const [],
    this.homeSurface,
    this.growthCenter,
    this.referralClaim,
    this.assistantConfig,
    this.iosGuide,
  });

  final String email;
  final String? planName;
  final String? registeredAt;
  final String? expiredAt;
  final int trafficUsed;
  final int trafficTotal;
  final int balance;
  final String? subscriptionVersion;
  final String? lastSyncedAt;
  final int? nodeCount;
  final String? pullUrl;
  final String? telegramUrl;
  final String? telegramGroupUrl;
  final String? githubUrl;
  final String? ticketUrl;
  final String? noticeUrl;
  final bool telegramBound;
  final String? telegramUsername;
  final String? telegramBotUrl;
  final bool newUserDiscountEnabled;
  final bool newUserDiscountEligible;
  final int newUserDiscountPercent;
  final int newUserDiscountWindowDays;
  final String? newUserDiscountText;
  final GatewayBrandProfile? brandProfile;
  final GatewayFeatureFlags? featureFlags;
  final GatewayPortalSchema? portalSchema;
  final List<GatewayRoutingPreset> routingPresets;
  final List<GatewayNetworkDiagnostic> diagnostics;
  final GatewayHomeSurface? homeSurface;
  final GatewayGrowthCenterSummary? growthCenter;
  final GatewayReferralClaim? referralClaim;
  final GatewayAssistantConfig? assistantConfig;
  final GatewayIosGuide? iosGuide;

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
    final promo = _asMap(map["promo"]);
    final newUserDiscount = _asMap(promo["new_user_discount"]);
    final routingPresets = (map["routing_presets"] as List? ?? const [])
        .whereType<Map>()
        .map((item) => GatewayRoutingPreset.fromMap(_asMap(item)))
        .toList();
    final diagnostics = (map["network_diagnostics"] as List? ?? const [])
        .whereType<Map>()
        .map((item) => GatewayNetworkDiagnostic.fromMap(_asMap(item)))
        .toList();

    return GatewayAccountSummary(
      email: user["email"]?.toString() ?? "",
      planName: _asNullableString(user["plan_name"]),
      registeredAt: _asNullableString(user["registered_at"]),
      expiredAt: _asNullableString(user["expired_at"]),
      trafficUsed: _asInt(user["traffic_used"]),
      trafficTotal: _asInt(user["traffic_total"]),
      balance: _asInt(user["balance"]),
      subscriptionVersion: _asNullableString(subscription["version"]),
      lastSyncedAt: _asNullableString(subscription["last_synced_at"]),
      nodeCount: subscription["node_count"] == null ? null : _asInt(subscription["node_count"]),
      pullUrl: _asNullableString(subscription["pull_url"]),
      telegramUrl: _asNullableString(links["telegram"]),
      telegramGroupUrl: _asNullableString(links["telegram_group"]),
      githubUrl: _asNullableString(links["github"]),
      ticketUrl: _asNullableString(links["tickets"]),
      noticeUrl: _asNullableString(links["notices"]),
      telegramBound: user["telegram_bound"] == true,
      telegramUsername: _asNullableString(user["telegram_username"]),
      telegramBotUrl: _asNullableString(links["telegram_bot"]),
      newUserDiscountEnabled: newUserDiscount["enabled"] == true,
      newUserDiscountEligible: newUserDiscount["eligible"] == true,
      newUserDiscountPercent: _asInt(newUserDiscount["percent"]),
      newUserDiscountWindowDays: _asInt(newUserDiscount["window_days"]),
      newUserDiscountText: _asNullableString(newUserDiscount["text"]),
      brandProfile: map["brand_profile"] is Map ? GatewayBrandProfile.fromMap(_asMap(map["brand_profile"])) : null,
      featureFlags: map["feature_flags"] is Map ? GatewayFeatureFlags.fromMap(_asMap(map["feature_flags"])) : null,
      portalSchema: map["portal_schema"] is Map ? GatewayPortalSchema.fromMap(_asMap(map["portal_schema"])) : null,
      routingPresets: routingPresets,
      diagnostics: diagnostics,
      homeSurface: map["home_surface"] is Map ? GatewayHomeSurface.fromMap(_asMap(map["home_surface"])) : null,
      growthCenter: map["growth_center_summary"] is Map
          ? GatewayGrowthCenterSummary.fromMap(_asMap(map["growth_center_summary"]))
          : null,
      referralClaim: map["referral_claim"] is Map ? GatewayReferralClaim.fromMap(_asMap(map["referral_claim"])) : null,
      assistantConfig: map["assistant_config"] is Map
          ? GatewayAssistantConfig.fromMap(_asMap(map["assistant_config"]))
          : null,
      iosGuide: map["ios_guide"] is Map ? GatewayIosGuide.fromMap(_asMap(map["ios_guide"])) : null,
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
    this.displaySummary,
    this.displayHighlights = const [],
    this.displayBadge,
    this.displaySort = 0,
    this.hiddenReason,
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
  final String? displaySummary;
  final List<String> displayHighlights;
  final String? displayBadge;
  final int displaySort;
  final String? hiddenReason;
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
      displaySummary: _asNullableString(map["display_summary"]),
      displayHighlights: _asStringList(map["display_highlights_json"]),
      displayBadge: _asNullableString(map["display_badge"]),
      displaySort: _asInt(map["display_sort"]),
      hiddenReason: _asNullableString(map["hidden_reason"]),
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

class GatewayOrderCreateResult {
  GatewayOrderCreateResult({
    required this.orderNo,
    this.checkoutToken,
    this.nextAction,
    this.createdAt,
  });

  final String orderNo;
  final String? checkoutToken;
  final String? nextAction;
  final String? createdAt;

  factory GatewayOrderCreateResult.fromMap(Map<String, dynamic> map) => GatewayOrderCreateResult(
    orderNo: _asNullableString(map["order_no"]) ?? "",
    checkoutToken: _asNullableString(map["checkout_token"]),
    nextAction: _asNullableString(map["next_action"]),
    createdAt: _asNullableString(map["created_at"]),
  );
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

class GatewayAssistantChatResult {
  GatewayAssistantChatResult({
    required this.answer,
    required this.provider,
    this.model,
    required this.fallback,
    required this.ticketHandoffEnabled,
    this.createdAt,
  });

  final String answer;
  final String provider;
  final String? model;
  final bool fallback;
  final bool ticketHandoffEnabled;
  final String? createdAt;

  factory GatewayAssistantChatResult.fromMap(Map<String, dynamic> map) => GatewayAssistantChatResult(
    answer: _asNullableString(map["answer"]) ?? "",
    provider: _asNullableString(map["provider"]) ?? "unknown",
    model: _asNullableString(map["model"]),
    fallback: _asBool(map["fallback"], false),
    ticketHandoffEnabled: _asBool(map["ticket_handoff_enabled"], true),
    createdAt: _asNullableString(map["created_at"]),
  );
}

class GatewayAssistantTicketResult {
  GatewayAssistantTicketResult({
    required this.created,
    this.ticketId,
    this.subject,
    this.createdAt,
  });

  final bool created;
  final int? ticketId;
  final String? subject;
  final String? createdAt;

  factory GatewayAssistantTicketResult.fromMap(Map<String, dynamic> map) => GatewayAssistantTicketResult(
    created: _asBool(map["created"], false),
    ticketId: map["ticket_id"] == null ? null : _asInt(map["ticket_id"]),
    subject: _asNullableString(map["subject"]),
    createdAt: _asNullableString(map["created_at"]),
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
