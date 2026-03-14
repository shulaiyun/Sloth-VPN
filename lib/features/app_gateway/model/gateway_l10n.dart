import 'package:flutter/widgets.dart';

abstract class GatewayL10n {
  const GatewayL10n();

  static GatewayL10n of(BuildContext context) {
    final code = Localizations.localeOf(context).languageCode.toLowerCase();
    if (code.startsWith('zh')) {
      return const _GatewayL10nZh();
    }
    return const _GatewayL10nEn();
  }

  String get loginTitle;
  String get loginSubtitle;
  String get emailLabel;
  String get passwordLabel;
  String get loginButton;
  String get loggingIn;
  String get createAccountButton;
  String get enterEmailPassword;
  String get enterEmailFirst;
  String get loginSucceeded;
  String loginFailed(String message);

  String get registerTitle;
  String get registerSubtitle;
  String get passwordHint;
  String get emailCodeLabel;
  String get inviteCodeLabel;
  String get sendEmailCode;
  String get sending;
  String get verifyCodeSent;
  String get registerAndLogin;
  String get registering;
  String get registerSucceeded;
  String registerFailed(String message);
  String sendFailed(String message);

  String get back;
  String get retry;
  String get refresh;
  String get copy;
  String get copied;

  String get accountCenterTitle;
  String get notLoggedIn;
  String get viewAccountFailed;
  String get accountEmail;
  String get accountPlan;
  String get accountExpire;
  String get accountUsedTraffic;
  String get accountRemainingTraffic;
  String get accountBalance;
  String get accountSubVersion;
  String get accountLastSynced;
  String get accountNodeCount;
  String get syncSubscriptionNow;
  String get syncCompleted;
  String syncFailed(String message);
  String get openPlansAndPurchase;
  String get telegram;
  String get ticket;
  String get notices;
  String get github;
  String get logout;
  String get loggedOut;
  String get openTicketInApp;
  String get accountActions;
  String get accountSecurity;
  String get changePassword;
  String get openNotices;
  String get openKnowledge;

  String get plansTitle;
  String get purchaseTabPlans;
  String get purchaseTabOrders;
  String loadPlansFailed(String message);
  String get noPurchasablePlans;
  String get paymentMethod;
  String get billingPeriod;
  String get selectPeriodAndPayment;
  String get buyNow;
  String get processing;
  String get orderCompletedAndSynced;
  String orderFailed(String message);
  String paymentPageOpened(String orderNo);
  String get noPaymentUrl;
  String paymentPayload(String payload);
  String get backToAccountCenter;
  String get planTraffic;
  String get planDevices;
  String get planSpeed;
  String get unlimited;

  String get ordersTitle;
  String get noOrders;
  String get continuePay;
  String get refreshOrderStatus;
  String get cancelOrder;
  String get orderCancelled;
  String cancelOrderFailed(String message);
  String get paidStatus;
  String get pendingStatus;
  String get cancelledStatus;
  String get expiredStatus;
  String get allStatus;
  String orderStatusLabel(String status);
  String orderStatusUpdated(String orderNo, String status);
  String get orderDetail;
  String get orderType;
  String get orderDiscountAmount;
  String get orderBalanceAmount;
  String get orderSurplusAmount;
  String get orderRefundAmount;
  String get orderPaidAt;
  String get orderCreatedAt;
  String get orderAmount;

  String get homeAccountAndPlans;
  String get checkingAccountStatus;
  String statusLoggedIn(String email);
  String get statusNotLoggedIn;
  String get homeGuide;
  String get homeCurrentPlan;
  String get homeExpireAt;
  String get homeRemainingTraffic;
  String get myAccount;
  String get register;
  String get login;
  String get buyPlan;
  String get viewPlans;
  String get syncNow;
  String get quickRenew;
  String get renewRulesTitle;
  String get renewRulesSamePlan;
  String get renewRulesUpgrade;
  String get renewRulesRefund;

  String get aboutAccountCenterTitle;
  String get aboutAccountCenterSub;
  String get aboutPlanTitle;
  String get aboutPlanSub;
  String get aboutCompatBindTitle;
  String get aboutCompatBindSub;

  String get emailSuffixRestricted;
  String emailSuffixHint(List<String> suffixes);
  String get registerClosedHint;
  String get accountAndPlanSectionTitle;
  String get goPurchase;

  String get inviteCenterTitle;
  String get inviteCode;
  String get inviteLink;
  String get inviteRebateTotal;
  String get inviteRebatePending;
  String get inviteCount;
  String get inviteNotAvailable;
  String get noticesTitle;
  String get knowledgeTitle;
  String get knowledgeEmpty;
  String get ticketOpenFailed;
  String get openInWebview;
  String get changePasswordTitle;
  String get oldPasswordLabel;
  String get newPasswordLabel;
  String get confirmPasswordLabel;
  String get submit;
  String get changePasswordSuccess;
  String get passwordNotMatch;
  String get passwordTooShort;

  String get unknownError;

  String periodLabel(String code, String fallback);
}

class _GatewayL10nZh extends GatewayL10n {
  const _GatewayL10nZh();

  @override
  String get loginTitle => '登录';
  @override
  String get loginSubtitle => '登录后可在 App 内购买套餐并自动同步节点。';
  @override
  String get emailLabel => '邮箱';
  @override
  String get passwordLabel => '密码';
  @override
  String get loginButton => '登录';
  @override
  String get loggingIn => '登录中...';
  @override
  String get createAccountButton => '创建账号';
  @override
  String get enterEmailPassword => '请输入邮箱和密码';
  @override
  String get enterEmailFirst => '请先输入邮箱';
  @override
  String get loginSucceeded => '登录成功，订阅已自动同步';
  @override
  String loginFailed(String message) => '登录失败：$message';

  @override
  String get registerTitle => '注册';
  @override
  String get registerSubtitle => '在 App 内创建账号，随后可直接购买并使用。';
  @override
  String get passwordHint => '密码（至少 8 位）';
  @override
  String get emailCodeLabel => '邮箱验证码（如需）';
  @override
  String get inviteCodeLabel => '邀请码（如需）';
  @override
  String get sendEmailCode => '发送邮箱验证码';
  @override
  String get sending => '发送中...';
  @override
  String get verifyCodeSent => '验证码已发送，请查收邮箱';
  @override
  String get registerAndLogin => '注册并登录';
  @override
  String get registering => '注册中...';
  @override
  String get registerSucceeded => '注册成功，已自动登录并同步订阅';
  @override
  String registerFailed(String message) => '注册失败：$message';
  @override
  String sendFailed(String message) => '发送失败：$message';

  @override
  String get back => '返回';
  @override
  String get retry => '重试';
  @override
  String get refresh => '刷新';
  @override
  String get copy => '复制';
  @override
  String get copied => '已复制';

  @override
  String get accountCenterTitle => '账户中心';
  @override
  String get notLoggedIn => '当前未登录';
  @override
  String get viewAccountFailed => '加载账户信息失败';
  @override
  String get accountEmail => '邮箱';
  @override
  String get accountPlan => '当前套餐';
  @override
  String get accountExpire => '到期时间';
  @override
  String get accountUsedTraffic => '已用流量';
  @override
  String get accountRemainingTraffic => '剩余流量';
  @override
  String get accountBalance => '账户余额';
  @override
  String get accountSubVersion => '订阅版本';
  @override
  String get accountLastSynced => '上次同步';
  @override
  String get accountNodeCount => '节点数量';
  @override
  String get syncSubscriptionNow => '立即同步订阅';
  @override
  String get syncCompleted => '订阅同步完成';
  @override
  String syncFailed(String message) => '同步失败：$message';
  @override
  String get openPlansAndPurchase => '进入购买中心';
  @override
  String get telegram => 'Telegram';
  @override
  String get ticket => '工单';
  @override
  String get notices => '公告';
  @override
  String get github => 'GitHub';
  @override
  String get logout => '退出登录';
  @override
  String get loggedOut => '已退出登录';
  @override
  String get openTicketInApp => '在应用内打开工单';
  @override
  String get accountActions => '服务与支持';
  @override
  String get accountSecurity => '账户安全';
  @override
  String get changePassword => '修改密码';
  @override
  String get openNotices => '查看公告';
  @override
  String get openKnowledge => '知识库 / 教程';

  @override
  String get plansTitle => '购买';
  @override
  String get purchaseTabPlans => '套餐';
  @override
  String get purchaseTabOrders => '订单';
  @override
  String loadPlansFailed(String message) => '加载套餐失败：$message';
  @override
  String get noPurchasablePlans => '暂无可购买套餐';
  @override
  String get paymentMethod => '支付方式';
  @override
  String get billingPeriod => '购买周期';
  @override
  String get selectPeriodAndPayment => '请先选择周期和支付方式';
  @override
  String get buyNow => '创建订单';
  @override
  String get processing => '处理中...';
  @override
  String get orderCompletedAndSynced => '订单已完成，订阅已自动同步';
  @override
  String orderFailed(String message) => '下单失败：$message';
  @override
  String paymentPageOpened(String orderNo) => '已打开支付页，订单号：$orderNo';
  @override
  String get noPaymentUrl => '订单已创建，但未返回支付链接';
  @override
  String paymentPayload(String payload) => '支付信息：$payload';
  @override
  String get backToAccountCenter => '返回账户中心';
  @override
  String get planTraffic => '流量';
  @override
  String get planDevices => '设备数';
  @override
  String get planSpeed => '速率';
  @override
  String get unlimited => '不限';

  @override
  String get ordersTitle => '订单管理';
  @override
  String get noOrders => '暂无订单';
  @override
  String get continuePay => '继续支付';
  @override
  String get refreshOrderStatus => '刷新状态';
  @override
  String get cancelOrder => '关闭订单';
  @override
  String get orderCancelled => '订单已关闭';
  @override
  String cancelOrderFailed(String message) => '关闭订单失败：$message';
  @override
  String get paidStatus => '已支付';
  @override
  String get pendingStatus => '待支付';
  @override
  String get cancelledStatus => '已取消';
  @override
  String get expiredStatus => '已过期';
  @override
  String get allStatus => '全部';
  @override
  String orderStatusLabel(String status) {
    switch (status) {
      case 'pending':
      case 'processing':
        return pendingStatus;
      case 'completed':
      case 'discounted':
      case 'paid':
        return paidStatus;
      case 'cancelled':
        return cancelledStatus;
      case 'expired':
        return expiredStatus;
      default:
        return status;
    }
  }

  @override
  String orderStatusUpdated(String orderNo, String status) => '订单 $orderNo 当前状态：${orderStatusLabel(status)}';
  @override
  String get orderDetail => '订单详情';
  @override
  String get orderType => '订单类型';
  @override
  String get orderDiscountAmount => '优惠抵扣';
  @override
  String get orderBalanceAmount => '余额抵扣';
  @override
  String get orderSurplusAmount => '旧套餐折算抵扣';
  @override
  String get orderRefundAmount => '退款到余额';
  @override
  String get orderPaidAt => '支付时间';
  @override
  String get orderCreatedAt => '创建时间';
  @override
  String get orderAmount => '订单金额';

  @override
  String get homeAccountAndPlans => '账户与套餐';
  @override
  String get checkingAccountStatus => '正在检查账户状态...';
  @override
  String statusLoggedIn(String email) => '已登录：$email';
  @override
  String get statusNotLoggedIn => '未登录';
  @override
  String get homeGuide => '先登录或注册，再购买套餐。支付成功后会自动同步节点。';
  @override
  String get homeCurrentPlan => '套餐';
  @override
  String get homeExpireAt => '到期';
  @override
  String get homeRemainingTraffic => '剩余流量';
  @override
  String get myAccount => '账户中心';
  @override
  String get register => '注册';
  @override
  String get login => '登录';
  @override
  String get buyPlan => '去购买';
  @override
  String get viewPlans => '查看套餐';
  @override
  String get syncNow => '同步订阅';
  @override
  String get quickRenew => '快速续费';
  @override
  String get renewRulesTitle => '续费与升级说明';
  @override
  String get renewRulesSamePlan => '同款套餐续费会自动叠加时长。';
  @override
  String get renewRulesUpgrade => '切换套餐时会自动计算旧套餐剩余价值并抵扣新订单。';
  @override
  String get renewRulesRefund => '若旧套餐剩余价值大于新套餐价格，差额将退回账户余额。';

  @override
  String get aboutAccountCenterTitle => '账户中心';
  @override
  String get aboutAccountCenterSub => '查看账号状态、同步订阅、邀请返利与服务入口';
  @override
  String get aboutPlanTitle => '购买中心';
  @override
  String get aboutPlanSub => '查看套餐、创建订单、继续支付';
  @override
  String get aboutCompatBindTitle => '兼容绑定入口';
  @override
  String get aboutCompatBindSub => '保留第一阶段绑定流程用于兼容测试';

  @override
  String get emailSuffixRestricted => '仅支持指定邮箱后缀注册';
  @override
  String emailSuffixHint(List<String> suffixes) => '当前支持后缀：${suffixes.join('、')}';
  @override
  String get registerClosedHint => '当前站点已关闭注册';
  @override
  String get accountAndPlanSectionTitle => '账户与套餐';
  @override
  String get goPurchase => '去购买';

  @override
  String get inviteCenterTitle => '邀请返利';
  @override
  String get inviteCode => '我的邀请码';
  @override
  String get inviteLink => '邀请链接';
  @override
  String get inviteRebateTotal => '累计返利';
  @override
  String get inviteRebatePending => '待结算返利';
  @override
  String get inviteCount => '邀请人数';
  @override
  String get inviteNotAvailable => '当前站点暂未开启邀请返利';
  @override
  String get noticesTitle => '公告';
  @override
  String get knowledgeTitle => '知识库 / 教程';
  @override
  String get knowledgeEmpty => '暂无教程内容';
  @override
  String get ticketOpenFailed => '打开工单失败，请稍后重试';
  @override
  String get openInWebview => '在应用内打开';
  @override
  String get changePasswordTitle => '修改密码';
  @override
  String get oldPasswordLabel => '旧密码';
  @override
  String get newPasswordLabel => '新密码（至少 8 位）';
  @override
  String get confirmPasswordLabel => '确认新密码';
  @override
  String get submit => '提交';
  @override
  String get changePasswordSuccess => '密码修改成功，请使用新密码登录';
  @override
  String get passwordNotMatch => '两次输入的新密码不一致';
  @override
  String get passwordTooShort => '新密码至少 8 位';

  @override
  String get unknownError => '未知错误';

  @override
  String periodLabel(String code, String fallback) {
    switch (code) {
      case 'month_price':
        return '月付';
      case 'quarter_price':
        return '季付';
      case 'half_year_price':
        return '半年';
      case 'year_price':
        return '年付';
      case 'two_year_price':
        return '两年';
      case 'three_year_price':
        return '三年';
      case 'onetime_price':
        return '一次性';
      case 'reset_price':
        return '重置流量';
      default:
        return fallback;
    }
  }
}

class _GatewayL10nEn extends GatewayL10n {
  const _GatewayL10nEn();

  @override
  String get loginTitle => 'Login';
  @override
  String get loginSubtitle => 'Sign in to purchase plans and auto-sync nodes in app.';
  @override
  String get emailLabel => 'Email';
  @override
  String get passwordLabel => 'Password';
  @override
  String get loginButton => 'Login';
  @override
  String get loggingIn => 'Logging in...';
  @override
  String get createAccountButton => 'Create Account';
  @override
  String get enterEmailPassword => 'Please enter email and password';
  @override
  String get enterEmailFirst => 'Please enter email first';
  @override
  String get loginSucceeded => 'Login succeeded. Subscription synced.';
  @override
  String loginFailed(String message) => 'Login failed: $message';

  @override
  String get registerTitle => 'Register';
  @override
  String get registerSubtitle => 'Registration will auto login and sync subscription.';
  @override
  String get passwordHint => 'Password (min 8 chars)';
  @override
  String get emailCodeLabel => 'Email Code';
  @override
  String get inviteCodeLabel => 'Invite Code (if required)';
  @override
  String get sendEmailCode => 'Send Email Code';
  @override
  String get sending => 'Sending...';
  @override
  String get verifyCodeSent => 'Verification code sent';
  @override
  String get registerAndLogin => 'Register and Login';
  @override
  String get registering => 'Registering...';
  @override
  String get registerSucceeded => 'Registered and logged in';
  @override
  String registerFailed(String message) => 'Register failed: $message';
  @override
  String sendFailed(String message) => 'Send failed: $message';

  @override
  String get back => 'Back';
  @override
  String get retry => 'Retry';
  @override
  String get refresh => 'Refresh';
  @override
  String get copy => 'Copy';
  @override
  String get copied => 'Copied';

  @override
  String get accountCenterTitle => 'Account';
  @override
  String get notLoggedIn => 'Not logged in';
  @override
  String get viewAccountFailed => 'Failed to load account summary';
  @override
  String get accountEmail => 'Email';
  @override
  String get accountPlan => 'Plan';
  @override
  String get accountExpire => 'Expire';
  @override
  String get accountUsedTraffic => 'Used Traffic';
  @override
  String get accountRemainingTraffic => 'Remaining Traffic';
  @override
  String get accountBalance => 'Balance';
  @override
  String get accountSubVersion => 'Subscription Version';
  @override
  String get accountLastSynced => 'Last Synced';
  @override
  String get accountNodeCount => 'Node Count';
  @override
  String get syncSubscriptionNow => 'Sync Subscription';
  @override
  String get syncCompleted => 'Sync completed';
  @override
  String syncFailed(String message) => 'Sync failed: $message';
  @override
  String get openPlansAndPurchase => 'Open Purchase';
  @override
  String get telegram => 'Telegram';
  @override
  String get ticket => 'Ticket';
  @override
  String get notices => 'Notices';
  @override
  String get github => 'GitHub';
  @override
  String get logout => 'Logout';
  @override
  String get loggedOut => 'Logged out';
  @override
  String get openTicketInApp => 'Open ticket in app';
  @override
  String get accountActions => 'Support';
  @override
  String get accountSecurity => 'Security';
  @override
  String get changePassword => 'Change Password';
  @override
  String get openNotices => 'Notices';
  @override
  String get openKnowledge => 'Knowledge Base';

  @override
  String get plansTitle => 'Purchase';
  @override
  String get purchaseTabPlans => 'Plans';
  @override
  String get purchaseTabOrders => 'Orders';
  @override
  String loadPlansFailed(String message) => 'Failed to load plans: $message';
  @override
  String get noPurchasablePlans => 'No plans available';
  @override
  String get paymentMethod => 'Payment Method';
  @override
  String get billingPeriod => 'Billing Period';
  @override
  String get selectPeriodAndPayment => 'Select plan period and payment method first';
  @override
  String get buyNow => 'Create Order';
  @override
  String get processing => 'Processing...';
  @override
  String get orderCompletedAndSynced => 'Order completed and synced';
  @override
  String orderFailed(String message) => 'Order failed: $message';
  @override
  String paymentPageOpened(String orderNo) => 'Payment page opened. Order: $orderNo';
  @override
  String get noPaymentUrl => 'No payment URL returned';
  @override
  String paymentPayload(String payload) => 'Payment payload: $payload';
  @override
  String get backToAccountCenter => 'Back to Account';
  @override
  String get planTraffic => 'Traffic';
  @override
  String get planDevices => 'Devices';
  @override
  String get planSpeed => 'Speed';
  @override
  String get unlimited => 'Unlimited';

  @override
  String get ordersTitle => 'Orders';
  @override
  String get noOrders => 'No orders';
  @override
  String get continuePay => 'Continue Pay';
  @override
  String get refreshOrderStatus => 'Refresh Status';
  @override
  String get cancelOrder => 'Cancel Order';
  @override
  String get orderCancelled => 'Order cancelled';
  @override
  String cancelOrderFailed(String message) => 'Cancel failed: $message';
  @override
  String get paidStatus => 'Paid';
  @override
  String get pendingStatus => 'Pending';
  @override
  String get cancelledStatus => 'Cancelled';
  @override
  String get expiredStatus => 'Expired';
  @override
  String get allStatus => 'All';
  @override
  String orderStatusLabel(String status) => status;
  @override
  String orderStatusUpdated(String orderNo, String status) => 'Order $orderNo status: $status';
  @override
  String get orderDetail => 'Order Detail';
  @override
  String get orderType => 'Order Type';
  @override
  String get orderDiscountAmount => 'Discount';
  @override
  String get orderBalanceAmount => 'Balance Deduction';
  @override
  String get orderSurplusAmount => 'Old Plan Offset';
  @override
  String get orderRefundAmount => 'Refund to Balance';
  @override
  String get orderPaidAt => 'Paid At';
  @override
  String get orderCreatedAt => 'Created At';
  @override
  String get orderAmount => 'Amount';

  @override
  String get homeAccountAndPlans => 'Account & Plans';
  @override
  String get checkingAccountStatus => 'Checking account status...';
  @override
  String statusLoggedIn(String email) => 'Logged in: $email';
  @override
  String get statusNotLoggedIn => 'Not logged in';
  @override
  String get homeGuide => 'Login/Register first, then purchase and sync nodes automatically.';
  @override
  String get homeCurrentPlan => 'Plan';
  @override
  String get homeExpireAt => 'Expire';
  @override
  String get homeRemainingTraffic => 'Remaining';
  @override
  String get myAccount => 'Account';
  @override
  String get register => 'Register';
  @override
  String get login => 'Login';
  @override
  String get buyPlan => 'Buy';
  @override
  String get viewPlans => 'View Plans';
  @override
  String get syncNow => 'Sync';
  @override
  String get quickRenew => 'Renew';
  @override
  String get renewRulesTitle => 'Renew & Upgrade Rules';
  @override
  String get renewRulesSamePlan => 'Renewing the same plan extends your expiry.';
  @override
  String get renewRulesUpgrade => 'Switching plan offsets remaining value automatically.';
  @override
  String get renewRulesRefund => 'If offset exceeds price, extra amount returns to balance.';

  @override
  String get aboutAccountCenterTitle => 'Account Center';
  @override
  String get aboutAccountCenterSub => 'Manage account, sync and support';
  @override
  String get aboutPlanTitle => 'Purchase';
  @override
  String get aboutPlanSub => 'Plans + orders + payment';
  @override
  String get aboutCompatBindTitle => 'Bind (compat)';
  @override
  String get aboutCompatBindSub => 'Keep phase-1 binding entry';

  @override
  String get emailSuffixRestricted => 'Only specific email suffixes are allowed';
  @override
  String emailSuffixHint(List<String> suffixes) => 'Allowed suffixes: ${suffixes.join(', ')}';
  @override
  String get registerClosedHint => 'Registration is currently closed';
  @override
  String get accountAndPlanSectionTitle => 'Account & Plans';
  @override
  String get goPurchase => 'Go Purchase';

  @override
  String get inviteCenterTitle => 'Invite';
  @override
  String get inviteCode => 'Invite Code';
  @override
  String get inviteLink => 'Invite Link';
  @override
  String get inviteRebateTotal => 'Total Rebate';
  @override
  String get inviteRebatePending => 'Pending Rebate';
  @override
  String get inviteCount => 'Invited Users';
  @override
  String get inviteNotAvailable => 'Invite feature unavailable';
  @override
  String get noticesTitle => 'Notices';
  @override
  String get knowledgeTitle => 'Knowledge';
  @override
  String get knowledgeEmpty => 'No tutorials yet';
  @override
  String get ticketOpenFailed => 'Failed to open ticket';
  @override
  String get openInWebview => 'Open In App';
  @override
  String get changePasswordTitle => 'Change Password';
  @override
  String get oldPasswordLabel => 'Old Password';
  @override
  String get newPasswordLabel => 'New Password (min 8 chars)';
  @override
  String get confirmPasswordLabel => 'Confirm New Password';
  @override
  String get submit => 'Submit';
  @override
  String get changePasswordSuccess => 'Password changed successfully';
  @override
  String get passwordNotMatch => 'Password confirmation mismatch';
  @override
  String get passwordTooShort => 'New password is too short';

  @override
  String get unknownError => 'Unknown error';

  @override
  String periodLabel(String code, String fallback) => fallback;
}
