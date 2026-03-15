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
class TranslationsZhCn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhCn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZhCn _root = this; // ignore: unused_field

	@override 
	TranslationsZhCn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhCn(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonZhCn common = TranslationsCommonZhCn._(_root);
	@override late final TranslationsIntroZhCn intro = TranslationsIntroZhCn._(_root);
	@override late final TranslationsPagesZhCn pages = TranslationsPagesZhCn._(_root);
	@override late final TranslationsComponentsZhCn components = TranslationsComponentsZhCn._(_root);
	@override late final TranslationsDialogsZhCn dialogs = TranslationsDialogsZhCn._(_root);
	@override late final TranslationsConnectionZhCn connection = TranslationsConnectionZhCn._(_root);
	@override late final TranslationsErrorsZhCn errors = TranslationsErrorsZhCn._(_root);
}

// Path: common
class TranslationsCommonZhCn extends TranslationsCommonEn {
	TranslationsCommonZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get appTitle => '树懒VPN';
	@override String get start => '开始';
	@override String get version => '版本';
	@override String get ok => '确定';
	@override String get cancel => '取消';
	@override String get kContinue => '继续';
	@override String get showMore => '显示更多';
	@override String get showLess => '显示更少';
	@override String get filter => '筛选';
	@override String get all => '全部';
	@override String get pause => '暂停';
	@override String get resume => '恢复';
	@override String get clear => '清除';
	@override String get close => '关闭';
	@override String get auto => '自动';
	@override String get manually => '手动';
	@override String get name => '名称';
	@override String get url => 'URL';
	@override String get add => '添加';
	@override String get clipboard => '剪贴板';
	@override String get addToClipboard => '添加到剪贴板';
	@override String get scanQr => '扫描二维码';
	@override String get free => '免费';
	@override String get warp => 'WARP';
	@override String get fragment => 'Fragment';
	@override String get help => '帮助';
	@override String get save => '保存';
	@override String get update => '更新';
	@override String get share => '分享';
	@override String get edit => '编辑';
	@override String get delete => '删除';
	@override String get discard => '放弃';
	@override String get import => '导入';
	@override String get export => '导出';
	@override String get later => '稍后';
	@override String get ignore => '忽略';
	@override String get quit => '退出';
	@override String get notSet => '未设置';
	@override String get hide => '隐藏';
	@override String get exit => '退出';
	@override String get reset => '重置';
	@override String get done => '完成';
	@override String get search => '搜索';
	@override String get decline => '拒绝';
	@override String get agree => '同意';
	@override String get empty => '空';
	@override String get unknown => '未知';
	@override String get hidden => '隐藏';
	@override String get timeout => '超时';
	@override String get sort => '排序';
	@override String get dashboard => '仪表盘';
	@override late final TranslationsCommonIntervalZhCn interval = TranslationsCommonIntervalZhCn._(_root);
	@override late final TranslationsCommonMsgZhCn msg = TranslationsCommonMsgZhCn._(_root);
}

// Path: intro
class TranslationsIntroZhCn extends TranslationsIntroEn {
	TranslationsIntroZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get banner => '畅享无限制网络的所需一切';
	@override TextSpan termsAndPolicyCaution({required InlineSpanBuilder tap}) => TextSpan(children: [
		const TextSpan(text: '继续即表示您同意 '),
		tap(_root.pages.about.termsAndConditions),
	]);
	@override TextSpan info({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [
		const TextSpan(text: '由 Hiddify 用 ❤️ 制作 - '),
		tap_source('开源'),
		const TextSpan(text: ' ('),
		tap_license('许可证'),
		const TextSpan(text: ')'),
	]);
}

// Path: pages
class TranslationsPagesZhCn extends TranslationsPagesEn {
	TranslationsPagesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesHomeZhCn home = TranslationsPagesHomeZhCn._(_root);
	@override late final TranslationsPagesProxiesZhCn proxies = TranslationsPagesProxiesZhCn._(_root);
	@override late final TranslationsPagesProfilesZhCn profiles = TranslationsPagesProfilesZhCn._(_root);
	@override late final TranslationsPagesProfileDetailsZhCn profileDetails = TranslationsPagesProfileDetailsZhCn._(_root);
	@override late final TranslationsPagesLogsZhCn logs = TranslationsPagesLogsZhCn._(_root);
	@override late final TranslationsPagesAboutZhCn about = TranslationsPagesAboutZhCn._(_root);
	@override late final TranslationsPagesSettingsZhCn settings = TranslationsPagesSettingsZhCn._(_root);
}

// Path: components
class TranslationsComponentsZhCn extends TranslationsComponentsEn {
	TranslationsComponentsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsComponentsStatsZhCn stats = TranslationsComponentsStatsZhCn._(_root);
	@override late final TranslationsComponentsSubscriptionInfoZhCn subscriptionInfo = TranslationsComponentsSubscriptionInfoZhCn._(_root);
}

// Path: dialogs
class TranslationsDialogsZhCn extends TranslationsDialogsEn {
	TranslationsDialogsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsSortProfilesZhCn sortProfiles = TranslationsDialogsSortProfilesZhCn._(_root);
	@override late final TranslationsDialogsWarpLicenseZhCn warpLicense = TranslationsDialogsWarpLicenseZhCn._(_root);
	@override late final TranslationsDialogsNewVersionZhCn newVersion = TranslationsDialogsNewVersionZhCn._(_root);
	@override late final TranslationsDialogsConfirmationZhCn confirmation = TranslationsDialogsConfirmationZhCn._(_root);
	@override late final TranslationsDialogsExperimentalNoticeZhCn experimentalNotice = TranslationsDialogsExperimentalNoticeZhCn._(_root);
	@override late final TranslationsDialogsNoActiveProfileZhCn noActiveProfile = TranslationsDialogsNoActiveProfileZhCn._(_root);
	@override late final TranslationsDialogsUnknownDomainsWarningZhCn unknownDomainsWarning = TranslationsDialogsUnknownDomainsWarningZhCn._(_root);
	@override late final TranslationsDialogsProxyInfoZhCn proxyInfo = TranslationsDialogsProxyInfoZhCn._(_root);
	@override late final TranslationsDialogsWindowClosingZhCn windowClosing = TranslationsDialogsWindowClosingZhCn._(_root);
}

// Path: connection
class TranslationsConnectionZhCn extends TranslationsConnectionEn {
	TranslationsConnectionZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get tapToConnect => '点击连接';
	@override String get connect => '连接';
	@override String get connecting => '连接中...';
	@override String get connected => '已连接';
	@override String get disconnect => '断开连接';
	@override String get disconnecting => '断开连接中...';
	@override String get reconnect => '重新连接';
	@override String get reconnectMsg => '正在重新连接以应用更改...';
	@override String get secure => '由 WARP 保护';
}

// Path: errors
class TranslationsErrorsZhCn extends TranslationsErrorsEn {
	TranslationsErrorsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '意外错误';
	@override late final TranslationsErrorsConnectionZhCn connection = TranslationsErrorsConnectionZhCn._(_root);
	@override late final TranslationsErrorsProfilesZhCn profiles = TranslationsErrorsProfilesZhCn._(_root);
	@override late final TranslationsErrorsConnectivityZhCn connectivity = TranslationsErrorsConnectivityZhCn._(_root);
	@override late final TranslationsErrorsSingboxZhCn singbox = TranslationsErrorsSingboxZhCn._(_root);
	@override late final TranslationsErrorsWarpZhCn warp = TranslationsErrorsWarpZhCn._(_root);
}

// Path: common.interval
class TranslationsCommonIntervalZhCn extends TranslationsCommonIntervalEn {
	TranslationsCommonIntervalZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n,
		zero: '',
		one: '${n} 天',
		other: '${n} 天',
	);
	@override String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n,
		zero: '',
		one: '${n} 小时',
		other: '${n} 小时',
	);
}

// Path: common.msg
class TranslationsCommonMsgZhCn extends TranslationsCommonMsgEn {
	TranslationsCommonMsgZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgPermissionZhCn permission = TranslationsCommonMsgPermissionZhCn._(_root);
	@override late final TranslationsCommonMsgExportZhCn export = TranslationsCommonMsgExportZhCn._(_root);
	@override late final TranslationsCommonMsgImportZhCn import = TranslationsCommonMsgImportZhCn._(_root);
}

// Path: pages.home
class TranslationsPagesHomeZhCn extends TranslationsPagesHomeEn {
	TranslationsPagesHomeZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '主页';
	@override String get quickSettings => '快速设置';
}

// Path: pages.proxies
class TranslationsPagesProxiesZhCn extends TranslationsPagesProxiesEn {
	TranslationsPagesProxiesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '代理';
	@override String get sort => '排序代理';
	@override String get testDelay => '测试延迟';
	@override String get empty => '无可用代理';
	@override String get activeProxy => '当前代理';
	@override String get unknownIp => '未知 IP';
	@override late final TranslationsPagesProxiesSortOptionsZhCn sortOptions = TranslationsPagesProxiesSortOptionsZhCn._(_root);
	@override late final TranslationsPagesProxiesIpInfoZhCn ipInfo = TranslationsPagesProxiesIpInfoZhCn._(_root);
	@override late final TranslationsPagesProxiesDelayZhCn delay = TranslationsPagesProxiesDelayZhCn._(_root);
}

// Path: pages.profiles
class TranslationsPagesProfilesZhCn extends TranslationsPagesProfilesEn {
	TranslationsPagesProfilesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '配置文件';
	@override String get add => '添加配置文件';
	@override String get update => '更新配置文件';
	@override String get viewAllProfiles => '查看所有配置文件';
	@override String activeProfileName({required Object name}) => '当前配置文件："${name}"';
	@override String nonActiveProfileName({required Object name}) => '选择 "${name}" 作为当前配置文件';
	@override String get freeSubNotFound => '未找到免费订阅';
	@override String freeSubNotFoundForRegion({required Object region}) => '未找到 "${region}" 地区的免费订阅';
	@override String get failedToLoad => '加载失败';
	@override String get updateSubscriptions => '更新订阅';
	@override late final TranslationsPagesProfilesShareZhCn share = TranslationsPagesProfilesShareZhCn._(_root);
	@override late final TranslationsPagesProfilesMsgZhCn msg = TranslationsPagesProfilesMsgZhCn._(_root);
}

// Path: pages.profileDetails
class TranslationsPagesProfileDetailsZhCn extends TranslationsPagesProfileDetailsEn {
	TranslationsPagesProfileDetailsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '配置文件';
	@override String get lastUpdate => '最后更新';
	@override late final TranslationsPagesProfileDetailsFormZhCn form = TranslationsPagesProfileDetailsFormZhCn._(_root);
}

// Path: pages.logs
class TranslationsPagesLogsZhCn extends TranslationsPagesLogsEn {
	TranslationsPagesLogsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '日志';
	@override String get shareCoreLogs => '分享核心日志';
	@override String get shareAppLogs => '分享应用日志';
}

// Path: pages.about
class TranslationsPagesAboutZhCn extends TranslationsPagesAboutEn {
	TranslationsPagesAboutZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '关于';
	@override String get notAvailableMsg => '已是最新版本';
	@override String get checkForUpdate => '检查更新';
	@override String get openWorkingDir => '打开工作目录';
	@override String get sourceCode => '源代码';
	@override String get telegramChannel => 'Telegram 频道';
	@override String get termsAndConditions => '条款与条件';
	@override String get privacyPolicy => '隐私政策';
}

// Path: pages.settings
class TranslationsPagesSettingsZhCn extends TranslationsPagesSettingsEn {
	TranslationsPagesSettingsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '设置';
	@override String get resetTunnel => '重置 VPN 配置文件';
	@override String get resetTunnelSubtitle => '重建本地隧道状态';
	@override String get heroSubtitle => '网络调优中心';
	@override String get sectionOpenHint => '点击打开';
	@override late final TranslationsPagesSettingsOptionsZhCn options = TranslationsPagesSettingsOptionsZhCn._(_root);
	@override late final TranslationsPagesSettingsGeneralZhCn general = TranslationsPagesSettingsGeneralZhCn._(_root);
	@override late final TranslationsPagesSettingsRoutingZhCn routing = TranslationsPagesSettingsRoutingZhCn._(_root);
	@override late final TranslationsPagesSettingsDnsZhCn dns = TranslationsPagesSettingsDnsZhCn._(_root);
	@override late final TranslationsPagesSettingsInboundZhCn inbound = TranslationsPagesSettingsInboundZhCn._(_root);
	@override late final TranslationsPagesSettingsTlsTricksZhCn tlsTricks = TranslationsPagesSettingsTlsTricksZhCn._(_root);
	@override late final TranslationsPagesSettingsWarpZhCn warp = TranslationsPagesSettingsWarpZhCn._(_root);
}

// Path: components.stats
class TranslationsComponentsStatsZhCn extends TranslationsComponentsStatsEn {
	TranslationsComponentsStatsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get connection => '连接';
	@override String get traffic => '流量';
	@override String get trafficLive => '实时流量';
	@override String get trafficTotal => '总流量';
	@override String get uplink => '上传';
	@override String get downlink => '下载';
	@override String get speed => '速度';
	@override String get totalTransferred => '总传输量';
}

// Path: components.subscriptionInfo
class TranslationsComponentsSubscriptionInfoZhCn extends TranslationsComponentsSubscriptionInfoEn {
	TranslationsComponentsSubscriptionInfoZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get upload => '上传';
	@override String get download => '下载';
	@override String get total => '总流量';
	@override String get expireDate => '到期日期';
	@override String get expired => '已过期';
	@override String get noTraffic => '流量已用尽';
	@override String get remainingTime => '剩余时间';
	@override String remainingDuration({required Object duration}) => '剩余 ${duration} 天';
	@override String remainingDurationNew({required Object duration}) => '${duration} 天';
	@override String remainingTrafficSemanticLabel({required Object consumed, required Object total}) => '已使用 ${consumed} / ${total} 流量';
	@override String get remainingTraffic => '剩余流量';
	@override String get remainingUsage => '剩余';
	@override String get profileSite => '提供商';
	@override String get profileSupport => '支持';
}

// Path: dialogs.sortProfiles
class TranslationsDialogsSortProfilesZhCn extends TranslationsDialogsSortProfilesEn {
	TranslationsDialogsSortProfilesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '排序方式';
	@override late final TranslationsDialogsSortProfilesSortZhCn sort = TranslationsDialogsSortProfilesSortZhCn._(_root);
}

// Path: dialogs.warpLicense
class TranslationsDialogsWarpLicenseZhCn extends TranslationsDialogsWarpLicenseEn {
	TranslationsDialogsWarpLicenseZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cloudflare WARP 同意书';
	@override TextSpan description({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [
		const TextSpan(text: 'Cloudflare WARP 是一个免费的 WireGuard VPN 提供商。启用此选项即表示您同意 Cloudflare WARP 的 '),
		tos('服务条款'),
		const TextSpan(text: ' 和 '),
		privacy('隐私政策'),
		const TextSpan(text: '。'),
	]);
}

// Path: dialogs.newVersion
class TranslationsDialogsNewVersionZhCn extends TranslationsDialogsNewVersionEn {
	TranslationsDialogsNewVersionZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '有可用更新';
	@override String get msg => '${_root.common.appTitle} 的新版本已发布。您想现在更新吗？';
	@override String get currentVersion => '当前版本：';
	@override String get newVersion => '新版本：';
	@override String get updateNow => '立即更新';
}

// Path: dialogs.confirmation
class TranslationsDialogsConfirmationZhCn extends TranslationsDialogsConfirmationEn {
	TranslationsDialogsConfirmationZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsZhCn settings = TranslationsDialogsConfirmationSettingsZhCn._(_root);
	@override late final TranslationsDialogsConfirmationProfileZhCn profile = TranslationsDialogsConfirmationProfileZhCn._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyZhCn perAppProxy = TranslationsDialogsConfirmationPerAppProxyZhCn._(_root);
	@override late final TranslationsDialogsConfirmationRouteRuleZhCn routeRule = TranslationsDialogsConfirmationRouteRuleZhCn._(_root);
}

// Path: dialogs.experimentalNotice
class TranslationsDialogsExperimentalNoticeZhCn extends TranslationsDialogsExperimentalNoticeEn {
	TranslationsDialogsExperimentalNoticeZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '正在使用实验性功能';
	@override String get msg => '您已启用了一些实验性功能，这可能会影响连接质量并导致意外错误。您可以随时在配置选项页面更改或重置这些选项。';
	@override String get disable => '不再显示';
}

// Path: dialogs.noActiveProfile
class TranslationsDialogsNoActiveProfileZhCn extends TranslationsDialogsNoActiveProfileEn {
	TranslationsDialogsNoActiveProfileZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '选择一个配置文件';
	@override String get msg => '让我们从添加一个包含您 VPN 连接详细信息的配置文件开始。\n\n还没有 VPN 服务器？别担心，按照下面的教程，您可以快速免费地设置一个。';
	@override late final TranslationsDialogsNoActiveProfileHelpBtnZhCn helpBtn = TranslationsDialogsNoActiveProfileHelpBtnZhCn._(_root);
}

// Path: dialogs.unknownDomainsWarning
class TranslationsDialogsUnknownDomainsWarningZhCn extends TranslationsDialogsUnknownDomainsWarningEn {
	TranslationsDialogsUnknownDomainsWarningZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '外部链接警告';
	@override String get youAreAboutToVisit => '您即将访问：';
	@override String get thisWebsiteIsNotInOurTrustedList => '此网站不在我们的信任列表中。请谨慎操作。';
}

// Path: dialogs.proxyInfo
class TranslationsDialogsProxyInfoZhCn extends TranslationsDialogsProxyInfoEn {
	TranslationsDialogsProxyInfoZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get fullTag => '完整标签：';
	@override String get type => '类型：';
	@override String get testTime => '测试时间：';
	@override String get testDelay => '测试延迟：';
	@override String get isSelected => '已选择：';
	@override String get isGroup => '是组';
	@override String get isSecure => '安全：';
	@override String get port => '端口：';
	@override String get host => '主机：';
	@override String get ip => 'IP：';
	@override String get countryCode => '国家代码：';
	@override String get region => '地区：';
	@override String get city => '城市：';
	@override String get asn => 'ASN：';
	@override String get organization => '组织：';
	@override String get location => '位置：';
	@override String get postalCode => '邮政编码：';
}

// Path: dialogs.windowClosing
class TranslationsDialogsWindowClosingZhCn extends TranslationsDialogsWindowClosingEn {
	TranslationsDialogsWindowClosingZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get askEachTime => '每次询问';
	@override String get alertMessage => '隐藏还是退出应用程序？';
	@override String get remember => '记住我的选择';
}

// Path: errors.connection
class TranslationsErrorsConnectionZhCn extends TranslationsErrorsConnectionEn {
	TranslationsErrorsConnectionZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '意外连接错误';
	@override String get timeout => '连接超时';
	@override String get badResponse => '响应错误';
	@override String get connectionError => '连接错误';
	@override String get badCertificate => '证书无效';
}

// Path: errors.profiles
class TranslationsErrorsProfilesZhCn extends TranslationsErrorsProfilesEn {
	TranslationsErrorsProfilesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '意外错误';
	@override String get notFound => '未找到配置文件';
	@override String get invalidConfig => '配置无效';
	@override String get invalidUrl => 'URL 无效';
	@override String get canceledByUser => '用户已取消';
}

// Path: errors.connectivity
class TranslationsErrorsConnectivityZhCn extends TranslationsErrorsConnectivityEn {
	TranslationsErrorsConnectivityZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '意外失败';
	@override String get missingVpnPermission => '缺少 VPN 权限';
	@override String get missingNotificationPermission => '缺少通知权限';
	@override String get core => '核心错误';
}

// Path: errors.singbox
class TranslationsErrorsSingboxZhCn extends TranslationsErrorsSingboxEn {
	TranslationsErrorsSingboxZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get serviceNotRunning => '服务未运行';
	@override String get missingPrivilege => '缺少权限';
	@override String get missingPrivilegeMsg => 'VPN 模式需要管理员权限。请以管理员身份重新启动应用，或更改服务模式。';
	@override String get invalidConfigOptions => '配置选项无效';
	@override String get invalidConfig => '配置无效';
}

// Path: errors.warp
class TranslationsErrorsWarpZhCn extends TranslationsErrorsWarpEn {
	TranslationsErrorsWarpZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get missingLicense => 'WARP 许可证缺失';
	@override String get missingLicenseMsg => '所选配置文件使用 WARP 功能；要使用此功能，必须同意 WARP 许可证。';
}

// Path: common.msg.permission
class TranslationsCommonMsgPermissionZhCn extends TranslationsCommonMsgPermissionEn {
	TranslationsCommonMsgPermissionZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get denied => '权限被拒绝';
}

// Path: common.msg.export
class TranslationsCommonMsgExportZhCn extends TranslationsCommonMsgExportEn {
	TranslationsCommonMsgExportZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgExportClipboardZhCn clipboard = TranslationsCommonMsgExportClipboardZhCn._(_root);
	@override late final TranslationsCommonMsgExportFileZhCn file = TranslationsCommonMsgExportFileZhCn._(_root);
}

// Path: common.msg.import
class TranslationsCommonMsgImportZhCn extends TranslationsCommonMsgImportEn {
	TranslationsCommonMsgImportZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get confirm => '确认导入';
	@override String get success => '导入成功';
	@override String get failure => '导入失败';
}

// Path: pages.proxies.sortOptions
class TranslationsPagesProxiesSortOptionsZhCn extends TranslationsPagesProxiesSortOptionsEn {
	TranslationsPagesProxiesSortOptionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get unsorted => '默认';
	@override String get name => '按名称';
	@override String get delay => '按延迟';
}

// Path: pages.proxies.ipInfo
class TranslationsPagesProxiesIpInfoZhCn extends TranslationsPagesProxiesIpInfoEn {
	TranslationsPagesProxiesIpInfoZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get address => 'IP 地址';
	@override String get country => '国家';
	@override String get organization => '组织';
}

// Path: pages.proxies.delay
class TranslationsPagesProxiesDelayZhCn extends TranslationsPagesProxiesDelayEn {
	TranslationsPagesProxiesDelayZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String result({required Object delay}) => '延迟：${delay}毫秒';
	@override String get timeout => '延迟测试超时';
	@override String get testing => '延迟：测试中...';
}

// Path: pages.profiles.share
class TranslationsPagesProfilesShareZhCn extends TranslationsPagesProfilesShareEn {
	TranslationsPagesProfilesShareZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get urlToClipboard => 'URL 到剪贴板';
	@override String get showUrlQr => '显示 URL 二维码';
	@override String get jsonToClipboard => 'JSON 到剪贴板';
}

// Path: pages.profiles.msg
class TranslationsPagesProfilesMsgZhCn extends TranslationsPagesProfilesMsgEn {
	TranslationsPagesProfilesMsgZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesProfilesMsgSaveZhCn save = TranslationsPagesProfilesMsgSaveZhCn._(_root);
	@override String get invalidUrl => '无效的 URL';
	@override late final TranslationsPagesProfilesMsgAddZhCn add = TranslationsPagesProfilesMsgAddZhCn._(_root);
	@override late final TranslationsPagesProfilesMsgUpdateZhCn update = TranslationsPagesProfilesMsgUpdateZhCn._(_root);
	@override late final TranslationsPagesProfilesMsgDeleteZhCn delete = TranslationsPagesProfilesMsgDeleteZhCn._(_root);
}

// Path: pages.profileDetails.form
class TranslationsPagesProfileDetailsFormZhCn extends TranslationsPagesProfileDetailsFormEn {
	TranslationsPagesProfileDetailsFormZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get nameHint => '配置文件名称';
	@override String get emptyName => '名称为必填项';
	@override String get invalidUrl => '无效的 URL';
	@override String get urlHint => '完整的配置 URL';
	@override String get disableAutoUpdate => '禁用自动更新';
	@override String get autoUpdateInterval => '自动更新间隔';
	@override String get loading => '正在添加配置文件...';
}

// Path: pages.settings.options
class TranslationsPagesSettingsOptionsZhCn extends TranslationsPagesSettingsOptionsEn {
	TranslationsPagesSettingsOptionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsOptionsImportZhCn import = TranslationsPagesSettingsOptionsImportZhCn._(_root);
	@override late final TranslationsPagesSettingsOptionsExportZhCn export = TranslationsPagesSettingsOptionsExportZhCn._(_root);
	@override String get reset => '重置选项';
}

// Path: pages.settings.general
class TranslationsPagesSettingsGeneralZhCn extends TranslationsPagesSettingsGeneralEn {
	TranslationsPagesSettingsGeneralZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '通用';
	@override String get locale => '语言';
	@override String get themeMode => '主题模式';
	@override late final TranslationsPagesSettingsGeneralThemeModesZhCn themeModes = TranslationsPagesSettingsGeneralThemeModesZhCn._(_root);
	@override String get enableAnalytics => '启用分析';
	@override String get enableAnalyticsMsg => '允许收集分析数据和发送崩溃报告以改进应用';
	@override String get autoIpCheck => '自动检查连接 IP';
	@override String get dynamicNotification => '在通知中显示速度';
	@override String get hapticFeedback => '触觉反馈';
	@override String get actionAtClosing => '关闭时操作';
	@override String get autoStart => '开机自启';
	@override String get silentStart => '静默启动';
	@override String get ignoreBatteryOptimizations => '忽略电池优化';
	@override String get ignoreBatteryOptimizationsMsg => '移除限制以获得最佳 VPN 性能';
	@override String get memoryLimit => '内存限制';
	@override String get memoryLimitMsg => '如果您遇到内存不足错误或应用频繁崩溃，请启用此选项';
	@override String get debugMode => '调试模式';
	@override String get debugModeMsg => '重启应用以应用此更改';
	@override String get logLevel => '日志级别';
	@override String get connectionTestUrl => '连接测试 URL';
	@override String get urlTestInterval => 'URL 测试间隔';
	@override String get clashApiPort => 'Clash API 端口';
	@override String get useXrayCoreWhenPossible => '尽可能使用 xray-core';
	@override String get useXrayCoreWhenPossibleMsg => '解析订阅链接时使用 xray-core。您需要重新导入订阅链接才能启用此选项';
}

// Path: pages.settings.routing
class TranslationsPagesSettingsRoutingZhCn extends TranslationsPagesSettingsRoutingEn {
	TranslationsPagesSettingsRoutingZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '路由';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyZhCn perAppProxy = TranslationsPagesSettingsRoutingPerAppProxyZhCn._(_root);
	@override String get region => '地区';
	@override late final TranslationsPagesSettingsRoutingRegionsZhCn regions = TranslationsPagesSettingsRoutingRegionsZhCn._(_root);
	@override late final TranslationsPagesSettingsRoutingBalancerStrategyZhCn balancerStrategy = TranslationsPagesSettingsRoutingBalancerStrategyZhCn._(_root);
	@override String get blockAds => '拦截广告';
	@override String get bypassLan => '绕过局域网';
	@override String get resolveDestination => '解析目的地';
	@override String get ipv6Route => 'IPv6 路由';
	@override late final TranslationsPagesSettingsRoutingIpv6ModesZhCn ipv6Modes = TranslationsPagesSettingsRoutingIpv6ModesZhCn._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleZhCn routeRule = TranslationsPagesSettingsRoutingRouteRuleZhCn._(_root);
}

// Path: pages.settings.dns
class TranslationsPagesSettingsDnsZhCn extends TranslationsPagesSettingsDnsEn {
	TranslationsPagesSettingsDnsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => 'DNS';
	@override String get remoteDns => '远程 DNS';
	@override String get remoteDnsDomainStrategy => '远程 DNS 域名策略';
	@override String get directDns => '出站服务器解析器（直连）';
	@override String get directDnsDomainStrategy => '出站域名策略';
	@override String get enableDnsRouting => '启用 DNS 路由';
	@override String get enableFakeDns => '启用伪造 DNS';
	@override late final TranslationsPagesSettingsDnsDomainStrategyZhCn domainStrategy = TranslationsPagesSettingsDnsDomainStrategyZhCn._(_root);
}

// Path: pages.settings.inbound
class TranslationsPagesSettingsInboundZhCn extends TranslationsPagesSettingsInboundEn {
	TranslationsPagesSettingsInboundZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '入站';
	@override String get serviceMode => '服务模式';
	@override late final TranslationsPagesSettingsInboundServiceModesZhCn serviceModes = TranslationsPagesSettingsInboundServiceModesZhCn._(_root);
	@override late final TranslationsPagesSettingsInboundShortServiceModesZhCn shortServiceModes = TranslationsPagesSettingsInboundShortServiceModesZhCn._(_root);
	@override String get strictRoute => '严格路由';
	@override String get tunImplementation => 'TUN 实现';
	@override late final TranslationsPagesSettingsInboundTunImplementationsZhCn tunImplementations = TranslationsPagesSettingsInboundTunImplementationsZhCn._(_root);
	@override String get mixedPort => '混合端口';
	@override String get tproxyPort => '透明代理端口';
	@override String get directPort => '本地 Direct 端口';
	@override String get redirectPort => '重定向端口';
	@override String get allowConnectionFromLan => '允许来自局域网的连接';
}

// Path: pages.settings.tlsTricks
class TranslationsPagesSettingsTlsTricksZhCn extends TranslationsPagesSettingsTlsTricksEn {
	TranslationsPagesSettingsTlsTricksZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => 'TLS 技巧';
	@override String get enable => '启用分片';
	@override String get packets => '分片数据包';
	@override String get packetsTlsHello => 'TLS Hello';
	@override String get packets1_1 => '1-1';
	@override String get packets1_2 => '1-2';
	@override String get packets1_3 => '1-3';
	@override String get packets1_4 => '1-4';
	@override String get packets1_5 => '1-5';
	@override String get size => '分片大小';
	@override String get sleep => '分片延迟';
	@override late final TranslationsPagesSettingsTlsTricksMixedSniCaseZhCn mixedSniCase = TranslationsPagesSettingsTlsTricksMixedSniCaseZhCn._(_root);
	@override late final TranslationsPagesSettingsTlsTricksPaddingZhCn padding = TranslationsPagesSettingsTlsTricksPaddingZhCn._(_root);
}

// Path: pages.settings.warp
class TranslationsPagesSettingsWarpZhCn extends TranslationsPagesSettingsWarpEn {
	TranslationsPagesSettingsWarpZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => 'WARP';
	@override String get enable => '启用 WARP';
	@override String get generateConfig => '生成 WARP 配置';
	@override String get configGenerated => 'WARP 配置已生成';
	@override String get missingConfig => 'WARP 配置缺失';
	@override String get detourMode => 'WARP 路由模式';
	@override late final TranslationsPagesSettingsWarpDetourModesZhCn detourModes = TranslationsPagesSettingsWarpDetourModesZhCn._(_root);
	@override String get licenseKey => '许可证密钥';
	@override String get cleanIp => '优选 IP';
	@override String get port => '端口';
	@override late final TranslationsPagesSettingsWarpNoiseZhCn noise = TranslationsPagesSettingsWarpNoiseZhCn._(_root);
}

// Path: dialogs.sortProfiles.sort
class TranslationsDialogsSortProfilesSortZhCn extends TranslationsDialogsSortProfilesSortEn {
	TranslationsDialogsSortProfilesSortZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '按字母顺序';
	@override String get lastUpdate => '最近更新';
}

// Path: dialogs.confirmation.settings
class TranslationsDialogsConfirmationSettingsZhCn extends TranslationsDialogsConfirmationSettingsEn {
	TranslationsDialogsConfirmationSettingsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsImportZhCn import = TranslationsDialogsConfirmationSettingsImportZhCn._(_root);
}

// Path: dialogs.confirmation.profile
class TranslationsDialogsConfirmationProfileZhCn extends TranslationsDialogsConfirmationProfileEn {
	TranslationsDialogsConfirmationProfileZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationProfileDeleteZhCn delete = TranslationsDialogsConfirmationProfileDeleteZhCn._(_root);
}

// Path: dialogs.confirmation.perAppProxy
class TranslationsDialogsConfirmationPerAppProxyZhCn extends TranslationsDialogsConfirmationPerAppProxyEn {
	TranslationsDialogsConfirmationPerAppProxyZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationPerAppProxyShareOnGithubZhCn shareOnGithub = TranslationsDialogsConfirmationPerAppProxyShareOnGithubZhCn._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyImportZhCn import = TranslationsDialogsConfirmationPerAppProxyImportZhCn._(_root);
}

// Path: dialogs.confirmation.routeRule
class TranslationsDialogsConfirmationRouteRuleZhCn extends TranslationsDialogsConfirmationRouteRuleEn {
	TranslationsDialogsConfirmationRouteRuleZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationRouteRuleDeleteZhCn delete = TranslationsDialogsConfirmationRouteRuleDeleteZhCn._(_root);
}

// Path: dialogs.noActiveProfile.helpBtn
class TranslationsDialogsNoActiveProfileHelpBtnZhCn extends TranslationsDialogsNoActiveProfileHelpBtnEn {
	TranslationsDialogsNoActiveProfileHelpBtnZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get label => '告诉我如何操作';
	@override String get url => 'https://github.com/shulaiyun/Sloth-VPN.git';
}

// Path: common.msg.export.clipboard
class TranslationsCommonMsgExportClipboardZhCn extends TranslationsCommonMsgExportClipboardEn {
	TranslationsCommonMsgExportClipboardZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get success => '已成功添加到剪贴板';
	@override String get failure => '复制到剪贴板失败';
	@override String get contentTooLarge => '内容过大，请使用导出文件';
}

// Path: common.msg.export.file
class TranslationsCommonMsgExportFileZhCn extends TranslationsCommonMsgExportFileEn {
	TranslationsCommonMsgExportFileZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get success => 'JSON 文件创建成功';
	@override String get failure => '创建文件失败';
}

// Path: pages.profiles.msg.save
class TranslationsPagesProfilesMsgSaveZhCn extends TranslationsPagesProfilesMsgSaveEn {
	TranslationsPagesProfilesMsgSaveZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get success => '配置文件保存成功';
}

// Path: pages.profiles.msg.add
class TranslationsPagesProfilesMsgAddZhCn extends TranslationsPagesProfilesMsgAddEn {
	TranslationsPagesProfilesMsgAddZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get failure => '添加配置文件失败';
}

// Path: pages.profiles.msg.update
class TranslationsPagesProfilesMsgUpdateZhCn extends TranslationsPagesProfilesMsgUpdateEn {
	TranslationsPagesProfilesMsgUpdateZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get success => '配置文件更新成功';
	@override String successNamed({required Object name}) => '"${name}" 更新成功';
	@override String get failure => '更新配置文件失败';
	@override String failureNamed({required Object name}) => '更新 "${name}" 失败';
}

// Path: pages.profiles.msg.delete
class TranslationsPagesProfilesMsgDeleteZhCn extends TranslationsPagesProfilesMsgDeleteEn {
	TranslationsPagesProfilesMsgDeleteZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get success => '配置文件删除成功';
}

// Path: pages.settings.options.import
class TranslationsPagesSettingsOptionsImportZhCn extends TranslationsPagesSettingsOptionsImportEn {
	TranslationsPagesSettingsOptionsImportZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '从剪贴板导入选项';
	@override String get file => '从文件导入选项';
}

// Path: pages.settings.options.export
class TranslationsPagesSettingsOptionsExportZhCn extends TranslationsPagesSettingsOptionsExportEn {
	TranslationsPagesSettingsOptionsExportZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get anonymousToClipboard => '复制匿名选项到剪贴板';
	@override String get anonymousToFile => '导出匿名选项到文件';
	@override String get allToClipboard => '复制所有选项到剪贴板';
	@override String get allToFile => '导出所有选项到文件';
}

// Path: pages.settings.general.themeModes
class TranslationsPagesSettingsGeneralThemeModesZhCn extends TranslationsPagesSettingsGeneralThemeModesEn {
	TranslationsPagesSettingsGeneralThemeModesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get system => '跟随系统';
	@override String get dark => '深色模式';
	@override String get light => '浅色模式';
	@override String get black => '纯黑模式';
}

// Path: pages.settings.routing.perAppProxy
class TranslationsPagesSettingsRoutingPerAppProxyZhCn extends TranslationsPagesSettingsRoutingPerAppProxyEn {
	TranslationsPagesSettingsRoutingPerAppProxyZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '分应用代理';
	@override String get hideSysApps => '隐藏系统应用';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsZhCn options = TranslationsPagesSettingsRoutingPerAppProxyOptionsZhCn._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyModesZhCn modes = TranslationsPagesSettingsRoutingPerAppProxyModesZhCn._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionZhCn autoSelection = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionZhCn._(_root);
}

// Path: pages.settings.routing.regions
class TranslationsPagesSettingsRoutingRegionsZhCn extends TranslationsPagesSettingsRoutingRegionsEn {
	TranslationsPagesSettingsRoutingRegionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get ir => '伊朗 (ir)';
	@override String get cn => '中国 (cn)';
	@override String get ru => '俄罗斯 (ru)';
	@override String get af => '阿富汗 (af)';
	@override String get id => '印度尼西亚 (id)';
	@override String get tr => '土耳其 (tr)';
	@override String get br => '巴西 (br)';
	@override String get other => '其他';
}

// Path: pages.settings.routing.balancerStrategy
class TranslationsPagesSettingsRoutingBalancerStrategyZhCn extends TranslationsPagesSettingsRoutingBalancerStrategyEn {
	TranslationsPagesSettingsRoutingBalancerStrategyZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Balancer 策略';
	@override String get roundRobin => 'Round robin';
	@override String get consistentHash => 'Consistent hash';
	@override String get stickySession => 'Sticky session';
}

// Path: pages.settings.routing.ipv6Modes
class TranslationsPagesSettingsRoutingIpv6ModesZhCn extends TranslationsPagesSettingsRoutingIpv6ModesEn {
	TranslationsPagesSettingsRoutingIpv6ModesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get disable => '禁用';
	@override String get enable => '启用';
	@override String get prefer => '首选';
	@override String get only => '仅';
}

// Path: pages.settings.routing.routeRule
class TranslationsPagesSettingsRoutingRouteRuleZhCn extends TranslationsPagesSettingsRoutingRouteRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '路由规则';
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsZhCn options = TranslationsPagesSettingsRoutingRouteRuleOptionsZhCn._(_root);
	@override String get deleteRule => '删除规则';
	@override String get createRule => '创建新规则';
	@override late final TranslationsPagesSettingsRoutingRouteRuleRuleZhCn rule = TranslationsPagesSettingsRoutingRouteRuleRuleZhCn._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleGenericListZhCn genericList = TranslationsPagesSettingsRoutingRouteRuleGenericListZhCn._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleAndroidAppsZhCn androidApps = TranslationsPagesSettingsRoutingRouteRuleAndroidAppsZhCn._(_root);
}

// Path: pages.settings.dns.domainStrategy
class TranslationsPagesSettingsDnsDomainStrategyZhCn extends TranslationsPagesSettingsDnsDomainStrategyEn {
	TranslationsPagesSettingsDnsDomainStrategyZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get auto => '自动';
	@override String get preferIpv6 => '偏好 IPv6';
	@override String get preferIpv4 => '偏好 IPv4';
	@override String get ipv4Only => '仅 IPv4';
	@override String get ipv6Only => '仅 IPv6';
}

// Path: pages.settings.inbound.serviceModes
class TranslationsPagesSettingsInboundServiceModesZhCn extends TranslationsPagesSettingsInboundServiceModesEn {
	TranslationsPagesSettingsInboundServiceModesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get proxy => '仅代理服务';
	@override String get systemProxy => '设置系统代理';
	@override String get tun => 'VPN';
	@override String get tunService => 'VPN 服务';
}

// Path: pages.settings.inbound.shortServiceModes
class TranslationsPagesSettingsInboundShortServiceModesZhCn extends TranslationsPagesSettingsInboundShortServiceModesEn {
	TranslationsPagesSettingsInboundShortServiceModesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get proxy => '代理';
	@override String get systemProxy => '系统代理';
	@override String get tun => 'VPN';
	@override String get tunService => 'VPN 服务';
}

// Path: pages.settings.inbound.tunImplementations
class TranslationsPagesSettingsInboundTunImplementationsZhCn extends TranslationsPagesSettingsInboundTunImplementationsEn {
	TranslationsPagesSettingsInboundTunImplementationsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get mixed => '混合';
	@override String get system => '系统';
	@override String get gvisor => 'gVisor';
}

// Path: pages.settings.tlsTricks.mixedSniCase
class TranslationsPagesSettingsTlsTricksMixedSniCaseZhCn extends TranslationsPagesSettingsTlsTricksMixedSniCaseEn {
	TranslationsPagesSettingsTlsTricksMixedSniCaseZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get enable => '启用混合大小写 SNI';
}

// Path: pages.settings.tlsTricks.padding
class TranslationsPagesSettingsTlsTricksPaddingZhCn extends TranslationsPagesSettingsTlsTricksPaddingEn {
	TranslationsPagesSettingsTlsTricksPaddingZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get enable => '启用填充';
	@override String get size => '填充大小';
}

// Path: pages.settings.warp.detourModes
class TranslationsPagesSettingsWarpDetourModesZhCn extends TranslationsPagesSettingsWarpDetourModesEn {
	TranslationsPagesSettingsWarpDetourModesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get proxyOverWarp => '通过 WARP 路由代理';
	@override String get warpOverProxy => '通过代理路由 WARP';
	@override String get proxyOverWarpExplain => '通过 WARP 解锁代理';
	@override String get warpOverProxyExplain => '通过 WARP 增强安全性';
}

// Path: pages.settings.warp.noise
class TranslationsPagesSettingsWarpNoiseZhCn extends TranslationsPagesSettingsWarpNoiseEn {
	TranslationsPagesSettingsWarpNoiseZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get count => '噪声数量';
	@override String get mode => '噪声模式';
	@override String get size => '噪声大小';
	@override String get delay => '噪声延迟';
}

// Path: dialogs.confirmation.settings.import
class TranslationsDialogsConfirmationSettingsImportZhCn extends TranslationsDialogsConfirmationSettingsImportEn {
	TranslationsDialogsConfirmationSettingsImportZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get msg => '这将用提供的值覆盖所有配置选项。您确定吗？';
}

// Path: dialogs.confirmation.profile.delete
class TranslationsDialogsConfirmationProfileDeleteZhCn extends TranslationsDialogsConfirmationProfileDeleteEn {
	TranslationsDialogsConfirmationProfileDeleteZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '删除配置文件';
	@override String get msg => '您确定要永久删除此配置文件吗？';
}

// Path: dialogs.confirmation.perAppProxy.shareOnGithub
class TranslationsDialogsConfirmationPerAppProxyShareOnGithubZhCn extends TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn {
	TranslationsDialogsConfirmationPerAppProxyShareOnGithubZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '改进自动选择';
	@override String get msg => '通过分享您选择的应用，可以帮助完善“自动选择”列表';
}

// Path: dialogs.confirmation.perAppProxy.import
class TranslationsDialogsConfirmationPerAppProxyImportZhCn extends TranslationsDialogsConfirmationPerAppProxyImportEn {
	TranslationsDialogsConfirmationPerAppProxyImportZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get msg => '这将替换您当前所有的分应用代理选择。您确定要继续吗？';
}

// Path: dialogs.confirmation.routeRule.delete
class TranslationsDialogsConfirmationRouteRuleDeleteZhCn extends TranslationsDialogsConfirmationRouteRuleDeleteEn {
	TranslationsDialogsConfirmationRouteRuleDeleteZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '删除规则';
	@override String msg({required Object rulename}) => '您确定要删除规则 "${rulename}" 吗？';
}

// Path: pages.settings.routing.perAppProxy.options
class TranslationsPagesSettingsRoutingPerAppProxyOptionsZhCn extends TranslationsPagesSettingsRoutingPerAppProxyOptionsEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsImportZhCn import = TranslationsPagesSettingsRoutingPerAppProxyOptionsImportZhCn._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsExportZhCn export = TranslationsPagesSettingsRoutingPerAppProxyOptionsExportZhCn._(_root);
	@override String get shareToAll => '分享给所有人';
	@override String get clearAllSelections => '清除所有选择';
}

// Path: pages.settings.routing.perAppProxy.modes
class TranslationsPagesSettingsRoutingPerAppProxyModesZhCn extends TranslationsPagesSettingsRoutingPerAppProxyModesEn {
	TranslationsPagesSettingsRoutingPerAppProxyModesZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get all => '全部';
	@override String get proxy => '代理';
	@override String get bypass => '绕过';
	@override String get allMsg => '代理所有应用';
	@override String get proxyMsg => '仅代理选定应用';
	@override String get bypassMsg => '不代理选定应用';
}

// Path: pages.settings.routing.perAppProxy.autoSelection
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionZhCn extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '自动选择';
	@override String get performNow => '立即执行';
	@override String get resetToDefault => '重置为默认';
	@override String get autoUpdateInterval => '自动更新间隔';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastZhCn toast = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastZhCn._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogZhCn dialog = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogZhCn._(_root);
}

// Path: pages.settings.routing.routeRule.options
class TranslationsPagesSettingsRoutingRouteRuleOptionsZhCn extends TranslationsPagesSettingsRoutingRouteRuleOptionsEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsImportZhCn import = TranslationsPagesSettingsRoutingRouteRuleOptionsImportZhCn._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsExportZhCn export = TranslationsPagesSettingsRoutingRouteRuleOptionsExportZhCn._(_root);
	@override String get reset => '重置规则';
}

// Path: pages.settings.routing.routeRule.rule
class TranslationsPagesSettingsRoutingRouteRuleRuleZhCn extends TranslationsPagesSettingsRoutingRouteRuleRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleRuleZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '规则';
	@override String get ruleChanged => '规则已更改';
	@override String get ruleChangedMsg => '您想保存您的编辑吗？';
	@override String get onlyTunMode => '仅在 TUN 模式下可用';
	@override String get notAvailabeInThisPlatform => '在此平台上不可用';
	@override String get canNotBeEmpty => '不能为空';
	@override String get validUrlEx => 'https://example.com';
	@override String get validUrl => '有效的 "URL"，例如\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}';
	@override String get validProcessNameEx => 'Chrome.exe 或 google chrome 或 chrome';
	@override String get validProcessName => '有效的 "进程名"，例如\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}';
	@override String get validProcessPathEx => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome';
	@override String get validProcessPath => '有效的 "进程路径"，例如\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}';
	@override String get validPortRangeEx => '80 或 1-65000';
	@override String get validPortRange => '有效的 "端口" 或 "端口范围"，例如\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}';
	@override String get validIpCidrEx => '8.8.8.8 或 10.0.0.0/24';
	@override String get validIpCidr => '有效的 IP CIDR，例如\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}';
	@override String get validDomainEx => 'Google.com 或 dl.google.com';
	@override String get validDomain => '有效的 "域名"，例如\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}';
	@override String get validDomainSuffixEx => '.com 或 .cn';
	@override String get validDomainSuffix => '有效的 "域名后缀"，例如\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}';
	@override Map<String, String> get tileTitle => {
		'name': '名称',
		'outbound': '匹配时出站',
		'rule_set': '规则集 URL',
		'package_name': '包名',
		'process_name': '进程名',
		'process_path': '进程路径',
		'network': '网络',
		'port_range': '目标端口',
		'source_port_range': '源端口',
		'protocol': '协议',
		'ip_cidr': '目标 IP CIDR',
		'source_ip_cidr': '源 IP CIDR',
		'domain': '域名',
		'domain_suffixe': '域名后缀',
		'domain_keyword': '域名关键词',
		'domain_regex': '域名正则表达式',
	};
	@override Map<String, String> get outbound => {
		'proxy': '代理',
		'direct': '直连',
		'direct_with_fragment': '直连并分片',
		'block': '拦截',
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
class TranslationsPagesSettingsRoutingRouteRuleGenericListZhCn extends TranslationsPagesSettingsRoutingRouteRuleGenericListEn {
	TranslationsPagesSettingsRoutingRouteRuleGenericListZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get addNew => '添加新值';
	@override String get update => '更新值';
	@override String get clearList => '清空列表';
	@override String get clearListMsg => '所有项目已删除';
}

// Path: pages.settings.routing.routeRule.androidApps
class TranslationsPagesSettingsRoutingRouteRuleAndroidAppsZhCn extends TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn {
	TranslationsPagesSettingsRoutingRouteRuleAndroidAppsZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => '安卓应用';
	@override String get showSystemApps => '显示系统应用';
	@override String get hideSystemApps => '隐藏系统应用';
	@override String get clearSelection => '清除选择';
	@override String get uninstalled => '已卸载';
}

// Path: pages.settings.routing.perAppProxy.options.import
class TranslationsPagesSettingsRoutingPerAppProxyOptionsImportZhCn extends TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsImportZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '从剪贴板导入选择';
	@override String get file => '从文件导入选择';
	@override String get msg => '导入将替换您当前的选择。确定要继续吗？';
}

// Path: pages.settings.routing.perAppProxy.options.export
class TranslationsPagesSettingsRoutingPerAppProxyOptionsExportZhCn extends TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsExportZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '复制选择到剪贴板';
	@override String get file => '导出选择到文件';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.toast
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastZhCn extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get success => '自动选择应用成功完成';
	@override String get failure => '自动选择失败';
	@override String regionNotFound({required Object region}) => '未找到 "${region}" 地区的自动选择';
	@override String get alreadyInAuto => '您的选择已在自动列表中';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.dialog
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogZhCn extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get title => '自动选择应用';
	@override String msg({required Object region}) => '由于地区更改为 "${region}"，分应用代理的自动选择功能已被禁用';
}

// Path: pages.settings.routing.routeRule.options.import
class TranslationsPagesSettingsRoutingRouteRuleOptionsImportZhCn extends TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsImportZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '从剪贴板导入规则';
	@override String get file => '从文件导入规则';
}

// Path: pages.settings.routing.routeRule.options.export
class TranslationsPagesSettingsRoutingRouteRuleOptionsExportZhCn extends TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsExportZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '复制规则到剪贴板';
	@override String get file => '保存规则到文件';
}

/// The flat map containing all translations for locale <zh-CN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhCn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appTitle' => '树懒VPN',
			'common.start' => '开始',
			'common.version' => '版本',
			'common.ok' => '确定',
			'common.cancel' => '取消',
			'common.kContinue' => '继续',
			'common.showMore' => '显示更多',
			'common.showLess' => '显示更少',
			'common.filter' => '筛选',
			'common.all' => '全部',
			'common.pause' => '暂停',
			'common.resume' => '恢复',
			'common.clear' => '清除',
			'common.close' => '关闭',
			'common.auto' => '自动',
			'common.manually' => '手动',
			'common.name' => '名称',
			'common.url' => 'URL',
			'common.add' => '添加',
			'common.clipboard' => '剪贴板',
			'common.addToClipboard' => '添加到剪贴板',
			'common.scanQr' => '扫描二维码',
			'common.free' => '免费',
			'common.warp' => 'WARP',
			'common.fragment' => 'Fragment',
			'common.help' => '帮助',
			'common.save' => '保存',
			'common.update' => '更新',
			'common.share' => '分享',
			'common.edit' => '编辑',
			'common.delete' => '删除',
			'common.discard' => '放弃',
			'common.import' => '导入',
			'common.export' => '导出',
			'common.later' => '稍后',
			'common.ignore' => '忽略',
			'common.quit' => '退出',
			'common.notSet' => '未设置',
			'common.hide' => '隐藏',
			'common.exit' => '退出',
			'common.reset' => '重置',
			'common.done' => '完成',
			'common.search' => '搜索',
			'common.decline' => '拒绝',
			'common.agree' => '同意',
			'common.empty' => '空',
			'common.unknown' => '未知',
			'common.hidden' => '隐藏',
			'common.timeout' => '超时',
			'common.sort' => '排序',
			'common.dashboard' => '仪表盘',
			'common.interval.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n, zero: '', one: '${n} 天', other: '${n} 天', ), 
			'common.interval.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('zh'))(n, zero: '', one: '${n} 小时', other: '${n} 小时', ), 
			'common.msg.permission.denied' => '权限被拒绝',
			'common.msg.export.clipboard.success' => '已成功添加到剪贴板',
			'common.msg.export.clipboard.failure' => '复制到剪贴板失败',
			'common.msg.export.clipboard.contentTooLarge' => '内容过大，请使用导出文件',
			'common.msg.export.file.success' => 'JSON 文件创建成功',
			'common.msg.export.file.failure' => '创建文件失败',
			'common.msg.import.confirm' => '确认导入',
			'common.msg.import.success' => '导入成功',
			'common.msg.import.failure' => '导入失败',
			'intro.banner' => '畅享无限制网络的所需一切',
			'intro.termsAndPolicyCaution' => ({required InlineSpanBuilder tap}) => TextSpan(children: [ const TextSpan(text: '继续即表示您同意 '), tap(_root.pages.about.termsAndConditions), ]), 
			'intro.info' => ({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [ const TextSpan(text: '由 Hiddify 用 ❤️ 制作 - '), tap_source('开源'), const TextSpan(text: ' ('), tap_license('许可证'), const TextSpan(text: ')'), ]), 
			'pages.home.title' => '主页',
			'pages.home.quickSettings' => '快速设置',
			'pages.proxies.title' => '代理',
			'pages.proxies.sort' => '排序代理',
			'pages.proxies.testDelay' => '测试延迟',
			'pages.proxies.empty' => '无可用代理',
			'pages.proxies.activeProxy' => '当前代理',
			'pages.proxies.unknownIp' => '未知 IP',
			'pages.proxies.sortOptions.unsorted' => '默认',
			'pages.proxies.sortOptions.name' => '按名称',
			'pages.proxies.sortOptions.delay' => '按延迟',
			'pages.proxies.ipInfo.address' => 'IP 地址',
			'pages.proxies.ipInfo.country' => '国家',
			'pages.proxies.ipInfo.organization' => '组织',
			'pages.proxies.delay.result' => ({required Object delay}) => '延迟：${delay}毫秒',
			'pages.proxies.delay.timeout' => '延迟测试超时',
			'pages.proxies.delay.testing' => '延迟：测试中...',
			'pages.profiles.title' => '配置文件',
			'pages.profiles.add' => '添加配置文件',
			'pages.profiles.update' => '更新配置文件',
			'pages.profiles.viewAllProfiles' => '查看所有配置文件',
			'pages.profiles.activeProfileName' => ({required Object name}) => '当前配置文件："${name}"',
			'pages.profiles.nonActiveProfileName' => ({required Object name}) => '选择 "${name}" 作为当前配置文件',
			'pages.profiles.freeSubNotFound' => '未找到免费订阅',
			'pages.profiles.freeSubNotFoundForRegion' => ({required Object region}) => '未找到 "${region}" 地区的免费订阅',
			'pages.profiles.failedToLoad' => '加载失败',
			'pages.profiles.updateSubscriptions' => '更新订阅',
			'pages.profiles.share.urlToClipboard' => 'URL 到剪贴板',
			'pages.profiles.share.showUrlQr' => '显示 URL 二维码',
			'pages.profiles.share.jsonToClipboard' => 'JSON 到剪贴板',
			'pages.profiles.msg.save.success' => '配置文件保存成功',
			'pages.profiles.msg.invalidUrl' => '无效的 URL',
			'pages.profiles.msg.add.failure' => '添加配置文件失败',
			'pages.profiles.msg.update.success' => '配置文件更新成功',
			'pages.profiles.msg.update.successNamed' => ({required Object name}) => '"${name}" 更新成功',
			'pages.profiles.msg.update.failure' => '更新配置文件失败',
			'pages.profiles.msg.update.failureNamed' => ({required Object name}) => '更新 "${name}" 失败',
			'pages.profiles.msg.delete.success' => '配置文件删除成功',
			'pages.profileDetails.title' => '配置文件',
			'pages.profileDetails.lastUpdate' => '最后更新',
			'pages.profileDetails.form.nameHint' => '配置文件名称',
			'pages.profileDetails.form.emptyName' => '名称为必填项',
			'pages.profileDetails.form.invalidUrl' => '无效的 URL',
			'pages.profileDetails.form.urlHint' => '完整的配置 URL',
			'pages.profileDetails.form.disableAutoUpdate' => '禁用自动更新',
			'pages.profileDetails.form.autoUpdateInterval' => '自动更新间隔',
			'pages.profileDetails.form.loading' => '正在添加配置文件...',
			'pages.logs.title' => '日志',
			'pages.logs.shareCoreLogs' => '分享核心日志',
			'pages.logs.shareAppLogs' => '分享应用日志',
			'pages.about.title' => '关于',
			'pages.about.notAvailableMsg' => '已是最新版本',
			'pages.about.checkForUpdate' => '检查更新',
			'pages.about.openWorkingDir' => '打开工作目录',
			'pages.about.sourceCode' => '源代码',
			'pages.about.telegramChannel' => 'Telegram 频道',
			'pages.about.termsAndConditions' => '条款与条件',
			'pages.about.privacyPolicy' => '隐私政策',
			'pages.settings.title' => '设置',
			'pages.settings.resetTunnel' => '重置 VPN 配置文件',
			'pages.settings.resetTunnelSubtitle' => '重建本地隧道状态',
			'pages.settings.heroSubtitle' => '网络调优中心',
			'pages.settings.sectionOpenHint' => '点击打开',
			'pages.settings.options.import.clipboard' => '从剪贴板导入选项',
			'pages.settings.options.import.file' => '从文件导入选项',
			'pages.settings.options.export.anonymousToClipboard' => '复制匿名选项到剪贴板',
			'pages.settings.options.export.anonymousToFile' => '导出匿名选项到文件',
			'pages.settings.options.export.allToClipboard' => '复制所有选项到剪贴板',
			'pages.settings.options.export.allToFile' => '导出所有选项到文件',
			'pages.settings.options.reset' => '重置选项',
			'pages.settings.general.title' => '通用',
			'pages.settings.general.locale' => '语言',
			'pages.settings.general.themeMode' => '主题模式',
			'pages.settings.general.themeModes.system' => '跟随系统',
			'pages.settings.general.themeModes.dark' => '深色模式',
			'pages.settings.general.themeModes.light' => '浅色模式',
			'pages.settings.general.themeModes.black' => '纯黑模式',
			'pages.settings.general.enableAnalytics' => '启用分析',
			'pages.settings.general.enableAnalyticsMsg' => '允许收集分析数据和发送崩溃报告以改进应用',
			'pages.settings.general.autoIpCheck' => '自动检查连接 IP',
			'pages.settings.general.dynamicNotification' => '在通知中显示速度',
			'pages.settings.general.hapticFeedback' => '触觉反馈',
			'pages.settings.general.actionAtClosing' => '关闭时操作',
			'pages.settings.general.autoStart' => '开机自启',
			'pages.settings.general.silentStart' => '静默启动',
			'pages.settings.general.ignoreBatteryOptimizations' => '忽略电池优化',
			'pages.settings.general.ignoreBatteryOptimizationsMsg' => '移除限制以获得最佳 VPN 性能',
			'pages.settings.general.memoryLimit' => '内存限制',
			'pages.settings.general.memoryLimitMsg' => '如果您遇到内存不足错误或应用频繁崩溃，请启用此选项',
			'pages.settings.general.debugMode' => '调试模式',
			'pages.settings.general.debugModeMsg' => '重启应用以应用此更改',
			'pages.settings.general.logLevel' => '日志级别',
			'pages.settings.general.connectionTestUrl' => '连接测试 URL',
			'pages.settings.general.urlTestInterval' => 'URL 测试间隔',
			'pages.settings.general.clashApiPort' => 'Clash API 端口',
			'pages.settings.general.useXrayCoreWhenPossible' => '尽可能使用 xray-core',
			'pages.settings.general.useXrayCoreWhenPossibleMsg' => '解析订阅链接时使用 xray-core。您需要重新导入订阅链接才能启用此选项',
			'pages.settings.routing.title' => '路由',
			'pages.settings.routing.perAppProxy.title' => '分应用代理',
			'pages.settings.routing.perAppProxy.hideSysApps' => '隐藏系统应用',
			'pages.settings.routing.perAppProxy.options.import.clipboard' => '从剪贴板导入选择',
			'pages.settings.routing.perAppProxy.options.import.file' => '从文件导入选择',
			'pages.settings.routing.perAppProxy.options.import.msg' => '导入将替换您当前的选择。确定要继续吗？',
			'pages.settings.routing.perAppProxy.options.export.clipboard' => '复制选择到剪贴板',
			'pages.settings.routing.perAppProxy.options.export.file' => '导出选择到文件',
			'pages.settings.routing.perAppProxy.options.shareToAll' => '分享给所有人',
			'pages.settings.routing.perAppProxy.options.clearAllSelections' => '清除所有选择',
			'pages.settings.routing.perAppProxy.modes.all' => '全部',
			'pages.settings.routing.perAppProxy.modes.proxy' => '代理',
			'pages.settings.routing.perAppProxy.modes.bypass' => '绕过',
			'pages.settings.routing.perAppProxy.modes.allMsg' => '代理所有应用',
			'pages.settings.routing.perAppProxy.modes.proxyMsg' => '仅代理选定应用',
			'pages.settings.routing.perAppProxy.modes.bypassMsg' => '不代理选定应用',
			'pages.settings.routing.perAppProxy.autoSelection.title' => '自动选择',
			'pages.settings.routing.perAppProxy.autoSelection.performNow' => '立即执行',
			'pages.settings.routing.perAppProxy.autoSelection.resetToDefault' => '重置为默认',
			'pages.settings.routing.perAppProxy.autoSelection.autoUpdateInterval' => '自动更新间隔',
			'pages.settings.routing.perAppProxy.autoSelection.toast.success' => '自动选择应用成功完成',
			'pages.settings.routing.perAppProxy.autoSelection.toast.failure' => '自动选择失败',
			'pages.settings.routing.perAppProxy.autoSelection.toast.regionNotFound' => ({required Object region}) => '未找到 "${region}" 地区的自动选择',
			'pages.settings.routing.perAppProxy.autoSelection.toast.alreadyInAuto' => '您的选择已在自动列表中',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.title' => '自动选择应用',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.msg' => ({required Object region}) => '由于地区更改为 "${region}"，分应用代理的自动选择功能已被禁用',
			'pages.settings.routing.region' => '地区',
			'pages.settings.routing.regions.ir' => '伊朗 (ir)',
			'pages.settings.routing.regions.cn' => '中国 (cn)',
			'pages.settings.routing.regions.ru' => '俄罗斯 (ru)',
			'pages.settings.routing.regions.af' => '阿富汗 (af)',
			'pages.settings.routing.regions.id' => '印度尼西亚 (id)',
			'pages.settings.routing.regions.tr' => '土耳其 (tr)',
			'pages.settings.routing.regions.br' => '巴西 (br)',
			'pages.settings.routing.regions.other' => '其他',
			'pages.settings.routing.balancerStrategy.title' => 'Balancer 策略',
			'pages.settings.routing.balancerStrategy.roundRobin' => 'Round robin',
			'pages.settings.routing.balancerStrategy.consistentHash' => 'Consistent hash',
			'pages.settings.routing.balancerStrategy.stickySession' => 'Sticky session',
			'pages.settings.routing.blockAds' => '拦截广告',
			'pages.settings.routing.bypassLan' => '绕过局域网',
			'pages.settings.routing.resolveDestination' => '解析目的地',
			'pages.settings.routing.ipv6Route' => 'IPv6 路由',
			'pages.settings.routing.ipv6Modes.disable' => '禁用',
			'pages.settings.routing.ipv6Modes.enable' => '启用',
			'pages.settings.routing.ipv6Modes.prefer' => '首选',
			'pages.settings.routing.ipv6Modes.only' => '仅',
			'pages.settings.routing.routeRule.title' => '路由规则',
			'pages.settings.routing.routeRule.options.import.clipboard' => '从剪贴板导入规则',
			'pages.settings.routing.routeRule.options.import.file' => '从文件导入规则',
			'pages.settings.routing.routeRule.options.export.clipboard' => '复制规则到剪贴板',
			'pages.settings.routing.routeRule.options.export.file' => '保存规则到文件',
			'pages.settings.routing.routeRule.options.reset' => '重置规则',
			'pages.settings.routing.routeRule.deleteRule' => '删除规则',
			'pages.settings.routing.routeRule.createRule' => '创建新规则',
			'pages.settings.routing.routeRule.rule.title' => '规则',
			'pages.settings.routing.routeRule.rule.ruleChanged' => '规则已更改',
			'pages.settings.routing.routeRule.rule.ruleChangedMsg' => '您想保存您的编辑吗？',
			'pages.settings.routing.routeRule.rule.onlyTunMode' => '仅在 TUN 模式下可用',
			'pages.settings.routing.routeRule.rule.notAvailabeInThisPlatform' => '在此平台上不可用',
			'pages.settings.routing.routeRule.rule.canNotBeEmpty' => '不能为空',
			'pages.settings.routing.routeRule.rule.validUrlEx' => 'https://example.com',
			'pages.settings.routing.routeRule.rule.validUrl' => '有效的 "URL"，例如\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}',
			'pages.settings.routing.routeRule.rule.validProcessNameEx' => 'Chrome.exe 或 google chrome 或 chrome',
			'pages.settings.routing.routeRule.rule.validProcessName' => '有效的 "进程名"，例如\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}',
			'pages.settings.routing.routeRule.rule.validProcessPathEx' => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome',
			'pages.settings.routing.routeRule.rule.validProcessPath' => '有效的 "进程路径"，例如\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}',
			'pages.settings.routing.routeRule.rule.validPortRangeEx' => '80 或 1-65000',
			'pages.settings.routing.routeRule.rule.validPortRange' => '有效的 "端口" 或 "端口范围"，例如\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}',
			'pages.settings.routing.routeRule.rule.validIpCidrEx' => '8.8.8.8 或 10.0.0.0/24',
			'pages.settings.routing.routeRule.rule.validIpCidr' => '有效的 IP CIDR，例如\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}',
			'pages.settings.routing.routeRule.rule.validDomainEx' => 'Google.com 或 dl.google.com',
			'pages.settings.routing.routeRule.rule.validDomain' => '有效的 "域名"，例如\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}',
			'pages.settings.routing.routeRule.rule.validDomainSuffixEx' => '.com 或 .cn',
			'pages.settings.routing.routeRule.rule.validDomainSuffix' => '有效的 "域名后缀"，例如\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}',
			'pages.settings.routing.routeRule.rule.tileTitle.name' => '名称',
			'pages.settings.routing.routeRule.rule.tileTitle.outbound' => '匹配时出站',
			'pages.settings.routing.routeRule.rule.tileTitle.rule_set' => '规则集 URL',
			'pages.settings.routing.routeRule.rule.tileTitle.package_name' => '包名',
			'pages.settings.routing.routeRule.rule.tileTitle.process_name' => '进程名',
			'pages.settings.routing.routeRule.rule.tileTitle.process_path' => '进程路径',
			'pages.settings.routing.routeRule.rule.tileTitle.network' => '网络',
			'pages.settings.routing.routeRule.rule.tileTitle.port_range' => '目标端口',
			'pages.settings.routing.routeRule.rule.tileTitle.source_port_range' => '源端口',
			'pages.settings.routing.routeRule.rule.tileTitle.protocol' => '协议',
			'pages.settings.routing.routeRule.rule.tileTitle.ip_cidr' => '目标 IP CIDR',
			'pages.settings.routing.routeRule.rule.tileTitle.source_ip_cidr' => '源 IP CIDR',
			'pages.settings.routing.routeRule.rule.tileTitle.domain' => '域名',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_suffixe' => '域名后缀',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_keyword' => '域名关键词',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_regex' => '域名正则表达式',
			'pages.settings.routing.routeRule.rule.outbound.proxy' => '代理',
			'pages.settings.routing.routeRule.rule.outbound.direct' => '直连',
			'pages.settings.routing.routeRule.rule.outbound.direct_with_fragment' => '直连并分片',
			'pages.settings.routing.routeRule.rule.outbound.block' => '拦截',
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
			'pages.settings.routing.routeRule.genericList.addNew' => '添加新值',
			'pages.settings.routing.routeRule.genericList.update' => '更新值',
			'pages.settings.routing.routeRule.genericList.clearList' => '清空列表',
			'pages.settings.routing.routeRule.genericList.clearListMsg' => '所有项目已删除',
			'pages.settings.routing.routeRule.androidApps.pageTitle' => '安卓应用',
			'pages.settings.routing.routeRule.androidApps.showSystemApps' => '显示系统应用',
			'pages.settings.routing.routeRule.androidApps.hideSystemApps' => '隐藏系统应用',
			'pages.settings.routing.routeRule.androidApps.clearSelection' => '清除选择',
			'pages.settings.routing.routeRule.androidApps.uninstalled' => '已卸载',
			'pages.settings.dns.title' => 'DNS',
			'pages.settings.dns.remoteDns' => '远程 DNS',
			'pages.settings.dns.remoteDnsDomainStrategy' => '远程 DNS 域名策略',
			'pages.settings.dns.directDns' => '出站服务器解析器（直连）',
			'pages.settings.dns.directDnsDomainStrategy' => '出站域名策略',
			'pages.settings.dns.enableDnsRouting' => '启用 DNS 路由',
			'pages.settings.dns.enableFakeDns' => '启用伪造 DNS',
			'pages.settings.dns.domainStrategy.auto' => '自动',
			'pages.settings.dns.domainStrategy.preferIpv6' => '偏好 IPv6',
			'pages.settings.dns.domainStrategy.preferIpv4' => '偏好 IPv4',
			'pages.settings.dns.domainStrategy.ipv4Only' => '仅 IPv4',
			'pages.settings.dns.domainStrategy.ipv6Only' => '仅 IPv6',
			'pages.settings.inbound.title' => '入站',
			'pages.settings.inbound.serviceMode' => '服务模式',
			'pages.settings.inbound.serviceModes.proxy' => '仅代理服务',
			'pages.settings.inbound.serviceModes.systemProxy' => '设置系统代理',
			'pages.settings.inbound.serviceModes.tun' => 'VPN',
			'pages.settings.inbound.serviceModes.tunService' => 'VPN 服务',
			'pages.settings.inbound.shortServiceModes.proxy' => '代理',
			'pages.settings.inbound.shortServiceModes.systemProxy' => '系统代理',
			'pages.settings.inbound.shortServiceModes.tun' => 'VPN',
			'pages.settings.inbound.shortServiceModes.tunService' => 'VPN 服务',
			'pages.settings.inbound.strictRoute' => '严格路由',
			'pages.settings.inbound.tunImplementation' => 'TUN 实现',
			'pages.settings.inbound.tunImplementations.mixed' => '混合',
			'pages.settings.inbound.tunImplementations.system' => '系统',
			'pages.settings.inbound.tunImplementations.gvisor' => 'gVisor',
			'pages.settings.inbound.mixedPort' => '混合端口',
			'pages.settings.inbound.tproxyPort' => '透明代理端口',
			'pages.settings.inbound.directPort' => '本地 Direct 端口',
			'pages.settings.inbound.redirectPort' => '重定向端口',
			'pages.settings.inbound.allowConnectionFromLan' => '允许来自局域网的连接',
			'pages.settings.tlsTricks.title' => 'TLS 技巧',
			'pages.settings.tlsTricks.enable' => '启用分片',
			'pages.settings.tlsTricks.packets' => '分片数据包',
			'pages.settings.tlsTricks.packetsTlsHello' => 'TLS Hello',
			'pages.settings.tlsTricks.packets1_1' => '1-1',
			'pages.settings.tlsTricks.packets1_2' => '1-2',
			'pages.settings.tlsTricks.packets1_3' => '1-3',
			'pages.settings.tlsTricks.packets1_4' => '1-4',
			'pages.settings.tlsTricks.packets1_5' => '1-5',
			'pages.settings.tlsTricks.size' => '分片大小',
			'pages.settings.tlsTricks.sleep' => '分片延迟',
			'pages.settings.tlsTricks.mixedSniCase.enable' => '启用混合大小写 SNI',
			'pages.settings.tlsTricks.padding.enable' => '启用填充',
			'pages.settings.tlsTricks.padding.size' => '填充大小',
			'pages.settings.warp.title' => 'WARP',
			'pages.settings.warp.enable' => '启用 WARP',
			'pages.settings.warp.generateConfig' => '生成 WARP 配置',
			'pages.settings.warp.configGenerated' => 'WARP 配置已生成',
			'pages.settings.warp.missingConfig' => 'WARP 配置缺失',
			'pages.settings.warp.detourMode' => 'WARP 路由模式',
			'pages.settings.warp.detourModes.proxyOverWarp' => '通过 WARP 路由代理',
			'pages.settings.warp.detourModes.warpOverProxy' => '通过代理路由 WARP',
			'pages.settings.warp.detourModes.proxyOverWarpExplain' => '通过 WARP 解锁代理',
			'pages.settings.warp.detourModes.warpOverProxyExplain' => '通过 WARP 增强安全性',
			'pages.settings.warp.licenseKey' => '许可证密钥',
			'pages.settings.warp.cleanIp' => '优选 IP',
			'pages.settings.warp.port' => '端口',
			'pages.settings.warp.noise.count' => '噪声数量',
			'pages.settings.warp.noise.mode' => '噪声模式',
			'pages.settings.warp.noise.size' => '噪声大小',
			'pages.settings.warp.noise.delay' => '噪声延迟',
			'components.stats.connection' => '连接',
			'components.stats.traffic' => '流量',
			'components.stats.trafficLive' => '实时流量',
			'components.stats.trafficTotal' => '总流量',
			'components.stats.uplink' => '上传',
			'components.stats.downlink' => '下载',
			'components.stats.speed' => '速度',
			'components.stats.totalTransferred' => '总传输量',
			'components.subscriptionInfo.upload' => '上传',
			'components.subscriptionInfo.download' => '下载',
			'components.subscriptionInfo.total' => '总流量',
			'components.subscriptionInfo.expireDate' => '到期日期',
			'components.subscriptionInfo.expired' => '已过期',
			'components.subscriptionInfo.noTraffic' => '流量已用尽',
			'components.subscriptionInfo.remainingTime' => '剩余时间',
			'components.subscriptionInfo.remainingDuration' => ({required Object duration}) => '剩余 ${duration} 天',
			'components.subscriptionInfo.remainingDurationNew' => ({required Object duration}) => '${duration} 天',
			'components.subscriptionInfo.remainingTrafficSemanticLabel' => ({required Object consumed, required Object total}) => '已使用 ${consumed} / ${total} 流量',
			'components.subscriptionInfo.remainingTraffic' => '剩余流量',
			'components.subscriptionInfo.remainingUsage' => '剩余',
			'components.subscriptionInfo.profileSite' => '提供商',
			'components.subscriptionInfo.profileSupport' => '支持',
			'dialogs.sortProfiles.title' => '排序方式',
			'dialogs.sortProfiles.sort.name' => '按字母顺序',
			'dialogs.sortProfiles.sort.lastUpdate' => '最近更新',
			'dialogs.warpLicense.title' => 'Cloudflare WARP 同意书',
			'dialogs.warpLicense.description' => ({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [ const TextSpan(text: 'Cloudflare WARP 是一个免费的 WireGuard VPN 提供商。启用此选项即表示您同意 Cloudflare WARP 的 '), tos('服务条款'), const TextSpan(text: ' 和 '), privacy('隐私政策'), const TextSpan(text: '。'), ]), 
			'dialogs.newVersion.title' => '有可用更新',
			'dialogs.newVersion.msg' => '${_root.common.appTitle} 的新版本已发布。您想现在更新吗？',
			'dialogs.newVersion.currentVersion' => '当前版本：',
			'dialogs.newVersion.newVersion' => '新版本：',
			'dialogs.newVersion.updateNow' => '立即更新',
			'dialogs.confirmation.settings.import.msg' => '这将用提供的值覆盖所有配置选项。您确定吗？',
			'dialogs.confirmation.profile.delete.title' => '删除配置文件',
			'dialogs.confirmation.profile.delete.msg' => '您确定要永久删除此配置文件吗？',
			'dialogs.confirmation.perAppProxy.shareOnGithub.title' => '改进自动选择',
			'dialogs.confirmation.perAppProxy.shareOnGithub.msg' => '通过分享您选择的应用，可以帮助完善“自动选择”列表',
			'dialogs.confirmation.perAppProxy.import.msg' => '这将替换您当前所有的分应用代理选择。您确定要继续吗？',
			'dialogs.confirmation.routeRule.delete.title' => '删除规则',
			'dialogs.confirmation.routeRule.delete.msg' => ({required Object rulename}) => '您确定要删除规则 "${rulename}" 吗？',
			'dialogs.experimentalNotice.title' => '正在使用实验性功能',
			'dialogs.experimentalNotice.msg' => '您已启用了一些实验性功能，这可能会影响连接质量并导致意外错误。您可以随时在配置选项页面更改或重置这些选项。',
			'dialogs.experimentalNotice.disable' => '不再显示',
			'dialogs.noActiveProfile.title' => '选择一个配置文件',
			'dialogs.noActiveProfile.msg' => '让我们从添加一个包含您 VPN 连接详细信息的配置文件开始。\n\n还没有 VPN 服务器？别担心，按照下面的教程，您可以快速免费地设置一个。',
			'dialogs.noActiveProfile.helpBtn.label' => '告诉我如何操作',
			'dialogs.noActiveProfile.helpBtn.url' => 'https://github.com/shulaiyun/Sloth-VPN.git',
			'dialogs.unknownDomainsWarning.title' => '外部链接警告',
			'dialogs.unknownDomainsWarning.youAreAboutToVisit' => '您即将访问：',
			'dialogs.unknownDomainsWarning.thisWebsiteIsNotInOurTrustedList' => '此网站不在我们的信任列表中。请谨慎操作。',
			'dialogs.proxyInfo.fullTag' => '完整标签：',
			'dialogs.proxyInfo.type' => '类型：',
			'dialogs.proxyInfo.testTime' => '测试时间：',
			'dialogs.proxyInfo.testDelay' => '测试延迟：',
			'dialogs.proxyInfo.isSelected' => '已选择：',
			'dialogs.proxyInfo.isGroup' => '是组',
			'dialogs.proxyInfo.isSecure' => '安全：',
			'dialogs.proxyInfo.port' => '端口：',
			'dialogs.proxyInfo.host' => '主机：',
			'dialogs.proxyInfo.ip' => 'IP：',
			'dialogs.proxyInfo.countryCode' => '国家代码：',
			'dialogs.proxyInfo.region' => '地区：',
			'dialogs.proxyInfo.city' => '城市：',
			'dialogs.proxyInfo.asn' => 'ASN：',
			'dialogs.proxyInfo.organization' => '组织：',
			'dialogs.proxyInfo.location' => '位置：',
			'dialogs.proxyInfo.postalCode' => '邮政编码：',
			'dialogs.windowClosing.askEachTime' => '每次询问',
			'dialogs.windowClosing.alertMessage' => '隐藏还是退出应用程序？',
			'dialogs.windowClosing.remember' => '记住我的选择',
			'connection.tapToConnect' => '点击连接',
			'connection.connect' => '连接',
			'connection.connecting' => '连接中...',
			'connection.connected' => '已连接',
			'connection.disconnect' => '断开连接',
			'connection.disconnecting' => '断开连接中...',
			'connection.reconnect' => '重新连接',
			'connection.reconnectMsg' => '正在重新连接以应用更改...',
			'connection.secure' => '由 WARP 保护',
			'errors.unexpected' => '意外错误',
			'errors.connection.unexpected' => '意外连接错误',
			'errors.connection.timeout' => '连接超时',
			'errors.connection.badResponse' => '响应错误',
			'errors.connection.connectionError' => '连接错误',
			'errors.connection.badCertificate' => '证书无效',
			'errors.profiles.unexpected' => '意外错误',
			'errors.profiles.notFound' => '未找到配置文件',
			'errors.profiles.invalidConfig' => '配置无效',
			'errors.profiles.invalidUrl' => 'URL 无效',
			'errors.profiles.canceledByUser' => '用户已取消',
			'errors.connectivity.unexpected' => '意外失败',
			'errors.connectivity.missingVpnPermission' => '缺少 VPN 权限',
			'errors.connectivity.missingNotificationPermission' => '缺少通知权限',
			'errors.connectivity.core' => '核心错误',
			'errors.singbox.serviceNotRunning' => '服务未运行',
			'errors.singbox.missingPrivilege' => '缺少权限',
			'errors.singbox.missingPrivilegeMsg' => 'VPN 模式需要管理员权限。请以管理员身份重新启动应用，或更改服务模式。',
			'errors.singbox.invalidConfigOptions' => '配置选项无效',
			'errors.singbox.invalidConfig' => '配置无效',
			'errors.warp.missingLicense' => 'WARP 许可证缺失',
			'errors.warp.missingLicenseMsg' => '所选配置文件使用 WARP 功能；要使用此功能，必须同意 WARP 许可证。',
			_ => null,
		};
	}
}

