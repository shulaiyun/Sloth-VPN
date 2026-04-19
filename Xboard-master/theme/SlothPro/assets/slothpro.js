(() => {
  const root = document.getElementById("sloth-app");
  const settingsNode = document.getElementById("slothpro-settings");
  const settings = safeJson(settingsNode?.textContent, {});
  const config = settings.theme_config || {};
  const context = settings.context || {};
  const brandProfile = safeJson(config.brand_profile_json, {});
  const featureFlags = safeJson(config.feature_flags_json, {});
  const portalSchema = safeJson(config.portal_schema_json, {});
  const locales = normalizeLocales(config.enabled_locales);
  const defaultLocale = locales.includes(config.default_locale) ? config.default_locale : "zh-CN";
  const storedLocale = localStorage.getItem("slothpro_locale");
  const storedAuth = localStorage.getItem("slothpro_auth_data");
  const inviteStorageKey = "slothpro_invite_code";
  const claimStorageKey = "slothpro_claim_id";
  const assistantPosStorageKey = "slothpro_assistant_position";
  const customContent = safeJson(config.content_bundle_json, {});
  const landingBlocksConfig = safeJson(config.landing_blocks_json, []);
  const consoleSpotlightConfig = safeJson(config.console_spotlight_json, []);
  const helpCenterConfig = safeJson(config.help_center_json, []);

  const state = {
    locale: locales.includes(storedLocale) ? storedLocale : defaultLocale,
    auth: storedAuth || "",
    publicConfig: {},
    plans: [],
    user: null,
    subscription: null,
    orders: [],
    notices: [],
    invite: null,
    paymentMethods: [],
    tickets: [],
    trafficLogs: [],
    servers: [],
    knowledge: {},
    giftHistory: [],
    stats: [],
    commConfig: {},
    telegramBot: null,
    checkout: null,
    assistantChatHistory: [],
    message: null,
  };

  const localeNames = {
    "zh-CN": "简体中文",
    "en-US": "English",
    "ja-JP": "日本語",
    "vi-VN": "Tiếng Việt",
    "ko-KR": "한국어",
    "zh-TW": "繁體中文",
    "fa-IR": "فارسی",
  };

  const text = mergeDeep({
    "zh-CN": {
      brandLine: "专业代理服务",
      navFeatures: "产品能力",
      navPricing: "套餐价格",
      navDownload: "下载中心",
      navSupport: "帮助支持",
      navLogin: "登录",
      navRegister: "注册",
      navPortal: "控制台",
      logout: "退出",
      heroKicker: "SlothVPN 新一代全球代理网络",
      heroTitle: "为稳定访问与跨境协作打造的高速 VPN 服务",
      heroLead: "从下载安装到订阅管理，从套餐购买到工单支持，SlothVPN 把复杂的代理服务整理成清晰、可靠、容易操作的一站式体验。",
      ctaPricing: "查看套餐",
      ctaDownload: "立即下载",
      ctaPortal: "进入控制台",
      metricLocations: "全球节点",
      metricUptime: "可用性目标",
      metricLatency: "智能延迟",
      nodeSecure: "加密传输",
      nodeSecureSub: "私密连接",
      nodeSync: "订阅同步",
      nodeSyncSub: "多端可用",
      nodeRoute: "智能路由",
      nodeRouteSub: "按需分流",
      nodeSupport: "专业支持",
      nodeSupportSub: "快速响应",
      featuresKicker: "为什么选择 SlothVPN",
      featuresTitle: "面向个人与团队的专业代理基础设施",
      featuresDesc: "把速度、稳定性、订阅管理与售后支持放在同一个清晰界面里。",
      features: [
        ["多协议兼容", "支持主流代理协议和订阅格式，适配多平台客户端与常见使用场景。"],
        ["跨平台客户端", "Windows、macOS、Android 等设备统一入口，下载和配置都更直观。"],
        ["订阅运营中心", "余额、套餐、订单、流量、到期时间和订阅地址集中管理。"],
        ["专业售后闭环", "公告、教程、工单、Telegram 支持聚合到同一套服务流程。"],
      ],
      pricingKicker: "套餐",
      pricingTitle: "选择适合你的连接方案",
      pricingDesc: "公开套餐来自 XBoard 后台，价格与售卖状态实时读取。",
      featured: "推荐",
      from: "起",
      per: "周期",
      buyNow: "购买套餐",
      loginToBuy: "登录后购买",
      noPlans: "暂无可售套餐，请稍后再来或联系支持。",
      traffic: "流量",
      speed: "速度",
      devices: "设备",
      noLimit: "不限",
      soldOut: "已售罄",
      downloadKicker: "客户端",
      downloadTitle: "下载 SlothVPN 客户端",
      downloadDesc: "把下载入口前置，让用户在购买前就能清楚知道支持哪些平台。",
      download: "下载",
      notReady: "待配置",
      stepsKicker: "开始使用",
      stepsTitle: "3 步完成从注册到连接",
      steps: [
        ["创建账号", "注册或登录 SlothVPN 面板，进入你的订阅运营中心。"],
        ["选择套餐", "购买合适套餐，可在结算时使用优惠券或礼品卡。"],
        ["下载连接", "安装客户端，复制订阅或使用 App 同步后开始连接。"],
      ],
      faqKicker: "FAQ",
      faqTitle: "常见问题",
      faq: [
        ["是否支持多设备？", "套餐会显示设备限制；若后台未设置限制，则视为不限设备。"],
        ["如何获取订阅地址？", "登录后在控制台总览或订阅页可以复制订阅地址。"],
        ["支付后多久生效？", "正常情况下订单支付完成后会自动生效，可在订单页刷新状态。"],
        ["遇到连接问题怎么办？", "请先查看下载与教程页面，仍无法解决时提交工单。"],
      ],
      finalTitle: "把代理服务做成清晰、可信、可运营的产品",
      finalDesc: "从官网展示到用户中心，从套餐转化到售后支持，SlothVPN 现在更像一个专业服务商。",
      loginTitle: "欢迎回来",
      loginLead: "登录后查看你的套餐、订阅地址、订单和支持记录。",
      registerTitle: "创建 SlothVPN 账号",
      registerLead: "注册后即可选择套餐、下载客户端并开始使用。",
      email: "邮箱",
      password: "密码",
      emailCode: "邮箱验证码",
      inviteCode: "邀请码",
      optional: "可选",
      sendCode: "发送验证码",
      submitLogin: "登录控制台",
      submitRegister: "创建账号",
      noAccount: "还没有账号？立即注册",
      hasAccount: "已有账号？去登录",
      authTip: "请使用至少 8 位密码。若站点开启邮箱验证，请先发送验证码。",
      portalTitle: "订阅运营中心",
      portalLead: "集中管理套餐、流量、订单、下载、工单和邀请权益。",
      overview: "总览",
      subscription: "订阅与套餐",
      orders: "订单与支付",
      downloads: "下载与教程",
      support: "工单支持",
      invite: "邀请权益",
      account: "账号设置",
      currentPlan: "当前套餐",
      expireAt: "到期时间",
      trafficUsage: "流量使用",
      balance: "账户余额",
      commission: "可用佣金",
      copySub: "复制订阅",
      renew: "续费/购买",
      openTicket: "提交工单",
      quickActions: "快捷操作",
      latestOrders: "最近订单",
      latestNotices: "公告",
      orderNo: "订单号",
      amount: "金额",
      status: "状态",
      createdAt: "创建时间",
      noOrders: "暂无订单记录。",
      noNotices: "暂无公告。",
      inviteCodes: "邀请码",
      inviteStats: "邀请数据",
      registeredUsers: "注册用户",
      totalCommission: "累计佣金",
      pendingCommission: "确认中",
      rate: "佣金比例",
      copied: "已复制",
      loginRequired: "请先登录后继续操作。",
      networkError: "请求失败，请稍后重试。",
      authSaved: "登录成功，正在进入控制台。",
      pageFeaturesTitle: "产品能力与服务架构",
      pageFeaturesLead: "把节点、订阅、下载、订单与支持串成完整服务链路。",
      pagePricingTitle: "套餐与结算中心",
      pagePricingLead: "用户可以选择周期、填写优惠券并创建订单。",
      pageDownloadTitle: "客户端下载与订阅导入",
      pageDownloadLead: "下载客户端、复制订阅地址，并按教程完成连接。",
      pageSupportTitle: "帮助支持与工单闭环",
      pageSupportLead: "常见问题、公告、教程与工单统一入口。",
      choosePeriod: "选择周期",
      couponCode: "优惠券",
      optionalCoupon: "可选优惠券",
      createOrder: "创建订单",
      orderCreated: "订单已创建，请选择支付方式完成结算。",
      pay: "支付",
      cancelOrder: "取消订单",
      checkPayment: "检查支付",
      paymentMethod: "支付方式",
      noPayment: "暂无可用支付方式，请联系管理员配置支付插件。",
      choosePaymentMethod: "请选择支付方式。",
      paymentOpening: "支付页面已打开，请完成付款后返回检查订单状态。",
      paymentQr: "请扫码或打开支付链接完成付款。",
      freeOrderActivated: "免费订单已自动开通。",
      orderCanceled: "订单已取消。",
      paymentPending: "订单仍在处理中，请稍后刷新。",
      statusPending: "待支付",
      statusProcessing: "开通中",
      statusCanceled: "已取消",
      statusDone: "已完成",
      operation: "操作",
      planName: "套餐",
      period: "周期",
      openLink: "打开链接",
      noTickets: "暂无工单。",
      newTicket: "新建工单",
      ticketSubject: "工单主题",
      ticketLevel: "优先级",
      ticketMessage: "问题描述",
      ticketCreated: "工单已提交。",
      ticketClosed: "工单已关闭。",
      low: "低",
      medium: "中",
      high: "高",
      close: "关闭",
      knowledgeBase: "使用文档",
      noDocs: "暂无文档。",
      serverStatus: "节点状态",
      noServers: "暂无可用节点或订阅未生效。",
      trafficLog: "流量明细",
      noTraffic: "暂无流量记录。",
      changePassword: "修改密码",
      oldPassword: "旧密码",
      newPassword: "新密码",
      save: "保存",
      passwordChanged: "密码已修改，请重新登录。",
      notifySettings: "通知设置",
      remindExpire: "到期提醒",
      remindTraffic: "流量提醒",
      saved: "已保存。",
      resetSecurity: "重置订阅信息",
      resetSecurityDesc: "当订阅地址泄露时重置 UUID 与订阅链接，客户端需要重新导入。",
      resetDone: "订阅信息已重置。",
      transferCommission: "佣金划转到余额",
      transferAmount: "划转金额",
      transferDone: "佣金已划转。",
      redeemGift: "礼品卡兑换",
      giftCode: "兑换码",
      redeem: "兑换",
      redeemed: "兑换成功。",
      giftHistory: "兑换记录",
      noGiftHistory: "暂无兑换记录。",
      generateInvite: "生成邀请码",
      inviteGenerated: "邀请码已生成。",
      copyLink: "复制链接",
      copyFailed: "复制失败，请手动复制。",
      refresh: "刷新",
      oneClickImport: "一键导入",
      manualSubscribe: "备用订阅地址",
      importToApp: "一键导入 App",
      appImportFallback: "如果没有自动打开 App，请先下载安装客户端，然后再次点击导入。",
      downloadForDevice: "未安装 App？请选择设备下载安装",
      appImportGuide: "点击一键导入会自动唤起 SlothVPN App 并写入订阅。",
      telegramService: "Telegram 服务",
      openTelegramBot: "打开 Telegram 助手",
      copyBindCommand: "复制绑定命令",
      telegramBindGuide: "在 Telegram 机器人里发送绑定命令即可关联当前订阅。",
      telegramDiscuss: "进入讨论群",
      telegramUnavailable: "站点暂未开启 Telegram 服务，请先联系管理员配置 Bot。",
      newUserOffer: "新用户注册 3 天内自动享 15% 优惠",
      newUserOfferBadge: "新用户专享 15%",
      resetPackTag: "重置流量包",
      assistantTitle: "智能业务助手",
      assistantLead: "直接问套餐、导入、付款、iOS 下载、分流模式等问题，助手会先给出业务答案，解决不了再提交工单。",
      assistantTicket: "提交工单",
      assistantPlaceholder: "例如：怎么导入订阅 / iOS 怎么下载 / 付款后没生效",
      assistantSuggested: "猜你想问",
      assistantNoMatch: "暂时没匹配到更准确的答案，你可以换个问法，或者直接提交工单。",
    },
    "en-US": {
      brandLine: "Premium proxy service",
      navFeatures: "Features",
      navPricing: "Pricing",
      navDownload: "Downloads",
      navSupport: "Support",
      navLogin: "Sign in",
      navRegister: "Create account",
      navPortal: "Console",
      logout: "Sign out",
      heroKicker: "A next-generation global proxy network",
      heroTitle: "High-speed VPN service for reliable access and cross-border work",
      heroLead: "SlothVPN turns subscriptions, payments, downloads and support into a clear service experience.",
      ctaPricing: "View plans",
      ctaDownload: "Download app",
      ctaPortal: "Open console",
      metricLocations: "Locations",
      metricUptime: "Uptime target",
      metricLatency: "Smart latency",
      nodeSecure: "Encrypted",
      nodeSecureSub: "Private sessions",
      nodeSync: "Sync",
      nodeSyncSub: "All devices",
      nodeRoute: "Routing",
      nodeRouteSub: "Policy based",
      nodeSupport: "Support",
      nodeSupportSub: "Fast response",
      featuresKicker: "Why SlothVPN",
      featuresTitle: "Professional proxy infrastructure for people and teams",
      featuresDesc: "Speed, stability, subscription management and support in one clean interface.",
      features: [
        ["Protocol-ready", "Works with common proxy protocols and subscription formats."],
        ["Cross-platform", "Clear downloads for Windows, macOS and Android."],
        ["Subscription center", "Plans, orders, traffic, expiry and subscription URL in one place."],
        ["Support loop", "Announcements, tutorials, tickets and community links stay close."],
      ],
      pricingKicker: "Plans",
      pricingTitle: "Choose the right connection plan",
      pricingDesc: "Plans are loaded from XBoard in real time.",
      featured: "Popular",
      from: "From",
      per: "period",
      buyNow: "Buy plan",
      loginToBuy: "Sign in to buy",
      noPlans: "No public plans are available yet.",
      traffic: "Traffic",
      speed: "Speed",
      devices: "Devices",
      noLimit: "Unlimited",
      soldOut: "Sold out",
      downloadKicker: "Apps",
      downloadTitle: "Download SlothVPN clients",
      downloadDesc: "Make platform support obvious before users buy.",
      download: "Download",
      notReady: "Not configured",
      stepsKicker: "Get started",
      stepsTitle: "Connect in three steps",
      steps: [["Create account", "Sign up and enter your console."], ["Pick a plan", "Use coupons or gift cards at checkout."], ["Install and connect", "Copy subscription or sync with the app."]],
      faqKicker: "FAQ",
      faqTitle: "Common questions",
      faq: [["Multiple devices?", "Device limits are shown by plan."], ["Where is my subscription URL?", "Copy it in the console overview."], ["When does payment apply?", "Paid orders normally activate automatically."], ["Need help?", "Read tutorials or open a ticket."]],
      finalTitle: "A professional service surface for SlothVPN",
      finalDesc: "Landing page, conversion and customer operations now work together.",
      loginTitle: "Welcome back",
      loginLead: "Manage plans, subscriptions, orders and support.",
      registerTitle: "Create your SlothVPN account",
      registerLead: "Pick a plan, download apps and start connecting.",
      email: "Email",
      password: "Password",
      emailCode: "Email code",
      inviteCode: "Invite code",
      optional: "Optional",
      sendCode: "Send code",
      submitLogin: "Sign in",
      submitRegister: "Create account",
      noAccount: "No account? Create one",
      hasAccount: "Already have an account? Sign in",
      authTip: "Use at least 8 characters. Email code may be required.",
      portalTitle: "Subscription console",
      portalLead: "Manage traffic, orders, downloads, support and referrals.",
      overview: "Overview",
      subscription: "Subscription",
      orders: "Orders",
      downloads: "Downloads",
      support: "Support",
      invite: "Referrals",
      account: "Account",
      currentPlan: "Current plan",
      expireAt: "Expires",
      trafficUsage: "Traffic usage",
      balance: "Balance",
      commission: "Commission",
      copySub: "Copy subscription",
      renew: "Renew / buy",
      openTicket: "Open ticket",
      quickActions: "Quick actions",
      latestOrders: "Recent orders",
      latestNotices: "Notices",
      orderNo: "Order",
      amount: "Amount",
      status: "Status",
      createdAt: "Created",
      noOrders: "No orders yet.",
      noNotices: "No notices.",
      inviteCodes: "Invite codes",
      inviteStats: "Referral stats",
      registeredUsers: "Users",
      totalCommission: "Total",
      pendingCommission: "Pending",
      rate: "Rate",
      copied: "Copied",
      loginRequired: "Please sign in first.",
      networkError: "Request failed. Try again later.",
      authSaved: "Signed in. Opening console.",
      pageFeaturesTitle: "Product capabilities and service architecture",
      pageFeaturesLead: "Nodes, subscriptions, downloads, orders and support in one complete service loop.",
      pagePricingTitle: "Plans and checkout",
      pagePricingLead: "Choose billing periods, apply coupons and create orders.",
      pageDownloadTitle: "Client downloads and subscription import",
      pageDownloadLead: "Download clients, copy subscription links and follow tutorials.",
      pageSupportTitle: "Help, notices and ticket support",
      pageSupportLead: "FAQ, announcements, docs and tickets share one clear entry.",
      choosePeriod: "Billing period",
      couponCode: "Coupon",
      optionalCoupon: "Optional coupon",
      createOrder: "Create order",
      orderCreated: "Order created. Choose a payment method to continue.",
      pay: "Pay",
      cancelOrder: "Cancel",
      checkPayment: "Check payment",
      paymentMethod: "Payment method",
      noPayment: "No payment method is configured. Please contact support.",
      choosePaymentMethod: "Choose a payment method.",
      paymentOpening: "Payment page opened. Complete payment and come back to check status.",
      paymentQr: "Scan or open the payment link to complete payment.",
      freeOrderActivated: "Free order activated.",
      orderCanceled: "Order canceled.",
      paymentPending: "Order is still processing. Please check again later.",
      statusPending: "Pending",
      statusProcessing: "Processing",
      statusCanceled: "Canceled",
      statusDone: "Completed",
      operation: "Actions",
      planName: "Plan",
      period: "Period",
      openLink: "Open link",
      noTickets: "No tickets yet.",
      newTicket: "New ticket",
      ticketSubject: "Subject",
      ticketLevel: "Priority",
      ticketMessage: "Message",
      ticketCreated: "Ticket submitted.",
      ticketClosed: "Ticket closed.",
      low: "Low",
      medium: "Medium",
      high: "High",
      close: "Close",
      knowledgeBase: "Docs",
      noDocs: "No docs yet.",
      serverStatus: "Node status",
      noServers: "No nodes available or subscription inactive.",
      trafficLog: "Traffic log",
      noTraffic: "No traffic records.",
      changePassword: "Change password",
      oldPassword: "Old password",
      newPassword: "New password",
      save: "Save",
      passwordChanged: "Password changed. Please sign in again.",
      notifySettings: "Notifications",
      remindExpire: "Expiry reminder",
      remindTraffic: "Traffic reminder",
      saved: "Saved.",
      resetSecurity: "Reset subscription",
      resetSecurityDesc: "Reset UUID and subscription link if the old link leaked.",
      resetDone: "Subscription reset.",
      transferCommission: "Transfer commission to balance",
      transferAmount: "Amount",
      transferDone: "Commission transferred.",
      redeemGift: "Redeem gift card",
      giftCode: "Gift code",
      redeem: "Redeem",
      redeemed: "Redeemed.",
      giftHistory: "Redeem history",
      noGiftHistory: "No redeem records.",
      generateInvite: "Generate invite",
      inviteGenerated: "Invite code generated.",
      copyLink: "Copy link",
      copyFailed: "Copy failed. Please copy manually.",
      refresh: "Refresh",
      oneClickImport: "One-click import",
      manualSubscribe: "Backup subscription URL",
      importToApp: "Import to app",
      appImportFallback: "App did not open automatically. Install the app for your device, then try import again.",
      downloadForDevice: "App not installed yet? Choose your device download below.",
      appImportGuide: "Use one-click import to open SlothVPN app and add this subscription automatically.",
      telegramService: "Telegram service",
      openTelegramBot: "Open Telegram bot",
      copyBindCommand: "Copy bind command",
      telegramBindGuide: "Send the bind command in Telegram bot to connect this subscription.",
      telegramDiscuss: "Open discuss group",
      telegramUnavailable: "Telegram is not enabled on this site yet.",
      newUserOffer: "New users get 15% off automatically within 3 days after signup",
      newUserOfferBadge: "New user 15% off",
      resetPackTag: "Traffic reset pack",
      assistantTitle: "Business assistant",
      assistantLead: "Ask about plans, importing, payment, iOS download, or split mode. The assistant answers first and escalates to tickets when needed.",
      assistantTicket: "Open ticket",
      assistantPlaceholder: "Example: import subscription / iOS download / payment not active",
      assistantSuggested: "Suggested questions",
      assistantNoMatch: "No precise answer matched yet. Try another wording or open a ticket directly.",
    },
  }, customContent);

  text["zh-TW"] = mergeDeep(clone(text["zh-CN"]), {
    brandLine: "專業代理服務",
    navFeatures: "產品能力",
    navPricing: "方案價格",
    navDownload: "下載中心",
    navSupport: "幫助支援",
    navLogin: "登入",
    navRegister: "註冊",
    navPortal: "控制台",
    heroTitle: "為穩定存取與跨境協作打造的高速 VPN 服務",
    ctaPricing: "查看方案",
    ctaDownload: "立即下載",
    portalTitle: "訂閱營運中心",
  });

  text["ja-JP"] = mergeDeep(clone(text["en-US"]), {
    brandLine: "プロ向けプロキシサービス",
    navFeatures: "機能",
    navPricing: "料金",
    navDownload: "ダウンロード",
    navSupport: "サポート",
    navLogin: "ログイン",
    navRegister: "登録",
    navPortal: "コンソール",
    heroTitle: "安定したアクセスと越境ワークのための高速 VPN",
    heroLead: "SlothVPN は購読、支払い、ダウンロード、サポートを分かりやすい体験にまとめます。",
    ctaPricing: "プランを見る",
    ctaDownload: "アプリを入手",
    portalTitle: "購読コンソール",
  });

  text["vi-VN"] = mergeDeep(clone(text["en-US"]), {
    brandLine: "Dịch vụ proxy chuyên nghiệp",
    navFeatures: "Tính năng",
    navPricing: "Gói dịch vụ",
    navDownload: "Tải xuống",
    navSupport: "Hỗ trợ",
    navLogin: "Đăng nhập",
    navRegister: "Đăng ký",
    navPortal: "Bảng điều khiển",
    heroTitle: "VPN tốc độ cao cho truy cập ổn định và làm việc xuyên biên giới",
    heroLead: "SlothVPN gom đăng ký, thanh toán, tải ứng dụng và hỗ trợ vào một trải nghiệm rõ ràng.",
    ctaPricing: "Xem gói",
    ctaDownload: "Tải ứng dụng",
    portalTitle: "Trung tâm đăng ký",
  });

  text["ko-KR"] = mergeDeep(clone(text["en-US"]), {
    brandLine: "전문 프록시 서비스",
    navFeatures: "기능",
    navPricing: "요금제",
    navDownload: "다운로드",
    navSupport: "지원",
    navLogin: "로그인",
    navRegister: "가입",
    navPortal: "콘솔",
    heroTitle: "안정적인 접속과 글로벌 협업을 위한 고속 VPN",
    heroLead: "SlothVPN은 구독, 결제, 다운로드, 지원을 명확한 서비스 경험으로 정리합니다.",
    ctaPricing: "요금제 보기",
    ctaDownload: "앱 다운로드",
    portalTitle: "구독 운영 센터",
  });

  text["fa-IR"] = mergeDeep(clone(text["en-US"]), {
    brandLine: "سرویس حرفه‌ای پروکسی",
    navFeatures: "قابلیت‌ها",
    navPricing: "تعرفه‌ها",
    navDownload: "دانلود",
    navSupport: "پشتیبانی",
    navLogin: "ورود",
    navRegister: "ثبت‌نام",
    navPortal: "پنل",
    heroTitle: "VPN پرسرعت برای دسترسی پایدار و کار بین‌المللی",
    heroLead: "SlothVPN اشتراک، پرداخت، دانلود و پشتیبانی را در یک تجربه روشن و قابل اعتماد جمع می‌کند.",
    ctaPricing: "مشاهده تعرفه‌ها",
    ctaDownload: "دانلود برنامه",
    portalTitle: "مرکز مدیریت اشتراک",
  });

  Object.keys(customContent || {}).forEach((locale) => {
    text[locale] = mergeDeep(text[locale] || {}, customContent[locale]);
  });

  function safeJson(value, fallback) {
    if (!value || typeof value !== "string") return typeof value === "object" && value ? value : fallback;
    try {
      return JSON.parse(value);
    } catch (_) {
      return fallback;
    }
  }

  function normalizeLocales(value) {
    const defaults = ["zh-CN", "en-US", "ja-JP", "vi-VN", "ko-KR", "zh-TW", "fa-IR"];
    if (!value || typeof value !== "string") return defaults;
    const next = value.split(",").map((item) => item.trim()).filter(Boolean);
    return next.length ? next : defaults;
  }

  function clone(value) {
    return JSON.parse(JSON.stringify(value));
  }

  function mergeDeep(target, source) {
    if (!source || typeof source !== "object") return target;
    const output = Array.isArray(target) ? [...target] : { ...target };
    Object.keys(source).forEach((key) => {
      const sourceValue = source[key];
      const targetValue = output[key];
      if (sourceValue && typeof sourceValue === "object" && !Array.isArray(sourceValue)) {
        output[key] = mergeDeep(targetValue && typeof targetValue === "object" ? targetValue : {}, sourceValue);
      } else {
        output[key] = sourceValue;
      }
    });
    return output;
  }

  function t(key) {
    const active = text[state.locale] || text[defaultLocale] || text["zh-CN"];
    return active[key] ?? text["zh-CN"][key] ?? text["en-US"][key] ?? key;
  }

  function esc(value) {
    return String(value ?? "")
      .replaceAll("&", "&amp;")
      .replaceAll("<", "&lt;")
      .replaceAll(">", "&gt;")
      .replaceAll('"', "&quot;")
      .replaceAll("'", "&#039;");
  }

  function cssEsc(value) {
    return window.CSS?.escape ? window.CSS.escape(String(value)) : String(value).replace(/["\\]/g, "\\$&");
  }

  function api(path, options = {}) {
    const url = new URL(`/api/v1${path}`, window.location.origin);
    Object.entries(options.params || {}).forEach(([key, value]) => {
      if (value !== undefined && value !== null && value !== "") url.searchParams.set(key, value);
    });
    const headers = { Accept: "application/json" };
    if (options.body) headers["Content-Type"] = "application/json";
    if (options.auth !== false && state.auth) headers.Authorization = state.auth;
    return fetch(url.toString(), {
      method: options.method || (options.body ? "POST" : "GET"),
      headers,
      body: options.body ? JSON.stringify(options.body) : undefined,
    })
      .then(async (response) => {
        const payload = await response.json().catch(() => ({}));
        if (!response.ok || payload.status === "fail") {
          const message = Array.isArray(payload.message) ? payload.message.join(" / ") : payload.message;
          throw new Error(message || payload.error?.message || t("networkError"));
        }
        if (options.raw) return payload;
        return payload.data !== undefined ? payload.data : payload;
      });
  }

  function formatMoney(value) {
    const symbol = context.currency_symbol || "¥";
    const amount = Number(value || 0) / 100;
    return `${symbol}${amount.toFixed(amount % 1 ? 2 : 0)}`;
  }

  function formatBytes(value) {
    const num = Number(value || 0);
    if (!num) return "0 B";
    const units = ["B", "KB", "MB", "GB", "TB", "PB"];
    const index = Math.min(Math.floor(Math.log(num) / Math.log(1024)), units.length - 1);
    return `${(num / Math.pow(1024, index)).toFixed(index < 2 ? 0 : 1)} ${units[index]}`;
  }

  function formatDate(value) {
    if (!value) return "-";
    const num = Number(value);
    const date = Number.isFinite(num) ? new Date(num > 10000000000 ? num : num * 1000) : new Date(value);
    if (Number.isNaN(date.getTime())) return "-";
    return date.toLocaleDateString(state.locale, { year: "numeric", month: "short", day: "numeric" });
  }

  function bestPrice(plan) {
    const available = priceOptions(plan).sort((a, b) => a.value - b.value);
    const recurring = available.filter((item) => item.key !== "reset_price");
    return recurring[0] || available[0] || { key: "month_price", label: t("per"), value: 0 };
  }

  function resetPackPrice(plan) {
    const available = priceOptions(plan);
    return available.find((item) => item.key === "reset_price") || null;
  }

  function configuredNewUserOffer() {
    const rawPercent = Number(config.new_user_discount_percent ?? config.new_user_offer_percent ?? 15);
    const rawDays = Number(config.new_user_discount_days ?? config.new_user_offer_days ?? 3);
    const percent = Number.isFinite(rawPercent) && rawPercent > 0 ? rawPercent : 15;
    const days = Number.isFinite(rawDays) && rawDays > 0 ? rawDays : 3;
    return { percent, days };
  }

  function parseFlexibleDate(value) {
    if (!value) return null;
    const num = Number(value);
    const date = Number.isFinite(num) ? new Date(num > 10000000000 ? num : num * 1000) : new Date(value);
    if (Number.isNaN(date.getTime())) return null;
    return date;
  }

  function isNewUserEligible() {
    const createdAt = parseFlexibleDate(state.user?.created_at);
    if (!createdAt) return false;
    const { days } = configuredNewUserOffer();
    const delta = Date.now() - createdAt.getTime();
    return delta >= 0 && delta <= days * 24 * 60 * 60 * 1000;
  }

  function periodLabels() {
    return {
      month_price: state.locale === "zh-CN" ? "月付" : "Monthly",
      quarter_price: state.locale === "zh-CN" ? "季付" : "Quarterly",
      half_year_price: state.locale === "zh-CN" ? "半年付" : "Half-year",
      year_price: state.locale === "zh-CN" ? "年付" : "Yearly",
      two_year_price: state.locale === "zh-CN" ? "两年付" : "2 years",
      three_year_price: state.locale === "zh-CN" ? "三年付" : "3 years",
      onetime_price: state.locale === "zh-CN" ? "一次性" : "One-time",
      reset_price: state.locale === "zh-CN" ? "重置流量包" : "Traffic reset",
    };
  }

  function priceOptions(plan) {
    const labels = periodLabels();
    return Object.keys(labels)
      .map((key) => ({ key, label: labels[key], value: Number(plan[key] || 0) }))
      .filter((item) => item.value > 0);
  }

  function orderStatusText(status) {
    const map = {
      0: t("statusPending"),
      1: t("statusProcessing"),
      2: t("statusCanceled"),
      3: t("statusDone"),
      4: state.locale === "zh-CN" ? "已折抵" : "Offset",
    };
    return map[Number(status)] || String(status ?? "-");
  }

  function plainText(html, limit = 160) {
    return String(html || "").replace(/<[^>]*>/g, "").replace(/\s+/g, " ").trim().slice(0, limit);
  }

  function cleanPlanDescription(raw, limit = 0) {
    const normalized = String(raw || "")
      .replace(/<br\s*\/?>/gi, " ")
      .replace(/<\/p>/gi, " ")
      .replace(/<[^>]*>/g, " ")
      .replace(/\[(.*?)\]\((.*?)\)/g, "$1")
      .replace(/[*_`~>#-]+/g, " ")
      .replace(/[\u{1F300}-\u{1FAFF}\u{2600}-\u{27BF}]/gu, " ")
      .replace(/[|｜/]/g, " · ")
      .replace(/\s+/g, " ")
      .trim();
    if (!normalized) return "";
    if (!limit || limit <= 0) return normalized;
    return normalized.length > limit ? `${normalized.slice(0, limit)}...` : normalized;
  }

  function resolvePlanSummary(plan, limit = 180) {
    const displaySummary = cleanPlanDescription(plan?.display_summary || "", limit);
    if (displaySummary) return displaySummary;
    return cleanPlanDescription(plan?.content || "", limit);
  }

  function resolvePlanHighlights(plan) {
    const list = [];
    const raw = plan?.display_highlights_json ?? plan?.display_highlights;
    if (Array.isArray(raw)) {
      raw.forEach((item) => {
        const text = cleanPlanDescription(item, 52);
        if (text) list.push(text);
      });
    } else if (typeof raw === "string" && raw.trim()) {
      try {
        const parsed = JSON.parse(raw);
        if (Array.isArray(parsed)) {
          parsed.forEach((item) => {
            const text = cleanPlanDescription(item, 52);
            if (text) list.push(text);
          });
        } else {
          raw.split(/[\n;|]/g).forEach((item) => {
            const text = cleanPlanDescription(item, 52);
            if (text) list.push(text);
          });
        }
      } catch (_) {
        raw.split(/[\n;|]/g).forEach((item) => {
          const text = cleanPlanDescription(item, 52);
          if (text) list.push(text);
        });
      }
    }
    if (!list.length && Array.isArray(plan?.tags)) {
      plan.tags.forEach((item) => {
        const text = cleanPlanDescription(item, 42);
        if (text) list.push(text);
      });
    }
    return [...new Set(list)].slice(0, 6);
  }

  function planHiddenReasonText(reason) {
    const code = String(reason || "").trim().toLowerCase();
    if (state.locale.startsWith("zh")) {
      if (code === "capacity_limit") return "该套餐当前容量已满，可先选择其它套餐。";
      if (code === "sell_disabled") return "该套餐暂停售卖，稍后可刷新查看。";
      if (code === "no_period") return "该套餐暂未配置可购买周期。";
      if (code === "hidden") return "该套餐暂不可见，请联系站点支持。";
      return "该套餐当前不可购买。";
    }
    if (code === "capacity_limit") return "This plan is currently full. Please pick another one.";
    if (code === "sell_disabled") return "This plan is currently unavailable.";
    if (code === "no_period") return "No billing period is available for this plan yet.";
    if (code === "hidden") return "This plan is currently hidden.";
    return "This plan is not purchasable right now.";
  }

  function currentPath() {
    return window.location.pathname || "/";
  }

  function currentSearch() {
    return new URLSearchParams(window.location.search || "");
  }

  function rememberedInviteCode() {
    return localStorage.getItem(inviteStorageKey) || "";
  }

  function rememberedClaimId() {
    return localStorage.getItem(claimStorageKey) || "";
  }

  function captureAttributionFromLocation() {
    const search = currentSearch();
    const inviteCode = (search.get("invite_code") || "").trim();
    const claimId = (search.get("claim_id") || "").trim();
    if (inviteCode) localStorage.setItem(inviteStorageKey, inviteCode);
    if (claimId) localStorage.setItem(claimStorageKey, claimId);
  }

  function applyBrandTheme() {
    const style = document.documentElement.style;
    if (brandProfile.primary_color) style.setProperty("--brand", String(brandProfile.primary_color));
    if (brandProfile.secondary_color) style.setProperty("--brand-2", String(brandProfile.secondary_color));
    if (brandProfile.accent_color) style.setProperty("--ok", String(brandProfile.accent_color));
    if (brandProfile.font_family) {
      style.setProperty("--font", `"${String(brandProfile.font_family)}", "Sora", "Noto Sans SC", "PingFang SC", "Microsoft YaHei", sans-serif`);
    }
  }

  function portalHref(path = "/portal") {
    return state.auth ? path : `/auth/login?redirect=${encodeURIComponent(path)}`;
  }

  function resolveConfiguredHref(value) {
    const raw = String(value || "").trim();
    if (!raw) return "#";
    const aliases = {
      "@portal": portalHref("/portal"),
      "@portal_plans": portalHref("/portal/plans"),
      "@portal_help": portalHref("/portal/help"),
      "@portal_orders": portalHref("/portal/orders"),
      "@portal_growth": portalHref("/portal/growth"),
      "@operator_path": context.operator_path || portalHref("/portal/security"),
      "@support": "/support",
      "@download": "/download",
      "@pricing": "/pricing",
    };
    return aliases[raw] || raw;
  }

  function normalizeExternalUrl(value) {
    const raw = String(value || "").trim();
    if (!raw) return "";
    if (/^https?:\/\//i.test(raw)) return raw;
    if (raw.startsWith("@")) return `https://t.me/${raw.slice(1)}`;
    if (raw.startsWith("t.me/")) return `https://${raw}`;
    if (/^[\w-]+$/.test(raw)) return `https://t.me/${raw}`;
    return `https://${raw.replace(/^\/+/, "")}`;
  }

  function resolveSupportLinks() {
    const configured = safeJson(config.support_links_json, {});
    const commConfig = state.commConfig || {};
    const botUsername = String(state.telegramBot?.username || "").replace(/^@+/, "");
    const botLink = botUsername ? `https://t.me/${botUsername}` : "";
    const discussLink = normalizeExternalUrl(configured.telegram_discuss || commConfig.telegram_discuss_link || "");
    const telegramLink = normalizeExternalUrl(configured.telegram || discussLink || botLink);
    const email = String(configured.email || "").trim();
    return {
      telegram: telegramLink,
      telegram_discuss: discussLink,
      telegram_bot: botLink,
      telegram_username: botUsername,
      email,
    };
  }

  function buildAppImportLink(subscribeUrl) {
    const raw = String(subscribeUrl || "").trim();
    if (!raw) return "";
    const name = brandProfile.name || settings.title || "SlothVPN";
    return `slothvpn://import?url=${encodeURIComponent(raw)}&name=${encodeURIComponent(name)}`;
  }

  function resolveIosGuideHref() {
    const candidates = [
      config.ios_guide_url,
      context.downloads?.ios?.guide_url,
      portalSchema?.ios_guide_url,
      state.auth ? "/portal/help" : "/support",
    ];
    for (const item of candidates) {
      const value = String(item || "").trim();
      if (value) return value;
    }
    return state.auth ? "/portal/help" : "/support";
  }

  function resolveIosGuideTitle() {
    const candidates = [
      config.ios_guide_title,
      context.downloads?.ios?.guide_title,
      state.locale.startsWith("zh") ? "iOS 安装教程" : "iOS install guide",
    ];
    for (const item of candidates) {
      const value = String(item || "").trim();
      if (value) return value;
    }
    return state.locale.startsWith("zh") ? "iOS 安装教程" : "iOS install guide";
  }

  function resolveIosGuideMarkdown() {
    return String(config.ios_guide_markdown || context.downloads?.ios?.guide_markdown || "").trim();
  }

  function renderDeviceDownloadButtons(downloads) {
    const items = [
      ["windows", "Windows"],
      ["macos", "macOS"],
      ["android", "Android"],
      ["ios", "iOS"],
    ];
    const buttons = items.map(([key, label]) => {
      const url = String(downloads?.[key]?.url || "").trim();
      if (!url) return "";
      return `<a class="btn" href="${esc(url)}" target="_blank" rel="noreferrer">${esc(label)} · ${esc(t("download"))}</a>`;
    }).filter(Boolean);
    const iosGuideHref = resolveIosGuideHref();
    const iosGuideTitle = resolveIosGuideTitle();
    const iosGuide = `<a class="btn" href="${esc(iosGuideHref)}" ${iosGuideHref.startsWith("/") ? `data-nav="${esc(iosGuideHref)}"` : `target="_blank" rel="noreferrer"`}>${esc(iosGuideTitle)}</a>`;
    return buttons.length ? `${buttons.join("")}${iosGuide}` : iosGuide;
  }

  function configuredItems(items, fallback) {
    return Array.isArray(items) && items.length ? items : fallback;
  }

  function defaultLandingBlocks() {
    const isZh = state.locale.startsWith("zh");
    return [
      {
        title: isZh ? "全局模式" : "Global mode",
        description: isZh ? "所有应用统一走代理，适合稳定连接与公共网络防护。" : "Route every app through the gateway for maximum stability and protection.",
        href: "@portal",
        cta_label: isZh ? "打开控制台" : "Open console",
      },
      {
        title: isZh ? "智能分流" : "Smart split",
        description: isZh ? "只代理真正需要加速的流量，减少聊天、支付、本地服务的冲突。" : "Proxy only the traffic that actually needs acceleration and keep local apps clean.",
        href: "@support",
        cta_label: isZh ? "查看说明" : "Learn more",
      },
      {
        title: isZh ? "白牌交付" : "White-label ready",
        description: isZh ? "同一套产品同时服务终端用户与机场运营者，支持品牌化交付。" : "One product surface for both subscribers and operators with white-label delivery.",
        href: "@operator_path",
        cta_label: isZh ? "进入运营台" : "Open workspace",
      },
    ];
  }

  function defaultConsoleSpotlight() {
    const isZh = state.locale.startsWith("zh");
    return [
      {
        badge: isZh ? "核心入口" : "Core entry",
        title: isZh ? "用户控制台" : "User console",
        description: isZh ? "集中处理连接、套餐、订单、下载和同步订阅，是用户日常使用的主入口。" : "Handle plans, orders, downloads and subscriptions from one daily control surface.",
        href: "@portal",
        cta_label: isZh ? "进入控制台" : "Open console",
      },
      {
        badge: isZh ? "运营入口" : "Operator",
        title: isZh ? "机场主工作台" : "Operator workspace",
        description: isZh ? "统一查看品牌、支付、下载分发、节点表现和用户增长。" : "Track brand, payments, downloads, node quality and user growth in one workspace.",
        href: "@operator_path",
        cta_label: isZh ? "打开运营台" : "Open workspace",
      },
      {
        badge: isZh ? "帮助中心" : "Support",
        title: isZh ? "教程与排障" : "Guides & diagnostics",
        description: isZh ? "把下载、导入、支付、邀请和常见故障整理成用户真正看得懂的教程。" : "Turn downloads, imports, payments and recovery paths into user-readable guides.",
        href: "@support",
        cta_label: isZh ? "查看帮助" : "View guides",
      },
    ];
  }

  function defaultHelpCenterDocs() {
    const isZh = state.locale.startsWith("zh");
    return [
      {
        tag: isZh ? "新手上手" : "Getting started",
        title: isZh ? "从注册到连通的快速开始" : "Go from signup to connected in one flow",
        description: isZh ? "注册账号、选择套餐、下载客户端、导入订阅的一整套标准流程。" : "The full path from signup to plan purchase, download and subscription import.",
        href: "@download",
        cta_label: isZh ? "打开教程" : "Open guide",
      },
      {
        tag: isZh ? "分流模式" : "Routing",
        title: isZh ? "全局模式与智能分流怎么选" : "Choose between global and smart split",
        description: isZh ? "告诉用户什么场景适合全局代理，什么场景适合按应用分流。" : "Explain when to proxy everything and when to keep local traffic bypassed.",
        href: "@support",
        cta_label: isZh ? "查看说明" : "Read guide",
      },
      {
        tag: isZh ? "支付与订单" : "Payments",
        title: isZh ? "支付成功后为什么还没生效" : "Why an order may not activate immediately",
        description: isZh ? "集中解释支付跳转、订单状态刷新、套餐开通与回调延迟问题。" : "Cover payment redirects, delayed callbacks, order refresh and activation timing.",
        href: "@portal_orders",
        cta_label: isZh ? "查看订单" : "Open orders",
      },
      {
        tag: isZh ? "邀请返利" : "Referrals",
        title: isZh ? "邀请码、下载链接与 App 归因怎么用" : "How referral links and app attribution work",
        description: isZh ? "帮助用户正确分享注册链接、下载链接和 App 首开归因链接。" : "Show how to share signup links, download links and app first-open attribution links.",
        href: "@portal_growth",
        cta_label: isZh ? "查看增长中心" : "Open growth center",
      },
    ];
  }

  function renderActionCards(items, className = "spotlight-grid") {
    if (!items.length) return "";
    const cardClass = className.includes("help-docs") ? "doc-card" : "spotlight-card";
    return `<div class="grid ${className}">${items.map((item) => {
      const primaryHref = resolveConfiguredHref(item.href);
      const secondaryHref = resolveConfiguredHref(item.secondary_href);
      const badge = item.badge ? `<span class="card-label">${esc(item.badge)}</span>` : "";
      const primaryAction = item.cta_label ? `<a class="btn primary" href="${esc(primaryHref)}" ${primaryHref.startsWith("/") ? `data-nav="${esc(primaryHref)}"` : ""}>${esc(item.cta_label)}</a>` : "";
      const secondaryAction = item.secondary_label ? `<a class="btn" href="${esc(secondaryHref)}" ${secondaryHref.startsWith("/") ? `data-nav="${esc(secondaryHref)}"` : ""}>${esc(item.secondary_label)}</a>` : "";
      return `<article class="card ${cardClass}">${badge}<h3>${esc(item.title || "")}</h3><p>${esc(item.description || "")}</p><div class="hero-actions">${primaryAction}${secondaryAction}</div></article>`;
    }).join("")}</div>`;
  }

  function renderHelpCenterDocs() {
    const docs = configuredItems(helpCenterConfig, defaultHelpCenterDocs());
    return renderActionCards(docs, "help-docs-grid");
  }

  function assistantKnowledgeBase() {
    const isZh = state.locale.startsWith("zh");
    const faqItems = (t("faq") || []).map((item) => ({
      question: item[0],
      answer: item[1],
    }));
    const extras = [
      {
        question: isZh ? "怎么导入订阅到 App？" : "How do I import my subscription into the app?",
        answer: t("appImportGuide"),
      },
      {
        question: isZh ? "iOS 怎么下载安装？" : "How do I install on iOS?",
        answer: resolveIosGuideHref()
          ? (isZh
              ? `iOS 需要按站点教程完成下载准备，下载中心里已经配置了 iOS 教程入口。`
              : "iOS requires the site guide for download preparation. The download center already provides the iOS guide entry.")
          : (isZh
              ? "iOS 下载方式需要在后台配置教程链接，当前还没有配置完成。"
              : "The iOS download flow needs a configured guide link and is not set up yet."),
      },
      {
        question: isZh ? "付款后多久会生效？" : "How long does payment take to activate?",
        answer: isZh
          ? "正常支付成功后会自动开通套餐。若订单没有立即变更，请先检查订单状态，再刷新套餐与订阅。"
          : "Paid orders usually activate automatically. If the order does not update right away, check order status first, then refresh your plan and subscription.",
      },
      {
        question: isZh ? "分流模式有什么用？" : "What is split mode for?",
        answer: isZh
          ? "分流模式只让指定应用走代理，本地网络和直连目标保持原样，适合本地支付、国内访问和 SSH 直连场景。"
          : "Split mode only proxies selected apps while local traffic and direct targets stay on the normal network, which is useful for payments, local access, and SSH direct scenarios.",
      },
    ];
    return [...extras, ...faqItems];
  }

  function scoreAssistantAnswer(entry, query) {
    const normalizedQuery = String(query || "").toLowerCase().trim();
    if (!normalizedQuery) return 1;
    const combined = `${entry.question || ""} ${entry.answer || ""}`.toLowerCase();
    let score = 0;
    if (combined.includes(normalizedQuery)) score += 12;
    normalizedQuery.split(/\s+/).filter(Boolean).forEach((token) => {
      if (String(entry.question || "").toLowerCase().includes(token)) score += 6;
      if (combined.includes(token)) score += 2;
    });
    return score;
  }

  function assistantMatches(query) {
    const scored = assistantKnowledgeBase()
      .map((item) => ({ item, score: scoreAssistantAnswer(item, query) }))
      .filter((entry) => !query || entry.score > 0)
      .sort((a, b) => b.score - a.score);
    return (scored.length ? scored : assistantKnowledgeBase().map((item) => ({ item, score: 1 })))
      .map((entry) => entry.item)
      .slice(0, 4);
  }

  function assistantHistory() {
    if (!Array.isArray(state.assistantChatHistory)) state.assistantChatHistory = [];
    if (!state.assistantChatHistory.length) {
      state.assistantChatHistory.push({
        role: "assistant",
        content: state.auth
          ? t("assistantLead")
          : (state.locale.startsWith("zh")
              ? "请先登录后提问，这样助手可以结合你的套餐与订单状态回答。"
              : "Please sign in first so the assistant can answer with your account context."),
      });
    }
    return state.assistantChatHistory;
  }

  function pushAssistantHistory(role, content) {
    const message = String(content || "").trim();
    if (!message) return;
    assistantHistory().push({ role, content: message });
    if (state.assistantChatHistory.length > 16) {
      state.assistantChatHistory = state.assistantChatHistory.slice(state.assistantChatHistory.length - 16);
    }
  }

  function assistantHistoryPayload() {
    return assistantHistory().map((item) => ({
      role: item.role === "user" ? "user" : "assistant",
      content: String(item.content || ""),
    }));
  }

  function assistantBubbleHtml(item) {
    const role = item.role === "user" ? "user" : "assistant";
    return `<div class="assistant-bubble ${role}"><p>${esc(item.content || "")}</p></div>`;
  }

  function renderAssistantSuggestions(query) {
    const suggestions = assistantMatches(query).slice(0, 3);
    if (!suggestions.length) return "";
    return `<div class="assistant-suggestions"><span>${esc(t("assistantSuggested"))}</span>${suggestions.map((item) => `
      <button class="assistant-chip" type="button" data-action="assistant-question" data-question="${esc(item.question)}">${esc(item.question)}</button>
    `).join("")}</div>`;
  }

  function renderAssistantHistory(wrapper, query = "") {
    const output = wrapper?.querySelector("[data-assistant-results]");
    if (!output) return;
    output.innerHTML = `
      <div class="assistant-history">
        ${assistantHistory().map((item) => assistantBubbleHtml(item)).join("")}
      </div>
      ${renderAssistantSuggestions(query)}
    `;
    const historyNode = output.querySelector(".assistant-history");
    if (historyNode) historyNode.scrollTop = historyNode.scrollHeight;
  }

  async function assistantAsk(wrapper, query) {
    const textQuery = String(query || "").trim();
    if (!textQuery) return;
    if (!state.auth) {
      navigate(`/auth/login?redirect=${encodeURIComponent(currentPath())}`);
      return;
    }

    const sendButton = wrapper?.querySelector("[data-action='assistant-send']");
    if (sendButton) sendButton.disabled = true;
    pushAssistantHistory("user", textQuery);
    renderAssistantHistory(wrapper, textQuery);

    try {
      const data = await api("/user/assistant/chat", {
        method: "POST",
        body: {
          query: textQuery,
          messages: assistantHistoryPayload(),
        },
      });
      const answer = String(data?.answer || "").trim();
      if (answer) {
        pushAssistantHistory("assistant", answer);
      } else {
        pushAssistantHistory("assistant", t("assistantNoMatch"));
      }
    } catch (error) {
      const fallback = assistantMatches(textQuery)[0]?.answer || t("assistantNoMatch");
      pushAssistantHistory("assistant", fallback);
      setMessage(error.message || t("networkError"), "error");
    } finally {
      if (sendButton) sendButton.disabled = false;
      renderAssistantHistory(wrapper, "");
    }
  }

  async function assistantTicketHandoff() {
    const lastQuestion = [...assistantHistory()].reverse().find((item) => item.role === "user")?.content || "";
    const lastAnswer = [...assistantHistory()].reverse().find((item) => item.role !== "user")?.content || "";
    if (!state.auth) {
      navigate("/auth/login?redirect=/portal/help");
      return;
    }
    try {
      await api("/user/assistant/ticket-handoff", {
        method: "POST",
        body: {
          question: lastQuestion,
          answer: lastAnswer,
          context: `path=${currentPath()}`,
        },
      });
      setMessage(state.locale.startsWith("zh") ? "已转人工工单，请继续补充问题详情。" : "Handed off to ticket. Please add more details.", "success");
      navigate("/portal/help");
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
      navigate("/portal/help");
    }
  }

  function renderAssistantWidget() {
    const shortLabel = state.locale.startsWith("zh") ? "助手" : "AI";
    assistantHistory();
    return `
      <div class="assistant-widget" data-assistant>
        <button class="assistant-trigger" data-action="assistant-toggle" data-assistant-handle aria-expanded="false" aria-label="${esc(t("assistantTitle"))}">
          <span class="assistant-trigger-icon">AI</span>
          <span class="assistant-trigger-text">${esc(shortLabel)}</span>
        </button>
        <div class="assistant-panel">
          <h3>${esc(t("assistantTitle"))}</h3>
          <p>${esc(t("assistantLead"))}</p>
          <div data-assistant-results></div>
          <div class="assistant-compose">
            <label class="assistant-field">
              <input type="text" data-assistant-query placeholder="${esc(t("assistantPlaceholder"))}" />
            </label>
            <button class="btn primary small" type="button" data-action="assistant-send">${esc(state.locale.startsWith("zh") ? "发送" : "Send")}</button>
          </div>
          <div class="assistant-actions">
            <button class="btn" type="button" data-action="assistant-ticket">${esc(t("assistantTicket"))}</button>
          </div>
        </div>
      </div>
    `;
  }

  function setupAssistantWidget() {
    const wrapper = document.querySelector("[data-assistant]");
    if (!wrapper || wrapper.dataset.dragReady === "1") return;
    wrapper.dataset.dragReady = "1";
    const handle = wrapper.querySelector("[data-assistant-handle]");
    if (!handle) return;
    const saved = safeJson(localStorage.getItem(assistantPosStorageKey), null);
    if (saved && Number.isFinite(saved.right) && Number.isFinite(saved.bottom)) {
      wrapper.style.right = `${saved.right}px`;
      wrapper.style.bottom = `${saved.bottom}px`;
      wrapper.style.left = "auto";
      wrapper.style.top = "auto";
    }
    let pointerId = null;
    let startX = 0;
    let startY = 0;
    let originRight = 0;
    let originBottom = 0;
    let dragging = false;

    function persistPosition() {
      const rect = wrapper.getBoundingClientRect();
      const right = Math.round(window.innerWidth - rect.right);
      const bottom = Math.round(window.innerHeight - rect.bottom);
      localStorage.setItem(assistantPosStorageKey, JSON.stringify({ right, bottom }));
    }

    function finalize(event) {
      if (pointerId === null || event.pointerId !== pointerId) return;
      if (handle.hasPointerCapture(pointerId)) {
        handle.releasePointerCapture(pointerId);
      }
      const wasDragging = dragging;
      pointerId = null;
      dragging = false;
      wrapper.classList.remove("dragging");
      if (wasDragging) {
        const rect = wrapper.getBoundingClientRect();
        const leftDistance = rect.left;
        const rightDistance = window.innerWidth - rect.right;
        const maxRight = Math.max(12, window.innerWidth - rect.width - 12);
        const snapRight = rightDistance <= leftDistance ? 12 : maxRight;
        const maxBottom = Math.max(12, window.innerHeight - rect.height - 12);
        const snapBottom = Math.max(12, Math.min(maxBottom, window.innerHeight - rect.bottom));
        wrapper.style.right = `${snapRight}px`;
        wrapper.style.bottom = `${snapBottom}px`;
        wrapper.style.left = "auto";
        wrapper.style.top = "auto";
        wrapper.dataset.justDragged = "1";
        window.setTimeout(() => {
          wrapper.dataset.justDragged = "0";
        }, 220);
      }
      persistPosition();
    }

    handle.addEventListener("pointerdown", (event) => {
      if (event.button !== 0) return;
      pointerId = event.pointerId;
      dragging = false;
      startX = event.clientX;
      startY = event.clientY;
      const rect = wrapper.getBoundingClientRect();
      originRight = window.innerWidth - rect.right;
      originBottom = window.innerHeight - rect.bottom;
      handle.setPointerCapture(pointerId);
    });

    handle.addEventListener("pointermove", (event) => {
      if (pointerId === null || event.pointerId !== pointerId) return;
      const dx = event.clientX - startX;
      const dy = event.clientY - startY;
      if (!dragging && Math.abs(dx) + Math.abs(dy) >= 9) {
        dragging = true;
        wrapper.classList.add("dragging");
      }
      if (!dragging) return;
      const maxRight = Math.max(12, window.innerWidth - 56);
      const maxBottom = Math.max(12, window.innerHeight - 56);
      const nextRight = Math.max(12, Math.min(maxRight, originRight - dx));
      const nextBottom = Math.max(12, Math.min(maxBottom, originBottom - dy));
      wrapper.style.right = `${nextRight}px`;
      wrapper.style.bottom = `${nextBottom}px`;
      wrapper.style.left = "auto";
      wrapper.style.top = "auto";
    });

    handle.addEventListener("pointerup", finalize);
    handle.addEventListener("pointercancel", finalize);
  }

  function navigate(path) {
    history.pushState({}, "", path);
    captureAttributionFromLocation();
    render();
    window.scrollTo({ top: 0, behavior: "smooth" });
  }

  function sectionRoute(path) {
    const map = { "/pricing": "pricing", "/download": "download", "/features": "features", "/support": "support" };
    return map[path];
  }

  async function loadPublic() {
    try {
      state.publicConfig = await api("/guest/comm/config", { auth: false });
    } catch (_) {
      state.publicConfig = {};
    }
    try {
      state.plans = await api("/guest/plan/fetch", { auth: false });
    } catch (_) {
      state.plans = [];
    }
    render();
  }

  async function loadProtected() {
    if (!state.auth) return;
    try {
      state.user = await api("/user/info");
    } catch (_) {
      logout(false);
      render();
      return;
    }
    await Promise.all([
      api("/user/getSubscribe").then((data) => { state.subscription = data; }).catch(() => {}),
      api("/user/order/fetch").then((data) => { state.orders = data || []; }).catch(() => {}),
      api("/user/notice/fetch").then((data) => { state.notices = data?.data || data || []; }).catch(() => {}),
      api("/user/invite/fetch").then((data) => {
        state.invite = data;
        const primaryInvite = Array.isArray(data?.codes) && data.codes[0]?.code ? String(data.codes[0].code).trim() : "";
        if (primaryInvite) localStorage.setItem(inviteStorageKey, primaryInvite);
      }).catch(() => {}),
      api("/user/order/getPaymentMethod").then((data) => { state.paymentMethods = data || []; }).catch(() => {}),
      api("/user/ticket/fetch").then((data) => { state.tickets = data || []; }).catch(() => {}),
      api("/user/getStat").then((data) => { state.stats = data || []; }).catch(() => {}),
      api("/user/stat/getTrafficLog").then((data) => { state.trafficLogs = data || []; }).catch(() => {}),
      api("/user/server/fetch").then((data) => { state.servers = data || []; }).catch(() => {}),
      api("/user/knowledge/fetch", { params: { language: state.locale } }).then((data) => { state.knowledge = data || {}; }).catch(() => {}),
      api("/user/gift-card/history", { params: { per_page: 6 } }).then((data) => { state.giftHistory = data || []; }).catch(() => {}),
      api("/user/comm/config")
        .then(async (data) => {
          state.commConfig = data || {};
          if (Number(data?.is_telegram) === 1) {
            try {
              state.telegramBot = await api("/user/telegram/getBotInfo");
            } catch (_) {
              state.telegramBot = null;
            }
          } else {
            state.telegramBot = null;
          }
        })
        .catch(() => {
          state.commConfig = {};
          state.telegramBot = null;
        }),
    ]);
    render();
  }

  function setLocale(locale) {
    if (!locales.includes(locale)) return;
    state.locale = locale;
    localStorage.setItem("slothpro_locale", locale);
    document.documentElement.lang = locale;
    document.documentElement.dir = locale === "fa-IR" ? "rtl" : "ltr";
    render();
    if (state.auth) loadProtected();
  }

  function setMessage(message, type = "success") {
    state.message = { message, type };
    render();
  }

  function logout(refresh = true) {
    state.auth = "";
    state.user = null;
    state.subscription = null;
    state.orders = [];
    state.invite = null;
    localStorage.removeItem("slothpro_auth_data");
    localStorage.removeItem("slothpro_user_token");
    if (refresh) navigate("/");
  }

  function shell(content, active = "") {
    const loggedIn = Boolean(state.user);
    const isZh = state.locale.startsWith("zh");
    const logoUrl = brandProfile.logo_url || "/theme/SlothPro/assets/slothvpn-logo.svg";
    const hasLogo = Boolean(logoUrl);
    const logo = hasLogo ? `<img src="${esc(logoUrl)}" alt="${esc(settings.title)}" />` : `<span>S</span>`;
    const brandName = brandProfile.name || settings.title || "SlothVPN";
    const brandLine = brandProfile.tagline || t("brandLine");
    const localeOptions = locales.map((locale) => `<option value="${esc(locale)}" ${locale === state.locale ? "selected" : ""}>${esc(localeNames[locale] || locale)}</option>`).join("");
    const consoleHref = loggedIn ? "/portal" : portalHref("/portal");
    const nav = [
      ["/features", t("navFeatures")],
      ["/pricing", t("navPricing")],
      ["/download", t("navDownload")],
      ["/support", t("navSupport")],
    ].map(([path, label, extraClass = ""]) => {
      const isActive = active === path || (String(path).startsWith("/portal") && active === "/portal");
      const classes = [isActive ? "active" : "", extraClass].filter(Boolean).join(" ");
      return `<a href="${path}" data-nav="${path}" class="${classes}">${esc(label)}</a>`;
    }).join("");
    const accountLinks = loggedIn
      ? `<button class="btn" data-action="logout">${esc(t("logout"))}</button>`
      : `<a class="btn ghost" href="/auth/login" data-nav="/auth/login">${esc(t("navLogin"))}</a><a class="btn primary" href="/auth/register" data-nav="/auth/register">${esc(t("navRegister"))}</a>`;
    const dockSecondaryHref = featureFlags.operator_console_enabled && context.operator_path
      ? context.operator_path
      : "/download";
    const dockSecondaryLabel = featureFlags.operator_console_enabled && context.operator_path
      ? (isZh ? "运营台" : "Workspace")
      : t("ctaDownload");
    const assistantWidget = renderAssistantWidget();
    return `
      <div class="app-shell">
        <header class="topbar">
          <div class="container topbar-inner">
            <a class="brand" href="/" data-nav="/">
              <span class="${hasLogo ? "brand-logo" : "brand-glyph"}">${logo}</span>
              <span class="brand-text">
                <span class="brand-name">${esc(brandName)}</span>
                <span class="brand-sub">${esc(brandLine)}</span>
              </span>
            </a>
            <nav class="nav">${nav}</nav>
            <div class="top-actions">
              <select class="locale-select" data-action="locale">${localeOptions}</select>
              ${accountLinks}
              <button class="menu-toggle" data-action="menu">☰</button>
            </div>
          </div>
          <div class="mobile-menu" id="mobile-menu">${nav}${accountLinks}<select class="locale-select" data-action="locale">${localeOptions}</select></div>
        </header>
        <main>${content}</main>
        <div class="mobile-dock">
          <a class="btn primary console-entry" href="${esc(consoleHref)}" data-nav="${esc(consoleHref)}">${esc(loggedIn ? t("navPortal") : t("ctaPortal"))}</a>
          <a class="btn" href="${esc(dockSecondaryHref)}" ${dockSecondaryHref.startsWith("/") ? `data-nav="${esc(dockSecondaryHref)}"` : `target="_blank" rel="noreferrer"`}>${esc(dockSecondaryLabel)}</a>
        </div>
        ${assistantWidget}
        <footer class="footer">
          <div class="container footer-inner">
            <span>${esc(brandName)} · ${esc(brandProfile.description || settings.description || brandLine)}</span>
            <span>${new Date().getFullYear()} · Professional proxy service panel</span>
          </div>
        </footer>
      </div>
    `;
  }

  function renderHome() {
    const metrics = safeJson(config.brand_metrics_json, {});
    const downloads = context.downloads || {};
    const active = sectionRoute(currentPath());
    const plans = renderPlans();
    const isZh = state.locale.startsWith("zh");
    const faq = (t("faq") || []).slice(0, 2).map((item) => `<article class="card faq-item"><h3>${esc(item[0])}</h3><p>${esc(item[1])}</p></article>`).join("");
    const consoleSpotlight = renderActionCards(configuredItems(consoleSpotlightConfig, defaultConsoleSpotlight()));
    const helpDocs = renderHelpCenterDocs();
    const newUserOffer = configuredNewUserOffer();
    const newUserOfferText = isZh
      ? `新用户注册 ${newUserOffer.days} 天内自动享 ${newUserOffer.percent}% 优惠`
      : `New users get ${newUserOffer.percent}% off automatically within ${newUserOffer.days} days after signup`;
    return shell(`
      <section class="hero compact-home-hero">
        <div class="container">
          <div class="reveal compact-home-body">
            <span class="eyebrow">${esc(t("heroKicker"))}</span>
            <h1><span class="gradient-text">${esc(t("heroTitle"))}</span></h1>
            <p class="hero-copy">${esc(t("heroLead"))}</p>
            <div class="hero-actions">
              <a class="btn primary" href="/pricing" data-nav="/pricing">${esc(t("ctaPricing"))}</a>
              <a class="btn" href="/download" data-nav="/download">${esc(t("ctaDownload"))}</a>
              <a class="btn ghost" href="${state.user ? "/portal" : "/auth/login?redirect=/portal"}" data-nav="${state.user ? "/portal" : "/auth/login?redirect=/portal"}">${esc(t("ctaPortal"))}</a>
            </div>
            <div class="metric-row compact-metrics">
              <div class="metric"><strong>${esc(metrics.locations || "30+")}</strong><span>${esc(t("metricLocations"))}</span></div>
              <div class="metric"><strong>${esc(metrics.uptime || "99.9%")}</strong><span>${esc(t("metricUptime"))}</span></div>
              <div class="metric"><strong>${esc(metrics.latency || "<80ms")}</strong><span>${esc(t("metricLatency"))}</span></div>
            </div>
          </div>
        </div>
      </section>
      <section class="section spotlight-section" id="pricing">
        <div class="container">
          <div class="section-head">
            <div><div class="section-kicker">${esc(t("pricingKicker"))}</div><h2>${esc(t("pricingTitle"))}</h2></div>
            <p class="section-desc">${esc(t("pricingDesc"))}</p>
          </div>
          <div class="offer-chip">${esc(newUserOfferText)}</div>
          ${plans}
        </div>
      </section>
      <section class="section spotlight-section">
        <div class="container">
          <div class="section-head">
            <div><div class="section-kicker">${esc(isZh ? "核心控制台" : "Core console")}</div><h2>${esc(isZh ? "核心入口放在首屏可见位置" : "Keep core actions visible above the fold")}</h2></div>
            <p class="section-desc">${esc(isZh ? "用户控制台、运营台和帮助中心统一在这里，减少找入口的时间。" : "Console, workspace and help entry are now grouped for faster navigation.")}</p>
          </div>
          ${consoleSpotlight}
        </div>
      </section>
      <section class="section" id="download">
        <div class="container">
          <div class="section-head">
            <div><div class="section-kicker">${esc(t("downloadKicker"))}</div><h2>${esc(t("downloadTitle"))}</h2></div>
            <p class="section-desc">${esc(isZh ? "客户端下载与 iOS 教程放在同一入口，安装后可一键导入订阅。" : "Downloads and iOS guide are in one place, then import subscription in one click.")}</p>
          </div>
          <div class="grid download-grid">${renderDownloadCards(downloads)}</div>
        </div>
      </section>
      <section class="section" id="support">
        <div class="container">
          <div class="section-head"><div><div class="section-kicker">${esc(t("faqKicker"))}</div><h2>${esc(isZh ? "帮助中心与常见问题" : "Help center & FAQs")}</h2></div><p class="section-desc">${esc(isZh ? "先看教程，再提交工单。右下角智能助手会先回答常见业务问题。" : "Start with guides, escalate to tickets. The assistant at bottom-right answers common business questions first.")}</p></div>
          ${helpDocs}
          <div class="grid faq-grid">${faq}</div>
        </div>
      </section>
      <section class="section">
        <div class="container cta-panel">
          <h2>${esc(t("finalTitle"))}</h2>
          <p class="section-desc">${esc(t("finalDesc"))}</p>
          <div class="hero-actions"><a class="btn primary" href="/pricing" data-nav="/pricing">${esc(t("ctaPricing"))}</a><a class="btn" href="/auth/register" data-nav="/auth/register">${esc(t("navRegister"))}</a></div>
        </div>
      </section>
    `, active ? `/${active}` : currentPath());
  }

  function renderMarketingPage(page) {
    const pages = {
      features: [t("featuresKicker"), t("pageFeaturesTitle"), t("pageFeaturesLead")],
      pricing: [t("pricingKicker"), t("pagePricingTitle"), t("pagePricingLead")],
      download: [t("downloadKicker"), t("pageDownloadTitle"), t("pageDownloadLead")],
      support: [t("faqKicker"), t("pageSupportTitle"), t("pageSupportLead")],
    };
    const [kicker, title, lead] = pages[page] || pages.features;
    const featureCards = (t("features") || []).map((item, index) => `
      <article class="card reveal" style="animation-delay:${index * 70}ms">
        <div class="feature-icon">${String(index + 1).padStart(2, "0")}</div>
        <h3>${esc(item[0])}</h3>
        <p>${esc(item[1])}</p>
      </article>
    `).join("");
    const steps = (t("steps") || []).map((item) => `<article class="card step"><h3>${esc(item[0])}</h3><p>${esc(item[1])}</p></article>`).join("");
    const faq = (t("faq") || []).map((item) => `<article class="card faq-item"><h3>${esc(item[0])}</h3><p>${esc(item[1])}</p></article>`).join("");
    const supportLinks = resolveSupportLinks();
    const helpDocs = renderHelpCenterDocs();
    const contentMap = {
      features: `
        <section class="section standalone">
          <div class="container">
            <div class="section-head"><div><div class="section-kicker">${esc(t("featuresKicker"))}</div><h2>${esc(t("featuresTitle"))}</h2></div><p class="section-desc">${esc(t("featuresDesc"))}</p></div>
            <div class="grid feature-grid">${featureCards}</div>
          </div>
        </section>
        <section class="section"><div class="container"><div class="grid stat-grid">
          <article class="card stat-card"><strong>API</strong><span>${esc(t("subscription"))}</span></article>
          <article class="card stat-card"><strong>Queue</strong><span>${esc(t("orders"))}</span></article>
          <article class="card stat-card"><strong>WS</strong><span>${esc(t("serverStatus"))}</span></article>
        </div></div></section>
      `,
      pricing: `
        <section class="section standalone"><div class="container">
          <div class="section-head"><div><div class="section-kicker">${esc(t("pricingKicker"))}</div><h2>${esc(t("pricingTitle"))}</h2></div><p class="section-desc">${esc(t("pricingDesc"))}</p></div>
          <div class="offer-chip">${esc(t("newUserOffer"))}</div>
          ${renderPlans()}
        </div></section>
      `,
      download: `
        <section class="section standalone"><div class="container">
          <div class="section-head"><div><div class="section-kicker">${esc(t("downloadKicker"))}</div><h2>${esc(t("downloadTitle"))}</h2></div><p class="section-desc">${esc(t("downloadDesc"))}</p></div>
          <div class="grid download-grid">${renderDownloadCards(context.downloads || {})}</div>
        </div></section>
        <section class="section"><div class="container"><div class="section-head"><div><div class="section-kicker">${esc(state.locale.startsWith("zh") ? "帮助中心" : "Help center")}</div><h2>${esc(state.locale.startsWith("zh") ? "先把安装与导入教程讲清楚" : "Explain install and import before support is needed")}</h2></div></div>${helpDocs}</div></section>
        <section class="section"><div class="container"><article class="card"><h3>${esc(t("stepsTitle"))}</h3><div class="grid steps">${steps}</div></article></div></section>
      `,
      support: `
        <section class="section standalone"><div class="container">
          <div class="section-head"><div><div class="section-kicker">${esc(state.locale.startsWith("zh") ? "帮助中心" : "Help center")}</div><h2>${esc(state.locale.startsWith("zh") ? "教程先行，再进入工单" : "Guides first, tickets second")}</h2></div><p class="section-desc">${esc(t("pageSupportLead"))}</p></div>
          ${helpDocs}
        </div></section>
        <section class="section"><div class="container">
          <div class="section-head"><div><div class="section-kicker">${esc(t("faqKicker"))}</div><h2>${esc(t("faqTitle"))}</h2></div></div>
          <div class="grid faq-grid">${faq}</div>
        </div></section>
        <section class="section"><div class="container"><article class="card">
          <h3>${esc(t("support"))}</h3>
          <p class="section-desc">${esc(t("pageSupportLead"))}</p>
          <div class="hero-actions">${supportLinks.telegram ? `<a class="btn primary" href="${esc(supportLinks.telegram)}" target="_blank" rel="noreferrer">Telegram</a>` : ""}${supportLinks.email ? `<a class="btn" href="mailto:${esc(supportLinks.email)}">${esc(supportLinks.email)}</a>` : ""}<a class="btn" href="${state.auth ? "/portal/help" : "/auth/login?redirect=/portal/help"}" data-nav="${state.auth ? "/portal/help" : "/auth/login?redirect=/portal/help"}">${esc(t("openTicket"))}</a></div>
        </article></div></section>
      `,
    };
    return shell(`
      <section class="hero compact-hero">
        <div class="container">
          <span class="eyebrow">${esc(kicker)}</span>
          <h1><span class="gradient-text">${esc(title)}</span></h1>
          <p class="hero-copy">${esc(lead)}</p>
        </div>
      </section>
      ${contentMap[page] || contentMap.features}
    `, `/${page}`);
  }

  function renderPlans() {
    if (!state.plans.length) return `<div class="empty">${esc(t("noPlans"))}</div>`;
    const offer = configuredNewUserOffer();
    const offerText = state.locale.startsWith("zh")
      ? `新用户注册 ${offer.days} 天内自动享 ${offer.percent}%`
      : `New users ${offer.percent}% off in ${offer.days} days`;
    const showOfferBadge = !state.auth || isNewUserEligible();
    const sortedPlans = [...state.plans].sort((a, b) => {
      const aSort = Number(a?.display_sort ?? a?.sort ?? 0);
      const bSort = Number(b?.display_sort ?? b?.sort ?? 0);
      if (aSort > 0 || bSort > 0) {
        if (aSort <= 0) return 1;
        if (bSort <= 0) return -1;
        if (aSort !== bSort) return aSort - bSort;
      }
      return Number(a?.id ?? 0) - Number(b?.id ?? 0);
    });
    return `<div class="grid plan-grid">${sortedPlans.map((plan, index) => {
      const price = bestPrice(plan);
      const resetPack = resetPackPrice(plan);
      const prices = priceOptions(plan);
      const defaultPeriod = prices[0];
      const badgeText = String(plan.display_badge || "").trim();
      const isFeatured = Boolean(badgeText) || index === 1 || sortedPlans.length === 1;
      const disabled = !plan.sell || !prices.length;
      const planDescription = resolvePlanSummary(plan, 170);
      const highlights = resolvePlanHighlights(plan);
      const hiddenHint = disabled ? planHiddenReasonText(plan.hidden_reason) : "";
      const priceLabel = price.key === "reset_price"
        ? `${t("resetPackTag")}`
        : `${t("from")} / ${price.label}`;
      return `
        <article class="card plan-card ${isFeatured ? "featured" : ""}">
          ${isFeatured ? `<span class="plan-badge">${esc(badgeText || t("featured"))}</span>` : ""}
          ${showOfferBadge ? `<span class="plan-offer">${esc(offerText)}</span>` : ""}
          <div>
            <h3>${esc(plan.name)}</h3>
            <div class="price"><strong>${price.value ? esc(formatMoney(price.value)) : "-"}</strong><span>${esc(priceLabel)}</span></div>
            ${resetPack && price.key !== "reset_price" ? `<div class="tag reset-pack">${esc(t("resetPackTag"))} · ${esc(formatMoney(resetPack.value))}</div>` : ""}
            ${planDescription ? `<p class="section-desc">${esc(planDescription)}</p>` : ""}
          </div>
          <ul class="plan-list">
            <li>${esc(t("traffic"))}: ${esc(formatBytes(Number(plan.transfer_enable || 0) * 1024 * 1024 * 1024))}</li>
            <li>${esc(t("speed"))}: ${esc(plan.speed_limit || t("noLimit"))}</li>
            <li>${esc(t("devices"))}: ${esc(plan.device_limit || t("noLimit"))}</li>
            ${highlights.slice(0, 3).map((item) => `<li>${esc(item)}</li>`).join("")}
          </ul>
          <div class="mini-form">
            <label class="field compact">
              <span>${esc(t("choosePeriod"))}</span>
              <div class="period-picker" data-period-picker="${esc(plan.id)}">
                ${prices.map((item, itemIndex) => `
                  <button
                    type="button"
                    class="period-option ${itemIndex === 0 ? "active" : ""}"
                    data-action="select-period"
                    data-plan="${esc(plan.id)}"
                    data-period="${esc(item.key)}"
                    ${disabled ? "disabled" : ""}
                  >
                    <span>${esc(item.label)}</span>
                    <strong>${esc(formatMoney(item.value))}</strong>
                  </button>
                `).join("")}
              </div>
              <input type="hidden" data-plan-period="${esc(plan.id)}" value="${esc(defaultPeriod?.key || "")}" />
            </label>
            <p class="section-desc checkout-note">${esc(state.locale.startsWith("zh") ? "支付方式与优惠券在下单后结算步骤中选择。" : "Payment method and coupon are selected in checkout after order creation.")}</p>
            ${hiddenHint ? `<p class="section-desc checkout-note plan-hidden-note">${esc(hiddenHint)}</p>` : ""}
          </div>
          <button class="btn primary block" data-action="buy-plan" data-plan="${esc(plan.id)}" ${disabled ? "disabled" : ""}>${esc(state.auth ? t("createOrder") : t("loginToBuy"))}</button>
        </article>
      `;
    }).join("")}</div>`;
  }

  function renderDownloadCards(downloads) {
    const iosGuideHref = resolveIosGuideHref();
    const items = [
      ["windows", "WIN", "Windows", ""],
      ["macos", "MAC", "macOS", ""],
      ["android", "APK", "Android", ""],
      ["ios", "IOS", "iOS", iosGuideHref],
    ];
    return items.map(([key, mark, label, fallbackHref]) => {
      const item = downloads[key] || {};
      const hasUrl = Boolean(item.url);
      const guideButton = fallbackHref
        ? `<a class="btn" href="${esc(fallbackHref)}" data-nav="${esc(fallbackHref)}">${esc(state.locale.startsWith("zh") ? "查看教程" : "View guide")}</a>`
        : `<span class="tag">${esc(t("notReady"))}</span>`;
      return `
        <article class="card download-card">
          <div class="platform-mark">${mark}</div>
          <div>
            <h3>${label}</h3>
            <p>${esc(item.version ? `v${item.version}` : t("notReady"))}</p>
          </div>
          ${hasUrl ? `<a class="btn primary" href="${esc(item.url)}" target="_blank" rel="noreferrer">${esc(t("download"))}</a>` : guideButton}
        </article>
      `;
    }).join("");
  }

  function renderAuth(mode) {
    const isRegister = mode === "register";
    const params = currentSearch();
    const redirect = params.get("redirect") || "/portal";
    const inviteCode = params.get("invite_code") || rememberedInviteCode() || "";
    return shell(`
      <section class="auth-wrap">
        <div class="container auth-grid">
          <div class="card auth-pitch">
            <div>
              <span class="eyebrow">${esc(isRegister ? t("navRegister") : t("navLogin"))}</span>
              <h1 class="gradient-text">${esc(isRegister ? t("registerTitle") : t("loginTitle"))}</h1>
              <p class="hero-copy">${esc(isRegister ? t("registerLead") : t("loginLead"))}</p>
            </div>
            <div class="metric-row">
              <div class="metric"><strong>24/7</strong><span>${esc(t("support"))}</span></div>
              <div class="metric"><strong>Multi</strong><span>${esc(t("devices"))}</span></div>
              <div class="metric"><strong>Secure</strong><span>${esc(t("nodeSecure"))}</span></div>
            </div>
          </div>
          <form class="card auth-form" data-form="${isRegister ? "register" : "login"}" data-redirect="${esc(redirect)}">
            <h2>${esc(isRegister ? t("registerTitle") : t("loginTitle"))}</h2>
            ${state.message ? `<div class="notice ${esc(state.message.type)}">${esc(state.message.message)}</div>` : ""}
            <label class="field"><span>${esc(t("email"))}</span><input name="email" type="email" autocomplete="email" required /></label>
            <label class="field"><span>${esc(t("password"))}</span><input name="password" type="password" autocomplete="${isRegister ? "new-password" : "current-password"}" minlength="8" required /></label>
            ${isRegister ? `<div class="form-row"><label class="field"><span>${esc(t("emailCode"))} · ${esc(t("optional"))}</span><input name="email_code" /></label><button class="btn" type="button" data-action="send-code">${esc(t("sendCode"))}</button></div><label class="field"><span>${esc(t("inviteCode"))} · ${esc(t("optional"))}</span><input name="invite_code" value="${esc(inviteCode)}" /></label>` : ""}
            <p class="section-desc">${esc(t("authTip"))}</p>
            <button class="btn primary block" type="submit">${esc(isRegister ? t("submitRegister") : t("submitLogin"))}</button>
            <a href="${isRegister ? "/auth/login" : "/auth/register"}" data-nav="${isRegister ? "/auth/login" : "/auth/register"}">${esc(isRegister ? t("hasAccount") : t("noAccount"))}</a>
          </form>
        </div>
      </section>
    `, isRegister ? "/auth/register" : "/auth/login");
  }

  function renderPortal() {
    const path = currentPath();
    const rawActive = path === "/portal" ? "overview" : path.replace("/portal/", "") || "overview";
    const aliases = {
      subscription: "plans",
      orders: "plans",
      invite: "growth",
      support: "support",
      help: "support",
      account: "security",
    };
    const active = aliases[rawActive] || rawActive;
    const content = portalContent(active);
    return shell(`
      <section class="portal-wrap">
        <div class="container">
          <div class="section-head">
            <div><div class="section-kicker">${esc(t("portalTitle"))}</div><h2>${esc(t("portalLead"))}</h2></div>
          </div>
          <div class="portal-layout">
            <aside class="card sidebar">${portalNav(active)}</aside>
            <div class="portal-main">${state.message ? `<div class="notice ${esc(state.message.type)}">${esc(state.message.message)}</div>` : ""}${content}</div>
          </div>
        </div>
      </section>
    `, "/portal");
  }

  function portalNav(active) {
    const isZh = state.locale.startsWith("zh");
    const items = [
      ["overview", "/portal", isZh ? "总览" : "Overview"],
      ["plans", "/portal/plans", isZh ? "套餐与订单" : "Plans & Orders"],
      ["downloads", "/portal/downloads", isZh ? "下载与导入" : "Downloads & Import"],
      ["growth", "/portal/growth", isZh ? "邀请与返利" : "Growth Center"],
      ["support", "/portal/help", isZh ? "支持与工单" : "Support & Tickets"],
      ["security", "/portal/security", isZh ? "账户与安全" : "Account & Security"],
    ];
    return `<nav class="side-nav">${items.map(([key, path, label]) => `<a href="${path}" data-nav="${path}" class="${active === key ? "active" : ""}">${esc(label)}<span>›</span></a>`).join("")}<button data-action="logout">${esc(t("logout"))}</button></nav>`;
  }

  function portalContent(active) {
    if (active === "plans") return `${portalSubscription()}${portalOrders()}`;
    if (active === "downloads") return portalDownloads();
    if (active === "support") return portalSupport();
    if (active === "growth") return portalInvite();
    if (active === "security") return portalAccount();
    return portalOverview();
  }

  function portalOverview() {
    const sub = state.subscription || {};
    const used = Number(sub.u || 0) + Number(sub.d || 0);
    const total = Number(sub.transfer_enable || 0);
    const pct = total ? Math.min(100, Math.round((used / total) * 100)) : 0;
    return `
      <div class="portal-hero">
        <article class="card">
          <span class="tag">${esc(t("currentPlan"))}</span>
          <h2>${esc(sub.plan?.name || state.user?.plan?.name || "-")}</h2>
          <p class="section-desc">${esc(t("expireAt"))}: ${esc(formatDate(sub.expired_at || state.user?.expired_at))}</p>
          <div class="progress"><span style="width:${pct}%"></span></div>
          <p>${esc(t("trafficUsage"))}: ${esc(formatBytes(used))} / ${esc(total ? formatBytes(total) : t("noLimit"))}</p>
        </article>
        <article class="card">
          <h3>${esc(t("quickActions"))}</h3>
          <div class="grid">
            <button class="btn primary" data-action="copy-sub">${esc(t("copySub"))}</button>
            <a class="btn" href="/portal/plans" data-nav="/portal/plans">${esc(t("renew"))}</a>
            <a class="btn" href="/portal/downloads" data-nav="/portal/downloads">${esc(t("ctaDownload"))}</a>
            <a class="btn" href="/portal/help" data-nav="/portal/help">${esc(t("openTicket"))}</a>
          </div>
        </article>
      </div>
      <div class="grid stat-grid">
        <article class="card stat-card"><strong>${esc(formatMoney(state.user?.balance || 0))}</strong><span>${esc(t("balance"))}</span></article>
        <article class="card stat-card"><strong>${esc(formatMoney(state.user?.commission_balance || 0))}</strong><span>${esc(t("commission"))}</span></article>
        <article class="card stat-card"><strong>${esc(pct)}%</strong><span>${esc(t("trafficUsage"))}</span></article>
      </div>
      <div class="grid faq-grid">
        <article class="card"><h3>${esc(t("latestOrders"))}</h3>${orderTable(state.orders.slice(0, 4))}</article>
        <article class="card"><h3>${esc(t("latestNotices"))}</h3>${noticeList(state.notices.slice(0, 4))}</article>
      </div>
    `;
  }

  function portalSubscription() {
    const sub = state.subscription || {};
    const used = Number(sub.u || 0) + Number(sub.d || 0);
    const total = Number(sub.transfer_enable || 0);
    const servers = state.servers || [];
    return `
      <article class="card">
        <h3>${esc(t("subscription"))}</h3>
        <p class="section-desc">${esc(t("expireAt"))}: ${esc(formatDate(sub.expired_at || state.user?.expired_at))}</p>
        <div class="grid stat-grid">
          <div class="stat-card"><strong>${esc(sub.plan?.name || state.user?.plan?.name || "-")}</strong><span>${esc(t("currentPlan"))}</span></div>
          <div class="stat-card"><strong>${esc(formatBytes(used))}</strong><span>${esc(t("trafficUsage"))}</span></div>
          <div class="stat-card"><strong>${esc(total ? formatBytes(total) : t("noLimit"))}</strong><span>${esc(t("traffic"))}</span></div>
        </div>
        <div class="hero-actions"><button class="btn primary" data-action="copy-sub">${esc(t("copySub"))}</button><button class="btn" data-action="reset-security">${esc(t("resetSecurity"))}</button></div>
      </article>
      <article class="card">
        <h3>${esc(t("serverStatus"))}</h3>
        ${servers.length ? `<div class="chip-grid">${servers.slice(0, 12).map((server) => `<span class="chip">${esc(server.name || server.host || server.type || "Node")}</span>`).join("")}</div>` : `<div class="empty">${esc(t("noServers"))}</div>`}
      </article>
      <article class="card"><h3>${esc(t("trafficLog"))}</h3>${trafficTable(state.trafficLogs)}</article>
      <article class="card"><h3>${esc(t("pricingTitle"))}</h3><p class="section-desc">${esc(t("pricingDesc"))}</p></article>
      ${renderPlans()}
    `;
  }

  function portalOrders() {
    const checkout = state.checkout ? `
      <article class="card checkout-result">
        <h3>${esc(t("paymentQr"))}</h3>
        <p class="section-desc">${esc(state.checkout.tradeNo || "")}</p>
        <div class="hero-actions">
          <a class="btn primary" href="${esc(state.checkout.data)}" target="_blank" rel="noreferrer">${esc(t("openLink"))}</a>
          <button class="btn" data-action="copy" data-copy="${esc(state.checkout.data)}">${esc(t("copyLink"))}</button>
          <button class="btn" data-action="check-order" data-trade="${esc(state.checkout.tradeNo)}">${esc(t("checkPayment"))}</button>
        </div>
      </article>
    ` : "";
    return `${checkout}<article class="card"><h3>${esc(t("orders"))}</h3>${orderTable(state.orders, true)}</article>`;
  }

  function portalDownloads() {
    const subUrl = state.subscription?.subscribe_url;
    const importLink = buildAppImportLink(subUrl);
    const deviceDownloads = renderDeviceDownloadButtons(context.downloads || {});
    return `
      <div class="grid download-grid">${renderDownloadCards(context.downloads || {})}</div>
      <article class="card">
        <h3>${esc(t("importToApp"))}</h3>
        <p class="section-desc">${esc(subUrl ? t("appImportGuide") : t("loginRequired"))}</p>
        <div class="hero-actions">${subUrl ? `<button class="btn primary" data-action="import-app" data-link="${esc(importLink)}">${esc(t("importToApp"))}</button><button class="btn" data-action="copy-sub">${esc(t("copySub"))}</button>` : ""}</div>
        <div class="app-import-fallback" data-app-import-fallback>
          <p class="section-desc">${esc(t("downloadForDevice"))}</p>
          <div class="hero-actions">${deviceDownloads}</div>
        </div>
        <p class="section-desc">${esc(t("manualSubscribe"))}: ${esc(subUrl || "-")}</p>
      </article>
      <article class="card">
        <h3>${esc(state.locale.startsWith("zh") ? "帮助中心" : "Help center")}</h3>
        <p class="section-desc">${esc(state.locale.startsWith("zh") ? "把安装、导入、支付和连接异常教程集中到下载中心，减少用户来回跳转。" : "Keep install, import, payment and recovery guides close to the download flow.")}</p>
        ${renderHelpCenterDocs()}
      </article>
      <article class="card"><h3>${esc(t("stepsTitle"))}</h3><div class="grid steps">${(t("steps") || []).map((item) => `<div class="step"><h3>${esc(item[0])}</h3><p>${esc(item[1])}</p></div>`).join("")}</div></article>
      <article class="card"><h3>${esc(t("knowledgeBase"))}</h3>${knowledgeList()}</article>
    `;
  }

  function portalSupport() {
    const links = resolveSupportLinks();
    const isZh = state.locale.startsWith("zh");
    const subUrl = String(state.subscription?.subscribe_url || "").trim();
    const bindCommand = subUrl ? `/bind ${subUrl}` : "/bind <subscription_url>";
    const telegramEnabled = Number(state.commConfig?.is_telegram) === 1 || Boolean(links.telegram) || Boolean(links.telegram_bot);
    return `
      <article class="card">
        <h3>${esc(state.locale.startsWith("zh") ? "帮助中心" : "Help center")}</h3>
        <p class="section-desc">${esc(state.locale.startsWith("zh") ? "先让用户看到可执行的教程，再决定是否需要人工支持。" : "Lead with actionable guides before escalating to human support.")}</p>
        ${renderHelpCenterDocs()}
      </article>
      <article class="card">
        <h3>${esc(t("telegramService"))}</h3>
        <p class="section-desc">${esc(telegramEnabled ? t("telegramBindGuide") : t("telegramUnavailable"))}</p>
        <div class="hero-actions">
          ${links.telegram_bot ? `<a class="btn primary" href="${esc(links.telegram_bot)}" target="_blank" rel="noreferrer">${esc(t("openTelegramBot"))}${links.telegram_username ? ` @${esc(links.telegram_username)}` : ""}</a>` : ""}
          ${subUrl ? `<button class="btn" data-action="copy" data-copy="${esc(bindCommand)}">${esc(t("copyBindCommand"))}</button>` : `<a class="btn" href="/portal/downloads" data-nav="/portal/downloads">${esc(isZh ? "先导入订阅" : "Import subscription first")}</a>`}
          ${links.telegram_discuss ? `<a class="btn" href="${esc(links.telegram_discuss)}" target="_blank" rel="noreferrer">${esc(t("telegramDiscuss"))}</a>` : ""}
        </div>
      </article>
      <article class="card"><h3>${esc(t("support"))}</h3><p class="section-desc">${esc(t("faqTitle"))}</p><div class="hero-actions">${links.telegram ? `<a class="btn primary" href="${esc(links.telegram)}" target="_blank" rel="noreferrer">Telegram</a>` : ""}${links.email ? `<a class="btn" href="mailto:${esc(links.email)}">${esc(links.email)}</a>` : ""}<button class="btn" data-action="refresh">${esc(t("refresh"))}</button></div></article>
      <article class="card">
        <h3>${esc(t("newTicket"))}</h3>
        <form class="support-form" data-form="ticket">
          <label class="field"><span>${esc(t("ticketSubject"))}</span><input name="subject" required /></label>
          <label class="field"><span>${esc(t("ticketLevel"))}</span><select name="level"><option value="0">${esc(t("low"))}</option><option value="1">${esc(t("medium"))}</option><option value="2">${esc(t("high"))}</option></select></label>
          <label class="field"><span>${esc(t("ticketMessage"))}</span><textarea name="message" required></textarea></label>
          <button class="btn primary" type="submit">${esc(t("openTicket"))}</button>
        </form>
      </article>
      <article class="card"><h3>${esc(t("support"))}</h3>${ticketList(state.tickets)}</article>
      <article class="card"><h3>${esc(t("latestNotices"))}</h3>${noticeList(state.notices)}</article>
      <article class="card"><h3>${esc(t("knowledgeBase"))}</h3>${knowledgeList()}</article>
    `;
  }

  function portalInvite() {
    const stat = state.invite?.stat || [];
    const codes = state.invite?.codes || [];
    const primaryCode = (codes[0] && codes[0].code) || rememberedInviteCode() || "";
    const inviteRegisterUrl = primaryCode ? `${window.location.origin}/auth/register?invite_code=${encodeURIComponent(primaryCode)}` : "";
    const inviteDownloadUrl = primaryCode ? `${window.location.origin}/download?invite_code=${encodeURIComponent(primaryCode)}` : `${window.location.origin}/download`;
    const appClaimUrl = primaryCode ? `slothvpn://referral/claim?invite_code=${encodeURIComponent(primaryCode)}` : "";
    const isZh = state.locale.startsWith("zh");
    return `
      <div class="grid stat-grid">
        <article class="card stat-card"><strong>${esc(stat[0] || 0)}</strong><span>${esc(t("registeredUsers"))}</span></article>
        <article class="card stat-card"><strong>${esc(formatMoney(stat[1] || 0))}</strong><span>${esc(t("totalCommission"))}</span></article>
        <article class="card stat-card"><strong>${esc(stat[3] || 0)}%</strong><span>${esc(t("rate"))}</span></article>
      </div>
      <article class="card">
        <h3>${esc(isZh ? "增长中心" : "Growth center")}</h3>
        <p class="section-desc">${esc(isZh ? "网站注册、客户端下载和 App 首开三条路径现在统一围绕邀请码展开，减少用户复制错链路后无法归因的问题。" : "Website signups, downloads and app first-open now share the same referral path.")}</p>
        <div class="hero-actions">
          <button class="btn primary" data-action="generate-invite">${esc(t("generateInvite"))}</button>
          ${inviteRegisterUrl ? `<button class="btn" data-action="copy" data-copy="${esc(inviteRegisterUrl)}">${esc(isZh ? "复制注册链接" : "Copy signup link")}</button>` : ""}
          ${inviteDownloadUrl ? `<button class="btn" data-action="copy" data-copy="${esc(inviteDownloadUrl)}">${esc(isZh ? "复制下载链接" : "Copy download link")}</button>` : ""}
          ${appClaimUrl ? `<button class="btn" data-action="copy" data-copy="${esc(appClaimUrl)}">${esc(isZh ? "复制 App 归因链接" : "Copy app claim link")}</button>` : ""}
        </div>
      </article>
      <article class="card">
        <h3>${esc(t("inviteCodes"))}</h3>
        ${codes.length ? codes.map((item) => {
          const registerLink = `${window.location.origin}/auth/register?invite_code=${encodeURIComponent(item.code)}`;
          const downloadLink = `${window.location.origin}/download?invite_code=${encodeURIComponent(item.code)}`;
          const deepLink = `slothvpn://referral/claim?invite_code=${encodeURIComponent(item.code)}`;
          return `<div class="invite-row">
            <strong>${esc(item.code)}</strong>
            <span>PV ${esc(item.pv || 0)}</span>
            <button class="btn" data-action="copy" data-copy="${esc(item.code)}">${esc(t("inviteCode"))}</button>
            <button class="btn" data-action="copy" data-copy="${esc(registerLink)}">${esc(isZh ? "注册链接" : "Signup link")}</button>
            <button class="btn" data-action="copy" data-copy="${esc(downloadLink)}">${esc(isZh ? "下载链接" : "Download link")}</button>
            <button class="btn" data-action="copy" data-copy="${esc(deepLink)}">${esc(isZh ? "App 归因" : "App claim")}</button>
          </div>`;
        }).join("") : `<div class="empty">${esc(t("noNotices"))}</div>`}
      </article>
    `;
  }

  function portalAccount() {
    const links = resolveSupportLinks();
    const isZh = state.locale.startsWith("zh");
    const subUrl = String(state.subscription?.subscribe_url || "").trim();
    const bindCommand = subUrl ? `/bind ${subUrl}` : "/bind <subscription_url>";
    const telegramEnabled = Number(state.commConfig?.is_telegram) === 1 || Boolean(links.telegram) || Boolean(links.telegram_bot);
    return `
      <article class="card"><h3>${esc(state.locale.startsWith("zh") ? "账户与安全" : "Account & security")}</h3><p>${esc(state.user?.email || "")}</p><p>${esc(t("balance"))}: ${esc(formatMoney(state.user?.balance || 0))}</p><p>UUID: ${esc(state.user?.uuid || "-")}</p><div class="hero-actions"><button class="btn" data-action="logout">${esc(t("logout"))}</button><button class="btn" data-action="reset-security">${esc(t("resetSecurity"))}</button>${featureFlags.operator_console_enabled && context.operator_path ? `<a class="btn" href="${esc(context.operator_path)}" target="_blank" rel="noreferrer">${esc(state.locale.startsWith("zh") ? "运营台" : "Operator")}</a>` : ""}</div><p class="section-desc">${esc(t("resetSecurityDesc"))}</p></article>
      <article class="card"><h3>${esc(t("telegramService"))}</h3><p class="section-desc">${esc(telegramEnabled ? t("telegramBindGuide") : t("telegramUnavailable"))}</p><div class="hero-actions">${links.telegram_bot ? `<a class="btn primary" href="${esc(links.telegram_bot)}" target="_blank" rel="noreferrer">${esc(t("openTelegramBot"))}</a>` : ""}${subUrl ? `<button class="btn" data-action="copy" data-copy="${esc(bindCommand)}">${esc(t("copyBindCommand"))}</button>` : `<a class="btn" href="/portal/downloads" data-nav="/portal/downloads">${esc(isZh ? "先导入订阅" : "Import subscription first")}</a>`}${links.telegram_discuss ? `<a class="btn" href="${esc(links.telegram_discuss)}" target="_blank" rel="noreferrer">${esc(t("telegramDiscuss"))}</a>` : ""}</div></article>
      <article class="card">
        <h3>${esc(t("changePassword"))}</h3>
        <form class="support-form" data-form="password">
          <label class="field"><span>${esc(t("oldPassword"))}</span><input name="old_password" type="password" required /></label>
          <label class="field"><span>${esc(t("newPassword"))}</span><input name="new_password" type="password" minlength="8" required /></label>
          <button class="btn primary" type="submit">${esc(t("save"))}</button>
        </form>
      </article>
      <article class="card">
        <h3>${esc(t("notifySettings"))}</h3>
        <form class="support-form inline-form" data-form="settings">
          <label class="check"><input type="checkbox" name="remind_expire" ${Number(state.user?.remind_expire) ? "checked" : ""} /> ${esc(t("remindExpire"))}</label>
          <label class="check"><input type="checkbox" name="remind_traffic" ${Number(state.user?.remind_traffic) ? "checked" : ""} /> ${esc(t("remindTraffic"))}</label>
          <button class="btn primary" type="submit">${esc(t("save"))}</button>
        </form>
      </article>
      <article class="card">
        <h3>${esc(t("transferCommission"))}</h3>
        <form class="support-form inline-form" data-form="transfer">
          <label class="field"><span>${esc(t("transferAmount"))}</span><input name="transfer_amount" type="number" min="0.01" step="0.01" placeholder="0.00" /></label>
          <button class="btn primary" type="submit">${esc(t("save"))}</button>
        </form>
      </article>
      <article class="card">
        <h3>${esc(t("redeemGift"))}</h3>
        <form class="support-form inline-form" data-form="gift">
          <label class="field"><span>${esc(t("giftCode"))}</span><input name="code" minlength="8" maxlength="32" /></label>
          <button class="btn primary" type="submit">${esc(t("redeem"))}</button>
        </form>
        <h3>${esc(t("giftHistory"))}</h3>
        ${giftHistoryList()}
      </article>
    `;
  }

  function orderTable(orders, withActions = false) {
    if (!orders || !orders.length) return `<div class="empty">${esc(t("noOrders"))}</div>`;
    return `<div class="table-wrap"><table class="data-table"><thead><tr><th>${esc(t("orderNo"))}</th><th>${esc(t("planName"))}</th><th>${esc(t("period"))}</th><th>${esc(t("amount"))}</th><th>${esc(t("status"))}</th><th>${esc(t("createdAt"))}</th>${withActions ? `<th>${esc(t("operation"))}</th>` : ""}</tr></thead><tbody>${orders.map((order) => `<tr><td>${esc(order.trade_no || "-")}</td><td>${esc(order.plan?.name || "-")}</td><td>${esc(periodLabels()[order.period] || order.period || "-")}</td><td>${esc(formatMoney(order.total_amount || 0))}</td><td><span class="status-pill status-${esc(order.status)}">${esc(orderStatusText(order.status))}</span></td><td>${esc(formatDate(order.created_at))}</td>${withActions ? `<td>${orderActions(order)}</td>` : ""}</tr>`).join("")}</tbody></table></div>`;
  }

  function orderActions(order) {
    if (Number(order.status) === 0) {
      const methods = state.paymentMethods || [];
      const methodSelect = methods.length ? `<select class="payment-select" data-payment="${esc(order.trade_no)}">${methods.map((item) => `<option value="${esc(item.id)}">${esc(item.name || item.payment || item.id)}</option>`).join("")}</select>` : `<span class="tag">${esc(t("noPayment"))}</span>`;
      const payButton = methods.length ? `<button class="btn primary small" data-action="checkout-order" data-trade="${esc(order.trade_no)}">${esc(t("pay"))}</button>` : "";
      return `<div class="order-actions">${methodSelect}${payButton}<button class="btn small" data-action="cancel-order" data-trade="${esc(order.trade_no)}">${esc(t("cancelOrder"))}</button></div>`;
    }
    if (Number(order.status) === 1) {
      return `<button class="btn small" data-action="check-order" data-trade="${esc(order.trade_no)}">${esc(t("checkPayment"))}</button>`;
    }
    return "-";
  }

  function trafficTable(records) {
    if (!records || !records.length) return `<div class="empty">${esc(t("noTraffic"))}</div>`;
    return `<div class="table-wrap"><table class="data-table"><thead><tr><th>${esc(t("createdAt"))}</th><th>Upload</th><th>Download</th><th>${esc(t("trafficUsage"))}</th></tr></thead><tbody>${records.slice(0, 12).map((item) => {
      const up = Number(item.u || item.upload || 0);
      const down = Number(item.d || item.download || 0);
      return `<tr><td>${esc(formatDate(item.record_at || item.created_at))}</td><td>${esc(formatBytes(up))}</td><td>${esc(formatBytes(down))}</td><td>${esc(formatBytes(up + down))}</td></tr>`;
    }).join("")}</tbody></table></div>`;
  }

  function ticketList(tickets) {
    if (!tickets || !tickets.length) return `<div class="empty">${esc(t("noTickets"))}</div>`;
    return `<div class="ticket-list">${tickets.map((ticket) => `
      <div class="ticket-item">
        <div><strong>${esc(ticket.subject || "-")}</strong><p>${esc(formatDate(ticket.updated_at || ticket.created_at))} · ${esc(Number(ticket.status) ? t("close") : t("statusProcessing"))}</p></div>
        ${Number(ticket.status) ? "" : `<button class="btn small" data-action="close-ticket" data-ticket="${esc(ticket.id)}">${esc(t("close"))}</button>`}
      </div>
    `).join("")}</div>`;
  }

  function knowledgeList() {
    const groups = state.knowledge && typeof state.knowledge === "object" ? state.knowledge : {};
    const entries = Object.entries(groups).flatMap(([category, items]) => (Array.isArray(items) ? items : []).map((item) => ({ ...item, category })));
    if (!entries.length) return `<div class="empty">${esc(t("noDocs"))}</div>`;
    return `<div class="doc-list">${entries.slice(0, 8).map((item) => `<article class="doc-item"><strong>${esc(item.title || "-")}</strong><span>${esc(item.category || "")}</span><p>${esc(plainText(item.body, 120))}</p></article>`).join("")}</div>`;
  }

  function giftHistoryList() {
    const records = Array.isArray(state.giftHistory) ? state.giftHistory : [];
    if (!records.length) return `<div class="empty">${esc(t("noGiftHistory"))}</div>`;
    return `<div class="doc-list">${records.map((item) => `<article class="doc-item"><strong>${esc(item.template_name || item.code || "-")}</strong><span>${esc(formatDate(item.created_at))}</span><p>${esc(item.template_type_name || "")}</p></article>`).join("")}</div>`;
  }

  function noticeList(notices) {
    if (!notices || !notices.length) return `<div class="empty">${esc(t("noNotices"))}</div>`;
    return notices.map((notice) => {
      const body = String(notice.content || notice.message || "").replace(/<[^>]*>/g, "").slice(0, 120);
      return `<div class="notice"><strong>${esc(notice.title || notice.subject || "-")}</strong><p>${esc(body)}</p></div>`;
    }).join("");
  }

  async function handleAuth(form) {
    const fd = new FormData(form);
    const mode = form.dataset.form;
    const body = {
      email: fd.get("email"),
      password: fd.get("password"),
    };
    if (mode === "register") {
      if (fd.get("email_code")) body.email_code = fd.get("email_code");
      if (fd.get("invite_code")) body.invite_code = fd.get("invite_code");
      if (!body.invite_code && rememberedInviteCode()) body.invite_code = rememberedInviteCode();
      if (rememberedClaimId()) body.claim_id = rememberedClaimId();
    }
    try {
      const data = await api(`/passport/auth/${mode === "register" ? "register" : "login"}`, { method: "POST", body, auth: false });
      state.auth = data.auth_data;
      localStorage.setItem("slothpro_auth_data", data.auth_data);
      localStorage.setItem("slothpro_user_token", data.token || "");
      state.message = { message: t("authSaved"), type: "success" };
      await loadProtected();
      navigate(form.dataset.redirect || "/portal");
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  async function sendCode(button) {
    const form = button.closest("form");
    const email = new FormData(form).get("email");
    if (!email) return setMessage(t("email"), "error");
    try {
      await api("/passport/comm/sendEmailVerify", { method: "POST", body: { email }, auth: false });
      setMessage(t("sendCode"), "success");
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  function resolveOrderNoFromSave(payload) {
    if (typeof payload === "string" || typeof payload === "number") {
      return String(payload).trim();
    }
    if (payload && typeof payload === "object") {
      return String(payload.order_no || payload.trade_no || payload.orderNo || payload.tradeNo || "").trim();
    }
    return "";
  }

  function openCheckoutComposer(defaultMethod) {
    const methods = Array.isArray(state.paymentMethods) ? state.paymentMethods : [];
    if (!methods.length) {
      setMessage(t("noPayment"), "error");
      return Promise.resolve(null);
    }

    return new Promise((resolve) => {
      const overlay = document.createElement("div");
      overlay.className = "checkout-overlay";
      overlay.innerHTML = `
        <div class="checkout-modal card">
          <h3>${esc(state.locale.startsWith("zh") ? "结算设置" : "Checkout setup")}</h3>
          <p class="section-desc">${esc(state.locale.startsWith("zh") ? "支付方式和优惠券仅在结算时出现。" : "Payment method and coupon are selected during checkout.")}</p>
          <label class="field">
            <span>${esc(t("paymentMethod"))}</span>
            <select data-checkout-method>
              ${methods.map((item) => `<option value="${esc(item.id)}" ${String(defaultMethod || methods[0].id) === String(item.id) ? "selected" : ""}>${esc(item.name || item.payment || item.id)}</option>`).join("")}
            </select>
          </label>
          <label class="field">
            <span>${esc(t("optionalCoupon"))}</span>
            <input type="text" data-checkout-coupon placeholder="${esc(t("couponCode"))}" />
          </label>
          <div class="hero-actions">
            <button class="btn" type="button" data-checkout-cancel>${esc(state.locale.startsWith("zh") ? "取消" : "Cancel")}</button>
            <button class="btn primary" type="button" data-checkout-confirm>${esc(state.locale.startsWith("zh") ? "创建订单并结算" : "Create order & checkout")}</button>
          </div>
        </div>
      `;
      document.body.appendChild(overlay);

      const close = (result) => {
        overlay.remove();
        resolve(result);
      };

      overlay.addEventListener("click", (event) => {
        if (event.target === overlay) close(null);
      });
      overlay.querySelector("[data-checkout-cancel]")?.addEventListener("click", () => close(null));
      overlay.querySelector("[data-checkout-confirm]")?.addEventListener("click", () => {
        const method = String(overlay.querySelector("[data-checkout-method]")?.value || "").trim();
        const coupon = String(overlay.querySelector("[data-checkout-coupon]")?.value || "").trim();
        if (!method) {
          setMessage(t("choosePaymentMethod"), "error");
          return;
        }
        close({ method, coupon });
      });
    });
  }

  async function checkoutByTrade(tradeNo, method) {
    if (!tradeNo) return;
    if (!String(method || "").trim()) {
      setMessage(t("choosePaymentMethod"), "error");
      return;
    }
    const paymentWindow = window.open("", "_blank");
    if (paymentWindow) {
      paymentWindow.opener = null;
      paymentWindow.document.write(`<p style="font-family:sans-serif;padding:24px">Opening payment...</p>`);
    }
    try {
      const result = await api("/user/order/checkout", { method: "POST", body: { trade_no: tradeNo, method }, raw: true });
      if (Number(result.type) === -1) {
        paymentWindow?.close();
        state.checkout = null;
        setMessage(t("freeOrderActivated"), "success");
      } else if (Number(result.type) === 1) {
        state.checkout = null;
        if (paymentWindow) {
          paymentWindow.location.href = result.data;
        } else {
          state.checkout = { tradeNo, type: result.type, data: result.data };
        }
        setMessage(paymentWindow ? t("paymentOpening") : t("paymentQr"), "success");
      } else {
        paymentWindow?.close();
        state.checkout = { tradeNo, type: result.type, data: result.data };
        setMessage(t("paymentQr"), "success");
      }
      await loadProtected();
    } catch (error) {
      paymentWindow?.close();
      setMessage(error.message || t("networkError"), "error");
    }
  }

  async function buyPlan(button) {
    if (!state.auth) {
      navigate(`/auth/login?redirect=${encodeURIComponent("/portal/plans")}`);
      return;
    }
    const planId = button.dataset.plan;
    const period = document.querySelector(`[data-plan-period="${cssEsc(planId)}"]`)?.value;
    const checkout = await openCheckoutComposer(state.paymentMethods?.[0]?.id || "");
    if (!checkout) return;
    const body = {
      plan_id: planId,
      period,
    };
    if (checkout.coupon) body.coupon_code = checkout.coupon;
    try {
      const saved = await api("/user/order/save", { method: "POST", body });
      const tradeNo = resolveOrderNoFromSave(saved);
      if (!tradeNo) throw new Error(t("networkError"));
      state.checkout = null;
      state.message = { message: `${t("orderCreated")} ${t("orderNo")}: ${tradeNo}`, type: "success" };
      await loadProtected();
      await checkoutByTrade(tradeNo, checkout.method);
      if (!currentPath().startsWith("/portal")) {
        navigate("/portal/plans");
      }
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  function selectPlanPeriod(button) {
    const planId = button?.dataset.plan;
    const period = button?.dataset.period;
    if (!planId || !period) return;
    const hiddenInput = document.querySelector(`[data-plan-period="${cssEsc(planId)}"]`);
    if (hiddenInput) hiddenInput.value = period;
    const picker = button.closest("[data-period-picker]");
    picker?.querySelectorAll(".period-option").forEach((node) => {
      node.classList.toggle("active", node === button);
    });
  }

  function copy(value) {
    if (!value) return;
    if (navigator.clipboard?.writeText) {
      navigator.clipboard.writeText(value).then(() => setMessage(t("copied"), "success")).catch(() => setMessage(t("copyFailed"), "error"));
      return;
    }
    const input = document.createElement("textarea");
    input.value = value;
    document.body.appendChild(input);
    input.select();
    const ok = document.execCommand("copy");
    input.remove();
    setMessage(ok ? t("copied") : t("copyFailed"), ok ? "success" : "error");
  }

  function importToApp(button) {
    const deepLink = button?.dataset.link || buildAppImportLink(state.subscription?.subscribe_url);
    if (!deepLink) {
      setMessage(t("loginRequired"), "error");
      return;
    }
    const fallback = button?.closest(".card")?.querySelector("[data-app-import-fallback]");
    fallback?.classList.remove("show");
    window.location.href = deepLink;
    window.setTimeout(() => {
      if (document.visibilityState === "visible") {
        fallback?.classList.add("show");
        setMessage(t("appImportFallback"), "success");
      }
    }, 1200);
  }

  async function checkoutOrder(button) {
    const tradeNo = button.dataset.trade;
    const method = String(document.querySelector(`[data-payment="${cssEsc(tradeNo)}"]`)?.value || "").trim();
    await checkoutByTrade(tradeNo, method);
  }

  async function cancelOrder(button) {
    const tradeNo = button.dataset.trade;
    try {
      await api("/user/order/cancel", { method: "POST", body: { trade_no: tradeNo } });
      state.checkout = null;
      setMessage(t("orderCanceled"), "success");
      await loadProtected();
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  async function checkOrder(button) {
    const tradeNo = button.dataset.trade;
    try {
      const status = await api("/user/order/check", { params: { trade_no: tradeNo } });
      setMessage(Number(status) === 3 ? t("statusDone") : t("paymentPending"), Number(status) === 3 ? "success" : "info");
      await loadProtected();
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  async function resetSecurity() {
    if (!window.confirm(t("resetSecurityDesc"))) return;
    try {
      const subscribeUrl = await api("/user/resetSecurity");
      if (state.subscription) state.subscription.subscribe_url = subscribeUrl;
      setMessage(t("resetDone"), "success");
      await loadProtected();
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  async function generateInvite() {
    try {
      await api("/user/invite/save");
      setMessage(t("inviteGenerated"), "success");
      await loadProtected();
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  async function closeTicket(button) {
    try {
      await api("/user/ticket/close", { method: "POST", body: { id: button.dataset.ticket } });
      setMessage(t("ticketClosed"), "success");
      await loadProtected();
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  async function handleTicket(form) {
    const fd = new FormData(form);
    try {
      await api("/user/ticket/save", { method: "POST", body: { subject: fd.get("subject"), level: fd.get("level"), message: fd.get("message") } });
      form.reset();
      setMessage(t("ticketCreated"), "success");
      await loadProtected();
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  async function handlePassword(form) {
    const fd = new FormData(form);
    try {
      await api("/user/changePassword", { method: "POST", body: { old_password: fd.get("old_password"), new_password: fd.get("new_password") } });
      setMessage(t("passwordChanged"), "success");
      logout(false);
      navigate("/auth/login");
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  async function handleSettings(form) {
    const fd = new FormData(form);
    try {
      await api("/user/update", { method: "POST", body: { remind_expire: fd.get("remind_expire") ? 1 : 0, remind_traffic: fd.get("remind_traffic") ? 1 : 0 } });
      setMessage(t("saved"), "success");
      await loadProtected();
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  async function handleTransfer(form) {
    const amount = Math.round(Number(new FormData(form).get("transfer_amount") || 0) * 100);
    try {
      await api("/user/transfer", { method: "POST", body: { transfer_amount: amount } });
      form.reset();
      setMessage(t("transferDone"), "success");
      await loadProtected();
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  async function handleGift(form) {
    const code = String(new FormData(form).get("code") || "").trim();
    try {
      await api("/user/gift-card/redeem", { method: "POST", body: { code } });
      form.reset();
      setMessage(t("redeemed"), "success");
      await loadProtected();
    } catch (error) {
      setMessage(error.message || t("networkError"), "error");
    }
  }

  function bindEvents() {
    document.addEventListener("click", (event) => {
      const nav = event.target.closest("[data-nav]");
      if (nav) {
        event.preventDefault();
        navigate(nav.getAttribute("data-nav"));
        return;
      }
      const action = event.target.closest("[data-action]")?.dataset.action;
      if (!action) return;
      if (action === "menu") document.getElementById("mobile-menu")?.classList.toggle("open");
      if (action === "assistant-toggle") {
        const trigger = event.target.closest("[data-action='assistant-toggle']");
        const wrapper = trigger?.closest("[data-assistant]");
        if (wrapper?.dataset.justDragged === "1") return;
        const opened = wrapper?.classList.toggle("open");
        trigger?.setAttribute("aria-expanded", opened ? "true" : "false");
        if (opened) {
          const query = wrapper?.querySelector("[data-assistant-query]")?.value || "";
          renderAssistantHistory(wrapper, query);
        }
      }
      if (action === "assistant-question") {
        const button = event.target.closest("[data-action='assistant-question']");
        const wrapper = button?.closest("[data-assistant]");
        const input = wrapper?.querySelector("[data-assistant-query]");
        const question = button?.dataset.question || "";
        if (input) input.value = question;
        assistantAsk(wrapper, question);
      }
      if (action === "assistant-send") {
        const wrapper = event.target.closest("[data-assistant]");
        const input = wrapper?.querySelector("[data-assistant-query]");
        assistantAsk(wrapper, input?.value || "");
      }
      if (action === "assistant-ticket") {
        assistantTicketHandoff();
      }
      if (action === "logout") logout();
      if (action === "send-code") sendCode(event.target.closest("[data-action]"));
      if (action === "buy-plan") buyPlan(event.target.closest("[data-action]"));
      if (action === "select-period") selectPlanPeriod(event.target.closest("[data-action]"));
      if (action === "copy") copy(event.target.closest("[data-action]").dataset.copy);
      if (action === "copy-sub") copy(state.subscription?.subscribe_url);
      if (action === "import-app") importToApp(event.target.closest("[data-action]"));
      if (action === "checkout-order") checkoutOrder(event.target.closest("[data-action]"));
      if (action === "cancel-order") cancelOrder(event.target.closest("[data-action]"));
      if (action === "check-order") checkOrder(event.target.closest("[data-action]"));
      if (action === "reset-security") resetSecurity();
      if (action === "generate-invite") generateInvite();
      if (action === "close-ticket") closeTicket(event.target.closest("[data-action]"));
      if (action === "refresh") loadProtected();
    });

    document.addEventListener("change", (event) => {
      if (event.target.matches("[data-action='locale']")) setLocale(event.target.value);
    });

    document.addEventListener("input", (event) => {
      if (event.target.matches("[data-assistant-query]")) {
        renderAssistantHistory(event.target.closest("[data-assistant]"), event.target.value || "");
      }
    });

    document.addEventListener("keydown", (event) => {
      if (!event.target.matches("[data-assistant-query]")) return;
      if (event.key !== "Enter" || event.shiftKey) return;
      event.preventDefault();
      const wrapper = event.target.closest("[data-assistant]");
      assistantAsk(wrapper, event.target.value || "");
    });

    document.addEventListener("focusin", (event) => {
      if (event.target.matches("[data-assistant-query]")) {
        const wrapper = event.target.closest("[data-assistant]");
        renderAssistantHistory(wrapper, event.target.value || "");
      }
    });

    document.addEventListener("submit", (event) => {
      const form = event.target.closest("[data-form]");
      if (!form) return;
      event.preventDefault();
      const type = form.dataset.form;
      if (type === "login" || type === "register") handleAuth(form);
      if (type === "ticket") handleTicket(form);
      if (type === "password") handlePassword(form);
      if (type === "settings") handleSettings(form);
      if (type === "transfer") handleTransfer(form);
      if (type === "gift") handleGift(form);
    });

    window.addEventListener("popstate", render);
  }

  function render() {
    captureAttributionFromLocation();
    applyBrandTheme();
    document.documentElement.lang = state.locale;
    document.documentElement.dir = state.locale === "fa-IR" ? "rtl" : "ltr";
    const path = currentPath();
    state.message = path.startsWith("/auth/") ? state.message : state.message;
    if (path.startsWith("/auth/register")) {
      root.innerHTML = renderAuth("register");
    } else if (path.startsWith("/auth/login")) {
      root.innerHTML = renderAuth("login");
    } else if (path.startsWith("/portal")) {
      if (!state.auth) {
        navigate(`/auth/login?redirect=${encodeURIComponent(path)}`);
        return;
      }
      root.innerHTML = renderPortal();
    } else if (path === "/features" || path === "/pricing" || path === "/download" || path === "/support") {
      root.innerHTML = renderMarketingPage(path.slice(1));
    } else {
      root.innerHTML = renderHome();
    }
    setupAssistantWidget();
  }

  bindEvents();
  render();
  loadPublic();
  loadProtected();
})();
