///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsZhTw extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhTw({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhTw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-TW>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZhTw _root = this; // ignore: unused_field

	@override 
	TranslationsZhTw $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhTw(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonZhTw common = TranslationsCommonZhTw._(_root);
	@override late final TranslationsIntroZhTw intro = TranslationsIntroZhTw._(_root);
	@override late final TranslationsPagesZhTw pages = TranslationsPagesZhTw._(_root);
	@override late final TranslationsComponentsZhTw components = TranslationsComponentsZhTw._(_root);
	@override late final TranslationsDialogsZhTw dialogs = TranslationsDialogsZhTw._(_root);
	@override late final TranslationsConnectionZhTw connection = TranslationsConnectionZhTw._(_root);
	@override late final TranslationsErrorsZhTw errors = TranslationsErrorsZhTw._(_root);
}

// Path: common
class TranslationsCommonZhTw extends TranslationsCommonEn {
	TranslationsCommonZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get appTitle => '樹懶VPN';
	@override String get start => '開始';
	@override String get version => '版本';
	@override String get ok => '確定';
	@override String get cancel => '取消';
	@override String get kContinue => '繼續';
	@override String get showMore => '顯示更多';
	@override String get showLess => '顯示較少';
	@override String get filter => '篩選';
	@override String get all => '全部';
	@override String get pause => '暫停';
	@override String get resume => '恢復';
	@override String get clear => '清除';
	@override String get close => '關閉';
	@override String get auto => '自動';
	@override String get manually => '手動';
	@override String get name => '名稱';
	@override String get url => 'URL';
	@override String get add => '新增';
	@override String get clipboard => '剪貼簿';
	@override String get addToClipboard => '新增至剪貼簿';
	@override String get scanQr => '掃描 QR Code';
	@override String get free => '免費';
	@override String get warp => 'WARP';
	@override String get fragment => 'Fragment';
	@override String get help => '說明';
	@override String get save => '儲存';
	@override String get update => '更新';
	@override String get share => '分享';
	@override String get edit => '編輯';
	@override String get delete => '刪除';
	@override String get discard => '捨棄';
	@override String get import => '匯入';
	@override String get export => '匯出';
	@override String get later => '稍後';
	@override String get ignore => '忽略';
	@override String get quit => '退出';
	@override String get notSet => '未設定';
	@override String get hide => '隱藏';
	@override String get exit => '退出';
	@override String get reset => '重設';
	@override String get done => '完成';
	@override String get search => '搜尋';
	@override String get decline => '拒絕';
	@override String get agree => '同意';
	@override String get empty => '空';
	@override String get unknown => '未知';
	@override String get hidden => '隱藏';
	@override String get timeout => '超時';
	@override String get sort => '排序';
	@override String get dashboard => '儀表板';
	@override late final TranslationsCommonIntervalZhTw interval = TranslationsCommonIntervalZhTw._(_root);
	@override late final TranslationsCommonMsgZhTw msg = TranslationsCommonMsgZhTw._(_root);
}

// Path: intro
class TranslationsIntroZhTw extends TranslationsIntroEn {
	TranslationsIntroZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get banner => '暢享無限制網路的所需一切';
	@override TextSpan termsAndPolicyCaution({required InlineSpanBuilder tap}) => TextSpan(children: [
		const TextSpan(text: '繼續即表示您同意 '),
		tap(_root.pages.about.termsAndConditions),
	]);
	@override TextSpan info({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [
		const TextSpan(text: '由 Hiddify 以 ❤️ 製作 - '),
		tap_source('開源'),
		const TextSpan(text: ' ('),
		tap_license('授權'),
		const TextSpan(text: ')'),
	]);
}

// Path: pages
class TranslationsPagesZhTw extends TranslationsPagesEn {
	TranslationsPagesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesHomeZhTw home = TranslationsPagesHomeZhTw._(_root);
	@override late final TranslationsPagesProxiesZhTw proxies = TranslationsPagesProxiesZhTw._(_root);
	@override late final TranslationsPagesProfilesZhTw profiles = TranslationsPagesProfilesZhTw._(_root);
	@override late final TranslationsPagesProfileDetailsZhTw profileDetails = TranslationsPagesProfileDetailsZhTw._(_root);
	@override late final TranslationsPagesLogsZhTw logs = TranslationsPagesLogsZhTw._(_root);
	@override late final TranslationsPagesAboutZhTw about = TranslationsPagesAboutZhTw._(_root);
	@override late final TranslationsPagesSettingsZhTw settings = TranslationsPagesSettingsZhTw._(_root);
}

// Path: components
class TranslationsComponentsZhTw extends TranslationsComponentsEn {
	TranslationsComponentsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsComponentsStatsZhTw stats = TranslationsComponentsStatsZhTw._(_root);
	@override late final TranslationsComponentsSubscriptionInfoZhTw subscriptionInfo = TranslationsComponentsSubscriptionInfoZhTw._(_root);
}

// Path: dialogs
class TranslationsDialogsZhTw extends TranslationsDialogsEn {
	TranslationsDialogsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsSortProfilesZhTw sortProfiles = TranslationsDialogsSortProfilesZhTw._(_root);
	@override late final TranslationsDialogsWarpLicenseZhTw warpLicense = TranslationsDialogsWarpLicenseZhTw._(_root);
	@override late final TranslationsDialogsNewVersionZhTw newVersion = TranslationsDialogsNewVersionZhTw._(_root);
	@override late final TranslationsDialogsConfirmationZhTw confirmation = TranslationsDialogsConfirmationZhTw._(_root);
	@override late final TranslationsDialogsExperimentalNoticeZhTw experimentalNotice = TranslationsDialogsExperimentalNoticeZhTw._(_root);
	@override late final TranslationsDialogsNoActiveProfileZhTw noActiveProfile = TranslationsDialogsNoActiveProfileZhTw._(_root);
	@override late final TranslationsDialogsUnknownDomainsWarningZhTw unknownDomainsWarning = TranslationsDialogsUnknownDomainsWarningZhTw._(_root);
	@override late final TranslationsDialogsProxyInfoZhTw proxyInfo = TranslationsDialogsProxyInfoZhTw._(_root);
	@override late final TranslationsDialogsWindowClosingZhTw windowClosing = TranslationsDialogsWindowClosingZhTw._(_root);
}

// Path: connection
class TranslationsConnectionZhTw extends TranslationsConnectionEn {
	TranslationsConnectionZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get tapToConnect => '點擊連線';
	@override String get connect => '連線';
	@override String get connecting => '連線中...';
	@override String get connected => '已連線';
	@override String get disconnect => '中斷連線';
	@override String get disconnecting => '中斷連線中...';
	@override String get reconnect => '重新連線';
	@override String get reconnectMsg => '正在重新連線以套用變更...';
	@override String get secure => '由 WARP 保護';
}

// Path: errors
class TranslationsErrorsZhTw extends TranslationsErrorsEn {
	TranslationsErrorsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '意外錯誤';
	@override late final TranslationsErrorsConnectionZhTw connection = TranslationsErrorsConnectionZhTw._(_root);
	@override late final TranslationsErrorsProfilesZhTw profiles = TranslationsErrorsProfilesZhTw._(_root);
	@override late final TranslationsErrorsConnectivityZhTw connectivity = TranslationsErrorsConnectivityZhTw._(_root);
	@override late final TranslationsErrorsSingboxZhTw singbox = TranslationsErrorsSingboxZhTw._(_root);
	@override late final TranslationsErrorsWarpZhTw warp = TranslationsErrorsWarpZhTw._(_root);
}

// Path: common.interval
class TranslationsCommonIntervalZhTw extends TranslationsCommonIntervalEn {
	TranslationsCommonIntervalZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n,
		zero: '',
		one: '${n} 天',
		other: '${n} 天',
	);
	@override String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n,
		zero: '',
		one: '${n} 小時',
		other: '${n} 小時',
	);
}

// Path: common.msg
class TranslationsCommonMsgZhTw extends TranslationsCommonMsgEn {
	TranslationsCommonMsgZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgPermissionZhTw permission = TranslationsCommonMsgPermissionZhTw._(_root);
	@override late final TranslationsCommonMsgExportZhTw export = TranslationsCommonMsgExportZhTw._(_root);
	@override late final TranslationsCommonMsgImportZhTw import = TranslationsCommonMsgImportZhTw._(_root);
}

// Path: pages.home
class TranslationsPagesHomeZhTw extends TranslationsPagesHomeEn {
	TranslationsPagesHomeZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '首頁';
	@override String get quickSettings => '快速設定';
}

// Path: pages.proxies
class TranslationsPagesProxiesZhTw extends TranslationsPagesProxiesEn {
	TranslationsPagesProxiesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '代理';
	@override String get sort => '排序代理';
	@override String get testDelay => '測試延遲';
	@override String get empty => '無可用代理';
	@override String get activeProxy => '當前代理';
	@override String get unknownIp => '未知 IP';
	@override late final TranslationsPagesProxiesSortOptionsZhTw sortOptions = TranslationsPagesProxiesSortOptionsZhTw._(_root);
	@override late final TranslationsPagesProxiesIpInfoZhTw ipInfo = TranslationsPagesProxiesIpInfoZhTw._(_root);
	@override late final TranslationsPagesProxiesDelayZhTw delay = TranslationsPagesProxiesDelayZhTw._(_root);
}

// Path: pages.profiles
class TranslationsPagesProfilesZhTw extends TranslationsPagesProfilesEn {
	TranslationsPagesProfilesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '設定檔';
	@override String get add => '新增設定檔';
	@override String get update => '更新設定檔';
	@override String get viewAllProfiles => '檢視所有設定檔';
	@override String activeProfileName({required Object name}) => '目前設定檔：「${name}」';
	@override String nonActiveProfileName({required Object name}) => '選擇「${name}」作為目前設定檔';
	@override String get freeSubNotFound => '未找到免費訂閱';
	@override String freeSubNotFoundForRegion({required Object region}) => '未找到「${region}」地區的免費訂閱';
	@override String get failedToLoad => '載入失敗';
	@override String get updateSubscriptions => '更新訂閱';
	@override late final TranslationsPagesProfilesShareZhTw share = TranslationsPagesProfilesShareZhTw._(_root);
	@override late final TranslationsPagesProfilesMsgZhTw msg = TranslationsPagesProfilesMsgZhTw._(_root);
}

// Path: pages.profileDetails
class TranslationsPagesProfileDetailsZhTw extends TranslationsPagesProfileDetailsEn {
	TranslationsPagesProfileDetailsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '設定檔';
	@override String get lastUpdate => '最後更新';
	@override late final TranslationsPagesProfileDetailsFormZhTw form = TranslationsPagesProfileDetailsFormZhTw._(_root);
}

// Path: pages.logs
class TranslationsPagesLogsZhTw extends TranslationsPagesLogsEn {
	TranslationsPagesLogsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '日誌';
	@override String get shareCoreLogs => '分享核心日誌';
	@override String get shareAppLogs => '分享應用程式日誌';
}

// Path: pages.about
class TranslationsPagesAboutZhTw extends TranslationsPagesAboutEn {
	TranslationsPagesAboutZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '關於';
	@override String get notAvailableMsg => '已是最新版本';
	@override String get checkForUpdate => '檢查更新';
	@override String get openWorkingDir => '開啟工作目錄';
	@override String get sourceCode => '原始碼';
	@override String get telegramChannel => 'Telegram 頻道';
	@override String get termsAndConditions => '條款與條件';
	@override String get privacyPolicy => '隱私權政策';
}

// Path: pages.settings
class TranslationsPagesSettingsZhTw extends TranslationsPagesSettingsEn {
	TranslationsPagesSettingsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
	@override String get resetTunnel => '重設 VPN 設定檔';
	@override String get resetTunnelSubtitle => '重建本地通道狀態';
	@override String get heroSubtitle => '網路調校中心';
	@override String get sectionOpenHint => '點擊開啟';
	@override late final TranslationsPagesSettingsOptionsZhTw options = TranslationsPagesSettingsOptionsZhTw._(_root);
	@override late final TranslationsPagesSettingsGeneralZhTw general = TranslationsPagesSettingsGeneralZhTw._(_root);
	@override late final TranslationsPagesSettingsRoutingZhTw routing = TranslationsPagesSettingsRoutingZhTw._(_root);
	@override late final TranslationsPagesSettingsDnsZhTw dns = TranslationsPagesSettingsDnsZhTw._(_root);
	@override late final TranslationsPagesSettingsInboundZhTw inbound = TranslationsPagesSettingsInboundZhTw._(_root);
	@override late final TranslationsPagesSettingsTlsTricksZhTw tlsTricks = TranslationsPagesSettingsTlsTricksZhTw._(_root);
	@override late final TranslationsPagesSettingsWarpZhTw warp = TranslationsPagesSettingsWarpZhTw._(_root);
}

// Path: components.stats
class TranslationsComponentsStatsZhTw extends TranslationsComponentsStatsEn {
	TranslationsComponentsStatsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get connection => '連線';
	@override String get traffic => '流量';
	@override String get trafficLive => '即時流量';
	@override String get trafficTotal => '總流量';
	@override String get uplink => '上傳';
	@override String get downlink => '下載';
	@override String get speed => '速度';
	@override String get totalTransferred => '總傳輸量';
}

// Path: components.subscriptionInfo
class TranslationsComponentsSubscriptionInfoZhTw extends TranslationsComponentsSubscriptionInfoEn {
	TranslationsComponentsSubscriptionInfoZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get upload => '上傳';
	@override String get download => '下載';
	@override String get total => '總流量';
	@override String get expireDate => '到期日期';
	@override String get expired => '已到期';
	@override String get noTraffic => '流量已用盡';
	@override String get remainingTime => '剩餘時間';
	@override String remainingDuration({required Object duration}) => '剩餘 ${duration} 天';
	@override String remainingDurationNew({required Object duration}) => '${duration} 天';
	@override String remainingTrafficSemanticLabel({required Object consumed, required Object total}) => '已使用 ${consumed} / ${total} 流量';
	@override String get remainingTraffic => '剩餘流量';
	@override String get remainingUsage => '剩餘';
	@override String get profileSite => '提供商';
	@override String get profileSupport => '支援';
}

// Path: dialogs.sortProfiles
class TranslationsDialogsSortProfilesZhTw extends TranslationsDialogsSortProfilesEn {
	TranslationsDialogsSortProfilesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '排序方式';
	@override late final TranslationsDialogsSortProfilesSortZhTw sort = TranslationsDialogsSortProfilesSortZhTw._(_root);
}

// Path: dialogs.warpLicense
class TranslationsDialogsWarpLicenseZhTw extends TranslationsDialogsWarpLicenseEn {
	TranslationsDialogsWarpLicenseZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cloudflare WARP 同意書';
	@override TextSpan description({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [
		const TextSpan(text: 'Cloudflare WARP 是一個免費的 WireGuard VPN 提供商。啟用此選項即表示您同意 Cloudflare WARP 的 '),
		tos('服務條款'),
		const TextSpan(text: ' 和 '),
		privacy('隱私權政策'),
		const TextSpan(text: '。'),
	]);
}

// Path: dialogs.newVersion
class TranslationsDialogsNewVersionZhTw extends TranslationsDialogsNewVersionEn {
	TranslationsDialogsNewVersionZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '有可用更新';
	@override String get msg => '${_root.common.appTitle} 的新版本已發布。您想立即更新嗎？';
	@override String get currentVersion => '目前版本：';
	@override String get newVersion => '新版本：';
	@override String get updateNow => '立即更新';
}

// Path: dialogs.confirmation
class TranslationsDialogsConfirmationZhTw extends TranslationsDialogsConfirmationEn {
	TranslationsDialogsConfirmationZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsZhTw settings = TranslationsDialogsConfirmationSettingsZhTw._(_root);
	@override late final TranslationsDialogsConfirmationProfileZhTw profile = TranslationsDialogsConfirmationProfileZhTw._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyZhTw perAppProxy = TranslationsDialogsConfirmationPerAppProxyZhTw._(_root);
	@override late final TranslationsDialogsConfirmationRouteRuleZhTw routeRule = TranslationsDialogsConfirmationRouteRuleZhTw._(_root);
}

// Path: dialogs.experimentalNotice
class TranslationsDialogsExperimentalNoticeZhTw extends TranslationsDialogsExperimentalNoticeEn {
	TranslationsDialogsExperimentalNoticeZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '正在使用實驗性功能';
	@override String get msg => '您已啟用了一些實驗性功能，這可能會影響連線品質並導致意外錯誤。您可以隨時在設定選項頁面變更或重設這些選項。';
	@override String get disable => '不再顯示';
}

// Path: dialogs.noActiveProfile
class TranslationsDialogsNoActiveProfileZhTw extends TranslationsDialogsNoActiveProfileEn {
	TranslationsDialogsNoActiveProfileZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '選擇一個設定檔';
	@override String get msg => '讓我們從新增一個包含您 VPN 連線詳細資訊的設定檔開始。\n\n還沒有 VPN 伺服器？別擔心，按照下面的教學，您可以快速免費地設定一個。';
	@override late final TranslationsDialogsNoActiveProfileHelpBtnZhTw helpBtn = TranslationsDialogsNoActiveProfileHelpBtnZhTw._(_root);
}

// Path: dialogs.unknownDomainsWarning
class TranslationsDialogsUnknownDomainsWarningZhTw extends TranslationsDialogsUnknownDomainsWarningEn {
	TranslationsDialogsUnknownDomainsWarningZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '外部連結警告';
	@override String get youAreAboutToVisit => '您即將造訪：';
	@override String get thisWebsiteIsNotInOurTrustedList => '此網站不在我們的信任清單中。請謹慎操作。';
}

// Path: dialogs.proxyInfo
class TranslationsDialogsProxyInfoZhTw extends TranslationsDialogsProxyInfoEn {
	TranslationsDialogsProxyInfoZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get fullTag => '完整標籤：';
	@override String get type => '類型：';
	@override String get testTime => '測試時間：';
	@override String get testDelay => '測試延遲：';
	@override String get isSelected => '已選擇：';
	@override String get isGroup => '是群組';
	@override String get isSecure => '安全：';
	@override String get port => '連接埠：';
	@override String get host => '主機：';
	@override String get ip => 'IP：';
	@override String get countryCode => '國家代碼：';
	@override String get region => '地區：';
	@override String get city => '城市：';
	@override String get asn => 'ASN：';
	@override String get organization => '組織：';
	@override String get location => '位置：';
	@override String get postalCode => '郵遞區號：';
}

// Path: dialogs.windowClosing
class TranslationsDialogsWindowClosingZhTw extends TranslationsDialogsWindowClosingEn {
	TranslationsDialogsWindowClosingZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get askEachTime => '每次詢問';
	@override String get alertMessage => '隱藏還是退出應用程式？';
	@override String get remember => '記住我的選擇';
}

// Path: errors.connection
class TranslationsErrorsConnectionZhTw extends TranslationsErrorsConnectionEn {
	TranslationsErrorsConnectionZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '意外連線錯誤';
	@override String get timeout => '連線超時';
	@override String get badResponse => '回應錯誤';
	@override String get connectionError => '連線錯誤';
	@override String get badCertificate => '憑證無效';
}

// Path: errors.profiles
class TranslationsErrorsProfilesZhTw extends TranslationsErrorsProfilesEn {
	TranslationsErrorsProfilesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '意外錯誤';
	@override String get notFound => '未找到設定檔';
	@override String get invalidConfig => '設定無效';
	@override String get invalidUrl => 'URL 無效';
	@override String get canceledByUser => '使用者已取消';
}

// Path: errors.connectivity
class TranslationsErrorsConnectivityZhTw extends TranslationsErrorsConnectivityEn {
	TranslationsErrorsConnectivityZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '意外失敗';
	@override String get missingVpnPermission => '缺少 VPN 權限';
	@override String get missingNotificationPermission => '缺少通知權限';
	@override String get core => '核心錯誤';
}

// Path: errors.singbox
class TranslationsErrorsSingboxZhTw extends TranslationsErrorsSingboxEn {
	TranslationsErrorsSingboxZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get serviceNotRunning => '服務未運行';
	@override String get missingPrivilege => '缺少權限';
	@override String get missingPrivilegeMsg => 'VPN 模式需要管理員權限。請以管理員身份重新啟動應用，或更改服務模式。';
	@override String get invalidConfigOptions => '設定選項無效';
	@override String get invalidConfig => '設定無效';
}

// Path: errors.warp
class TranslationsErrorsWarpZhTw extends TranslationsErrorsWarpEn {
	TranslationsErrorsWarpZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get missingLicense => 'WARP 授權缺失';
	@override String get missingLicenseMsg => '所選設定檔使用 WARP 功能；要使用此功能，必須同意 WARP 授權條款。';
}

// Path: common.msg.permission
class TranslationsCommonMsgPermissionZhTw extends TranslationsCommonMsgPermissionEn {
	TranslationsCommonMsgPermissionZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get denied => '權限被拒絕';
}

// Path: common.msg.export
class TranslationsCommonMsgExportZhTw extends TranslationsCommonMsgExportEn {
	TranslationsCommonMsgExportZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgExportClipboardZhTw clipboard = TranslationsCommonMsgExportClipboardZhTw._(_root);
	@override late final TranslationsCommonMsgExportFileZhTw file = TranslationsCommonMsgExportFileZhTw._(_root);
}

// Path: common.msg.import
class TranslationsCommonMsgImportZhTw extends TranslationsCommonMsgImportEn {
	TranslationsCommonMsgImportZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get confirm => '確認匯入';
	@override String get success => '匯入成功';
	@override String get failure => '匯入失敗';
}

// Path: pages.proxies.sortOptions
class TranslationsPagesProxiesSortOptionsZhTw extends TranslationsPagesProxiesSortOptionsEn {
	TranslationsPagesProxiesSortOptionsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get unsorted => '預設';
	@override String get name => '按名稱';
	@override String get delay => '按延遲';
}

// Path: pages.proxies.ipInfo
class TranslationsPagesProxiesIpInfoZhTw extends TranslationsPagesProxiesIpInfoEn {
	TranslationsPagesProxiesIpInfoZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get address => 'IP 位址';
	@override String get country => '國家';
	@override String get organization => '組織';
}

// Path: pages.proxies.delay
class TranslationsPagesProxiesDelayZhTw extends TranslationsPagesProxiesDelayEn {
	TranslationsPagesProxiesDelayZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String result({required Object delay}) => '延遲：${delay}毫秒';
	@override String get timeout => '延遲測試超時';
	@override String get testing => '延遲：測試中...';
}

// Path: pages.profiles.share
class TranslationsPagesProfilesShareZhTw extends TranslationsPagesProfilesShareEn {
	TranslationsPagesProfilesShareZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get urlToClipboard => 'URL 到剪貼簿';
	@override String get showUrlQr => '顯示 URL QR Code';
	@override String get jsonToClipboard => 'JSON 到剪貼簿';
}

// Path: pages.profiles.msg
class TranslationsPagesProfilesMsgZhTw extends TranslationsPagesProfilesMsgEn {
	TranslationsPagesProfilesMsgZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesProfilesMsgSaveZhTw save = TranslationsPagesProfilesMsgSaveZhTw._(_root);
	@override String get invalidUrl => '無效的 URL';
	@override late final TranslationsPagesProfilesMsgAddZhTw add = TranslationsPagesProfilesMsgAddZhTw._(_root);
	@override late final TranslationsPagesProfilesMsgUpdateZhTw update = TranslationsPagesProfilesMsgUpdateZhTw._(_root);
	@override late final TranslationsPagesProfilesMsgDeleteZhTw delete = TranslationsPagesProfilesMsgDeleteZhTw._(_root);
}

// Path: pages.profileDetails.form
class TranslationsPagesProfileDetailsFormZhTw extends TranslationsPagesProfileDetailsFormEn {
	TranslationsPagesProfileDetailsFormZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get nameHint => '設定檔名稱';
	@override String get emptyName => '名稱為必填項';
	@override String get invalidUrl => '無效的 URL';
	@override String get urlHint => '完整的設定 URL';
	@override String get disableAutoUpdate => '停用自動更新';
	@override String get autoUpdateInterval => '自動更新間隔';
	@override String get loading => '正在新增設定檔...';
}

// Path: pages.settings.options
class TranslationsPagesSettingsOptionsZhTw extends TranslationsPagesSettingsOptionsEn {
	TranslationsPagesSettingsOptionsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsOptionsImportZhTw import = TranslationsPagesSettingsOptionsImportZhTw._(_root);
	@override late final TranslationsPagesSettingsOptionsExportZhTw export = TranslationsPagesSettingsOptionsExportZhTw._(_root);
	@override String get reset => '重設選項';
}

// Path: pages.settings.general
class TranslationsPagesSettingsGeneralZhTw extends TranslationsPagesSettingsGeneralEn {
	TranslationsPagesSettingsGeneralZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '一般';
	@override String get locale => '語言';
	@override String get themeMode => '主題模式';
	@override late final TranslationsPagesSettingsGeneralThemeModesZhTw themeModes = TranslationsPagesSettingsGeneralThemeModesZhTw._(_root);
	@override String get enableAnalytics => '啟用分析';
	@override String get enableAnalyticsMsg => '允許收集分析資料和傳送崩潰報告以改進應用程式';
	@override String get autoIpCheck => '自動檢查連線 IP';
	@override String get dynamicNotification => '在通知中顯示速度';
	@override String get hapticFeedback => '觸覺回饋';
	@override String get actionAtClosing => '關閉時操作';
	@override String get autoStart => '開機自啟';
	@override String get silentStart => '靜默啟動';
	@override String get ignoreBatteryOptimizations => '忽略電池最佳化';
	@override String get ignoreBatteryOptimizationsMsg => '移除限制以獲得最佳 VPN 效能';
	@override String get memoryLimit => '記憶體限制';
	@override String get memoryLimitMsg => '如果您遇到記憶體不足錯誤或應用程式頻繁崩潰，請啟用此選項';
	@override String get debugMode => '偵錯模式';
	@override String get debugModeMsg => '重新啟動應用程式以套用此變更';
	@override String get logLevel => '日誌級別';
	@override String get connectionTestUrl => '連線測試 URL';
	@override String get urlTestInterval => 'URL 測試間隔';
	@override String get clashApiPort => 'Clash API 連接埠';
	@override String get useXrayCoreWhenPossible => '盡可能使用 xray-core';
	@override String get useXrayCoreWhenPossibleMsg => '解析訂閱連結時使用 xray-core。您需要重新匯入訂閱連結才能啟用此選項';
}

// Path: pages.settings.routing
class TranslationsPagesSettingsRoutingZhTw extends TranslationsPagesSettingsRoutingEn {
	TranslationsPagesSettingsRoutingZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '路由';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyZhTw perAppProxy = TranslationsPagesSettingsRoutingPerAppProxyZhTw._(_root);
	@override String get region => '地區';
	@override late final TranslationsPagesSettingsRoutingRegionsZhTw regions = TranslationsPagesSettingsRoutingRegionsZhTw._(_root);
	@override late final TranslationsPagesSettingsRoutingBalancerStrategyZhTw balancerStrategy = TranslationsPagesSettingsRoutingBalancerStrategyZhTw._(_root);
	@override String get blockAds => '攔截廣告';
	@override String get bypassLan => '繞過區域網路';
	@override String get resolveDestination => '解析目的地';
	@override String get ipv6Route => 'IPv6 路由';
	@override late final TranslationsPagesSettingsRoutingIpv6ModesZhTw ipv6Modes = TranslationsPagesSettingsRoutingIpv6ModesZhTw._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleZhTw routeRule = TranslationsPagesSettingsRoutingRouteRuleZhTw._(_root);
}

// Path: pages.settings.dns
class TranslationsPagesSettingsDnsZhTw extends TranslationsPagesSettingsDnsEn {
	TranslationsPagesSettingsDnsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => 'DNS';
	@override String get remoteDns => '遠端 DNS';
	@override String get remoteDnsDomainStrategy => '遠端 DNS 網域策略';
	@override String get directDns => '出站伺服器解析器（直連）';
	@override String get directDnsDomainStrategy => '出站網域策略';
	@override String get enableDnsRouting => '啟用 DNS 路由';
	@override String get enableFakeDns => '啟用偽造 DNS';
	@override late final TranslationsPagesSettingsDnsDomainStrategyZhTw domainStrategy = TranslationsPagesSettingsDnsDomainStrategyZhTw._(_root);
}

// Path: pages.settings.inbound
class TranslationsPagesSettingsInboundZhTw extends TranslationsPagesSettingsInboundEn {
	TranslationsPagesSettingsInboundZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '入站';
	@override String get serviceMode => '服務模式';
	@override late final TranslationsPagesSettingsInboundServiceModesZhTw serviceModes = TranslationsPagesSettingsInboundServiceModesZhTw._(_root);
	@override late final TranslationsPagesSettingsInboundShortServiceModesZhTw shortServiceModes = TranslationsPagesSettingsInboundShortServiceModesZhTw._(_root);
	@override String get strictRoute => '嚴格路由';
	@override String get tunImplementation => 'TUN 實現';
	@override late final TranslationsPagesSettingsInboundTunImplementationsZhTw tunImplementations = TranslationsPagesSettingsInboundTunImplementationsZhTw._(_root);
	@override String get mixedPort => '混合連接埠';
	@override String get tproxyPort => '透明代理連接埠';
	@override String get directPort => '本地 Direct 連接埠';
	@override String get redirectPort => '重新導向連接埠';
	@override String get allowConnectionFromLan => '允許來自區域網路的連線';
}

// Path: pages.settings.tlsTricks
class TranslationsPagesSettingsTlsTricksZhTw extends TranslationsPagesSettingsTlsTricksEn {
	TranslationsPagesSettingsTlsTricksZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => 'TLS 技巧';
	@override String get enable => '啟用分片';
	@override String get packets => '分片封包';
	@override String get packetsTlsHello => 'TLS Hello';
	@override String get packets1_1 => '1-1';
	@override String get packets1_2 => '1-2';
	@override String get packets1_3 => '1-3';
	@override String get packets1_4 => '1-4';
	@override String get packets1_5 => '1-5';
	@override String get size => '分片大小';
	@override String get sleep => '分片延遲';
	@override late final TranslationsPagesSettingsTlsTricksMixedSniCaseZhTw mixedSniCase = TranslationsPagesSettingsTlsTricksMixedSniCaseZhTw._(_root);
	@override late final TranslationsPagesSettingsTlsTricksPaddingZhTw padding = TranslationsPagesSettingsTlsTricksPaddingZhTw._(_root);
}

// Path: pages.settings.warp
class TranslationsPagesSettingsWarpZhTw extends TranslationsPagesSettingsWarpEn {
	TranslationsPagesSettingsWarpZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => 'WARP';
	@override String get enable => '啟用 WARP';
	@override String get generateConfig => '產生 WARP 設定';
	@override String get configGenerated => 'WARP 設定已產生';
	@override String get missingConfig => 'WARP 設定缺失';
	@override String get detourMode => 'WARP 路由模式';
	@override late final TranslationsPagesSettingsWarpDetourModesZhTw detourModes = TranslationsPagesSettingsWarpDetourModesZhTw._(_root);
	@override String get licenseKey => '授權金鑰';
	@override String get cleanIp => '優選 IP';
	@override String get port => '連接埠';
	@override late final TranslationsPagesSettingsWarpNoiseZhTw noise = TranslationsPagesSettingsWarpNoiseZhTw._(_root);
}

// Path: dialogs.sortProfiles.sort
class TranslationsDialogsSortProfilesSortZhTw extends TranslationsDialogsSortProfilesSortEn {
	TranslationsDialogsSortProfilesSortZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get name => '按字母順序';
	@override String get lastUpdate => '最近更新';
}

// Path: dialogs.confirmation.settings
class TranslationsDialogsConfirmationSettingsZhTw extends TranslationsDialogsConfirmationSettingsEn {
	TranslationsDialogsConfirmationSettingsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsImportZhTw import = TranslationsDialogsConfirmationSettingsImportZhTw._(_root);
}

// Path: dialogs.confirmation.profile
class TranslationsDialogsConfirmationProfileZhTw extends TranslationsDialogsConfirmationProfileEn {
	TranslationsDialogsConfirmationProfileZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationProfileDeleteZhTw delete = TranslationsDialogsConfirmationProfileDeleteZhTw._(_root);
}

// Path: dialogs.confirmation.perAppProxy
class TranslationsDialogsConfirmationPerAppProxyZhTw extends TranslationsDialogsConfirmationPerAppProxyEn {
	TranslationsDialogsConfirmationPerAppProxyZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationPerAppProxyShareOnGithubZhTw shareOnGithub = TranslationsDialogsConfirmationPerAppProxyShareOnGithubZhTw._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyImportZhTw import = TranslationsDialogsConfirmationPerAppProxyImportZhTw._(_root);
}

// Path: dialogs.confirmation.routeRule
class TranslationsDialogsConfirmationRouteRuleZhTw extends TranslationsDialogsConfirmationRouteRuleEn {
	TranslationsDialogsConfirmationRouteRuleZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationRouteRuleDeleteZhTw delete = TranslationsDialogsConfirmationRouteRuleDeleteZhTw._(_root);
}

// Path: dialogs.noActiveProfile.helpBtn
class TranslationsDialogsNoActiveProfileHelpBtnZhTw extends TranslationsDialogsNoActiveProfileHelpBtnEn {
	TranslationsDialogsNoActiveProfileHelpBtnZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get label => '告訴我如何操作';
	@override String get url => 'https://github.com/shulaiyun/Sloth-VPN.git';
}

// Path: common.msg.export.clipboard
class TranslationsCommonMsgExportClipboardZhTw extends TranslationsCommonMsgExportClipboardEn {
	TranslationsCommonMsgExportClipboardZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get success => '已成功新增至剪貼簿';
	@override String get failure => '複製到剪貼簿失敗';
	@override String get contentTooLarge => '內容過大，請改用匯出檔案';
}

// Path: common.msg.export.file
class TranslationsCommonMsgExportFileZhTw extends TranslationsCommonMsgExportFileEn {
	TranslationsCommonMsgExportFileZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get success => 'JSON 檔案建立成功';
	@override String get failure => '建立檔案失敗';
}

// Path: pages.profiles.msg.save
class TranslationsPagesProfilesMsgSaveZhTw extends TranslationsPagesProfilesMsgSaveEn {
	TranslationsPagesProfilesMsgSaveZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get success => '設定檔儲存成功';
}

// Path: pages.profiles.msg.add
class TranslationsPagesProfilesMsgAddZhTw extends TranslationsPagesProfilesMsgAddEn {
	TranslationsPagesProfilesMsgAddZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get failure => '新增設定檔失敗';
}

// Path: pages.profiles.msg.update
class TranslationsPagesProfilesMsgUpdateZhTw extends TranslationsPagesProfilesMsgUpdateEn {
	TranslationsPagesProfilesMsgUpdateZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get success => '設定檔更新成功';
	@override String successNamed({required Object name}) => '「${name}」更新成功';
	@override String get failure => '更新設定檔失敗';
	@override String failureNamed({required Object name}) => '更新「${name}」失敗';
}

// Path: pages.profiles.msg.delete
class TranslationsPagesProfilesMsgDeleteZhTw extends TranslationsPagesProfilesMsgDeleteEn {
	TranslationsPagesProfilesMsgDeleteZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get success => '設定檔刪除成功';
}

// Path: pages.settings.options.import
class TranslationsPagesSettingsOptionsImportZhTw extends TranslationsPagesSettingsOptionsImportEn {
	TranslationsPagesSettingsOptionsImportZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '從剪貼簿匯入選項';
	@override String get file => '從檔案匯入選項';
}

// Path: pages.settings.options.export
class TranslationsPagesSettingsOptionsExportZhTw extends TranslationsPagesSettingsOptionsExportEn {
	TranslationsPagesSettingsOptionsExportZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get anonymousToClipboard => '複製匿名選項到剪貼簿';
	@override String get anonymousToFile => '匯出匿名選項到檔案';
	@override String get allToClipboard => '複製所有選項到剪貼簿';
	@override String get allToFile => '匯出所有選項到檔案';
}

// Path: pages.settings.general.themeModes
class TranslationsPagesSettingsGeneralThemeModesZhTw extends TranslationsPagesSettingsGeneralThemeModesEn {
	TranslationsPagesSettingsGeneralThemeModesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get system => '跟隨系統';
	@override String get dark => '深色模式';
	@override String get light => '淺色模式';
	@override String get black => '純黑模式';
}

// Path: pages.settings.routing.perAppProxy
class TranslationsPagesSettingsRoutingPerAppProxyZhTw extends TranslationsPagesSettingsRoutingPerAppProxyEn {
	TranslationsPagesSettingsRoutingPerAppProxyZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '依應用程式代理';
	@override String get hideSysApps => '隱藏系統應用程式';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsZhTw options = TranslationsPagesSettingsRoutingPerAppProxyOptionsZhTw._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyModesZhTw modes = TranslationsPagesSettingsRoutingPerAppProxyModesZhTw._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionZhTw autoSelection = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionZhTw._(_root);
}

// Path: pages.settings.routing.regions
class TranslationsPagesSettingsRoutingRegionsZhTw extends TranslationsPagesSettingsRoutingRegionsEn {
	TranslationsPagesSettingsRoutingRegionsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get ir => '伊朗 (ir)';
	@override String get cn => '中國 (cn)';
	@override String get ru => '俄羅斯 (ru)';
	@override String get af => '阿富汗 (af)';
	@override String get id => '印尼 (id)';
	@override String get tr => '土耳其 (tr)';
	@override String get br => '巴西 (br)';
	@override String get other => '其他';
}

// Path: pages.settings.routing.balancerStrategy
class TranslationsPagesSettingsRoutingBalancerStrategyZhTw extends TranslationsPagesSettingsRoutingBalancerStrategyEn {
	TranslationsPagesSettingsRoutingBalancerStrategyZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => 'Balancer 策略';
	@override String get roundRobin => 'Round robin';
	@override String get consistentHash => 'Consistent hash';
	@override String get stickySession => 'Sticky session';
}

// Path: pages.settings.routing.ipv6Modes
class TranslationsPagesSettingsRoutingIpv6ModesZhTw extends TranslationsPagesSettingsRoutingIpv6ModesEn {
	TranslationsPagesSettingsRoutingIpv6ModesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get disable => '停用';
	@override String get enable => '啟用';
	@override String get prefer => '首選';
	@override String get only => '僅';
}

// Path: pages.settings.routing.routeRule
class TranslationsPagesSettingsRoutingRouteRuleZhTw extends TranslationsPagesSettingsRoutingRouteRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '路由規則';
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsZhTw options = TranslationsPagesSettingsRoutingRouteRuleOptionsZhTw._(_root);
	@override String get deleteRule => '刪除規則';
	@override String get createRule => '建立新規則';
	@override late final TranslationsPagesSettingsRoutingRouteRuleRuleZhTw rule = TranslationsPagesSettingsRoutingRouteRuleRuleZhTw._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleGenericListZhTw genericList = TranslationsPagesSettingsRoutingRouteRuleGenericListZhTw._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleAndroidAppsZhTw androidApps = TranslationsPagesSettingsRoutingRouteRuleAndroidAppsZhTw._(_root);
}

// Path: pages.settings.dns.domainStrategy
class TranslationsPagesSettingsDnsDomainStrategyZhTw extends TranslationsPagesSettingsDnsDomainStrategyEn {
	TranslationsPagesSettingsDnsDomainStrategyZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get auto => '自動';
	@override String get preferIpv6 => '偏好 IPv6';
	@override String get preferIpv4 => '偏好 IPv4';
	@override String get ipv4Only => '僅 IPv4';
	@override String get ipv6Only => '僅 IPv6';
}

// Path: pages.settings.inbound.serviceModes
class TranslationsPagesSettingsInboundServiceModesZhTw extends TranslationsPagesSettingsInboundServiceModesEn {
	TranslationsPagesSettingsInboundServiceModesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get proxy => '僅代理服務';
	@override String get systemProxy => '設定系統代理';
	@override String get tun => 'VPN';
	@override String get tunService => 'VPN 服務';
}

// Path: pages.settings.inbound.shortServiceModes
class TranslationsPagesSettingsInboundShortServiceModesZhTw extends TranslationsPagesSettingsInboundShortServiceModesEn {
	TranslationsPagesSettingsInboundShortServiceModesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get proxy => '代理';
	@override String get systemProxy => '系統代理';
	@override String get tun => 'VPN';
	@override String get tunService => 'VPN 服務';
}

// Path: pages.settings.inbound.tunImplementations
class TranslationsPagesSettingsInboundTunImplementationsZhTw extends TranslationsPagesSettingsInboundTunImplementationsEn {
	TranslationsPagesSettingsInboundTunImplementationsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get mixed => '混合';
	@override String get system => '系統';
	@override String get gvisor => 'gVisor';
}

// Path: pages.settings.tlsTricks.mixedSniCase
class TranslationsPagesSettingsTlsTricksMixedSniCaseZhTw extends TranslationsPagesSettingsTlsTricksMixedSniCaseEn {
	TranslationsPagesSettingsTlsTricksMixedSniCaseZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get enable => '啟用混合大小寫 SNI';
}

// Path: pages.settings.tlsTricks.padding
class TranslationsPagesSettingsTlsTricksPaddingZhTw extends TranslationsPagesSettingsTlsTricksPaddingEn {
	TranslationsPagesSettingsTlsTricksPaddingZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get enable => '啟用填充';
	@override String get size => '填充大小';
}

// Path: pages.settings.warp.detourModes
class TranslationsPagesSettingsWarpDetourModesZhTw extends TranslationsPagesSettingsWarpDetourModesEn {
	TranslationsPagesSettingsWarpDetourModesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get proxyOverWarp => '透過 WARP 路由代理';
	@override String get warpOverProxy => '透過代理路由 WARP';
	@override String get proxyOverWarpExplain => '透過 WARP 解鎖代理';
	@override String get warpOverProxyExplain => '透過 WARP 增強安全性';
}

// Path: pages.settings.warp.noise
class TranslationsPagesSettingsWarpNoiseZhTw extends TranslationsPagesSettingsWarpNoiseEn {
	TranslationsPagesSettingsWarpNoiseZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get count => '噪音數量';
	@override String get mode => '噪音模式';
	@override String get size => '噪音大小';
	@override String get delay => '噪音延遲';
}

// Path: dialogs.confirmation.settings.import
class TranslationsDialogsConfirmationSettingsImportZhTw extends TranslationsDialogsConfirmationSettingsImportEn {
	TranslationsDialogsConfirmationSettingsImportZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get msg => '這會使用提供的值覆蓋所有設定選項。您確定嗎？';
}

// Path: dialogs.confirmation.profile.delete
class TranslationsDialogsConfirmationProfileDeleteZhTw extends TranslationsDialogsConfirmationProfileDeleteEn {
	TranslationsDialogsConfirmationProfileDeleteZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '刪除設定檔';
	@override String get msg => '您確定要永久刪除此設定檔嗎？';
}

// Path: dialogs.confirmation.perAppProxy.shareOnGithub
class TranslationsDialogsConfirmationPerAppProxyShareOnGithubZhTw extends TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn {
	TranslationsDialogsConfirmationPerAppProxyShareOnGithubZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '改進自動選擇';
	@override String get msg => '透過分享您選擇的應用程式，可以幫助完善「自動選擇」清單';
}

// Path: dialogs.confirmation.perAppProxy.import
class TranslationsDialogsConfirmationPerAppProxyImportZhTw extends TranslationsDialogsConfirmationPerAppProxyImportEn {
	TranslationsDialogsConfirmationPerAppProxyImportZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get msg => '這將取代您目前所有的依應用程式代理選擇。您確定要繼續嗎？';
}

// Path: dialogs.confirmation.routeRule.delete
class TranslationsDialogsConfirmationRouteRuleDeleteZhTw extends TranslationsDialogsConfirmationRouteRuleDeleteEn {
	TranslationsDialogsConfirmationRouteRuleDeleteZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '刪除規則';
	@override String msg({required Object rulename}) => '您確定要刪除規則「${rulename}」嗎？';
}

// Path: pages.settings.routing.perAppProxy.options
class TranslationsPagesSettingsRoutingPerAppProxyOptionsZhTw extends TranslationsPagesSettingsRoutingPerAppProxyOptionsEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsImportZhTw import = TranslationsPagesSettingsRoutingPerAppProxyOptionsImportZhTw._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsExportZhTw export = TranslationsPagesSettingsRoutingPerAppProxyOptionsExportZhTw._(_root);
	@override String get shareToAll => '分享給所有人';
	@override String get clearAllSelections => '清除所有選擇';
}

// Path: pages.settings.routing.perAppProxy.modes
class TranslationsPagesSettingsRoutingPerAppProxyModesZhTw extends TranslationsPagesSettingsRoutingPerAppProxyModesEn {
	TranslationsPagesSettingsRoutingPerAppProxyModesZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get all => '全部';
	@override String get proxy => '代理';
	@override String get bypass => '繞過';
	@override String get allMsg => '代理所有應用程式';
	@override String get proxyMsg => '僅代理選定應用程式';
	@override String get bypassMsg => '不代理選定應用程式';
}

// Path: pages.settings.routing.perAppProxy.autoSelection
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionZhTw extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '自動選擇';
	@override String get performNow => '立即執行';
	@override String get resetToDefault => '重設為預設';
	@override String get autoUpdateInterval => '自動更新間隔';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastZhTw toast = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastZhTw._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogZhTw dialog = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogZhTw._(_root);
}

// Path: pages.settings.routing.routeRule.options
class TranslationsPagesSettingsRoutingRouteRuleOptionsZhTw extends TranslationsPagesSettingsRoutingRouteRuleOptionsEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsImportZhTw import = TranslationsPagesSettingsRoutingRouteRuleOptionsImportZhTw._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsExportZhTw export = TranslationsPagesSettingsRoutingRouteRuleOptionsExportZhTw._(_root);
	@override String get reset => '重設規則';
}

// Path: pages.settings.routing.routeRule.rule
class TranslationsPagesSettingsRoutingRouteRuleRuleZhTw extends TranslationsPagesSettingsRoutingRouteRuleRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleRuleZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '規則';
	@override String get ruleChanged => '規則已變更';
	@override String get ruleChangedMsg => '您想儲存您的編輯嗎？';
	@override String get onlyTunMode => '僅在 TUN 模式下可用';
	@override String get notAvailabeInThisPlatform => '在此平台上不可用';
	@override String get canNotBeEmpty => '不能為空';
	@override String get validUrlEx => 'https://example.com';
	@override String get validUrl => '有效的「URL」，例如\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}';
	@override String get validProcessNameEx => 'Chrome.exe 或 google chrome 或 chrome';
	@override String get validProcessName => '有效的「處理程序名稱」，例如\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}';
	@override String get validProcessPathEx => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome';
	@override String get validProcessPath => '有效的「處理程序路徑」，例如\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}';
	@override String get validPortRangeEx => '80 或 1-65000';
	@override String get validPortRange => '有效的「連接埠」或「連接埠範圍」，例如\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}';
	@override String get validIpCidrEx => '8.8.8.8 或 10.0.0.0/24';
	@override String get validIpCidr => '有效的 IP CIDR，例如\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}';
	@override String get validDomainEx => 'Google.com 或 dl.google.com';
	@override String get validDomain => '有效的「網域」，例如\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}';
	@override String get validDomainSuffixEx => '.com 或 .tw';
	@override String get validDomainSuffix => '有效的「網域後綴」，例如\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}';
	@override Map<String, String> get tileTitle => {
		'name': '名稱',
		'outbound': '符合時出站',
		'rule_set': '規則集 URL',
		'package_name': '套件名稱',
		'process_name': '處理程序名稱',
		'process_path': '處理程序路徑',
		'network': '網路',
		'port_range': '目標連接埠',
		'source_port_range': '來源連接埠',
		'protocol': '協定',
		'ip_cidr': '目標 IP CIDR',
		'source_ip_cidr': '來源 IP CIDR',
		'domain': '網域',
		'domain_suffixe': '網域後綴',
		'domain_keyword': '網域關鍵字',
		'domain_regex': '網域正規表示式',
	};
	@override Map<String, String> get outbound => {
		'proxy': '代理',
		'direct': '直連',
		'direct_with_fragment': '直連並分片',
		'block': '攔截',
	};
	@override Map<String, String> get network => {
		'all': '全部',
		'tcp': 'TCP',
		'udp': 'UDP',
	};
	@override Map<String, String> get protocol => {
		'': '全部',
		'tls': 'TLS',
		'http': 'HTTP',
		'quic': 'QUIC',
		'stun': 'STUN',
		'dns': 'DNS',
		'bittorrent': 'BitTorrent',
	};
}

// Path: pages.settings.routing.routeRule.genericList
class TranslationsPagesSettingsRoutingRouteRuleGenericListZhTw extends TranslationsPagesSettingsRoutingRouteRuleGenericListEn {
	TranslationsPagesSettingsRoutingRouteRuleGenericListZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get addNew => '新增值';
	@override String get update => '更新值';
	@override String get clearList => '清除清單';
	@override String get clearListMsg => '所有項目已刪除';
}

// Path: pages.settings.routing.routeRule.androidApps
class TranslationsPagesSettingsRoutingRouteRuleAndroidAppsZhTw extends TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn {
	TranslationsPagesSettingsRoutingRouteRuleAndroidAppsZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => 'Android 應用程式';
	@override String get showSystemApps => '顯示系統應用程式';
	@override String get hideSystemApps => '隱藏系統應用程式';
	@override String get clearSelection => '清除選擇';
	@override String get uninstalled => '已解除安裝';
}

// Path: pages.settings.routing.perAppProxy.options.import
class TranslationsPagesSettingsRoutingPerAppProxyOptionsImportZhTw extends TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsImportZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '從剪貼簿匯入選擇';
	@override String get file => '從檔案匯入選擇';
	@override String get msg => '匯入將取代您目前的選擇。確定要繼續嗎？';
}

// Path: pages.settings.routing.perAppProxy.options.export
class TranslationsPagesSettingsRoutingPerAppProxyOptionsExportZhTw extends TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsExportZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '複製選擇到剪貼簿';
	@override String get file => '匯出選擇到檔案';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.toast
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastZhTw extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get success => '自動選擇應用程式成功完成';
	@override String get failure => '自動選擇失敗';
	@override String regionNotFound({required Object region}) => '未找到「${region}」地區的自動選擇';
	@override String get alreadyInAuto => '您的選擇已在自動清單中';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.dialog
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogZhTw extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get title => '自動選擇應用程式';
	@override String msg({required Object region}) => '由於地區更改為「${region}」，依應用程式代理的自動選擇功能已被停用';
}

// Path: pages.settings.routing.routeRule.options.import
class TranslationsPagesSettingsRoutingRouteRuleOptionsImportZhTw extends TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsImportZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '從剪貼簿匯入規則';
	@override String get file => '從檔案匯入規則';
}

// Path: pages.settings.routing.routeRule.options.export
class TranslationsPagesSettingsRoutingRouteRuleOptionsExportZhTw extends TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsExportZhTw._(TranslationsZhTw root) : this._root = root, super.internal(root);

	final TranslationsZhTw _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '複製規則到剪貼簿';
	@override String get file => '儲存規則到檔案';
}

/// The flat map containing all translations for locale <zh-TW>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhTw {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appTitle' => '樹懶VPN',
			'common.start' => '開始',
			'common.version' => '版本',
			'common.ok' => '確定',
			'common.cancel' => '取消',
			'common.kContinue' => '繼續',
			'common.showMore' => '顯示更多',
			'common.showLess' => '顯示較少',
			'common.filter' => '篩選',
			'common.all' => '全部',
			'common.pause' => '暫停',
			'common.resume' => '恢復',
			'common.clear' => '清除',
			'common.close' => '關閉',
			'common.auto' => '自動',
			'common.manually' => '手動',
			'common.name' => '名稱',
			'common.url' => 'URL',
			'common.add' => '新增',
			'common.clipboard' => '剪貼簿',
			'common.addToClipboard' => '新增至剪貼簿',
			'common.scanQr' => '掃描 QR Code',
			'common.free' => '免費',
			'common.warp' => 'WARP',
			'common.fragment' => 'Fragment',
			'common.help' => '說明',
			'common.save' => '儲存',
			'common.update' => '更新',
			'common.share' => '分享',
			'common.edit' => '編輯',
			'common.delete' => '刪除',
			'common.discard' => '捨棄',
			'common.import' => '匯入',
			'common.export' => '匯出',
			'common.later' => '稍後',
			'common.ignore' => '忽略',
			'common.quit' => '退出',
			'common.notSet' => '未設定',
			'common.hide' => '隱藏',
			'common.exit' => '退出',
			'common.reset' => '重設',
			'common.done' => '完成',
			'common.search' => '搜尋',
			'common.decline' => '拒絕',
			'common.agree' => '同意',
			'common.empty' => '空',
			'common.unknown' => '未知',
			'common.hidden' => '隱藏',
			'common.timeout' => '超時',
			'common.sort' => '排序',
			'common.dashboard' => '儀表板',
			'common.interval.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n, zero: '', one: '${n} 天', other: '${n} 天', ), 
			'common.interval.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n, zero: '', one: '${n} 小時', other: '${n} 小時', ), 
			'common.msg.permission.denied' => '權限被拒絕',
			'common.msg.export.clipboard.success' => '已成功新增至剪貼簿',
			'common.msg.export.clipboard.failure' => '複製到剪貼簿失敗',
			'common.msg.export.clipboard.contentTooLarge' => '內容過大，請改用匯出檔案',
			'common.msg.export.file.success' => 'JSON 檔案建立成功',
			'common.msg.export.file.failure' => '建立檔案失敗',
			'common.msg.import.confirm' => '確認匯入',
			'common.msg.import.success' => '匯入成功',
			'common.msg.import.failure' => '匯入失敗',
			'intro.banner' => '暢享無限制網路的所需一切',
			'intro.termsAndPolicyCaution' => ({required InlineSpanBuilder tap}) => TextSpan(children: [ const TextSpan(text: '繼續即表示您同意 '), tap(_root.pages.about.termsAndConditions), ]), 
			'intro.info' => ({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [ const TextSpan(text: '由 Hiddify 以 ❤️ 製作 - '), tap_source('開源'), const TextSpan(text: ' ('), tap_license('授權'), const TextSpan(text: ')'), ]), 
			'pages.home.title' => '首頁',
			'pages.home.quickSettings' => '快速設定',
			'pages.proxies.title' => '代理',
			'pages.proxies.sort' => '排序代理',
			'pages.proxies.testDelay' => '測試延遲',
			'pages.proxies.empty' => '無可用代理',
			'pages.proxies.activeProxy' => '當前代理',
			'pages.proxies.unknownIp' => '未知 IP',
			'pages.proxies.sortOptions.unsorted' => '預設',
			'pages.proxies.sortOptions.name' => '按名稱',
			'pages.proxies.sortOptions.delay' => '按延遲',
			'pages.proxies.ipInfo.address' => 'IP 位址',
			'pages.proxies.ipInfo.country' => '國家',
			'pages.proxies.ipInfo.organization' => '組織',
			'pages.proxies.delay.result' => ({required Object delay}) => '延遲：${delay}毫秒',
			'pages.proxies.delay.timeout' => '延遲測試超時',
			'pages.proxies.delay.testing' => '延遲：測試中...',
			'pages.profiles.title' => '設定檔',
			'pages.profiles.add' => '新增設定檔',
			'pages.profiles.update' => '更新設定檔',
			'pages.profiles.viewAllProfiles' => '檢視所有設定檔',
			'pages.profiles.activeProfileName' => ({required Object name}) => '目前設定檔：「${name}」',
			'pages.profiles.nonActiveProfileName' => ({required Object name}) => '選擇「${name}」作為目前設定檔',
			'pages.profiles.freeSubNotFound' => '未找到免費訂閱',
			'pages.profiles.freeSubNotFoundForRegion' => ({required Object region}) => '未找到「${region}」地區的免費訂閱',
			'pages.profiles.failedToLoad' => '載入失敗',
			'pages.profiles.updateSubscriptions' => '更新訂閱',
			'pages.profiles.share.urlToClipboard' => 'URL 到剪貼簿',
			'pages.profiles.share.showUrlQr' => '顯示 URL QR Code',
			'pages.profiles.share.jsonToClipboard' => 'JSON 到剪貼簿',
			'pages.profiles.msg.save.success' => '設定檔儲存成功',
			'pages.profiles.msg.invalidUrl' => '無效的 URL',
			'pages.profiles.msg.add.failure' => '新增設定檔失敗',
			'pages.profiles.msg.update.success' => '設定檔更新成功',
			'pages.profiles.msg.update.successNamed' => ({required Object name}) => '「${name}」更新成功',
			'pages.profiles.msg.update.failure' => '更新設定檔失敗',
			'pages.profiles.msg.update.failureNamed' => ({required Object name}) => '更新「${name}」失敗',
			'pages.profiles.msg.delete.success' => '設定檔刪除成功',
			'pages.profileDetails.title' => '設定檔',
			'pages.profileDetails.lastUpdate' => '最後更新',
			'pages.profileDetails.form.nameHint' => '設定檔名稱',
			'pages.profileDetails.form.emptyName' => '名稱為必填項',
			'pages.profileDetails.form.invalidUrl' => '無效的 URL',
			'pages.profileDetails.form.urlHint' => '完整的設定 URL',
			'pages.profileDetails.form.disableAutoUpdate' => '停用自動更新',
			'pages.profileDetails.form.autoUpdateInterval' => '自動更新間隔',
			'pages.profileDetails.form.loading' => '正在新增設定檔...',
			'pages.logs.title' => '日誌',
			'pages.logs.shareCoreLogs' => '分享核心日誌',
			'pages.logs.shareAppLogs' => '分享應用程式日誌',
			'pages.about.title' => '關於',
			'pages.about.notAvailableMsg' => '已是最新版本',
			'pages.about.checkForUpdate' => '檢查更新',
			'pages.about.openWorkingDir' => '開啟工作目錄',
			'pages.about.sourceCode' => '原始碼',
			'pages.about.telegramChannel' => 'Telegram 頻道',
			'pages.about.termsAndConditions' => '條款與條件',
			'pages.about.privacyPolicy' => '隱私權政策',
			'pages.settings.title' => '設定',
			'pages.settings.resetTunnel' => '重設 VPN 設定檔',
			'pages.settings.resetTunnelSubtitle' => '重建本地通道狀態',
			'pages.settings.heroSubtitle' => '網路調校中心',
			'pages.settings.sectionOpenHint' => '點擊開啟',
			'pages.settings.options.import.clipboard' => '從剪貼簿匯入選項',
			'pages.settings.options.import.file' => '從檔案匯入選項',
			'pages.settings.options.export.anonymousToClipboard' => '複製匿名選項到剪貼簿',
			'pages.settings.options.export.anonymousToFile' => '匯出匿名選項到檔案',
			'pages.settings.options.export.allToClipboard' => '複製所有選項到剪貼簿',
			'pages.settings.options.export.allToFile' => '匯出所有選項到檔案',
			'pages.settings.options.reset' => '重設選項',
			'pages.settings.general.title' => '一般',
			'pages.settings.general.locale' => '語言',
			'pages.settings.general.themeMode' => '主題模式',
			'pages.settings.general.themeModes.system' => '跟隨系統',
			'pages.settings.general.themeModes.dark' => '深色模式',
			'pages.settings.general.themeModes.light' => '淺色模式',
			'pages.settings.general.themeModes.black' => '純黑模式',
			'pages.settings.general.enableAnalytics' => '啟用分析',
			'pages.settings.general.enableAnalyticsMsg' => '允許收集分析資料和傳送崩潰報告以改進應用程式',
			'pages.settings.general.autoIpCheck' => '自動檢查連線 IP',
			'pages.settings.general.dynamicNotification' => '在通知中顯示速度',
			'pages.settings.general.hapticFeedback' => '觸覺回饋',
			'pages.settings.general.actionAtClosing' => '關閉時操作',
			'pages.settings.general.autoStart' => '開機自啟',
			'pages.settings.general.silentStart' => '靜默啟動',
			'pages.settings.general.ignoreBatteryOptimizations' => '忽略電池最佳化',
			'pages.settings.general.ignoreBatteryOptimizationsMsg' => '移除限制以獲得最佳 VPN 效能',
			'pages.settings.general.memoryLimit' => '記憶體限制',
			'pages.settings.general.memoryLimitMsg' => '如果您遇到記憶體不足錯誤或應用程式頻繁崩潰，請啟用此選項',
			'pages.settings.general.debugMode' => '偵錯模式',
			'pages.settings.general.debugModeMsg' => '重新啟動應用程式以套用此變更',
			'pages.settings.general.logLevel' => '日誌級別',
			'pages.settings.general.connectionTestUrl' => '連線測試 URL',
			'pages.settings.general.urlTestInterval' => 'URL 測試間隔',
			'pages.settings.general.clashApiPort' => 'Clash API 連接埠',
			'pages.settings.general.useXrayCoreWhenPossible' => '盡可能使用 xray-core',
			'pages.settings.general.useXrayCoreWhenPossibleMsg' => '解析訂閱連結時使用 xray-core。您需要重新匯入訂閱連結才能啟用此選項',
			'pages.settings.routing.title' => '路由',
			'pages.settings.routing.perAppProxy.title' => '依應用程式代理',
			'pages.settings.routing.perAppProxy.hideSysApps' => '隱藏系統應用程式',
			'pages.settings.routing.perAppProxy.options.import.clipboard' => '從剪貼簿匯入選擇',
			'pages.settings.routing.perAppProxy.options.import.file' => '從檔案匯入選擇',
			'pages.settings.routing.perAppProxy.options.import.msg' => '匯入將取代您目前的選擇。確定要繼續嗎？',
			'pages.settings.routing.perAppProxy.options.export.clipboard' => '複製選擇到剪貼簿',
			'pages.settings.routing.perAppProxy.options.export.file' => '匯出選擇到檔案',
			'pages.settings.routing.perAppProxy.options.shareToAll' => '分享給所有人',
			'pages.settings.routing.perAppProxy.options.clearAllSelections' => '清除所有選擇',
			'pages.settings.routing.perAppProxy.modes.all' => '全部',
			'pages.settings.routing.perAppProxy.modes.proxy' => '代理',
			'pages.settings.routing.perAppProxy.modes.bypass' => '繞過',
			'pages.settings.routing.perAppProxy.modes.allMsg' => '代理所有應用程式',
			'pages.settings.routing.perAppProxy.modes.proxyMsg' => '僅代理選定應用程式',
			'pages.settings.routing.perAppProxy.modes.bypassMsg' => '不代理選定應用程式',
			'pages.settings.routing.perAppProxy.autoSelection.title' => '自動選擇',
			'pages.settings.routing.perAppProxy.autoSelection.performNow' => '立即執行',
			'pages.settings.routing.perAppProxy.autoSelection.resetToDefault' => '重設為預設',
			'pages.settings.routing.perAppProxy.autoSelection.autoUpdateInterval' => '自動更新間隔',
			'pages.settings.routing.perAppProxy.autoSelection.toast.success' => '自動選擇應用程式成功完成',
			'pages.settings.routing.perAppProxy.autoSelection.toast.failure' => '自動選擇失敗',
			'pages.settings.routing.perAppProxy.autoSelection.toast.regionNotFound' => ({required Object region}) => '未找到「${region}」地區的自動選擇',
			'pages.settings.routing.perAppProxy.autoSelection.toast.alreadyInAuto' => '您的選擇已在自動清單中',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.title' => '自動選擇應用程式',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.msg' => ({required Object region}) => '由於地區更改為「${region}」，依應用程式代理的自動選擇功能已被停用',
			'pages.settings.routing.region' => '地區',
			'pages.settings.routing.regions.ir' => '伊朗 (ir)',
			'pages.settings.routing.regions.cn' => '中國 (cn)',
			'pages.settings.routing.regions.ru' => '俄羅斯 (ru)',
			'pages.settings.routing.regions.af' => '阿富汗 (af)',
			'pages.settings.routing.regions.id' => '印尼 (id)',
			'pages.settings.routing.regions.tr' => '土耳其 (tr)',
			'pages.settings.routing.regions.br' => '巴西 (br)',
			'pages.settings.routing.regions.other' => '其他',
			'pages.settings.routing.balancerStrategy.title' => 'Balancer 策略',
			'pages.settings.routing.balancerStrategy.roundRobin' => 'Round robin',
			'pages.settings.routing.balancerStrategy.consistentHash' => 'Consistent hash',
			'pages.settings.routing.balancerStrategy.stickySession' => 'Sticky session',
			'pages.settings.routing.blockAds' => '攔截廣告',
			'pages.settings.routing.bypassLan' => '繞過區域網路',
			'pages.settings.routing.resolveDestination' => '解析目的地',
			'pages.settings.routing.ipv6Route' => 'IPv6 路由',
			'pages.settings.routing.ipv6Modes.disable' => '停用',
			'pages.settings.routing.ipv6Modes.enable' => '啟用',
			'pages.settings.routing.ipv6Modes.prefer' => '首選',
			'pages.settings.routing.ipv6Modes.only' => '僅',
			'pages.settings.routing.routeRule.title' => '路由規則',
			'pages.settings.routing.routeRule.options.import.clipboard' => '從剪貼簿匯入規則',
			'pages.settings.routing.routeRule.options.import.file' => '從檔案匯入規則',
			'pages.settings.routing.routeRule.options.export.clipboard' => '複製規則到剪貼簿',
			'pages.settings.routing.routeRule.options.export.file' => '儲存規則到檔案',
			'pages.settings.routing.routeRule.options.reset' => '重設規則',
			'pages.settings.routing.routeRule.deleteRule' => '刪除規則',
			'pages.settings.routing.routeRule.createRule' => '建立新規則',
			'pages.settings.routing.routeRule.rule.title' => '規則',
			'pages.settings.routing.routeRule.rule.ruleChanged' => '規則已變更',
			'pages.settings.routing.routeRule.rule.ruleChangedMsg' => '您想儲存您的編輯嗎？',
			'pages.settings.routing.routeRule.rule.onlyTunMode' => '僅在 TUN 模式下可用',
			'pages.settings.routing.routeRule.rule.notAvailabeInThisPlatform' => '在此平台上不可用',
			'pages.settings.routing.routeRule.rule.canNotBeEmpty' => '不能為空',
			'pages.settings.routing.routeRule.rule.validUrlEx' => 'https://example.com',
			'pages.settings.routing.routeRule.rule.validUrl' => '有效的「URL」，例如\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}',
			'pages.settings.routing.routeRule.rule.validProcessNameEx' => 'Chrome.exe 或 google chrome 或 chrome',
			'pages.settings.routing.routeRule.rule.validProcessName' => '有效的「處理程序名稱」，例如\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}',
			'pages.settings.routing.routeRule.rule.validProcessPathEx' => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome',
			'pages.settings.routing.routeRule.rule.validProcessPath' => '有效的「處理程序路徑」，例如\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}',
			'pages.settings.routing.routeRule.rule.validPortRangeEx' => '80 或 1-65000',
			'pages.settings.routing.routeRule.rule.validPortRange' => '有效的「連接埠」或「連接埠範圍」，例如\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}',
			'pages.settings.routing.routeRule.rule.validIpCidrEx' => '8.8.8.8 或 10.0.0.0/24',
			'pages.settings.routing.routeRule.rule.validIpCidr' => '有效的 IP CIDR，例如\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}',
			'pages.settings.routing.routeRule.rule.validDomainEx' => 'Google.com 或 dl.google.com',
			'pages.settings.routing.routeRule.rule.validDomain' => '有效的「網域」，例如\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}',
			'pages.settings.routing.routeRule.rule.validDomainSuffixEx' => '.com 或 .tw',
			'pages.settings.routing.routeRule.rule.validDomainSuffix' => '有效的「網域後綴」，例如\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}',
			'pages.settings.routing.routeRule.rule.tileTitle.name' => '名稱',
			'pages.settings.routing.routeRule.rule.tileTitle.outbound' => '符合時出站',
			'pages.settings.routing.routeRule.rule.tileTitle.rule_set' => '規則集 URL',
			'pages.settings.routing.routeRule.rule.tileTitle.package_name' => '套件名稱',
			'pages.settings.routing.routeRule.rule.tileTitle.process_name' => '處理程序名稱',
			'pages.settings.routing.routeRule.rule.tileTitle.process_path' => '處理程序路徑',
			'pages.settings.routing.routeRule.rule.tileTitle.network' => '網路',
			'pages.settings.routing.routeRule.rule.tileTitle.port_range' => '目標連接埠',
			'pages.settings.routing.routeRule.rule.tileTitle.source_port_range' => '來源連接埠',
			'pages.settings.routing.routeRule.rule.tileTitle.protocol' => '協定',
			'pages.settings.routing.routeRule.rule.tileTitle.ip_cidr' => '目標 IP CIDR',
			'pages.settings.routing.routeRule.rule.tileTitle.source_ip_cidr' => '來源 IP CIDR',
			'pages.settings.routing.routeRule.rule.tileTitle.domain' => '網域',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_suffixe' => '網域後綴',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_keyword' => '網域關鍵字',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_regex' => '網域正規表示式',
			'pages.settings.routing.routeRule.rule.outbound.proxy' => '代理',
			'pages.settings.routing.routeRule.rule.outbound.direct' => '直連',
			'pages.settings.routing.routeRule.rule.outbound.direct_with_fragment' => '直連並分片',
			'pages.settings.routing.routeRule.rule.outbound.block' => '攔截',
			'pages.settings.routing.routeRule.rule.network.all' => '全部',
			'pages.settings.routing.routeRule.rule.network.tcp' => 'TCP',
			'pages.settings.routing.routeRule.rule.network.udp' => 'UDP',
			'pages.settings.routing.routeRule.rule.protocol.' => '全部',
			'pages.settings.routing.routeRule.rule.protocol.tls' => 'TLS',
			'pages.settings.routing.routeRule.rule.protocol.http' => 'HTTP',
			'pages.settings.routing.routeRule.rule.protocol.quic' => 'QUIC',
			'pages.settings.routing.routeRule.rule.protocol.stun' => 'STUN',
			'pages.settings.routing.routeRule.rule.protocol.dns' => 'DNS',
			'pages.settings.routing.routeRule.rule.protocol.bittorrent' => 'BitTorrent',
			'pages.settings.routing.routeRule.genericList.addNew' => '新增值',
			'pages.settings.routing.routeRule.genericList.update' => '更新值',
			'pages.settings.routing.routeRule.genericList.clearList' => '清除清單',
			'pages.settings.routing.routeRule.genericList.clearListMsg' => '所有項目已刪除',
			'pages.settings.routing.routeRule.androidApps.pageTitle' => 'Android 應用程式',
			'pages.settings.routing.routeRule.androidApps.showSystemApps' => '顯示系統應用程式',
			'pages.settings.routing.routeRule.androidApps.hideSystemApps' => '隱藏系統應用程式',
			'pages.settings.routing.routeRule.androidApps.clearSelection' => '清除選擇',
			'pages.settings.routing.routeRule.androidApps.uninstalled' => '已解除安裝',
			'pages.settings.dns.title' => 'DNS',
			'pages.settings.dns.remoteDns' => '遠端 DNS',
			'pages.settings.dns.remoteDnsDomainStrategy' => '遠端 DNS 網域策略',
			'pages.settings.dns.directDns' => '出站伺服器解析器（直連）',
			'pages.settings.dns.directDnsDomainStrategy' => '出站網域策略',
			'pages.settings.dns.enableDnsRouting' => '啟用 DNS 路由',
			'pages.settings.dns.enableFakeDns' => '啟用偽造 DNS',
			'pages.settings.dns.domainStrategy.auto' => '自動',
			'pages.settings.dns.domainStrategy.preferIpv6' => '偏好 IPv6',
			'pages.settings.dns.domainStrategy.preferIpv4' => '偏好 IPv4',
			'pages.settings.dns.domainStrategy.ipv4Only' => '僅 IPv4',
			'pages.settings.dns.domainStrategy.ipv6Only' => '僅 IPv6',
			'pages.settings.inbound.title' => '入站',
			'pages.settings.inbound.serviceMode' => '服務模式',
			'pages.settings.inbound.serviceModes.proxy' => '僅代理服務',
			'pages.settings.inbound.serviceModes.systemProxy' => '設定系統代理',
			'pages.settings.inbound.serviceModes.tun' => 'VPN',
			'pages.settings.inbound.serviceModes.tunService' => 'VPN 服務',
			'pages.settings.inbound.shortServiceModes.proxy' => '代理',
			'pages.settings.inbound.shortServiceModes.systemProxy' => '系統代理',
			'pages.settings.inbound.shortServiceModes.tun' => 'VPN',
			'pages.settings.inbound.shortServiceModes.tunService' => 'VPN 服務',
			'pages.settings.inbound.strictRoute' => '嚴格路由',
			'pages.settings.inbound.tunImplementation' => 'TUN 實現',
			'pages.settings.inbound.tunImplementations.mixed' => '混合',
			'pages.settings.inbound.tunImplementations.system' => '系統',
			'pages.settings.inbound.tunImplementations.gvisor' => 'gVisor',
			'pages.settings.inbound.mixedPort' => '混合連接埠',
			'pages.settings.inbound.tproxyPort' => '透明代理連接埠',
			'pages.settings.inbound.directPort' => '本地 Direct 連接埠',
			'pages.settings.inbound.redirectPort' => '重新導向連接埠',
			'pages.settings.inbound.allowConnectionFromLan' => '允許來自區域網路的連線',
			'pages.settings.tlsTricks.title' => 'TLS 技巧',
			'pages.settings.tlsTricks.enable' => '啟用分片',
			'pages.settings.tlsTricks.packets' => '分片封包',
			'pages.settings.tlsTricks.packetsTlsHello' => 'TLS Hello',
			'pages.settings.tlsTricks.packets1_1' => '1-1',
			'pages.settings.tlsTricks.packets1_2' => '1-2',
			'pages.settings.tlsTricks.packets1_3' => '1-3',
			'pages.settings.tlsTricks.packets1_4' => '1-4',
			'pages.settings.tlsTricks.packets1_5' => '1-5',
			'pages.settings.tlsTricks.size' => '分片大小',
			'pages.settings.tlsTricks.sleep' => '分片延遲',
			'pages.settings.tlsTricks.mixedSniCase.enable' => '啟用混合大小寫 SNI',
			'pages.settings.tlsTricks.padding.enable' => '啟用填充',
			'pages.settings.tlsTricks.padding.size' => '填充大小',
			'pages.settings.warp.title' => 'WARP',
			'pages.settings.warp.enable' => '啟用 WARP',
			'pages.settings.warp.generateConfig' => '產生 WARP 設定',
			'pages.settings.warp.configGenerated' => 'WARP 設定已產生',
			'pages.settings.warp.missingConfig' => 'WARP 設定缺失',
			'pages.settings.warp.detourMode' => 'WARP 路由模式',
			'pages.settings.warp.detourModes.proxyOverWarp' => '透過 WARP 路由代理',
			'pages.settings.warp.detourModes.warpOverProxy' => '透過代理路由 WARP',
			'pages.settings.warp.detourModes.proxyOverWarpExplain' => '透過 WARP 解鎖代理',
			'pages.settings.warp.detourModes.warpOverProxyExplain' => '透過 WARP 增強安全性',
			'pages.settings.warp.licenseKey' => '授權金鑰',
			'pages.settings.warp.cleanIp' => '優選 IP',
			'pages.settings.warp.port' => '連接埠',
			'pages.settings.warp.noise.count' => '噪音數量',
			'pages.settings.warp.noise.mode' => '噪音模式',
			'pages.settings.warp.noise.size' => '噪音大小',
			'pages.settings.warp.noise.delay' => '噪音延遲',
			'components.stats.connection' => '連線',
			'components.stats.traffic' => '流量',
			'components.stats.trafficLive' => '即時流量',
			'components.stats.trafficTotal' => '總流量',
			'components.stats.uplink' => '上傳',
			'components.stats.downlink' => '下載',
			'components.stats.speed' => '速度',
			'components.stats.totalTransferred' => '總傳輸量',
			'components.subscriptionInfo.upload' => '上傳',
			'components.subscriptionInfo.download' => '下載',
			'components.subscriptionInfo.total' => '總流量',
			'components.subscriptionInfo.expireDate' => '到期日期',
			'components.subscriptionInfo.expired' => '已到期',
			'components.subscriptionInfo.noTraffic' => '流量已用盡',
			'components.subscriptionInfo.remainingTime' => '剩餘時間',
			'components.subscriptionInfo.remainingDuration' => ({required Object duration}) => '剩餘 ${duration} 天',
			'components.subscriptionInfo.remainingDurationNew' => ({required Object duration}) => '${duration} 天',
			'components.subscriptionInfo.remainingTrafficSemanticLabel' => ({required Object consumed, required Object total}) => '已使用 ${consumed} / ${total} 流量',
			'components.subscriptionInfo.remainingTraffic' => '剩餘流量',
			'components.subscriptionInfo.remainingUsage' => '剩餘',
			'components.subscriptionInfo.profileSite' => '提供商',
			'components.subscriptionInfo.profileSupport' => '支援',
			'dialogs.sortProfiles.title' => '排序方式',
			'dialogs.sortProfiles.sort.name' => '按字母順序',
			'dialogs.sortProfiles.sort.lastUpdate' => '最近更新',
			'dialogs.warpLicense.title' => 'Cloudflare WARP 同意書',
			'dialogs.warpLicense.description' => ({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [ const TextSpan(text: 'Cloudflare WARP 是一個免費的 WireGuard VPN 提供商。啟用此選項即表示您同意 Cloudflare WARP 的 '), tos('服務條款'), const TextSpan(text: ' 和 '), privacy('隱私權政策'), const TextSpan(text: '。'), ]), 
			'dialogs.newVersion.title' => '有可用更新',
			'dialogs.newVersion.msg' => '${_root.common.appTitle} 的新版本已發布。您想立即更新嗎？',
			'dialogs.newVersion.currentVersion' => '目前版本：',
			'dialogs.newVersion.newVersion' => '新版本：',
			'dialogs.newVersion.updateNow' => '立即更新',
			'dialogs.confirmation.settings.import.msg' => '這會使用提供的值覆蓋所有設定選項。您確定嗎？',
			'dialogs.confirmation.profile.delete.title' => '刪除設定檔',
			'dialogs.confirmation.profile.delete.msg' => '您確定要永久刪除此設定檔嗎？',
			'dialogs.confirmation.perAppProxy.shareOnGithub.title' => '改進自動選擇',
			'dialogs.confirmation.perAppProxy.shareOnGithub.msg' => '透過分享您選擇的應用程式，可以幫助完善「自動選擇」清單',
			'dialogs.confirmation.perAppProxy.import.msg' => '這將取代您目前所有的依應用程式代理選擇。您確定要繼續嗎？',
			'dialogs.confirmation.routeRule.delete.title' => '刪除規則',
			'dialogs.confirmation.routeRule.delete.msg' => ({required Object rulename}) => '您確定要刪除規則「${rulename}」嗎？',
			'dialogs.experimentalNotice.title' => '正在使用實驗性功能',
			'dialogs.experimentalNotice.msg' => '您已啟用了一些實驗性功能，這可能會影響連線品質並導致意外錯誤。您可以隨時在設定選項頁面變更或重設這些選項。',
			'dialogs.experimentalNotice.disable' => '不再顯示',
			'dialogs.noActiveProfile.title' => '選擇一個設定檔',
			'dialogs.noActiveProfile.msg' => '讓我們從新增一個包含您 VPN 連線詳細資訊的設定檔開始。\n\n還沒有 VPN 伺服器？別擔心，按照下面的教學，您可以快速免費地設定一個。',
			'dialogs.noActiveProfile.helpBtn.label' => '告訴我如何操作',
			'dialogs.noActiveProfile.helpBtn.url' => 'https://github.com/shulaiyun/Sloth-VPN.git',
			'dialogs.unknownDomainsWarning.title' => '外部連結警告',
			'dialogs.unknownDomainsWarning.youAreAboutToVisit' => '您即將造訪：',
			'dialogs.unknownDomainsWarning.thisWebsiteIsNotInOurTrustedList' => '此網站不在我們的信任清單中。請謹慎操作。',
			'dialogs.proxyInfo.fullTag' => '完整標籤：',
			'dialogs.proxyInfo.type' => '類型：',
			'dialogs.proxyInfo.testTime' => '測試時間：',
			'dialogs.proxyInfo.testDelay' => '測試延遲：',
			'dialogs.proxyInfo.isSelected' => '已選擇：',
			'dialogs.proxyInfo.isGroup' => '是群組',
			'dialogs.proxyInfo.isSecure' => '安全：',
			'dialogs.proxyInfo.port' => '連接埠：',
			'dialogs.proxyInfo.host' => '主機：',
			'dialogs.proxyInfo.ip' => 'IP：',
			'dialogs.proxyInfo.countryCode' => '國家代碼：',
			'dialogs.proxyInfo.region' => '地區：',
			'dialogs.proxyInfo.city' => '城市：',
			'dialogs.proxyInfo.asn' => 'ASN：',
			'dialogs.proxyInfo.organization' => '組織：',
			'dialogs.proxyInfo.location' => '位置：',
			'dialogs.proxyInfo.postalCode' => '郵遞區號：',
			'dialogs.windowClosing.askEachTime' => '每次詢問',
			'dialogs.windowClosing.alertMessage' => '隱藏還是退出應用程式？',
			'dialogs.windowClosing.remember' => '記住我的選擇',
			'connection.tapToConnect' => '點擊連線',
			'connection.connect' => '連線',
			'connection.connecting' => '連線中...',
			'connection.connected' => '已連線',
			'connection.disconnect' => '中斷連線',
			'connection.disconnecting' => '中斷連線中...',
			'connection.reconnect' => '重新連線',
			'connection.reconnectMsg' => '正在重新連線以套用變更...',
			'connection.secure' => '由 WARP 保護',
			'errors.unexpected' => '意外錯誤',
			'errors.connection.unexpected' => '意外連線錯誤',
			'errors.connection.timeout' => '連線超時',
			'errors.connection.badResponse' => '回應錯誤',
			'errors.connection.connectionError' => '連線錯誤',
			'errors.connection.badCertificate' => '憑證無效',
			'errors.profiles.unexpected' => '意外錯誤',
			'errors.profiles.notFound' => '未找到設定檔',
			'errors.profiles.invalidConfig' => '設定無效',
			'errors.profiles.invalidUrl' => 'URL 無效',
			'errors.profiles.canceledByUser' => '使用者已取消',
			'errors.connectivity.unexpected' => '意外失敗',
			'errors.connectivity.missingVpnPermission' => '缺少 VPN 權限',
			'errors.connectivity.missingNotificationPermission' => '缺少通知權限',
			'errors.connectivity.core' => '核心錯誤',
			'errors.singbox.serviceNotRunning' => '服務未運行',
			'errors.singbox.missingPrivilege' => '缺少權限',
			'errors.singbox.missingPrivilegeMsg' => 'VPN 模式需要管理員權限。請以管理員身份重新啟動應用，或更改服務模式。',
			'errors.singbox.invalidConfigOptions' => '設定選項無效',
			'errors.singbox.invalidConfig' => '設定無效',
			'errors.warp.missingLicense' => 'WARP 授權缺失',
			'errors.warp.missingLicenseMsg' => '所選設定檔使用 WARP 功能；要使用此功能，必須同意 WARP 授權條款。',
			_ => null,
		};
	}
}

