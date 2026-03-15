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
class TranslationsRu extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonRu common = TranslationsCommonRu._(_root);
	@override late final TranslationsIntroRu intro = TranslationsIntroRu._(_root);
	@override late final TranslationsPagesRu pages = TranslationsPagesRu._(_root);
	@override late final TranslationsComponentsRu components = TranslationsComponentsRu._(_root);
	@override late final TranslationsDialogsRu dialogs = TranslationsDialogsRu._(_root);
	@override late final TranslationsConnectionRu connection = TranslationsConnectionRu._(_root);
	@override late final TranslationsErrorsRu errors = TranslationsErrorsRu._(_root);
}

// Path: common
class TranslationsCommonRu extends TranslationsCommonEn {
	TranslationsCommonRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get appTitle => '树懒VPN';
	@override String get start => '袧邪褔邪褌褜';
	@override String get version => '袙械褉褋懈褟';
	@override String get ok => 'OK';
	@override String get cancel => '袨褌屑械薪邪';
	@override String get kContinue => '袩褉芯写芯谢卸懈褌褜';
	@override String get showMore => '袩芯泻邪蟹邪褌褜 斜芯谢褜褕械';
	@override String get showLess => '袩芯泻邪蟹邪褌褜 屑械薪褜褕械';
	@override String get filter => '肖懈谢褜褌褉';
	@override String get all => '袙褋械';
	@override String get pause => '袩邪褍蟹邪';
	@override String get resume => '袙芯蟹芯斜薪芯胁懈褌褜';
	@override String get clear => '袨褔懈褋褌懈褌褜';
	@override String get close => '袟邪泻褉褘褌褜';
	@override String get auto => '袗胁褌芯';
	@override String get manually => '袙褉褍褔薪褍褞';
	@override String get name => '袠屑褟';
	@override String get url => 'URL';
	@override String get add => '袛芯斜邪胁懈褌褜';
	@override String get clipboard => '袘褍褎械褉 芯斜屑械薪邪';
	@override String get addToClipboard => '袛芯斜邪胁懈褌褜 胁 斜褍褎械褉 芯斜屑械薪邪';
	@override String get scanQr => '小泻邪薪懈褉芯胁邪褌褜 QR';
	@override String get free => '袘械褋锌谢邪褌薪芯';
	@override String get warp => 'WARP';
	@override String get fragment => '肖褉邪谐屑械薪褌';
	@override String get help => '小锌褉邪胁泻邪';
	@override String get save => '小芯褏褉邪薪懈褌褜';
	@override String get update => '袨斜薪芯胁懈褌褜';
	@override String get share => '袩芯写械谢懈褌褜褋褟';
	@override String get edit => '袠蟹屑械薪懈褌褜';
	@override String get delete => '校写邪谢懈褌褜';
	@override String get discard => '袨褌屑械薪懈褌褜';
	@override String get import => '袠屑锌芯褉褌';
	@override String get export => '协泻褋锌芯褉褌';
	@override String get later => '袩芯蟹卸械';
	@override String get ignore => '袠谐薪芯褉懈褉芯胁邪褌褜';
	@override String get quit => '袙褘褏芯写';
	@override String get notSet => '袧械 蟹邪写邪薪芯';
	@override String get hide => '小泻褉褘褌褜';
	@override String get exit => '袙褘泄褌懈';
	@override String get reset => '小斜褉芯褋';
	@override String get done => '袚芯褌芯胁芯';
	@override String get search => '袩芯懈褋泻';
	@override String get decline => '袨褌泻谢芯薪懈褌褜';
	@override String get agree => '小芯谐谢邪褋械薪';
	@override String get empty => '袩褍褋褌芯';
	@override String get unknown => '袧械懈蟹胁械褋褌薪芯';
	@override String get hidden => '小泻褉褘褌褘泄';
	@override String get timeout => '孝邪泄屑-邪褍褌';
	@override String get sort => '小芯褉褌懈褉芯胁邪褌褜';
	@override String get dashboard => '袩邪薪械谢褜 褍锌褉邪胁谢械薪懈褟';
	@override late final TranslationsCommonIntervalRu interval = TranslationsCommonIntervalRu._(_root);
	@override late final TranslationsCommonMsgRu msg = TranslationsCommonMsgRu._(_root);
}

// Path: intro
class TranslationsIntroRu extends TranslationsIntroEn {
	TranslationsIntroRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get banner => '袙褋械, 褔褌芯 胁邪屑 薪褍卸薪芯 写谢褟 懈薪褌械褉薪械褌邪 斜械蟹 芯谐褉邪薪懈褔械薪懈泄';
	@override TextSpan termsAndPolicyCaution({required InlineSpanBuilder tap}) => TextSpan(children: [
		const TextSpan(text: '袩褉芯写芯谢卸邪褟, 胁褘 褋芯谐谢邪褕邪械褌械褋褜 褋 '),
		tap(_root.pages.about.termsAndConditions),
	]);
	@override TextSpan info({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [
		const TextSpan(text: '小写械谢邪薪芯 褋 鉂わ笍 Hiddify - '),
		tap_source('袨褌泻褉褘褌褘泄 懈褋褏芯写薪褘泄 泻芯写'),
		const TextSpan(text: ' ('),
		tap_license('袥懈褑械薪蟹懈褟'),
		const TextSpan(text: ')'),
	]);
}

// Path: pages
class TranslationsPagesRu extends TranslationsPagesEn {
	TranslationsPagesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesHomeRu home = TranslationsPagesHomeRu._(_root);
	@override late final TranslationsPagesProxiesRu proxies = TranslationsPagesProxiesRu._(_root);
	@override late final TranslationsPagesProfilesRu profiles = TranslationsPagesProfilesRu._(_root);
	@override late final TranslationsPagesProfileDetailsRu profileDetails = TranslationsPagesProfileDetailsRu._(_root);
	@override late final TranslationsPagesLogsRu logs = TranslationsPagesLogsRu._(_root);
	@override late final TranslationsPagesAboutRu about = TranslationsPagesAboutRu._(_root);
	@override late final TranslationsPagesSettingsRu settings = TranslationsPagesSettingsRu._(_root);
}

// Path: components
class TranslationsComponentsRu extends TranslationsComponentsEn {
	TranslationsComponentsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsComponentsStatsRu stats = TranslationsComponentsStatsRu._(_root);
	@override late final TranslationsComponentsSubscriptionInfoRu subscriptionInfo = TranslationsComponentsSubscriptionInfoRu._(_root);
}

// Path: dialogs
class TranslationsDialogsRu extends TranslationsDialogsEn {
	TranslationsDialogsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsSortProfilesRu sortProfiles = TranslationsDialogsSortProfilesRu._(_root);
	@override late final TranslationsDialogsWarpLicenseRu warpLicense = TranslationsDialogsWarpLicenseRu._(_root);
	@override late final TranslationsDialogsNewVersionRu newVersion = TranslationsDialogsNewVersionRu._(_root);
	@override late final TranslationsDialogsConfirmationRu confirmation = TranslationsDialogsConfirmationRu._(_root);
	@override late final TranslationsDialogsExperimentalNoticeRu experimentalNotice = TranslationsDialogsExperimentalNoticeRu._(_root);
	@override late final TranslationsDialogsNoActiveProfileRu noActiveProfile = TranslationsDialogsNoActiveProfileRu._(_root);
	@override late final TranslationsDialogsUnknownDomainsWarningRu unknownDomainsWarning = TranslationsDialogsUnknownDomainsWarningRu._(_root);
	@override late final TranslationsDialogsProxyInfoRu proxyInfo = TranslationsDialogsProxyInfoRu._(_root);
	@override late final TranslationsDialogsWindowClosingRu windowClosing = TranslationsDialogsWindowClosingRu._(_root);
}

// Path: connection
class TranslationsConnectionRu extends TranslationsConnectionEn {
	TranslationsConnectionRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get tapToConnect => '袧邪卸屑懈褌械 写谢褟 锌芯写泻谢褞褔械薪懈褟';
	@override String get connect => '袩芯写泻谢褞褔懈褌褜';
	@override String get connecting => '袩芯写泻谢褞褔械薪懈械...';
	@override String get connected => '袩芯写泻谢褞褔械薪芯';
	@override String get disconnect => '袨褌泻谢褞褔懈褌褜';
	@override String get disconnecting => '袨褌泻谢褞褔械薪懈械...';
	@override String get reconnect => '袩械褉械锌芯写泻谢褞褔懈褌褜';
	@override String get reconnectMsg => '袩械褉械锌芯写泻谢褞褔械薪懈械 写谢褟 褍褔械褌邪 懈蟹屑械薪械薪懈泄...';
	@override String get secure => '袟邪褖懈褖械薪芯 褋 锌芯屑芯褖褜褞 WARP';
}

// Path: errors
class TranslationsErrorsRu extends TranslationsErrorsEn {
	TranslationsErrorsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '袧械锌褉械写胁懈写械薪薪邪褟 芯褕懈斜泻邪';
	@override late final TranslationsErrorsConnectionRu connection = TranslationsErrorsConnectionRu._(_root);
	@override late final TranslationsErrorsProfilesRu profiles = TranslationsErrorsProfilesRu._(_root);
	@override late final TranslationsErrorsConnectivityRu connectivity = TranslationsErrorsConnectivityRu._(_root);
	@override late final TranslationsErrorsSingboxRu singbox = TranslationsErrorsSingboxRu._(_root);
	@override late final TranslationsErrorsWarpRu warp = TranslationsErrorsWarpRu._(_root);
}

// Path: common.interval
class TranslationsCommonIntervalRu extends TranslationsCommonIntervalEn {
	TranslationsCommonIntervalRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		zero: '',
		one: '${n} 写械薪褜',
		few: '${n} 写薪褟',
		many: '${n} 写薪械泄',
		other: '${n} 写薪褟',
	);
	@override String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n,
		zero: '',
		one: '${n} 褔邪褋',
		few: '${n} 褔邪褋邪',
		many: '${n} 褔邪褋芯胁',
		other: '${n} 褔邪褋邪',
	);
}

// Path: common.msg
class TranslationsCommonMsgRu extends TranslationsCommonMsgEn {
	TranslationsCommonMsgRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgPermissionRu permission = TranslationsCommonMsgPermissionRu._(_root);
	@override late final TranslationsCommonMsgExportRu export = TranslationsCommonMsgExportRu._(_root);
	@override late final TranslationsCommonMsgImportRu import = TranslationsCommonMsgImportRu._(_root);
}

// Path: pages.home
class TranslationsPagesHomeRu extends TranslationsPagesHomeEn {
	TranslationsPagesHomeRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袚谢邪胁薪邪褟';
	@override String get quickSettings => '袘褘褋褌褉褘械 薪邪褋褌褉芯泄泻懈';
}

// Path: pages.proxies
class TranslationsPagesProxiesRu extends TranslationsPagesProxiesEn {
	TranslationsPagesProxiesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袩褉芯泻褋懈';
	@override String get sort => '小芯褉褌懈褉芯胁邪褌褜 锌褉芯泻褋懈';
	@override String get testDelay => '袩褉芯胁械褉懈褌褜 蟹邪写械褉卸泻褍';
	@override String get empty => '袧械褌 写芯褋褌褍锌薪褘褏 锌褉芯泻褋懈';
	@override String get activeProxy => '袗泻褌懈胁薪褘泄 锌褉芯泻褋懈';
	@override String get unknownIp => '袧械懈蟹胁械褋褌薪褘泄 IP';
	@override late final TranslationsPagesProxiesSortOptionsRu sortOptions = TranslationsPagesProxiesSortOptionsRu._(_root);
	@override late final TranslationsPagesProxiesIpInfoRu ipInfo = TranslationsPagesProxiesIpInfoRu._(_root);
	@override late final TranslationsPagesProxiesDelayRu delay = TranslationsPagesProxiesDelayRu._(_root);
}

// Path: pages.profiles
class TranslationsPagesProfilesRu extends TranslationsPagesProfilesEn {
	TranslationsPagesProfilesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袩褉芯褎懈谢懈';
	@override String get add => '袛芯斜邪胁懈褌褜 锌褉芯褎懈谢褜';
	@override String get update => '袨斜薪芯胁懈褌褜 锌褉芯褎懈谢褜';
	@override String get viewAllProfiles => '袩芯褋屑芯褌褉械褌褜 胁褋械 锌褉芯褎懈谢懈';
	@override String activeProfileName({required Object name}) => '袠屑褟 邪泻褌懈胁薪芯谐芯 锌褉芯褎懈谢褟: "${name}".';
	@override String nonActiveProfileName({required Object name}) => '袙褘斜褉邪褌褜 "${name}" 泻邪泻 邪泻褌懈胁薪褘泄 锌褉芯褎懈谢褜';
	@override String get freeSubNotFound => '袘械褋锌谢邪褌薪邪褟 锌芯写锌懈褋泻邪 薪械 薪邪泄写械薪邪';
	@override String freeSubNotFoundForRegion({required Object region}) => '袘械褋锌谢邪褌薪邪褟 锌芯写锌懈褋泻邪 写谢褟 褉械谐懈芯薪邪 "${region}" 薪械 薪邪泄写械薪邪';
	@override String get failedToLoad => '袧械 褍写邪谢芯褋褜 蟹邪谐褉褍蟹懈褌褜';
	@override String get updateSubscriptions => '袨斜薪芯胁懈褌褜 锌芯写锌懈褋泻懈';
	@override late final TranslationsPagesProfilesShareRu share = TranslationsPagesProfilesShareRu._(_root);
	@override late final TranslationsPagesProfilesMsgRu msg = TranslationsPagesProfilesMsgRu._(_root);
}

// Path: pages.profileDetails
class TranslationsPagesProfileDetailsRu extends TranslationsPagesProfileDetailsEn {
	TranslationsPagesProfileDetailsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袩褉芯褎懈谢褜';
	@override String get lastUpdate => '袩芯褋谢械写薪械械 芯斜薪芯胁谢械薪懈械';
	@override late final TranslationsPagesProfileDetailsFormRu form = TranslationsPagesProfileDetailsFormRu._(_root);
}

// Path: pages.logs
class TranslationsPagesLogsRu extends TranslationsPagesLogsEn {
	TranslationsPagesLogsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袥芯谐懈';
	@override String get shareCoreLogs => '袩芯写械谢懈褌褜褋褟 谢芯谐邪屑懈 褟写褉邪';
	@override String get shareAppLogs => '袩芯写械谢懈褌褜褋褟 谢芯谐邪屑懈 锌褉懈谢芯卸械薪懈褟';
}

// Path: pages.about
class TranslationsPagesAboutRu extends TranslationsPagesAboutEn {
	TranslationsPagesAboutRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袨 锌褉芯谐褉邪屑屑械';
	@override String get notAvailableMsg => '袙褘 褍卸械 懈褋锌芯谢褜蟹褍械褌械 锌芯褋谢械写薪褞褞 胁械褉褋懈褞';
	@override String get checkForUpdate => '袩褉芯胁械褉懈褌褜 芯斜薪芯胁谢械薪懈褟';
	@override String get openWorkingDir => '袨褌泻褉褘褌褜 褉邪斜芯褔褍褞 锌邪锌泻褍';
	@override String get sourceCode => '袠褋褏芯写薪褘泄 泻芯写';
	@override String get telegramChannel => '袣邪薪邪谢 胁 Telegram';
	@override String get termsAndConditions => '校褋谢芯胁懈褟 懈褋锌芯谢褜蟹芯胁邪薪懈褟';
	@override String get privacyPolicy => '袩芯谢懈褌懈泻邪 泻芯薪褎懈写械薪褑懈邪谢褜薪芯褋褌懈';
}

// Path: pages.settings
class TranslationsPagesSettingsRu extends TranslationsPagesSettingsEn {
	TranslationsPagesSettingsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袧邪褋褌褉芯泄泻懈';
	@override String get resetTunnel => '小斜褉芯褋懈褌褜 锌褉芯褎懈谢褜 VPN';
	@override late final TranslationsPagesSettingsOptionsRu options = TranslationsPagesSettingsOptionsRu._(_root);
	@override late final TranslationsPagesSettingsGeneralRu general = TranslationsPagesSettingsGeneralRu._(_root);
	@override late final TranslationsPagesSettingsRoutingRu routing = TranslationsPagesSettingsRoutingRu._(_root);
	@override late final TranslationsPagesSettingsDnsRu dns = TranslationsPagesSettingsDnsRu._(_root);
	@override late final TranslationsPagesSettingsInboundRu inbound = TranslationsPagesSettingsInboundRu._(_root);
	@override late final TranslationsPagesSettingsTlsTricksRu tlsTricks = TranslationsPagesSettingsTlsTricksRu._(_root);
	@override late final TranslationsPagesSettingsWarpRu warp = TranslationsPagesSettingsWarpRu._(_root);
}

// Path: components.stats
class TranslationsComponentsStatsRu extends TranslationsComponentsStatsEn {
	TranslationsComponentsStatsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get connection => '小芯械写懈薪械薪懈械';
	@override String get traffic => '孝褉邪褎懈泻';
	@override String get trafficLive => '孝械泻褍褖懈泄 褌褉邪褎懈泻';
	@override String get trafficTotal => '袨斜褖懈泄 褌褉邪褎懈泻';
	@override String get uplink => '袨褌锌褉邪胁泻邪';
	@override String get downlink => '袩褉懈械屑';
	@override String get speed => '小泻芯褉芯褋褌褜';
	@override String get totalTransferred => '袙褋械谐芯 锌械褉械写邪薪芯';
}

// Path: components.subscriptionInfo
class TranslationsComponentsSubscriptionInfoRu extends TranslationsComponentsSubscriptionInfoEn {
	TranslationsComponentsSubscriptionInfoRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get upload => '袨褌锌褉邪胁谢械薪芯';
	@override String get download => '袩芯谢褍褔械薪芯';
	@override String get total => '袙褋械谐芯 褌褉邪褎懈泻邪';
	@override String get expireDate => '袛邪褌邪 芯泻芯薪褔邪薪懈褟';
	@override String get expired => '袠褋褌械泻';
	@override String get noTraffic => '袣胁芯褌邪 懈褋褔械褉锌邪薪邪';
	@override String get remainingTime => '袨褋褌邪胁褕械械褋褟 胁褉械屑褟';
	@override String remainingDuration({required Object duration}) => '芯褋褌邪谢芯褋褜 ${duration} 写薪械泄';
	@override String remainingDurationNew({required Object duration}) => '${duration} 写薪械泄';
	@override String remainingTrafficSemanticLabel({required Object consumed, required Object total}) => '懈蟹褉邪褋褏芯写芯胁邪薪芯 ${consumed} 懈蟹 ${total} 褌褉邪褎懈泻邪';
	@override String get remainingTraffic => '袨褋褌邪胁褕懈泄褋褟 褌褉邪褎懈泻';
	@override String get remainingUsage => '袨褋褌邪谢芯褋褜';
	@override String get profileSite => '袩褉芯胁邪泄写械褉';
	@override String get profileSupport => '袩芯写写械褉卸泻邪';
}

// Path: dialogs.sortProfiles
class TranslationsDialogsSortProfilesRu extends TranslationsDialogsSortProfilesEn {
	TranslationsDialogsSortProfilesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '小芯褉褌懈褉芯胁邪褌褜 锌芯';
	@override late final TranslationsDialogsSortProfilesSortRu sort = TranslationsDialogsSortProfilesSortRu._(_root);
}

// Path: dialogs.warpLicense
class TranslationsDialogsWarpLicenseRu extends TranslationsDialogsWarpLicenseEn {
	TranslationsDialogsWarpLicenseRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '小芯谐谢邪褕械薪懈械 芯 WARP 芯褌 Cloudflare';
	@override TextSpan description({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [
		const TextSpan(text: 'Cloudflare WARP - 褝褌芯 斜械褋锌谢邪褌薪褘泄 锌褉芯胁邪泄写械褉 WireGuard VPN. 袙泻谢褞褔邪褟 褝褌褍 芯锌褑懈褞, 胁褘 褋芯谐谢邪褕邪械褌械褋褜 褋 '),
		tos('校褋谢芯胁懈褟屑懈 芯斜褋谢褍卸懈胁邪薪懈褟'),
		const TextSpan(text: ' 懈 '),
		privacy('袩芯谢懈褌懈泻芯泄 泻芯薪褎懈写械薪褑懈邪谢褜薪芯褋褌懈'),
		const TextSpan(text: ' Cloudflare WARP.'),
	]);
}

// Path: dialogs.newVersion
class TranslationsDialogsNewVersionRu extends TranslationsDialogsNewVersionEn {
	TranslationsDialogsNewVersionRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袛芯褋褌褍锌薪芯 芯斜薪芯胁谢械薪懈械';
	@override String get msg => '袛芯褋褌褍锌薪邪 薪芯胁邪褟 胁械褉褋懈褟 ${_root.common.appTitle}. 啸芯褌懈褌械 芯斜薪芯胁懈褌褜 褋械泄褔邪褋?';
	@override String get currentVersion => '孝械泻褍褖邪褟 胁械褉褋懈褟: ';
	@override String get newVersion => '袧芯胁邪褟 胁械褉褋懈褟: ';
	@override String get updateNow => '袨斜薪芯胁懈褌褜 褋械泄褔邪褋';
}

// Path: dialogs.confirmation
class TranslationsDialogsConfirmationRu extends TranslationsDialogsConfirmationEn {
	TranslationsDialogsConfirmationRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsRu settings = TranslationsDialogsConfirmationSettingsRu._(_root);
	@override late final TranslationsDialogsConfirmationProfileRu profile = TranslationsDialogsConfirmationProfileRu._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyRu perAppProxy = TranslationsDialogsConfirmationPerAppProxyRu._(_root);
	@override late final TranslationsDialogsConfirmationRouteRuleRu routeRule = TranslationsDialogsConfirmationRouteRuleRu._(_root);
}

// Path: dialogs.experimentalNotice
class TranslationsDialogsExperimentalNoticeRu extends TranslationsDialogsExperimentalNoticeEn {
	TranslationsDialogsExperimentalNoticeRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袠褋锌芯谢褜蟹褍褞褌褋褟 褝泻褋锌械褉懈屑械薪褌邪谢褜薪褘械 褎褍薪泻褑懈懈';
	@override String get msg => '袙褘 胁泻谢褞褔懈谢懈 薪械泻芯褌芯褉褘械 褝泻褋锌械褉懈屑械薪褌邪谢褜薪褘械 褎褍薪泻褑懈懈, 泻芯褌芯褉褘械 屑芯谐褍褌 锌芯胁谢懈褟褌褜 薪邪 泻邪褔械褋褌胁芯 褋芯械写懈薪械薪懈褟 懈 胁褘蟹胁邪褌褜 薪械锌褉械写胁懈写械薪薪褘械 芯褕懈斜泻懈. 袙褘 胁褋械谐写邪 屑芯卸械褌械 懈蟹屑械薪懈褌褜 懈谢懈 褋斜褉芯褋懈褌褜 褝褌懈 锌邪褉邪屑械褌褉褘 薪邪 褋褌褉邪薪懈褑械 薪邪褋褌褉芯械泻.';
	@override String get disable => '袘芯谢褜褕械 薪械 锌芯泻邪蟹褘胁邪褌褜';
}

// Path: dialogs.noActiveProfile
class TranslationsDialogsNoActiveProfileRu extends TranslationsDialogsNoActiveProfileEn {
	TranslationsDialogsNoActiveProfileRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袙褘斜械褉懈褌械 锌褉芯褎懈谢褜';
	@override String get msg => '袛邪胁邪泄褌械 薪邪褔薪械屑 褋 写芯斜邪胁谢械薪懈褟 锌褉芯褎懈谢褟 锌芯写泻谢褞褔械薪懈褟, 泻芯褌芯褉褘泄 褋芯写械褉卸懈褌 写邪薪薪褘械 胁邪褕械谐芯 VPN-褋芯械写懈薪械薪懈褟.\n\n袝褖械 薪械褌 VPN-褋械褉胁械褉邪? 袧械 斜械褋锌芯泻芯泄褌械褋褜 鈥?锌褉芯褋褌芯 褋谢械写褍泄褌械 褉褍泻芯胁芯写褋褌胁褍 薪懈卸械, 褔褌芯斜褘 斜褘褋褌褉芯 懈 斜械褋锌谢邪褌薪芯 薪邪褋褌褉芯懈褌褜 械谐芯.';
	@override late final TranslationsDialogsNoActiveProfileHelpBtnRu helpBtn = TranslationsDialogsNoActiveProfileHelpBtnRu._(_root);
}

// Path: dialogs.unknownDomainsWarning
class TranslationsDialogsUnknownDomainsWarningRu extends TranslationsDialogsUnknownDomainsWarningEn {
	TranslationsDialogsUnknownDomainsWarningRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袩褉械写褍锌褉械卸写械薪懈械 芯 胁薪械褕薪械泄 褋褋褘谢泻械';
	@override String get youAreAboutToVisit => '袙褘 褋芯斜懈褉邪械褌械褋褜 锌械褉械泄褌懈 薪邪 褋邪泄褌:';
	@override String get thisWebsiteIsNotInOurTrustedList => '协褌芯褌 褋邪泄褌 薪械 胁褏芯写懈褌 胁 薪邪褕 褋锌懈褋芯泻 写芯胁械褉械薪薪褘褏. 袩芯卸邪谢褍泄褋褌邪, 写械泄褋褌胁褍泄褌械 褋 芯褋褌芯褉芯卸薪芯褋褌褜褞.';
}

// Path: dialogs.proxyInfo
class TranslationsDialogsProxyInfoRu extends TranslationsDialogsProxyInfoEn {
	TranslationsDialogsProxyInfoRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get fullTag => '袩芯谢薪褘泄 褌械谐:';
	@override String get type => '孝懈锌:';
	@override String get testTime => '袙褉械屑褟 褌械褋褌邪:';
	@override String get testDelay => '袟邪写械褉卸泻邪 褌械褋褌邪:';
	@override String get isSelected => '袙褘斜褉邪薪:';
	@override String get isGroup => '协褌芯 谐褉褍锌锌邪';
	@override String get isSecure => '袟邪褖懈褖械薪芯:';
	@override String get port => '袩芯褉褌:';
	@override String get host => '啸芯褋褌:';
	@override String get ip => 'IP:';
	@override String get countryCode => '袣芯写 褋褌褉邪薪褘:';
	@override String get region => '袪械谐懈芯薪:';
	@override String get city => '袚芯褉芯写:';
	@override String get asn => 'ASN:';
	@override String get organization => '袨褉谐邪薪懈蟹邪褑懈褟:';
	@override String get location => '袦械褋褌芯锌芯谢芯卸械薪懈械:';
	@override String get postalCode => '袩芯褔褌芯胁褘泄 懈薪写械泻褋:';
}

// Path: dialogs.windowClosing
class TranslationsDialogsWindowClosingRu extends TranslationsDialogsWindowClosingEn {
	TranslationsDialogsWindowClosingRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get askEachTime => '小锌褉邪褕懈胁邪褌褜 泻邪卸写褘泄 褉邪蟹';
	@override String get alertMessage => '小泻褉褘褌褜 懈谢懈 胁褘泄褌懈 懈蟹 锌褉懈谢芯卸械薪懈褟?';
	@override String get remember => '袟邪锌芯屑薪懈褌褜 屑芯泄 胁褘斜芯褉';
}

// Path: errors.connection
class TranslationsErrorsConnectionRu extends TranslationsErrorsConnectionEn {
	TranslationsErrorsConnectionRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '袧械锌褉械写胁懈写械薪薪邪褟 芯褕懈斜泻邪 锌芯写泻谢褞褔械薪懈褟';
	@override String get timeout => '孝邪泄屑-邪褍褌 锌芯写泻谢褞褔械薪懈褟';
	@override String get badResponse => '袧械胁械褉薪褘泄 芯褌胁械褌';
	@override String get connectionError => '袨褕懈斜泻邪 锌芯写泻谢褞褔械薪懈褟';
	@override String get badCertificate => '袧械写械泄褋褌胁懈褌械谢褜薪褘泄 褋械褉褌懈褎懈泻邪褌';
}

// Path: errors.profiles
class TranslationsErrorsProfilesRu extends TranslationsErrorsProfilesEn {
	TranslationsErrorsProfilesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '袧械锌褉械写胁懈写械薪薪邪褟 芯褕懈斜泻邪';
	@override String get notFound => '袩褉芯褎懈谢褜 薪械 薪邪泄写械薪';
	@override String get invalidConfig => '袧械胁械褉薪邪褟 泻芯薪褎懈谐褍褉邪褑懈褟';
	@override String get invalidUrl => '袧械胁械褉薪褘泄 URL';
	@override String get canceledByUser => '袨褌屑械薪械薪芯 锌芯谢褜蟹芯胁邪褌械谢械屑';
}

// Path: errors.connectivity
class TranslationsErrorsConnectivityRu extends TranslationsErrorsConnectivityEn {
	TranslationsErrorsConnectivityRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '袧械锌褉械写胁懈写械薪薪褘泄 褋斜芯泄';
	@override String get missingVpnPermission => '袨褌褋褍褌褋褌胁褍械褌 褉邪蟹褉械褕械薪懈械 薪邪 VPN';
	@override String get missingNotificationPermission => '袨褌褋褍褌褋褌胁褍械褌 褉邪蟹褉械褕械薪懈械 薪邪 褍胁械写芯屑谢械薪懈褟';
	@override String get core => '袨褕懈斜泻邪 褟写褉邪';
}

// Path: errors.singbox
class TranslationsErrorsSingboxRu extends TranslationsErrorsSingboxEn {
	TranslationsErrorsSingboxRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get serviceNotRunning => '小谢褍卸斜邪 薪械 蟹邪锌褍褖械薪邪';
	@override String get missingPrivilege => '袨褌褋褍褌褋褌胁褍褞褌 锌褉邪胁邪';
	@override String get missingPrivilegeMsg => '袪械卸懈屑 VPN 褌褉械斜褍械褌 锌褉邪胁 邪写屑懈薪懈褋褌褉邪褌芯褉邪. 袥懈斜芯 锌械褉械蟹邪锌褍褋褌懈褌械 锌褉懈谢芯卸械薪懈械 芯褌 懈屑械薪懈 邪写屑懈薪懈褋褌褉邪褌芯褉邪, 谢懈斜芯 懈蟹屑械薪懈褌械 褉械卸懈屑 褋谢褍卸斜褘.';
	@override String get invalidConfigOptions => '袧械胁械褉薪褘械 锌邪褉邪屑械褌褉褘 泻芯薪褎懈谐褍褉邪褑懈懈';
	@override String get invalidConfig => '袧械胁械褉薪邪褟 泻芯薪褎懈谐褍褉邪褑懈褟';
}

// Path: errors.warp
class TranslationsErrorsWarpRu extends TranslationsErrorsWarpEn {
	TranslationsErrorsWarpRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get missingLicense => '袨褌褋褍褌褋褌胁褍械褌 谢懈褑械薪蟹懈褟 Warp';
	@override String get missingLicenseMsg => '袙褘斜褉邪薪薪褘泄 锌褉芯褎懈谢褜 懈褋锌芯谢褜蟹褍械褌 褎褍薪泻褑懈褞 WARP; 写谢褟 懈褋锌芯谢褜蟹芯胁邪薪懈褟 褝褌芯泄 褎褍薪泻褑懈懈 薪械芯斜褏芯写懈屑芯 锌褉懈薪褟褌褜 谢懈褑械薪蟹懈褞 WARP.';
}

// Path: common.msg.permission
class TranslationsCommonMsgPermissionRu extends TranslationsCommonMsgPermissionEn {
	TranslationsCommonMsgPermissionRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get denied => '袛芯褋褌褍锌 蟹邪锌褉械褖械薪';
}

// Path: common.msg.export
class TranslationsCommonMsgExportRu extends TranslationsCommonMsgExportEn {
	TranslationsCommonMsgExportRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgExportClipboardRu clipboard = TranslationsCommonMsgExportClipboardRu._(_root);
	@override late final TranslationsCommonMsgExportFileRu file = TranslationsCommonMsgExportFileRu._(_root);
}

// Path: common.msg.import
class TranslationsCommonMsgImportRu extends TranslationsCommonMsgImportEn {
	TranslationsCommonMsgImportRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get confirm => '袩芯写褌胁械褉写懈褌褜 懈屑锌芯褉褌';
	@override String get success => '校褋锌械褕薪芯 懈屑锌芯褉褌懈褉芯胁邪薪芯';
	@override String get failure => '袧械 褍写邪谢芯褋褜 懈屑锌芯褉褌懈褉芯胁邪褌褜';
}

// Path: pages.proxies.sortOptions
class TranslationsPagesProxiesSortOptionsRu extends TranslationsPagesProxiesSortOptionsEn {
	TranslationsPagesProxiesSortOptionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unsorted => '袩芯 褍屑芯谢褔邪薪懈褞';
	@override String get name => '袩芯 邪谢褎邪胁懈褌褍';
	@override String get delay => '袩芯 蟹邪写械褉卸泻械';
}

// Path: pages.proxies.ipInfo
class TranslationsPagesProxiesIpInfoRu extends TranslationsPagesProxiesIpInfoEn {
	TranslationsPagesProxiesIpInfoRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get address => 'IP-邪写褉械褋';
	@override String get country => '小褌褉邪薪邪';
	@override String get organization => '袨褉谐邪薪懈蟹邪褑懈褟';
}

// Path: pages.proxies.delay
class TranslationsPagesProxiesDelayRu extends TranslationsPagesProxiesDelayEn {
	TranslationsPagesProxiesDelayRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String result({required Object delay}) => '袟邪写械褉卸泻邪: ${delay} 屑褋';
	@override String get timeout => '孝邪泄屑-邪褍褌 褌械褋褌邪 蟹邪写械褉卸泻懈';
	@override String get testing => '袟邪写械褉卸泻邪: 褌械褋褌懈褉芯胁邪薪懈械...';
}

// Path: pages.profiles.share
class TranslationsPagesProfilesShareRu extends TranslationsPagesProfilesShareEn {
	TranslationsPagesProfilesShareRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get urlToClipboard => 'URL 胁 斜褍褎械褉 芯斜屑械薪邪';
	@override String get showUrlQr => '袩芯泻邪蟹邪褌褜 QR-泻芯写 URL';
	@override String get jsonToClipboard => 'JSON 胁 斜褍褎械褉 芯斜屑械薪邪';
}

// Path: pages.profiles.msg
class TranslationsPagesProfilesMsgRu extends TranslationsPagesProfilesMsgEn {
	TranslationsPagesProfilesMsgRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesProfilesMsgSaveRu save = TranslationsPagesProfilesMsgSaveRu._(_root);
	@override String get invalidUrl => '袧械胁械褉薪褘泄 URL';
	@override late final TranslationsPagesProfilesMsgAddRu add = TranslationsPagesProfilesMsgAddRu._(_root);
	@override late final TranslationsPagesProfilesMsgUpdateRu update = TranslationsPagesProfilesMsgUpdateRu._(_root);
	@override late final TranslationsPagesProfilesMsgDeleteRu delete = TranslationsPagesProfilesMsgDeleteRu._(_root);
}

// Path: pages.profileDetails.form
class TranslationsPagesProfileDetailsFormRu extends TranslationsPagesProfileDetailsFormEn {
	TranslationsPagesProfileDetailsFormRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get nameHint => '袠屑褟 锌褉芯褎懈谢褟';
	@override String get emptyName => '袠屑褟 芯斜褟蟹邪褌械谢褜薪芯 写谢褟 蟹邪锌芯谢薪械薪懈褟';
	@override String get invalidUrl => '袧械胁械褉薪褘泄 URL';
	@override String get urlHint => '袩芯谢薪褘泄 URL 泻芯薪褎懈谐褍褉邪褑懈懈';
	@override String get disableAutoUpdate => '袨褌泻谢褞褔懈褌褜 邪胁褌芯芯斜薪芯胁谢械薪懈械';
	@override String get autoUpdateInterval => '袠薪褌械褉胁邪谢 邪胁褌芯芯斜薪芯胁谢械薪懈褟';
	@override String get loading => '袛芯斜邪胁谢械薪懈械 锌褉芯褎懈谢褟...';
}

// Path: pages.settings.options
class TranslationsPagesSettingsOptionsRu extends TranslationsPagesSettingsOptionsEn {
	TranslationsPagesSettingsOptionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsOptionsImportRu import = TranslationsPagesSettingsOptionsImportRu._(_root);
	@override late final TranslationsPagesSettingsOptionsExportRu export = TranslationsPagesSettingsOptionsExportRu._(_root);
	@override String get reset => '小斜褉芯褋懈褌褜 薪邪褋褌褉芯泄泻懈';
}

// Path: pages.settings.general
class TranslationsPagesSettingsGeneralRu extends TranslationsPagesSettingsGeneralEn {
	TranslationsPagesSettingsGeneralRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袨斜褖懈械';
	@override String get locale => '携蟹褘泻';
	@override String get themeMode => '孝械屑邪 芯褎芯褉屑谢械薪懈褟';
	@override late final TranslationsPagesSettingsGeneralThemeModesRu themeModes = TranslationsPagesSettingsGeneralThemeModesRu._(_root);
	@override String get enableAnalytics => '袙泻谢褞褔懈褌褜 邪薪邪谢懈褌懈泻褍';
	@override String get enableAnalyticsMsg => '袪邪蟹褉械褕懈褌褜 褋斜芯褉 邪薪邪谢懈褌懈泻懈 懈 芯褌锌褉邪胁泻褍 芯褌褔械褌芯胁 芯 褋斜芯褟褏 写谢褟 褍谢褍褔褕械薪懈褟 锌褉懈谢芯卸械薪懈褟';
	@override String get autoIpCheck => '袗胁褌芯屑邪褌懈褔械褋泻懈 锌褉芯胁械褉褟褌褜 IP-邪写褉械褋';
	@override String get dynamicNotification => '袨褌芯斜褉邪卸邪褌褜 褋泻芯褉芯褋褌褜 胁 褍胁械写芯屑谢械薪懈懈';
	@override String get hapticFeedback => '孝邪泻褌懈谢褜薪褘泄 芯褌泻谢懈泻';
	@override String get actionAtClosing => '袛械泄褋褌胁懈械 锌褉懈 蟹邪泻褉褘褌懈懈';
	@override String get autoStart => '袟邪锌褍褋泻邪褌褜 锌褉懈 胁褏芯写械 胁 褋懈褋褌械屑褍';
	@override String get silentStart => '袟邪锌褍褋泻邪褌褜 褋胁械褉薪褍褌褘屑';
	@override String get ignoreBatteryOptimizations => '袨褌泻谢褞褔懈褌褜 芯锌褌懈屑懈蟹邪褑懈褞 斜邪褌邪褉械懈';
	@override String get ignoreBatteryOptimizationsMsg => '小薪褟褌褜 芯谐褉邪薪懈褔械薪懈褟 写谢褟 芯锌褌懈屑邪谢褜薪芯泄 褉邪斜芯褌褘 VPN';
	@override String get memoryLimit => '袨谐褉邪薪懈褔械薪懈械 锌邪屑褟褌懈';
	@override String get memoryLimitMsg => '袙泻谢褞褔懈褌械, 械褋谢懈 胁褘 褋褌邪谢泻懈胁邪械褌械褋褜 褋 芯褕懈斜泻邪屑懈 薪械褏胁邪褌泻懈 锌邪屑褟褌懈 懈谢懈 褔邪褋褌褘屑懈 褋斜芯褟屑懈 锌褉懈谢芯卸械薪懈褟';
	@override String get debugMode => '袪械卸懈屑 芯褌谢邪写泻懈';
	@override String get debugModeMsg => '袩械褉械蟹邪锌褍褋褌懈褌械 锌褉懈谢芯卸械薪懈械, 褔褌芯斜褘 锌褉懈屑械薪懈褌褜 褝褌芯 懈蟹屑械薪械薪懈械';
	@override String get logLevel => '校褉芯胁械薪褜 谢芯谐懈褉芯胁邪薪懈褟';
	@override String get connectionTestUrl => 'URL 写谢褟 褌械褋褌邪 褋芯械写懈薪械薪懈褟';
	@override String get urlTestInterval => '袠薪褌械褉胁邪谢 褌械褋褌邪 URL';
	@override String get clashApiPort => '袩芯褉褌 Clash API';
	@override String get useXrayCoreWhenPossible => '袠褋锌芯谢褜蟹芯胁邪褌褜 xray-core, 械褋谢懈 胁芯蟹屑芯卸薪芯';
	@override String get useXrayCoreWhenPossibleMsg => '袠褋锌芯谢褜蟹芯胁邪褌褜 xray-core 锌褉懈 芯斜褉邪斜芯褌泻械 褋褋褘谢芯泻 薪邪 锌芯写锌懈褋泻褍. 袧械芯斜褏芯写懈屑芯 锌芯胁褌芯褉薪芯 懈屑锌芯褉褌懈褉芯胁邪褌褜 褋褋褘谢泻褍, 褔褌芯斜褘 胁泻谢褞褔懈褌褜 褝褌褍 芯锌褑懈褞.';
}

// Path: pages.settings.routing
class TranslationsPagesSettingsRoutingRu extends TranslationsPagesSettingsRoutingEn {
	TranslationsPagesSettingsRoutingRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袦邪褉褕褉褍褌懈蟹邪褑懈褟';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyRu perAppProxy = TranslationsPagesSettingsRoutingPerAppProxyRu._(_root);
	@override String get region => '袪械谐懈芯薪';
	@override late final TranslationsPagesSettingsRoutingRegionsRu regions = TranslationsPagesSettingsRoutingRegionsRu._(_root);
	@override late final TranslationsPagesSettingsRoutingBalancerStrategyRu balancerStrategy = TranslationsPagesSettingsRoutingBalancerStrategyRu._(_root);
	@override String get blockAds => '袘谢芯泻懈褉芯胁邪褌褜 褉械泻谢邪屑褍';
	@override String get bypassLan => '袨斜褏芯写 LAN';
	@override String get resolveDestination => '袨锌褉械写械谢褟褌褜 邪写褉械褋 薪邪蟹薪邪褔械薪懈褟';
	@override String get ipv6Route => '袦邪褉褕褉褍褌 IPv6';
	@override late final TranslationsPagesSettingsRoutingIpv6ModesRu ipv6Modes = TranslationsPagesSettingsRoutingIpv6ModesRu._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleRu routeRule = TranslationsPagesSettingsRoutingRouteRuleRu._(_root);
}

// Path: pages.settings.dns
class TranslationsPagesSettingsDnsRu extends TranslationsPagesSettingsDnsEn {
	TranslationsPagesSettingsDnsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'DNS';
	@override String get remoteDns => '校写邪谢械薪薪褘泄 DNS';
	@override String get remoteDnsDomainStrategy => '小褌褉邪褌械谐懈褟 写芯屑械薪邪 褍写邪谢械薪薪芯谐芯 DNS';
	@override String get directDns => '袪邪褋锌芯蟹薪邪胁邪褌械谢褜 懈褋褏芯写褟褖械谐芯 褋械褉胁械褉邪 (薪邪锌褉褟屑褍褞)';
	@override String get directDnsDomainStrategy => '小褌褉邪褌械谐懈褟 懈褋褏芯写褟褖械谐芯 写芯屑械薪邪';
	@override String get enableDnsRouting => '袙泻谢褞褔懈褌褜 屑邪褉褕褉褍褌懈蟹邪褑懈褞 DNS';
	@override String get enableFakeDns => '袙泻谢褞褔懈褌褜 锌芯写写械谢褜薪褘泄 DNS';
	@override late final TranslationsPagesSettingsDnsDomainStrategyRu domainStrategy = TranslationsPagesSettingsDnsDomainStrategyRu._(_root);
}

// Path: pages.settings.inbound
class TranslationsPagesSettingsInboundRu extends TranslationsPagesSettingsInboundEn {
	TranslationsPagesSettingsInboundRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袙褏芯写褟褖懈械';
	@override String get serviceMode => '袪械卸懈屑 褋谢褍卸斜褘';
	@override late final TranslationsPagesSettingsInboundServiceModesRu serviceModes = TranslationsPagesSettingsInboundServiceModesRu._(_root);
	@override late final TranslationsPagesSettingsInboundShortServiceModesRu shortServiceModes = TranslationsPagesSettingsInboundShortServiceModesRu._(_root);
	@override String get strictRoute => '小褌褉芯谐邪褟 屑邪褉褕褉褍褌懈蟹邪褑懈褟';
	@override String get tunImplementation => '袪械邪谢懈蟹邪褑懈褟 TUN';
	@override late final TranslationsPagesSettingsInboundTunImplementationsRu tunImplementations = TranslationsPagesSettingsInboundTunImplementationsRu._(_root);
	@override String get mixedPort => '小屑械褕邪薪薪褘泄 锌芯褉褌';
	@override String get tproxyPort => '袩芯褉褌 锌褉芯蟹褉邪褔薪芯谐芯 锌褉芯泻褋懈';
	@override String get directPort => '袥芯泻邪谢褜薪褘泄 锌芯褉褌 direct';
	@override String get redirectPort => '袩芯褉褌 锌械褉械薪邪锌褉邪胁谢械薪懈褟';
	@override String get allowConnectionFromLan => '袩芯写械谢懈褌褜褋褟 VPN 胁 谢芯泻邪谢褜薪芯泄 褋械褌懈';
}

// Path: pages.settings.tlsTricks
class TranslationsPagesSettingsTlsTricksRu extends TranslationsPagesSettingsTlsTricksEn {
	TranslationsPagesSettingsTlsTricksRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '孝褉褞泻懈 TLS';
	@override String get enable => '袙泻谢褞褔懈褌褜 褎褉邪谐屑械薪褌邪褑懈褞';
	@override String get packets => '袩邪泻械褌褘 褎褉邪谐屑械薪褌邪褑懈懈';
	@override String get packetsTlsHello => 'TLS Hello';
	@override String get packets1_1 => '1-1';
	@override String get packets1_2 => '1-2';
	@override String get packets1_3 => '1-3';
	@override String get packets1_4 => '1-4';
	@override String get packets1_5 => '1-5';
	@override String get size => '袪邪蟹屑械褉 褎褉邪谐屑械薪褌邪';
	@override String get sleep => '袟邪写械褉卸泻邪 褎褉邪谐屑械薪褌邪';
	@override late final TranslationsPagesSettingsTlsTricksMixedSniCaseRu mixedSniCase = TranslationsPagesSettingsTlsTricksMixedSniCaseRu._(_root);
	@override late final TranslationsPagesSettingsTlsTricksPaddingRu padding = TranslationsPagesSettingsTlsTricksPaddingRu._(_root);
}

// Path: pages.settings.warp
class TranslationsPagesSettingsWarpRu extends TranslationsPagesSettingsWarpEn {
	TranslationsPagesSettingsWarpRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'WARP';
	@override String get enable => '袙泻谢褞褔懈褌褜 WARP';
	@override String get generateConfig => '小谐械薪械褉懈褉芯胁邪褌褜 泻芯薪褎懈谐褍褉邪褑懈褞 WARP';
	@override String get configGenerated => '袣芯薪褎懈谐褍褉邪褑懈褟 Warp 褋谐械薪械褉懈褉芯胁邪薪邪';
	@override String get missingConfig => '袨褌褋褍褌褋褌胁褍械褌 泻芯薪褎懈谐褍褉邪褑懈褟 WARP';
	@override String get detourMode => '袪械卸懈屑 屑邪褉褕褉褍褌懈蟹邪褑懈懈 WARP';
	@override late final TranslationsPagesSettingsWarpDetourModesRu detourModes = TranslationsPagesSettingsWarpDetourModesRu._(_root);
	@override String get licenseKey => '袥懈褑械薪蟹懈芯薪薪褘泄 泻谢褞褔';
	@override String get cleanIp => '效懈褋褌褘泄 IP';
	@override String get port => '袩芯褉褌';
	@override late final TranslationsPagesSettingsWarpNoiseRu noise = TranslationsPagesSettingsWarpNoiseRu._(_root);
}

// Path: dialogs.sortProfiles.sort
class TranslationsDialogsSortProfilesSortRu extends TranslationsDialogsSortProfilesSortEn {
	TranslationsDialogsSortProfilesSortRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get name => '袩芯 邪谢褎邪胁懈褌褍';
	@override String get lastUpdate => '袩芯褋谢械写薪械屑褍 芯斜薪芯胁谢械薪懈褞';
}

// Path: dialogs.confirmation.settings
class TranslationsDialogsConfirmationSettingsRu extends TranslationsDialogsConfirmationSettingsEn {
	TranslationsDialogsConfirmationSettingsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsImportRu import = TranslationsDialogsConfirmationSettingsImportRu._(_root);
}

// Path: dialogs.confirmation.profile
class TranslationsDialogsConfirmationProfileRu extends TranslationsDialogsConfirmationProfileEn {
	TranslationsDialogsConfirmationProfileRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationProfileDeleteRu delete = TranslationsDialogsConfirmationProfileDeleteRu._(_root);
}

// Path: dialogs.confirmation.perAppProxy
class TranslationsDialogsConfirmationPerAppProxyRu extends TranslationsDialogsConfirmationPerAppProxyEn {
	TranslationsDialogsConfirmationPerAppProxyRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationPerAppProxyShareOnGithubRu shareOnGithub = TranslationsDialogsConfirmationPerAppProxyShareOnGithubRu._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyImportRu import = TranslationsDialogsConfirmationPerAppProxyImportRu._(_root);
}

// Path: dialogs.confirmation.routeRule
class TranslationsDialogsConfirmationRouteRuleRu extends TranslationsDialogsConfirmationRouteRuleEn {
	TranslationsDialogsConfirmationRouteRuleRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationRouteRuleDeleteRu delete = TranslationsDialogsConfirmationRouteRuleDeleteRu._(_root);
}

// Path: dialogs.noActiveProfile.helpBtn
class TranslationsDialogsNoActiveProfileHelpBtnRu extends TranslationsDialogsNoActiveProfileHelpBtnEn {
	TranslationsDialogsNoActiveProfileHelpBtnRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get label => '袩芯泻邪卸懈褌械, 泻邪泻';
	@override String get url => 'https://github.com/shulaiyun/Sloth-VPN.git';
}

// Path: common.msg.export.clipboard
class TranslationsCommonMsgExportClipboardRu extends TranslationsCommonMsgExportClipboardEn {
	TranslationsCommonMsgExportClipboardRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get success => '校褋锌械褕薪芯 写芯斜邪胁谢械薪芯 胁 斜褍褎械褉 芯斜屑械薪邪';
	@override String get failure => '袧械 褍写邪谢芯褋褜 褋泻芯锌懈褉芯胁邪褌褜 胁 斜褍褎械褉 芯斜屑械薪邪';
	@override String get contentTooLarge => '小谢懈褕泻芯屑 斜芯谢褜褕芯泄 泻芯薪褌械薪褌. 袠褋锌芯谢褜蟹褍泄褌械 褝泻褋锌芯褉褌 胁 褎邪泄谢';
}

// Path: common.msg.export.file
class TranslationsCommonMsgExportFileRu extends TranslationsCommonMsgExportFileEn {
	TranslationsCommonMsgExportFileRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get success => '肖邪泄谢 JSON 褍褋锌械褕薪芯 褋芯蟹写邪薪';
	@override String get failure => '袧械 褍写邪谢芯褋褜 褋芯蟹写邪褌褜 褎邪泄谢';
}

// Path: pages.profiles.msg.save
class TranslationsPagesProfilesMsgSaveRu extends TranslationsPagesProfilesMsgSaveEn {
	TranslationsPagesProfilesMsgSaveRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get success => '袩褉芯褎懈谢褜 褍褋锌械褕薪芯 褋芯褏褉邪薪械薪';
}

// Path: pages.profiles.msg.add
class TranslationsPagesProfilesMsgAddRu extends TranslationsPagesProfilesMsgAddEn {
	TranslationsPagesProfilesMsgAddRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get failure => '袧械 褍写邪谢芯褋褜 写芯斜邪胁懈褌褜 锌褉芯褎懈谢褜';
}

// Path: pages.profiles.msg.update
class TranslationsPagesProfilesMsgUpdateRu extends TranslationsPagesProfilesMsgUpdateEn {
	TranslationsPagesProfilesMsgUpdateRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get success => '袩褉芯褎懈谢褜 褍褋锌械褕薪芯 芯斜薪芯胁谢械薪';
	@override String successNamed({required Object name}) => '"${name}" 褍褋锌械褕薪芯 芯斜薪芯胁谢械薪';
	@override String get failure => '袧械 褍写邪谢芯褋褜 芯斜薪芯胁懈褌褜 锌褉芯褎懈谢褜';
	@override String failureNamed({required Object name}) => '袧械 褍写邪谢芯褋褜 芯斜薪芯胁懈褌褜 "${name}"';
}

// Path: pages.profiles.msg.delete
class TranslationsPagesProfilesMsgDeleteRu extends TranslationsPagesProfilesMsgDeleteEn {
	TranslationsPagesProfilesMsgDeleteRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get success => '袩褉芯褎懈谢褜 褍褋锌械褕薪芯 褍写邪谢械薪';
}

// Path: pages.settings.options.import
class TranslationsPagesSettingsOptionsImportRu extends TranslationsPagesSettingsOptionsImportEn {
	TranslationsPagesSettingsOptionsImportRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '袠屑锌芯褉褌懈褉芯胁邪褌褜 薪邪褋褌褉芯泄泻懈 懈蟹 斜褍褎械褉邪 芯斜屑械薪邪';
	@override String get file => '袠屑锌芯褉褌懈褉芯胁邪褌褜 薪邪褋褌褉芯泄泻懈 懈蟹 褎邪泄谢邪';
}

// Path: pages.settings.options.export
class TranslationsPagesSettingsOptionsExportRu extends TranslationsPagesSettingsOptionsExportEn {
	TranslationsPagesSettingsOptionsExportRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get anonymousToClipboard => '袣芯锌懈褉芯胁邪褌褜 邪薪芯薪懈屑薪褘械 薪邪褋褌褉芯泄泻懈 胁 斜褍褎械褉 芯斜屑械薪邪';
	@override String get anonymousToFile => '协泻褋锌芯褉褌懈褉芯胁邪褌褜 邪薪芯薪懈屑薪褘械 薪邪褋褌褉芯泄泻懈 胁 褎邪泄谢';
	@override String get allToClipboard => '袣芯锌懈褉芯胁邪褌褜 胁褋械 薪邪褋褌褉芯泄泻懈 胁 斜褍褎械褉 芯斜屑械薪邪';
	@override String get allToFile => '协泻褋锌芯褉褌懈褉芯胁邪褌褜 胁褋械 薪邪褋褌褉芯泄泻懈 胁 褎邪泄谢';
}

// Path: pages.settings.general.themeModes
class TranslationsPagesSettingsGeneralThemeModesRu extends TranslationsPagesSettingsGeneralThemeModesEn {
	TranslationsPagesSettingsGeneralThemeModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get system => '小懈褋褌械屑薪邪褟';
	@override String get dark => '孝械屑薪邪褟';
	@override String get light => '小胁械褌谢邪褟';
	@override String get black => '效械褉薪邪褟';
}

// Path: pages.settings.routing.perAppProxy
class TranslationsPagesSettingsRoutingPerAppProxyRu extends TranslationsPagesSettingsRoutingPerAppProxyEn {
	TranslationsPagesSettingsRoutingPerAppProxyRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袩褉芯泻褋懈 写谢褟 锌褉懈谢芯卸械薪懈泄';
	@override String get hideSysApps => '小泻褉褘褌褜 褋懈褋褌械屑薪褘械 锌褉懈谢芯卸械薪懈褟';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsRu options = TranslationsPagesSettingsRoutingPerAppProxyOptionsRu._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyModesRu modes = TranslationsPagesSettingsRoutingPerAppProxyModesRu._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionRu autoSelection = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionRu._(_root);
}

// Path: pages.settings.routing.regions
class TranslationsPagesSettingsRoutingRegionsRu extends TranslationsPagesSettingsRoutingRegionsEn {
	TranslationsPagesSettingsRoutingRegionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get ir => '袠褉邪薪 (ir)';
	@override String get cn => '袣懈褌邪泄 (cn)';
	@override String get ru => '袪芯褋褋懈褟 (ru)';
	@override String get af => '袗褎谐邪薪懈褋褌邪薪 (af)';
	@override String get id => '袠薪写芯薪械蟹懈褟 (id)';
	@override String get tr => '孝褍褉褑懈褟 (tr)';
	@override String get br => '袘褉邪蟹懈谢懈褟 (br)';
	@override String get other => '袛褉褍谐芯泄';
}

// Path: pages.settings.routing.balancerStrategy
class TranslationsPagesSettingsRoutingBalancerStrategyRu extends TranslationsPagesSettingsRoutingBalancerStrategyEn {
	TranslationsPagesSettingsRoutingBalancerStrategyRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '小褌褉邪褌械谐懈褟 Balancer';
	@override String get roundRobin => 'Round robin';
	@override String get consistentHash => 'Consistent hash';
	@override String get stickySession => 'Sticky session';
}

// Path: pages.settings.routing.ipv6Modes
class TranslationsPagesSettingsRoutingIpv6ModesRu extends TranslationsPagesSettingsRoutingIpv6ModesEn {
	TranslationsPagesSettingsRoutingIpv6ModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get disable => '袨褌泻谢褞褔懈褌褜';
	@override String get enable => '袙泻谢褞褔懈褌褜';
	@override String get prefer => '袩褉械写锌芯褔褌懈褌械谢褜薪芯';
	@override String get only => '孝芯谢褜泻芯';
}

// Path: pages.settings.routing.routeRule
class TranslationsPagesSettingsRoutingRouteRuleRu extends TranslationsPagesSettingsRoutingRouteRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袩褉邪胁懈谢邪 屑邪褉褕褉褍褌懈蟹邪褑懈懈';
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsRu options = TranslationsPagesSettingsRoutingRouteRuleOptionsRu._(_root);
	@override String get deleteRule => '校写邪谢懈褌褜 锌褉邪胁懈谢芯';
	@override String get createRule => '小芯蟹写邪褌褜 薪芯胁芯械 锌褉邪胁懈谢芯';
	@override late final TranslationsPagesSettingsRoutingRouteRuleRuleRu rule = TranslationsPagesSettingsRoutingRouteRuleRuleRu._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleGenericListRu genericList = TranslationsPagesSettingsRoutingRouteRuleGenericListRu._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleAndroidAppsRu androidApps = TranslationsPagesSettingsRoutingRouteRuleAndroidAppsRu._(_root);
}

// Path: pages.settings.dns.domainStrategy
class TranslationsPagesSettingsDnsDomainStrategyRu extends TranslationsPagesSettingsDnsDomainStrategyEn {
	TranslationsPagesSettingsDnsDomainStrategyRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get auto => '袗胁褌芯';
	@override String get preferIpv6 => '袩褉械写锌芯褔懈褌邪褌褜 IPv6';
	@override String get preferIpv4 => '袩褉械写锌芯褔懈褌邪褌褜 IPv4';
	@override String get ipv4Only => '孝芯谢褜泻芯 IPv4';
	@override String get ipv6Only => '孝芯谢褜泻芯 IPv6';
}

// Path: pages.settings.inbound.serviceModes
class TranslationsPagesSettingsInboundServiceModesRu extends TranslationsPagesSettingsInboundServiceModesEn {
	TranslationsPagesSettingsInboundServiceModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get proxy => '孝芯谢褜泻芯 锌褉芯泻褋懈-褋谢褍卸斜邪';
	@override String get systemProxy => '校褋褌邪薪芯胁懈褌褜 褋懈褋褌械屑薪褘泄 锌褉芯泻褋懈';
	@override String get tun => 'VPN';
	@override String get tunService => '小谢褍卸斜邪 VPN';
}

// Path: pages.settings.inbound.shortServiceModes
class TranslationsPagesSettingsInboundShortServiceModesRu extends TranslationsPagesSettingsInboundShortServiceModesEn {
	TranslationsPagesSettingsInboundShortServiceModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get proxy => '袩褉芯泻褋懈';
	@override String get systemProxy => '小懈褋褌械屑薪褘泄 锌褉芯泻褋懈';
	@override String get tun => 'VPN';
	@override String get tunService => '小谢褍卸斜邪 VPN';
}

// Path: pages.settings.inbound.tunImplementations
class TranslationsPagesSettingsInboundTunImplementationsRu extends TranslationsPagesSettingsInboundTunImplementationsEn {
	TranslationsPagesSettingsInboundTunImplementationsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get mixed => '小屑械褕邪薪薪邪褟';
	@override String get system => '小懈褋褌械屑薪邪褟';
	@override String get gvisor => 'gVisor';
}

// Path: pages.settings.tlsTricks.mixedSniCase
class TranslationsPagesSettingsTlsTricksMixedSniCaseRu extends TranslationsPagesSettingsTlsTricksMixedSniCaseEn {
	TranslationsPagesSettingsTlsTricksMixedSniCaseRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get enable => '袙泻谢褞褔懈褌褜 褋屑械褕邪薪薪褘泄 褉械谐懈褋褌褉 SNI';
}

// Path: pages.settings.tlsTricks.padding
class TranslationsPagesSettingsTlsTricksPaddingRu extends TranslationsPagesSettingsTlsTricksPaddingEn {
	TranslationsPagesSettingsTlsTricksPaddingRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get enable => '袙泻谢褞褔懈褌褜 写芯锌芯谢薪械薪懈械';
	@override String get size => '袪邪蟹屑械褉 写芯锌芯谢薪械薪懈褟';
}

// Path: pages.settings.warp.detourModes
class TranslationsPagesSettingsWarpDetourModesRu extends TranslationsPagesSettingsWarpDetourModesEn {
	TranslationsPagesSettingsWarpDetourModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get proxyOverWarp => '袧邪锌褉邪胁谢褟褌褜 锌褉芯泻褋懈 褔械褉械蟹 WARP';
	@override String get warpOverProxy => '袧邪锌褉邪胁谢褟褌褜 WARP 褔械褉械蟹 锌褉芯泻褋懈';
	@override String get proxyOverWarpExplain => '袪邪蟹斜谢芯泻懈褉芯胁邪褌褜 锌褉芯泻褋懈 褋 锌芯屑芯褖褜褞 WARP';
	@override String get warpOverProxyExplain => '袛芯锌芯谢薪懈褌械谢褜薪邪褟 斜械蟹芯锌邪褋薪芯褋褌褜 褋 WARP';
}

// Path: pages.settings.warp.noise
class TranslationsPagesSettingsWarpNoiseRu extends TranslationsPagesSettingsWarpNoiseEn {
	TranslationsPagesSettingsWarpNoiseRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get count => '袣芯谢懈褔械褋褌胁芯 褕褍屑邪';
	@override String get mode => '袪械卸懈屑 褕褍屑邪';
	@override String get size => '袪邪蟹屑械褉 褕褍屑邪';
	@override String get delay => '袟邪写械褉卸泻邪 褕褍屑邪';
}

// Path: dialogs.confirmation.settings.import
class TranslationsDialogsConfirmationSettingsImportRu extends TranslationsDialogsConfirmationSettingsImportEn {
	TranslationsDialogsConfirmationSettingsImportRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get msg => '协褌芯 锌械褉械蟹邪锌懈褕械褌 胁褋械 锌邪褉邪屑械褌褉褘 泻芯薪褎懈谐褍褉邪褑懈懈 锌褉械写芯褋褌邪胁谢械薪薪褘屑懈 蟹薪邪褔械薪懈褟屑懈. 袙褘 褍胁械褉械薪褘?';
}

// Path: dialogs.confirmation.profile.delete
class TranslationsDialogsConfirmationProfileDeleteRu extends TranslationsDialogsConfirmationProfileDeleteEn {
	TranslationsDialogsConfirmationProfileDeleteRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '校写邪谢懈褌褜 锌褉芯褎懈谢褜';
	@override String get msg => '袙褘 褍胁械褉械薪褘, 褔褌芯 褏芯褌懈褌械 薪邪胁褋械谐写邪 褍写邪谢懈褌褜 褝褌芯褌 锌褉芯褎懈谢褜?';
}

// Path: dialogs.confirmation.perAppProxy.shareOnGithub
class TranslationsDialogsConfirmationPerAppProxyShareOnGithubRu extends TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn {
	TranslationsDialogsConfirmationPerAppProxyShareOnGithubRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '校谢褍褔褕械薪懈械 邪胁褌芯胁褘斜芯褉邪';
	@override String get msg => '袛械谢褟褋褜 胁褘斜褉邪薪薪褘屑懈 锌褉懈谢芯卸械薪懈褟屑懈, 胁褘 锌芯屑芯谐邪械褌械 锌芯锌芯谢薪懈褌褜 褋锌懈褋芯泻 "邪胁褌芯胁褘斜芯褉邪"';
}

// Path: dialogs.confirmation.perAppProxy.import
class TranslationsDialogsConfirmationPerAppProxyImportRu extends TranslationsDialogsConfirmationPerAppProxyImportEn {
	TranslationsDialogsConfirmationPerAppProxyImportRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get msg => '协褌芯 蟹邪屑械薪懈褌 胁褋械 胁邪褕懈 褌械泻褍褖懈械 薪邪褋褌褉芯泄泻懈 锌褉芯泻褋懈 写谢褟 锌褉懈谢芯卸械薪懈泄. 袙褘 褍胁械褉械薪褘, 褔褌芯 褏芯褌懈褌械 锌褉芯写芯谢卸懈褌褜?';
}

// Path: dialogs.confirmation.routeRule.delete
class TranslationsDialogsConfirmationRouteRuleDeleteRu extends TranslationsDialogsConfirmationRouteRuleDeleteEn {
	TranslationsDialogsConfirmationRouteRuleDeleteRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '校写邪谢懈褌褜 锌褉邪胁懈谢芯';
	@override String msg({required Object rulename}) => '袙褘 褍胁械褉械薪褘, 褔褌芯 褏芯褌懈褌械 褍写邪谢懈褌褜 锌褉邪胁懈谢芯 "${rulename}"?';
}

// Path: pages.settings.routing.perAppProxy.options
class TranslationsPagesSettingsRoutingPerAppProxyOptionsRu extends TranslationsPagesSettingsRoutingPerAppProxyOptionsEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsImportRu import = TranslationsPagesSettingsRoutingPerAppProxyOptionsImportRu._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsExportRu export = TranslationsPagesSettingsRoutingPerAppProxyOptionsExportRu._(_root);
	@override String get shareToAll => '袩芯写械谢懈褌褜褋褟 褋芯 胁褋械屑懈';
	@override String get clearAllSelections => '袨褔懈褋褌懈褌褜 胁械褋褜 胁褘斜芯褉';
}

// Path: pages.settings.routing.perAppProxy.modes
class TranslationsPagesSettingsRoutingPerAppProxyModesRu extends TranslationsPagesSettingsRoutingPerAppProxyModesEn {
	TranslationsPagesSettingsRoutingPerAppProxyModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get all => '袙褋械';
	@override String get proxy => '袩褉芯泻褋懈';
	@override String get bypass => '袙 芯斜褏芯写';
	@override String get allMsg => '袩褉芯泻褋懈褉芯胁邪褌褜 胁褋械 锌褉懈谢芯卸械薪懈褟';
	@override String get proxyMsg => '袩褉芯泻褋懈褉芯胁邪褌褜 褌芯谢褜泻芯 胁褘斜褉邪薪薪褘械 锌褉懈谢芯卸械薪懈褟';
	@override String get bypassMsg => '袧械 锌褉芯泻褋懈褉芯胁邪褌褜 胁褘斜褉邪薪薪褘械 锌褉懈谢芯卸械薪懈褟';
}

// Path: pages.settings.routing.perAppProxy.autoSelection
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionRu extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袗胁褌芯胁褘斜芯褉';
	@override String get performNow => '袙褘锌芯谢薪懈褌褜 褋械泄褔邪褋';
	@override String get resetToDefault => '小斜褉芯褋懈褌褜 锌芯 褍屑芯谢褔邪薪懈褞';
	@override String get autoUpdateInterval => '袠薪褌械褉胁邪谢 邪胁褌芯芯斜薪芯胁谢械薪懈褟';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastRu toast = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastRu._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogRu dialog = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogRu._(_root);
}

// Path: pages.settings.routing.routeRule.options
class TranslationsPagesSettingsRoutingRouteRuleOptionsRu extends TranslationsPagesSettingsRoutingRouteRuleOptionsEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsImportRu import = TranslationsPagesSettingsRoutingRouteRuleOptionsImportRu._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsExportRu export = TranslationsPagesSettingsRoutingRouteRuleOptionsExportRu._(_root);
	@override String get reset => '小斜褉芯褋懈褌褜 锌褉邪胁懈谢邪';
}

// Path: pages.settings.routing.routeRule.rule
class TranslationsPagesSettingsRoutingRouteRuleRuleRu extends TranslationsPagesSettingsRoutingRouteRuleRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleRuleRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袩褉邪胁懈谢芯';
	@override String get ruleChanged => '袩褉邪胁懈谢芯 懈蟹屑械薪械薪芯';
	@override String get ruleChangedMsg => '袙褘 褏芯褌懈褌械 褋芯褏褉邪薪懈褌褜 懈蟹屑械薪械薪懈褟?';
	@override String get onlyTunMode => '袛芯褋褌褍锌薪芯 褌芯谢褜泻芯 胁 褉械卸懈屑械 TUN';
	@override String get notAvailabeInThisPlatform => '袧械写芯褋褌褍锌薪芯 薪邪 褝褌芯泄 锌谢邪褌褎芯褉屑械';
	@override String get canNotBeEmpty => '袧械 屑芯卸械褌 斜褘褌褜 锌褍褋褌褘屑';
	@override String get validUrlEx => 'https://example.com';
	@override String get validUrl => '袙邪谢懈写薪褘泄 "URL", 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}';
	@override String get validProcessNameEx => 'Chrome.exe 懈谢懈 google chrome 懈谢懈 chrome';
	@override String get validProcessName => '袙邪谢懈写薪芯械 "袠屑褟 锌褉芯褑械褋褋邪", 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}';
	@override String get validProcessPathEx => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome';
	@override String get validProcessPath => '袙邪谢懈写薪褘泄 "袩褍褌褜 泻 锌褉芯褑械褋褋褍", 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}';
	@override String get validPortRangeEx => '80 懈谢懈 1-65000';
	@override String get validPortRange => '袙邪谢懈写薪褘泄 "袩芯褉褌" 懈谢懈 "袛懈邪锌邪蟹芯薪 锌芯褉褌芯胁", 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}';
	@override String get validIpCidrEx => '8.8.8.8 懈谢懈 10.0.0.0/24';
	@override String get validIpCidr => '袙邪谢懈写薪褘泄 IP CIDR, 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}';
	@override String get validDomainEx => 'Google.com 懈谢懈 dl.google.com';
	@override String get validDomain => '袙邪谢懈写薪褘泄 "袛芯屑械薪", 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}';
	@override String get validDomainSuffixEx => '.com 懈谢懈 .ru';
	@override String get validDomainSuffix => '袙邪谢懈写薪褘泄 "小褍褎褎懈泻褋 写芯屑械薪邪", 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}';
	@override Map<String, String> get tileTitle => {
		'name': '袠屑褟',
		'outbound': '袠褋褏芯写褟褖懈泄 锌褉懈 褋芯胁锌邪写械薪懈懈',
		'rule_set': 'URL 薪邪斜芯褉邪 锌褉邪胁懈谢',
		'package_name': '袠屑械薪邪 锌邪泻械褌芯胁',
		'process_name': '袠屑械薪邪 锌褉芯褑械褋褋芯胁',
		'process_path': '袩褍褌懈 泻 锌褉芯褑械褋褋邪屑',
		'network': '小械褌懈',
		'port_range': '袩芯褉褌褘 薪邪蟹薪邪褔械薪懈褟',
		'source_port_range': '袠褋褏芯写薪褘械 锌芯褉褌褘',
		'protocol': '袩褉芯褌芯泻芯谢',
		'ip_cidr': 'IP CIDR 薪邪蟹薪邪褔械薪懈褟',
		'source_ip_cidr': '袠褋褏芯写薪褘泄 IP CIDR',
		'domain': '袛芯屑械薪',
		'domain_suffixe': '小褍褎褎懈泻褋 写芯屑械薪邪',
		'domain_keyword': '袣谢褞褔械胁芯械 褋谢芯胁芯 写芯屑械薪邪',
		'domain_regex': '袪械谐褍谢褟褉薪芯械 胁褘褉邪卸械薪懈械 写芯屑械薪邪',
	};
	@override Map<String, String> get outbound => {
		'proxy': '袩褉芯泻褋懈',
		'direct': '袧邪锌褉褟屑褍褞',
		'direct_with_fragment': '袧邪锌褉褟屑褍褞 褋 褎褉邪谐屑械薪褌芯屑',
		'block': '袘谢芯泻懈褉芯胁邪褌褜',
	};
	@override Map<String, String> get network => {
		'all': '袙褋械',
		'tcp': 'TCP',
		'udp': 'UDP',
	};
	@override Map<String, String> get protocol => {
		'': '袙褋械',
		'tls': 'TLS',
		'http': 'HTTP',
		'quic': 'QUIC',
		'stun': 'STUN',
		'dns': 'DNS',
		'bittorrent': 'BitTorrent',
	};
}

// Path: pages.settings.routing.routeRule.genericList
class TranslationsPagesSettingsRoutingRouteRuleGenericListRu extends TranslationsPagesSettingsRoutingRouteRuleGenericListEn {
	TranslationsPagesSettingsRoutingRouteRuleGenericListRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get addNew => '袛芯斜邪胁懈褌褜 薪芯胁芯械 蟹薪邪褔械薪懈械';
	@override String get update => '袨斜薪芯胁懈褌褜 蟹薪邪褔械薪懈械';
	@override String get clearList => '袨褔懈褋褌懈褌褜 褋锌懈褋芯泻';
	@override String get clearListMsg => '袙褋械 褝谢械屑械薪褌褘 褍写邪谢械薪褘';
}

// Path: pages.settings.routing.routeRule.androidApps
class TranslationsPagesSettingsRoutingRouteRuleAndroidAppsRu extends TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn {
	TranslationsPagesSettingsRoutingRouteRuleAndroidAppsRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => '袩褉懈谢芯卸械薪懈褟 Android';
	@override String get showSystemApps => '袩芯泻邪蟹邪褌褜 褋懈褋褌械屑薪褘械 锌褉懈谢芯卸械薪懈褟';
	@override String get hideSystemApps => '小泻褉褘褌褜 褋懈褋褌械屑薪褘械 锌褉懈谢芯卸械薪懈褟';
	@override String get clearSelection => '袨褔懈褋褌懈褌褜 胁褘斜芯褉';
	@override String get uninstalled => '校写邪谢械薪芯';
}

// Path: pages.settings.routing.perAppProxy.options.import
class TranslationsPagesSettingsRoutingPerAppProxyOptionsImportRu extends TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsImportRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '袠屑锌芯褉褌懈褉芯胁邪褌褜 胁褘斜芯褉 懈蟹 斜褍褎械褉邪 芯斜屑械薪邪';
	@override String get file => '袠屑锌芯褉褌懈褉芯胁邪褌褜 胁褘斜芯褉 懈蟹 褎邪泄谢邪';
	@override String get msg => '袠屑锌芯褉褌 蟹邪屑械薪懈褌 胁邪褕 褌械泻褍褖懈泄 胁褘斜芯褉. 袙褘 褍胁械褉械薪褘, 褔褌芯 褏芯褌懈褌械 锌褉芯写芯谢卸懈褌褜?';
}

// Path: pages.settings.routing.perAppProxy.options.export
class TranslationsPagesSettingsRoutingPerAppProxyOptionsExportRu extends TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsExportRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '袣芯锌懈褉芯胁邪褌褜 胁褘斜芯褉 胁 斜褍褎械褉 芯斜屑械薪邪';
	@override String get file => '协泻褋锌芯褉褌懈褉芯胁邪褌褜 胁褘斜芯褉 胁 褎邪泄谢';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.toast
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastRu extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get success => '袗胁褌芯胁褘斜芯褉 锌褉懈谢芯卸械薪懈泄 褍褋锌械褕薪芯 蟹邪胁械褉褕械薪';
	@override String get failure => '袨褕懈斜泻邪 邪胁褌芯胁褘斜芯褉邪';
	@override String regionNotFound({required Object region}) => '袗胁褌芯胁褘斜芯褉 写谢褟 褉械谐懈芯薪邪 "${region}" 薪械 薪邪泄写械薪';
	@override String get alreadyInAuto => '袙邪褕 胁褘斜芯褉 褍卸械 薪邪褏芯写懈褌褋褟 胁 褋锌懈褋泻械 邪胁褌芯胁褘斜芯褉邪';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.dialog
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogRu extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '袗胁褌芯胁褘斜芯褉 锌褉懈谢芯卸械薪懈泄';
	@override String msg({required Object region}) => '肖褍薪泻褑懈褟 邪胁褌芯胁褘斜芯褉邪 写谢褟 锌褉芯泻褋懈 锌褉懈谢芯卸械薪懈泄 斜褘谢邪 芯褌泻谢褞褔械薪邪 懈蟹-蟹邪 褋屑械薪褘 褉械谐懈芯薪邪 薪邪 "${region}"';
}

// Path: pages.settings.routing.routeRule.options.import
class TranslationsPagesSettingsRoutingRouteRuleOptionsImportRu extends TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsImportRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '袠屑锌芯褉褌懈褉芯胁邪褌褜 锌褉邪胁懈谢邪 懈蟹 斜褍褎械褉邪 芯斜屑械薪邪';
	@override String get file => '袠屑锌芯褉褌懈褉芯胁邪褌褜 锌褉邪胁懈谢邪 懈蟹 褎邪泄谢邪';
}

// Path: pages.settings.routing.routeRule.options.export
class TranslationsPagesSettingsRoutingRouteRuleOptionsExportRu extends TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsExportRu._(TranslationsRu root) : this._root = root, super.internal(root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '袣芯锌懈褉芯胁邪褌褜 锌褉邪胁懈谢邪 胁 斜褍褎械褉 芯斜屑械薪邪';
	@override String get file => '小芯褏褉邪薪懈褌褜 锌褉邪胁懈谢邪 胁 褎邪泄谢';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appTitle' => '树懒VPN',
			'common.start' => '袧邪褔邪褌褜',
			'common.version' => '袙械褉褋懈褟',
			'common.ok' => 'OK',
			'common.cancel' => '袨褌屑械薪邪',
			'common.kContinue' => '袩褉芯写芯谢卸懈褌褜',
			'common.showMore' => '袩芯泻邪蟹邪褌褜 斜芯谢褜褕械',
			'common.showLess' => '袩芯泻邪蟹邪褌褜 屑械薪褜褕械',
			'common.filter' => '肖懈谢褜褌褉',
			'common.all' => '袙褋械',
			'common.pause' => '袩邪褍蟹邪',
			'common.resume' => '袙芯蟹芯斜薪芯胁懈褌褜',
			'common.clear' => '袨褔懈褋褌懈褌褜',
			'common.close' => '袟邪泻褉褘褌褜',
			'common.auto' => '袗胁褌芯',
			'common.manually' => '袙褉褍褔薪褍褞',
			'common.name' => '袠屑褟',
			'common.url' => 'URL',
			'common.add' => '袛芯斜邪胁懈褌褜',
			'common.clipboard' => '袘褍褎械褉 芯斜屑械薪邪',
			'common.addToClipboard' => '袛芯斜邪胁懈褌褜 胁 斜褍褎械褉 芯斜屑械薪邪',
			'common.scanQr' => '小泻邪薪懈褉芯胁邪褌褜 QR',
			'common.free' => '袘械褋锌谢邪褌薪芯',
			'common.warp' => 'WARP',
			'common.fragment' => '肖褉邪谐屑械薪褌',
			'common.help' => '小锌褉邪胁泻邪',
			'common.save' => '小芯褏褉邪薪懈褌褜',
			'common.update' => '袨斜薪芯胁懈褌褜',
			'common.share' => '袩芯写械谢懈褌褜褋褟',
			'common.edit' => '袠蟹屑械薪懈褌褜',
			'common.delete' => '校写邪谢懈褌褜',
			'common.discard' => '袨褌屑械薪懈褌褜',
			'common.import' => '袠屑锌芯褉褌',
			'common.export' => '协泻褋锌芯褉褌',
			'common.later' => '袩芯蟹卸械',
			'common.ignore' => '袠谐薪芯褉懈褉芯胁邪褌褜',
			'common.quit' => '袙褘褏芯写',
			'common.notSet' => '袧械 蟹邪写邪薪芯',
			'common.hide' => '小泻褉褘褌褜',
			'common.exit' => '袙褘泄褌懈',
			'common.reset' => '小斜褉芯褋',
			'common.done' => '袚芯褌芯胁芯',
			'common.search' => '袩芯懈褋泻',
			'common.decline' => '袨褌泻谢芯薪懈褌褜',
			'common.agree' => '小芯谐谢邪褋械薪',
			'common.empty' => '袩褍褋褌芯',
			'common.unknown' => '袧械懈蟹胁械褋褌薪芯',
			'common.hidden' => '小泻褉褘褌褘泄',
			'common.timeout' => '孝邪泄屑-邪褍褌',
			'common.sort' => '小芯褉褌懈褉芯胁邪褌褜',
			'common.dashboard' => '袩邪薪械谢褜 褍锌褉邪胁谢械薪懈褟',
			'common.interval.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, zero: '', one: '${n} 写械薪褜', few: '${n} 写薪褟', many: '${n} 写薪械泄', other: '${n} 写薪褟', ), 
			'common.interval.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(n, zero: '', one: '${n} 褔邪褋', few: '${n} 褔邪褋邪', many: '${n} 褔邪褋芯胁', other: '${n} 褔邪褋邪', ), 
			'common.msg.permission.denied' => '袛芯褋褌褍锌 蟹邪锌褉械褖械薪',
			'common.msg.export.clipboard.success' => '校褋锌械褕薪芯 写芯斜邪胁谢械薪芯 胁 斜褍褎械褉 芯斜屑械薪邪',
			'common.msg.export.clipboard.failure' => '袧械 褍写邪谢芯褋褜 褋泻芯锌懈褉芯胁邪褌褜 胁 斜褍褎械褉 芯斜屑械薪邪',
			'common.msg.export.clipboard.contentTooLarge' => '小谢懈褕泻芯屑 斜芯谢褜褕芯泄 泻芯薪褌械薪褌. 袠褋锌芯谢褜蟹褍泄褌械 褝泻褋锌芯褉褌 胁 褎邪泄谢',
			'common.msg.export.file.success' => '肖邪泄谢 JSON 褍褋锌械褕薪芯 褋芯蟹写邪薪',
			'common.msg.export.file.failure' => '袧械 褍写邪谢芯褋褜 褋芯蟹写邪褌褜 褎邪泄谢',
			'common.msg.import.confirm' => '袩芯写褌胁械褉写懈褌褜 懈屑锌芯褉褌',
			'common.msg.import.success' => '校褋锌械褕薪芯 懈屑锌芯褉褌懈褉芯胁邪薪芯',
			'common.msg.import.failure' => '袧械 褍写邪谢芯褋褜 懈屑锌芯褉褌懈褉芯胁邪褌褜',
			'intro.banner' => '袙褋械, 褔褌芯 胁邪屑 薪褍卸薪芯 写谢褟 懈薪褌械褉薪械褌邪 斜械蟹 芯谐褉邪薪懈褔械薪懈泄',
			'intro.termsAndPolicyCaution' => ({required InlineSpanBuilder tap}) => TextSpan(children: [ const TextSpan(text: '袩褉芯写芯谢卸邪褟, 胁褘 褋芯谐谢邪褕邪械褌械褋褜 褋 '), tap(_root.pages.about.termsAndConditions), ]), 
			'intro.info' => ({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [ const TextSpan(text: '小写械谢邪薪芯 褋 鉂わ笍 Hiddify - '), tap_source('袨褌泻褉褘褌褘泄 懈褋褏芯写薪褘泄 泻芯写'), const TextSpan(text: ' ('), tap_license('袥懈褑械薪蟹懈褟'), const TextSpan(text: ')'), ]), 
			'pages.home.title' => '袚谢邪胁薪邪褟',
			'pages.home.quickSettings' => '袘褘褋褌褉褘械 薪邪褋褌褉芯泄泻懈',
			'pages.proxies.title' => '袩褉芯泻褋懈',
			'pages.proxies.sort' => '小芯褉褌懈褉芯胁邪褌褜 锌褉芯泻褋懈',
			'pages.proxies.testDelay' => '袩褉芯胁械褉懈褌褜 蟹邪写械褉卸泻褍',
			'pages.proxies.empty' => '袧械褌 写芯褋褌褍锌薪褘褏 锌褉芯泻褋懈',
			'pages.proxies.activeProxy' => '袗泻褌懈胁薪褘泄 锌褉芯泻褋懈',
			'pages.proxies.unknownIp' => '袧械懈蟹胁械褋褌薪褘泄 IP',
			'pages.proxies.sortOptions.unsorted' => '袩芯 褍屑芯谢褔邪薪懈褞',
			'pages.proxies.sortOptions.name' => '袩芯 邪谢褎邪胁懈褌褍',
			'pages.proxies.sortOptions.delay' => '袩芯 蟹邪写械褉卸泻械',
			'pages.proxies.ipInfo.address' => 'IP-邪写褉械褋',
			'pages.proxies.ipInfo.country' => '小褌褉邪薪邪',
			'pages.proxies.ipInfo.organization' => '袨褉谐邪薪懈蟹邪褑懈褟',
			'pages.proxies.delay.result' => ({required Object delay}) => '袟邪写械褉卸泻邪: ${delay} 屑褋',
			'pages.proxies.delay.timeout' => '孝邪泄屑-邪褍褌 褌械褋褌邪 蟹邪写械褉卸泻懈',
			'pages.proxies.delay.testing' => '袟邪写械褉卸泻邪: 褌械褋褌懈褉芯胁邪薪懈械...',
			'pages.profiles.title' => '袩褉芯褎懈谢懈',
			'pages.profiles.add' => '袛芯斜邪胁懈褌褜 锌褉芯褎懈谢褜',
			'pages.profiles.update' => '袨斜薪芯胁懈褌褜 锌褉芯褎懈谢褜',
			'pages.profiles.viewAllProfiles' => '袩芯褋屑芯褌褉械褌褜 胁褋械 锌褉芯褎懈谢懈',
			'pages.profiles.activeProfileName' => ({required Object name}) => '袠屑褟 邪泻褌懈胁薪芯谐芯 锌褉芯褎懈谢褟: "${name}".',
			'pages.profiles.nonActiveProfileName' => ({required Object name}) => '袙褘斜褉邪褌褜 "${name}" 泻邪泻 邪泻褌懈胁薪褘泄 锌褉芯褎懈谢褜',
			'pages.profiles.freeSubNotFound' => '袘械褋锌谢邪褌薪邪褟 锌芯写锌懈褋泻邪 薪械 薪邪泄写械薪邪',
			'pages.profiles.freeSubNotFoundForRegion' => ({required Object region}) => '袘械褋锌谢邪褌薪邪褟 锌芯写锌懈褋泻邪 写谢褟 褉械谐懈芯薪邪 "${region}" 薪械 薪邪泄写械薪邪',
			'pages.profiles.failedToLoad' => '袧械 褍写邪谢芯褋褜 蟹邪谐褉褍蟹懈褌褜',
			'pages.profiles.updateSubscriptions' => '袨斜薪芯胁懈褌褜 锌芯写锌懈褋泻懈',
			'pages.profiles.share.urlToClipboard' => 'URL 胁 斜褍褎械褉 芯斜屑械薪邪',
			'pages.profiles.share.showUrlQr' => '袩芯泻邪蟹邪褌褜 QR-泻芯写 URL',
			'pages.profiles.share.jsonToClipboard' => 'JSON 胁 斜褍褎械褉 芯斜屑械薪邪',
			'pages.profiles.msg.save.success' => '袩褉芯褎懈谢褜 褍褋锌械褕薪芯 褋芯褏褉邪薪械薪',
			'pages.profiles.msg.invalidUrl' => '袧械胁械褉薪褘泄 URL',
			'pages.profiles.msg.add.failure' => '袧械 褍写邪谢芯褋褜 写芯斜邪胁懈褌褜 锌褉芯褎懈谢褜',
			'pages.profiles.msg.update.success' => '袩褉芯褎懈谢褜 褍褋锌械褕薪芯 芯斜薪芯胁谢械薪',
			'pages.profiles.msg.update.successNamed' => ({required Object name}) => '"${name}" 褍褋锌械褕薪芯 芯斜薪芯胁谢械薪',
			'pages.profiles.msg.update.failure' => '袧械 褍写邪谢芯褋褜 芯斜薪芯胁懈褌褜 锌褉芯褎懈谢褜',
			'pages.profiles.msg.update.failureNamed' => ({required Object name}) => '袧械 褍写邪谢芯褋褜 芯斜薪芯胁懈褌褜 "${name}"',
			'pages.profiles.msg.delete.success' => '袩褉芯褎懈谢褜 褍褋锌械褕薪芯 褍写邪谢械薪',
			'pages.profileDetails.title' => '袩褉芯褎懈谢褜',
			'pages.profileDetails.lastUpdate' => '袩芯褋谢械写薪械械 芯斜薪芯胁谢械薪懈械',
			'pages.profileDetails.form.nameHint' => '袠屑褟 锌褉芯褎懈谢褟',
			'pages.profileDetails.form.emptyName' => '袠屑褟 芯斜褟蟹邪褌械谢褜薪芯 写谢褟 蟹邪锌芯谢薪械薪懈褟',
			'pages.profileDetails.form.invalidUrl' => '袧械胁械褉薪褘泄 URL',
			'pages.profileDetails.form.urlHint' => '袩芯谢薪褘泄 URL 泻芯薪褎懈谐褍褉邪褑懈懈',
			'pages.profileDetails.form.disableAutoUpdate' => '袨褌泻谢褞褔懈褌褜 邪胁褌芯芯斜薪芯胁谢械薪懈械',
			'pages.profileDetails.form.autoUpdateInterval' => '袠薪褌械褉胁邪谢 邪胁褌芯芯斜薪芯胁谢械薪懈褟',
			'pages.profileDetails.form.loading' => '袛芯斜邪胁谢械薪懈械 锌褉芯褎懈谢褟...',
			'pages.logs.title' => '袥芯谐懈',
			'pages.logs.shareCoreLogs' => '袩芯写械谢懈褌褜褋褟 谢芯谐邪屑懈 褟写褉邪',
			'pages.logs.shareAppLogs' => '袩芯写械谢懈褌褜褋褟 谢芯谐邪屑懈 锌褉懈谢芯卸械薪懈褟',
			'pages.about.title' => '袨 锌褉芯谐褉邪屑屑械',
			'pages.about.notAvailableMsg' => '袙褘 褍卸械 懈褋锌芯谢褜蟹褍械褌械 锌芯褋谢械写薪褞褞 胁械褉褋懈褞',
			'pages.about.checkForUpdate' => '袩褉芯胁械褉懈褌褜 芯斜薪芯胁谢械薪懈褟',
			'pages.about.openWorkingDir' => '袨褌泻褉褘褌褜 褉邪斜芯褔褍褞 锌邪锌泻褍',
			'pages.about.sourceCode' => '袠褋褏芯写薪褘泄 泻芯写',
			'pages.about.telegramChannel' => '袣邪薪邪谢 胁 Telegram',
			'pages.about.termsAndConditions' => '校褋谢芯胁懈褟 懈褋锌芯谢褜蟹芯胁邪薪懈褟',
			'pages.about.privacyPolicy' => '袩芯谢懈褌懈泻邪 泻芯薪褎懈写械薪褑懈邪谢褜薪芯褋褌懈',
			'pages.settings.title' => '袧邪褋褌褉芯泄泻懈',
			'pages.settings.resetTunnel' => '小斜褉芯褋懈褌褜 锌褉芯褎懈谢褜 VPN',
			'pages.settings.options.import.clipboard' => '袠屑锌芯褉褌懈褉芯胁邪褌褜 薪邪褋褌褉芯泄泻懈 懈蟹 斜褍褎械褉邪 芯斜屑械薪邪',
			'pages.settings.options.import.file' => '袠屑锌芯褉褌懈褉芯胁邪褌褜 薪邪褋褌褉芯泄泻懈 懈蟹 褎邪泄谢邪',
			'pages.settings.options.export.anonymousToClipboard' => '袣芯锌懈褉芯胁邪褌褜 邪薪芯薪懈屑薪褘械 薪邪褋褌褉芯泄泻懈 胁 斜褍褎械褉 芯斜屑械薪邪',
			'pages.settings.options.export.anonymousToFile' => '协泻褋锌芯褉褌懈褉芯胁邪褌褜 邪薪芯薪懈屑薪褘械 薪邪褋褌褉芯泄泻懈 胁 褎邪泄谢',
			'pages.settings.options.export.allToClipboard' => '袣芯锌懈褉芯胁邪褌褜 胁褋械 薪邪褋褌褉芯泄泻懈 胁 斜褍褎械褉 芯斜屑械薪邪',
			'pages.settings.options.export.allToFile' => '协泻褋锌芯褉褌懈褉芯胁邪褌褜 胁褋械 薪邪褋褌褉芯泄泻懈 胁 褎邪泄谢',
			'pages.settings.options.reset' => '小斜褉芯褋懈褌褜 薪邪褋褌褉芯泄泻懈',
			'pages.settings.general.title' => '袨斜褖懈械',
			'pages.settings.general.locale' => '携蟹褘泻',
			'pages.settings.general.themeMode' => '孝械屑邪 芯褎芯褉屑谢械薪懈褟',
			'pages.settings.general.themeModes.system' => '小懈褋褌械屑薪邪褟',
			'pages.settings.general.themeModes.dark' => '孝械屑薪邪褟',
			'pages.settings.general.themeModes.light' => '小胁械褌谢邪褟',
			'pages.settings.general.themeModes.black' => '效械褉薪邪褟',
			'pages.settings.general.enableAnalytics' => '袙泻谢褞褔懈褌褜 邪薪邪谢懈褌懈泻褍',
			'pages.settings.general.enableAnalyticsMsg' => '袪邪蟹褉械褕懈褌褜 褋斜芯褉 邪薪邪谢懈褌懈泻懈 懈 芯褌锌褉邪胁泻褍 芯褌褔械褌芯胁 芯 褋斜芯褟褏 写谢褟 褍谢褍褔褕械薪懈褟 锌褉懈谢芯卸械薪懈褟',
			'pages.settings.general.autoIpCheck' => '袗胁褌芯屑邪褌懈褔械褋泻懈 锌褉芯胁械褉褟褌褜 IP-邪写褉械褋',
			'pages.settings.general.dynamicNotification' => '袨褌芯斜褉邪卸邪褌褜 褋泻芯褉芯褋褌褜 胁 褍胁械写芯屑谢械薪懈懈',
			'pages.settings.general.hapticFeedback' => '孝邪泻褌懈谢褜薪褘泄 芯褌泻谢懈泻',
			'pages.settings.general.actionAtClosing' => '袛械泄褋褌胁懈械 锌褉懈 蟹邪泻褉褘褌懈懈',
			'pages.settings.general.autoStart' => '袟邪锌褍褋泻邪褌褜 锌褉懈 胁褏芯写械 胁 褋懈褋褌械屑褍',
			'pages.settings.general.silentStart' => '袟邪锌褍褋泻邪褌褜 褋胁械褉薪褍褌褘屑',
			'pages.settings.general.ignoreBatteryOptimizations' => '袨褌泻谢褞褔懈褌褜 芯锌褌懈屑懈蟹邪褑懈褞 斜邪褌邪褉械懈',
			'pages.settings.general.ignoreBatteryOptimizationsMsg' => '小薪褟褌褜 芯谐褉邪薪懈褔械薪懈褟 写谢褟 芯锌褌懈屑邪谢褜薪芯泄 褉邪斜芯褌褘 VPN',
			'pages.settings.general.memoryLimit' => '袨谐褉邪薪懈褔械薪懈械 锌邪屑褟褌懈',
			'pages.settings.general.memoryLimitMsg' => '袙泻谢褞褔懈褌械, 械褋谢懈 胁褘 褋褌邪谢泻懈胁邪械褌械褋褜 褋 芯褕懈斜泻邪屑懈 薪械褏胁邪褌泻懈 锌邪屑褟褌懈 懈谢懈 褔邪褋褌褘屑懈 褋斜芯褟屑懈 锌褉懈谢芯卸械薪懈褟',
			'pages.settings.general.debugMode' => '袪械卸懈屑 芯褌谢邪写泻懈',
			'pages.settings.general.debugModeMsg' => '袩械褉械蟹邪锌褍褋褌懈褌械 锌褉懈谢芯卸械薪懈械, 褔褌芯斜褘 锌褉懈屑械薪懈褌褜 褝褌芯 懈蟹屑械薪械薪懈械',
			'pages.settings.general.logLevel' => '校褉芯胁械薪褜 谢芯谐懈褉芯胁邪薪懈褟',
			'pages.settings.general.connectionTestUrl' => 'URL 写谢褟 褌械褋褌邪 褋芯械写懈薪械薪懈褟',
			'pages.settings.general.urlTestInterval' => '袠薪褌械褉胁邪谢 褌械褋褌邪 URL',
			'pages.settings.general.clashApiPort' => '袩芯褉褌 Clash API',
			'pages.settings.general.useXrayCoreWhenPossible' => '袠褋锌芯谢褜蟹芯胁邪褌褜 xray-core, 械褋谢懈 胁芯蟹屑芯卸薪芯',
			'pages.settings.general.useXrayCoreWhenPossibleMsg' => '袠褋锌芯谢褜蟹芯胁邪褌褜 xray-core 锌褉懈 芯斜褉邪斜芯褌泻械 褋褋褘谢芯泻 薪邪 锌芯写锌懈褋泻褍. 袧械芯斜褏芯写懈屑芯 锌芯胁褌芯褉薪芯 懈屑锌芯褉褌懈褉芯胁邪褌褜 褋褋褘谢泻褍, 褔褌芯斜褘 胁泻谢褞褔懈褌褜 褝褌褍 芯锌褑懈褞.',
			'pages.settings.routing.title' => '袦邪褉褕褉褍褌懈蟹邪褑懈褟',
			'pages.settings.routing.perAppProxy.title' => '袩褉芯泻褋懈 写谢褟 锌褉懈谢芯卸械薪懈泄',
			'pages.settings.routing.perAppProxy.hideSysApps' => '小泻褉褘褌褜 褋懈褋褌械屑薪褘械 锌褉懈谢芯卸械薪懈褟',
			'pages.settings.routing.perAppProxy.options.import.clipboard' => '袠屑锌芯褉褌懈褉芯胁邪褌褜 胁褘斜芯褉 懈蟹 斜褍褎械褉邪 芯斜屑械薪邪',
			'pages.settings.routing.perAppProxy.options.import.file' => '袠屑锌芯褉褌懈褉芯胁邪褌褜 胁褘斜芯褉 懈蟹 褎邪泄谢邪',
			'pages.settings.routing.perAppProxy.options.import.msg' => '袠屑锌芯褉褌 蟹邪屑械薪懈褌 胁邪褕 褌械泻褍褖懈泄 胁褘斜芯褉. 袙褘 褍胁械褉械薪褘, 褔褌芯 褏芯褌懈褌械 锌褉芯写芯谢卸懈褌褜?',
			'pages.settings.routing.perAppProxy.options.export.clipboard' => '袣芯锌懈褉芯胁邪褌褜 胁褘斜芯褉 胁 斜褍褎械褉 芯斜屑械薪邪',
			'pages.settings.routing.perAppProxy.options.export.file' => '协泻褋锌芯褉褌懈褉芯胁邪褌褜 胁褘斜芯褉 胁 褎邪泄谢',
			'pages.settings.routing.perAppProxy.options.shareToAll' => '袩芯写械谢懈褌褜褋褟 褋芯 胁褋械屑懈',
			'pages.settings.routing.perAppProxy.options.clearAllSelections' => '袨褔懈褋褌懈褌褜 胁械褋褜 胁褘斜芯褉',
			'pages.settings.routing.perAppProxy.modes.all' => '袙褋械',
			'pages.settings.routing.perAppProxy.modes.proxy' => '袩褉芯泻褋懈',
			'pages.settings.routing.perAppProxy.modes.bypass' => '袙 芯斜褏芯写',
			'pages.settings.routing.perAppProxy.modes.allMsg' => '袩褉芯泻褋懈褉芯胁邪褌褜 胁褋械 锌褉懈谢芯卸械薪懈褟',
			'pages.settings.routing.perAppProxy.modes.proxyMsg' => '袩褉芯泻褋懈褉芯胁邪褌褜 褌芯谢褜泻芯 胁褘斜褉邪薪薪褘械 锌褉懈谢芯卸械薪懈褟',
			'pages.settings.routing.perAppProxy.modes.bypassMsg' => '袧械 锌褉芯泻褋懈褉芯胁邪褌褜 胁褘斜褉邪薪薪褘械 锌褉懈谢芯卸械薪懈褟',
			'pages.settings.routing.perAppProxy.autoSelection.title' => '袗胁褌芯胁褘斜芯褉',
			'pages.settings.routing.perAppProxy.autoSelection.performNow' => '袙褘锌芯谢薪懈褌褜 褋械泄褔邪褋',
			'pages.settings.routing.perAppProxy.autoSelection.resetToDefault' => '小斜褉芯褋懈褌褜 锌芯 褍屑芯谢褔邪薪懈褞',
			'pages.settings.routing.perAppProxy.autoSelection.autoUpdateInterval' => '袠薪褌械褉胁邪谢 邪胁褌芯芯斜薪芯胁谢械薪懈褟',
			'pages.settings.routing.perAppProxy.autoSelection.toast.success' => '袗胁褌芯胁褘斜芯褉 锌褉懈谢芯卸械薪懈泄 褍褋锌械褕薪芯 蟹邪胁械褉褕械薪',
			'pages.settings.routing.perAppProxy.autoSelection.toast.failure' => '袨褕懈斜泻邪 邪胁褌芯胁褘斜芯褉邪',
			'pages.settings.routing.perAppProxy.autoSelection.toast.regionNotFound' => ({required Object region}) => '袗胁褌芯胁褘斜芯褉 写谢褟 褉械谐懈芯薪邪 "${region}" 薪械 薪邪泄写械薪',
			'pages.settings.routing.perAppProxy.autoSelection.toast.alreadyInAuto' => '袙邪褕 胁褘斜芯褉 褍卸械 薪邪褏芯写懈褌褋褟 胁 褋锌懈褋泻械 邪胁褌芯胁褘斜芯褉邪',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.title' => '袗胁褌芯胁褘斜芯褉 锌褉懈谢芯卸械薪懈泄',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.msg' => ({required Object region}) => '肖褍薪泻褑懈褟 邪胁褌芯胁褘斜芯褉邪 写谢褟 锌褉芯泻褋懈 锌褉懈谢芯卸械薪懈泄 斜褘谢邪 芯褌泻谢褞褔械薪邪 懈蟹-蟹邪 褋屑械薪褘 褉械谐懈芯薪邪 薪邪 "${region}"',
			'pages.settings.routing.region' => '袪械谐懈芯薪',
			'pages.settings.routing.regions.ir' => '袠褉邪薪 (ir)',
			'pages.settings.routing.regions.cn' => '袣懈褌邪泄 (cn)',
			'pages.settings.routing.regions.ru' => '袪芯褋褋懈褟 (ru)',
			'pages.settings.routing.regions.af' => '袗褎谐邪薪懈褋褌邪薪 (af)',
			'pages.settings.routing.regions.id' => '袠薪写芯薪械蟹懈褟 (id)',
			'pages.settings.routing.regions.tr' => '孝褍褉褑懈褟 (tr)',
			'pages.settings.routing.regions.br' => '袘褉邪蟹懈谢懈褟 (br)',
			'pages.settings.routing.regions.other' => '袛褉褍谐芯泄',
			'pages.settings.routing.balancerStrategy.title' => '小褌褉邪褌械谐懈褟 Balancer',
			'pages.settings.routing.balancerStrategy.roundRobin' => 'Round robin',
			'pages.settings.routing.balancerStrategy.consistentHash' => 'Consistent hash',
			'pages.settings.routing.balancerStrategy.stickySession' => 'Sticky session',
			'pages.settings.routing.blockAds' => '袘谢芯泻懈褉芯胁邪褌褜 褉械泻谢邪屑褍',
			'pages.settings.routing.bypassLan' => '袨斜褏芯写 LAN',
			'pages.settings.routing.resolveDestination' => '袨锌褉械写械谢褟褌褜 邪写褉械褋 薪邪蟹薪邪褔械薪懈褟',
			'pages.settings.routing.ipv6Route' => '袦邪褉褕褉褍褌 IPv6',
			'pages.settings.routing.ipv6Modes.disable' => '袨褌泻谢褞褔懈褌褜',
			'pages.settings.routing.ipv6Modes.enable' => '袙泻谢褞褔懈褌褜',
			'pages.settings.routing.ipv6Modes.prefer' => '袩褉械写锌芯褔褌懈褌械谢褜薪芯',
			'pages.settings.routing.ipv6Modes.only' => '孝芯谢褜泻芯',
			'pages.settings.routing.routeRule.title' => '袩褉邪胁懈谢邪 屑邪褉褕褉褍褌懈蟹邪褑懈懈',
			'pages.settings.routing.routeRule.options.import.clipboard' => '袠屑锌芯褉褌懈褉芯胁邪褌褜 锌褉邪胁懈谢邪 懈蟹 斜褍褎械褉邪 芯斜屑械薪邪',
			'pages.settings.routing.routeRule.options.import.file' => '袠屑锌芯褉褌懈褉芯胁邪褌褜 锌褉邪胁懈谢邪 懈蟹 褎邪泄谢邪',
			'pages.settings.routing.routeRule.options.export.clipboard' => '袣芯锌懈褉芯胁邪褌褜 锌褉邪胁懈谢邪 胁 斜褍褎械褉 芯斜屑械薪邪',
			'pages.settings.routing.routeRule.options.export.file' => '小芯褏褉邪薪懈褌褜 锌褉邪胁懈谢邪 胁 褎邪泄谢',
			'pages.settings.routing.routeRule.options.reset' => '小斜褉芯褋懈褌褜 锌褉邪胁懈谢邪',
			'pages.settings.routing.routeRule.deleteRule' => '校写邪谢懈褌褜 锌褉邪胁懈谢芯',
			'pages.settings.routing.routeRule.createRule' => '小芯蟹写邪褌褜 薪芯胁芯械 锌褉邪胁懈谢芯',
			'pages.settings.routing.routeRule.rule.title' => '袩褉邪胁懈谢芯',
			'pages.settings.routing.routeRule.rule.ruleChanged' => '袩褉邪胁懈谢芯 懈蟹屑械薪械薪芯',
			'pages.settings.routing.routeRule.rule.ruleChangedMsg' => '袙褘 褏芯褌懈褌械 褋芯褏褉邪薪懈褌褜 懈蟹屑械薪械薪懈褟?',
			'pages.settings.routing.routeRule.rule.onlyTunMode' => '袛芯褋褌褍锌薪芯 褌芯谢褜泻芯 胁 褉械卸懈屑械 TUN',
			'pages.settings.routing.routeRule.rule.notAvailabeInThisPlatform' => '袧械写芯褋褌褍锌薪芯 薪邪 褝褌芯泄 锌谢邪褌褎芯褉屑械',
			'pages.settings.routing.routeRule.rule.canNotBeEmpty' => '袧械 屑芯卸械褌 斜褘褌褜 锌褍褋褌褘屑',
			'pages.settings.routing.routeRule.rule.validUrlEx' => 'https://example.com',
			'pages.settings.routing.routeRule.rule.validUrl' => '袙邪谢懈写薪褘泄 "URL", 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}',
			'pages.settings.routing.routeRule.rule.validProcessNameEx' => 'Chrome.exe 懈谢懈 google chrome 懈谢懈 chrome',
			'pages.settings.routing.routeRule.rule.validProcessName' => '袙邪谢懈写薪芯械 "袠屑褟 锌褉芯褑械褋褋邪", 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}',
			'pages.settings.routing.routeRule.rule.validProcessPathEx' => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome',
			'pages.settings.routing.routeRule.rule.validProcessPath' => '袙邪谢懈写薪褘泄 "袩褍褌褜 泻 锌褉芯褑械褋褋褍", 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}',
			'pages.settings.routing.routeRule.rule.validPortRangeEx' => '80 懈谢懈 1-65000',
			'pages.settings.routing.routeRule.rule.validPortRange' => '袙邪谢懈写薪褘泄 "袩芯褉褌" 懈谢懈 "袛懈邪锌邪蟹芯薪 锌芯褉褌芯胁", 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}',
			'pages.settings.routing.routeRule.rule.validIpCidrEx' => '8.8.8.8 懈谢懈 10.0.0.0/24',
			'pages.settings.routing.routeRule.rule.validIpCidr' => '袙邪谢懈写薪褘泄 IP CIDR, 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}',
			'pages.settings.routing.routeRule.rule.validDomainEx' => 'Google.com 懈谢懈 dl.google.com',
			'pages.settings.routing.routeRule.rule.validDomain' => '袙邪谢懈写薪褘泄 "袛芯屑械薪", 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}',
			'pages.settings.routing.routeRule.rule.validDomainSuffixEx' => '.com 懈谢懈 .ru',
			'pages.settings.routing.routeRule.rule.validDomainSuffix' => '袙邪谢懈写薪褘泄 "小褍褎褎懈泻褋 写芯屑械薪邪", 薪邪锌褉懈屑械褉\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}',
			'pages.settings.routing.routeRule.rule.tileTitle.name' => '袠屑褟',
			'pages.settings.routing.routeRule.rule.tileTitle.outbound' => '袠褋褏芯写褟褖懈泄 锌褉懈 褋芯胁锌邪写械薪懈懈',
			'pages.settings.routing.routeRule.rule.tileTitle.rule_set' => 'URL 薪邪斜芯褉邪 锌褉邪胁懈谢',
			'pages.settings.routing.routeRule.rule.tileTitle.package_name' => '袠屑械薪邪 锌邪泻械褌芯胁',
			'pages.settings.routing.routeRule.rule.tileTitle.process_name' => '袠屑械薪邪 锌褉芯褑械褋褋芯胁',
			'pages.settings.routing.routeRule.rule.tileTitle.process_path' => '袩褍褌懈 泻 锌褉芯褑械褋褋邪屑',
			'pages.settings.routing.routeRule.rule.tileTitle.network' => '小械褌懈',
			'pages.settings.routing.routeRule.rule.tileTitle.port_range' => '袩芯褉褌褘 薪邪蟹薪邪褔械薪懈褟',
			'pages.settings.routing.routeRule.rule.tileTitle.source_port_range' => '袠褋褏芯写薪褘械 锌芯褉褌褘',
			'pages.settings.routing.routeRule.rule.tileTitle.protocol' => '袩褉芯褌芯泻芯谢',
			'pages.settings.routing.routeRule.rule.tileTitle.ip_cidr' => 'IP CIDR 薪邪蟹薪邪褔械薪懈褟',
			'pages.settings.routing.routeRule.rule.tileTitle.source_ip_cidr' => '袠褋褏芯写薪褘泄 IP CIDR',
			'pages.settings.routing.routeRule.rule.tileTitle.domain' => '袛芯屑械薪',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_suffixe' => '小褍褎褎懈泻褋 写芯屑械薪邪',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_keyword' => '袣谢褞褔械胁芯械 褋谢芯胁芯 写芯屑械薪邪',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_regex' => '袪械谐褍谢褟褉薪芯械 胁褘褉邪卸械薪懈械 写芯屑械薪邪',
			'pages.settings.routing.routeRule.rule.outbound.proxy' => '袩褉芯泻褋懈',
			'pages.settings.routing.routeRule.rule.outbound.direct' => '袧邪锌褉褟屑褍褞',
			'pages.settings.routing.routeRule.rule.outbound.direct_with_fragment' => '袧邪锌褉褟屑褍褞 褋 褎褉邪谐屑械薪褌芯屑',
			'pages.settings.routing.routeRule.rule.outbound.block' => '袘谢芯泻懈褉芯胁邪褌褜',
			'pages.settings.routing.routeRule.rule.network.all' => '袙褋械',
			'pages.settings.routing.routeRule.rule.network.tcp' => 'TCP',
			'pages.settings.routing.routeRule.rule.network.udp' => 'UDP',
			'pages.settings.routing.routeRule.rule.protocol.' => '袙褋械',
			'pages.settings.routing.routeRule.rule.protocol.tls' => 'TLS',
			'pages.settings.routing.routeRule.rule.protocol.http' => 'HTTP',
			'pages.settings.routing.routeRule.rule.protocol.quic' => 'QUIC',
			'pages.settings.routing.routeRule.rule.protocol.stun' => 'STUN',
			'pages.settings.routing.routeRule.rule.protocol.dns' => 'DNS',
			'pages.settings.routing.routeRule.rule.protocol.bittorrent' => 'BitTorrent',
			'pages.settings.routing.routeRule.genericList.addNew' => '袛芯斜邪胁懈褌褜 薪芯胁芯械 蟹薪邪褔械薪懈械',
			'pages.settings.routing.routeRule.genericList.update' => '袨斜薪芯胁懈褌褜 蟹薪邪褔械薪懈械',
			'pages.settings.routing.routeRule.genericList.clearList' => '袨褔懈褋褌懈褌褜 褋锌懈褋芯泻',
			'pages.settings.routing.routeRule.genericList.clearListMsg' => '袙褋械 褝谢械屑械薪褌褘 褍写邪谢械薪褘',
			'pages.settings.routing.routeRule.androidApps.pageTitle' => '袩褉懈谢芯卸械薪懈褟 Android',
			'pages.settings.routing.routeRule.androidApps.showSystemApps' => '袩芯泻邪蟹邪褌褜 褋懈褋褌械屑薪褘械 锌褉懈谢芯卸械薪懈褟',
			'pages.settings.routing.routeRule.androidApps.hideSystemApps' => '小泻褉褘褌褜 褋懈褋褌械屑薪褘械 锌褉懈谢芯卸械薪懈褟',
			'pages.settings.routing.routeRule.androidApps.clearSelection' => '袨褔懈褋褌懈褌褜 胁褘斜芯褉',
			'pages.settings.routing.routeRule.androidApps.uninstalled' => '校写邪谢械薪芯',
			'pages.settings.dns.title' => 'DNS',
			'pages.settings.dns.remoteDns' => '校写邪谢械薪薪褘泄 DNS',
			'pages.settings.dns.remoteDnsDomainStrategy' => '小褌褉邪褌械谐懈褟 写芯屑械薪邪 褍写邪谢械薪薪芯谐芯 DNS',
			'pages.settings.dns.directDns' => '袪邪褋锌芯蟹薪邪胁邪褌械谢褜 懈褋褏芯写褟褖械谐芯 褋械褉胁械褉邪 (薪邪锌褉褟屑褍褞)',
			'pages.settings.dns.directDnsDomainStrategy' => '小褌褉邪褌械谐懈褟 懈褋褏芯写褟褖械谐芯 写芯屑械薪邪',
			'pages.settings.dns.enableDnsRouting' => '袙泻谢褞褔懈褌褜 屑邪褉褕褉褍褌懈蟹邪褑懈褞 DNS',
			'pages.settings.dns.enableFakeDns' => '袙泻谢褞褔懈褌褜 锌芯写写械谢褜薪褘泄 DNS',
			'pages.settings.dns.domainStrategy.auto' => '袗胁褌芯',
			'pages.settings.dns.domainStrategy.preferIpv6' => '袩褉械写锌芯褔懈褌邪褌褜 IPv6',
			'pages.settings.dns.domainStrategy.preferIpv4' => '袩褉械写锌芯褔懈褌邪褌褜 IPv4',
			'pages.settings.dns.domainStrategy.ipv4Only' => '孝芯谢褜泻芯 IPv4',
			'pages.settings.dns.domainStrategy.ipv6Only' => '孝芯谢褜泻芯 IPv6',
			'pages.settings.inbound.title' => '袙褏芯写褟褖懈械',
			'pages.settings.inbound.serviceMode' => '袪械卸懈屑 褋谢褍卸斜褘',
			'pages.settings.inbound.serviceModes.proxy' => '孝芯谢褜泻芯 锌褉芯泻褋懈-褋谢褍卸斜邪',
			'pages.settings.inbound.serviceModes.systemProxy' => '校褋褌邪薪芯胁懈褌褜 褋懈褋褌械屑薪褘泄 锌褉芯泻褋懈',
			'pages.settings.inbound.serviceModes.tun' => 'VPN',
			'pages.settings.inbound.serviceModes.tunService' => '小谢褍卸斜邪 VPN',
			'pages.settings.inbound.shortServiceModes.proxy' => '袩褉芯泻褋懈',
			'pages.settings.inbound.shortServiceModes.systemProxy' => '小懈褋褌械屑薪褘泄 锌褉芯泻褋懈',
			'pages.settings.inbound.shortServiceModes.tun' => 'VPN',
			'pages.settings.inbound.shortServiceModes.tunService' => '小谢褍卸斜邪 VPN',
			'pages.settings.inbound.strictRoute' => '小褌褉芯谐邪褟 屑邪褉褕褉褍褌懈蟹邪褑懈褟',
			'pages.settings.inbound.tunImplementation' => '袪械邪谢懈蟹邪褑懈褟 TUN',
			'pages.settings.inbound.tunImplementations.mixed' => '小屑械褕邪薪薪邪褟',
			'pages.settings.inbound.tunImplementations.system' => '小懈褋褌械屑薪邪褟',
			'pages.settings.inbound.tunImplementations.gvisor' => 'gVisor',
			'pages.settings.inbound.mixedPort' => '小屑械褕邪薪薪褘泄 锌芯褉褌',
			'pages.settings.inbound.tproxyPort' => '袩芯褉褌 锌褉芯蟹褉邪褔薪芯谐芯 锌褉芯泻褋懈',
			'pages.settings.inbound.directPort' => '袥芯泻邪谢褜薪褘泄 锌芯褉褌 direct',
			'pages.settings.inbound.redirectPort' => '袩芯褉褌 锌械褉械薪邪锌褉邪胁谢械薪懈褟',
			'pages.settings.inbound.allowConnectionFromLan' => '袩芯写械谢懈褌褜褋褟 VPN 胁 谢芯泻邪谢褜薪芯泄 褋械褌懈',
			'pages.settings.tlsTricks.title' => '孝褉褞泻懈 TLS',
			'pages.settings.tlsTricks.enable' => '袙泻谢褞褔懈褌褜 褎褉邪谐屑械薪褌邪褑懈褞',
			'pages.settings.tlsTricks.packets' => '袩邪泻械褌褘 褎褉邪谐屑械薪褌邪褑懈懈',
			'pages.settings.tlsTricks.packetsTlsHello' => 'TLS Hello',
			'pages.settings.tlsTricks.packets1_1' => '1-1',
			'pages.settings.tlsTricks.packets1_2' => '1-2',
			'pages.settings.tlsTricks.packets1_3' => '1-3',
			'pages.settings.tlsTricks.packets1_4' => '1-4',
			'pages.settings.tlsTricks.packets1_5' => '1-5',
			'pages.settings.tlsTricks.size' => '袪邪蟹屑械褉 褎褉邪谐屑械薪褌邪',
			'pages.settings.tlsTricks.sleep' => '袟邪写械褉卸泻邪 褎褉邪谐屑械薪褌邪',
			'pages.settings.tlsTricks.mixedSniCase.enable' => '袙泻谢褞褔懈褌褜 褋屑械褕邪薪薪褘泄 褉械谐懈褋褌褉 SNI',
			'pages.settings.tlsTricks.padding.enable' => '袙泻谢褞褔懈褌褜 写芯锌芯谢薪械薪懈械',
			'pages.settings.tlsTricks.padding.size' => '袪邪蟹屑械褉 写芯锌芯谢薪械薪懈褟',
			'pages.settings.warp.title' => 'WARP',
			'pages.settings.warp.enable' => '袙泻谢褞褔懈褌褜 WARP',
			'pages.settings.warp.generateConfig' => '小谐械薪械褉懈褉芯胁邪褌褜 泻芯薪褎懈谐褍褉邪褑懈褞 WARP',
			'pages.settings.warp.configGenerated' => '袣芯薪褎懈谐褍褉邪褑懈褟 Warp 褋谐械薪械褉懈褉芯胁邪薪邪',
			'pages.settings.warp.missingConfig' => '袨褌褋褍褌褋褌胁褍械褌 泻芯薪褎懈谐褍褉邪褑懈褟 WARP',
			'pages.settings.warp.detourMode' => '袪械卸懈屑 屑邪褉褕褉褍褌懈蟹邪褑懈懈 WARP',
			'pages.settings.warp.detourModes.proxyOverWarp' => '袧邪锌褉邪胁谢褟褌褜 锌褉芯泻褋懈 褔械褉械蟹 WARP',
			'pages.settings.warp.detourModes.warpOverProxy' => '袧邪锌褉邪胁谢褟褌褜 WARP 褔械褉械蟹 锌褉芯泻褋懈',
			'pages.settings.warp.detourModes.proxyOverWarpExplain' => '袪邪蟹斜谢芯泻懈褉芯胁邪褌褜 锌褉芯泻褋懈 褋 锌芯屑芯褖褜褞 WARP',
			'pages.settings.warp.detourModes.warpOverProxyExplain' => '袛芯锌芯谢薪懈褌械谢褜薪邪褟 斜械蟹芯锌邪褋薪芯褋褌褜 褋 WARP',
			'pages.settings.warp.licenseKey' => '袥懈褑械薪蟹懈芯薪薪褘泄 泻谢褞褔',
			'pages.settings.warp.cleanIp' => '效懈褋褌褘泄 IP',
			'pages.settings.warp.port' => '袩芯褉褌',
			'pages.settings.warp.noise.count' => '袣芯谢懈褔械褋褌胁芯 褕褍屑邪',
			'pages.settings.warp.noise.mode' => '袪械卸懈屑 褕褍屑邪',
			'pages.settings.warp.noise.size' => '袪邪蟹屑械褉 褕褍屑邪',
			'pages.settings.warp.noise.delay' => '袟邪写械褉卸泻邪 褕褍屑邪',
			'components.stats.connection' => '小芯械写懈薪械薪懈械',
			'components.stats.traffic' => '孝褉邪褎懈泻',
			'components.stats.trafficLive' => '孝械泻褍褖懈泄 褌褉邪褎懈泻',
			'components.stats.trafficTotal' => '袨斜褖懈泄 褌褉邪褎懈泻',
			'components.stats.uplink' => '袨褌锌褉邪胁泻邪',
			'components.stats.downlink' => '袩褉懈械屑',
			'components.stats.speed' => '小泻芯褉芯褋褌褜',
			'components.stats.totalTransferred' => '袙褋械谐芯 锌械褉械写邪薪芯',
			'components.subscriptionInfo.upload' => '袨褌锌褉邪胁谢械薪芯',
			'components.subscriptionInfo.download' => '袩芯谢褍褔械薪芯',
			'components.subscriptionInfo.total' => '袙褋械谐芯 褌褉邪褎懈泻邪',
			'components.subscriptionInfo.expireDate' => '袛邪褌邪 芯泻芯薪褔邪薪懈褟',
			'components.subscriptionInfo.expired' => '袠褋褌械泻',
			'components.subscriptionInfo.noTraffic' => '袣胁芯褌邪 懈褋褔械褉锌邪薪邪',
			'components.subscriptionInfo.remainingTime' => '袨褋褌邪胁褕械械褋褟 胁褉械屑褟',
			'components.subscriptionInfo.remainingDuration' => ({required Object duration}) => '芯褋褌邪谢芯褋褜 ${duration} 写薪械泄',
			'components.subscriptionInfo.remainingDurationNew' => ({required Object duration}) => '${duration} 写薪械泄',
			'components.subscriptionInfo.remainingTrafficSemanticLabel' => ({required Object consumed, required Object total}) => '懈蟹褉邪褋褏芯写芯胁邪薪芯 ${consumed} 懈蟹 ${total} 褌褉邪褎懈泻邪',
			'components.subscriptionInfo.remainingTraffic' => '袨褋褌邪胁褕懈泄褋褟 褌褉邪褎懈泻',
			'components.subscriptionInfo.remainingUsage' => '袨褋褌邪谢芯褋褜',
			'components.subscriptionInfo.profileSite' => '袩褉芯胁邪泄写械褉',
			'components.subscriptionInfo.profileSupport' => '袩芯写写械褉卸泻邪',
			'dialogs.sortProfiles.title' => '小芯褉褌懈褉芯胁邪褌褜 锌芯',
			'dialogs.sortProfiles.sort.name' => '袩芯 邪谢褎邪胁懈褌褍',
			'dialogs.sortProfiles.sort.lastUpdate' => '袩芯褋谢械写薪械屑褍 芯斜薪芯胁谢械薪懈褞',
			'dialogs.warpLicense.title' => '小芯谐谢邪褕械薪懈械 芯 WARP 芯褌 Cloudflare',
			'dialogs.warpLicense.description' => ({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [ const TextSpan(text: 'Cloudflare WARP - 褝褌芯 斜械褋锌谢邪褌薪褘泄 锌褉芯胁邪泄写械褉 WireGuard VPN. 袙泻谢褞褔邪褟 褝褌褍 芯锌褑懈褞, 胁褘 褋芯谐谢邪褕邪械褌械褋褜 褋 '), tos('校褋谢芯胁懈褟屑懈 芯斜褋谢褍卸懈胁邪薪懈褟'), const TextSpan(text: ' 懈 '), privacy('袩芯谢懈褌懈泻芯泄 泻芯薪褎懈写械薪褑懈邪谢褜薪芯褋褌懈'), const TextSpan(text: ' Cloudflare WARP.'), ]), 
			'dialogs.newVersion.title' => '袛芯褋褌褍锌薪芯 芯斜薪芯胁谢械薪懈械',
			'dialogs.newVersion.msg' => '袛芯褋褌褍锌薪邪 薪芯胁邪褟 胁械褉褋懈褟 ${_root.common.appTitle}. 啸芯褌懈褌械 芯斜薪芯胁懈褌褜 褋械泄褔邪褋?',
			'dialogs.newVersion.currentVersion' => '孝械泻褍褖邪褟 胁械褉褋懈褟: ',
			'dialogs.newVersion.newVersion' => '袧芯胁邪褟 胁械褉褋懈褟: ',
			'dialogs.newVersion.updateNow' => '袨斜薪芯胁懈褌褜 褋械泄褔邪褋',
			'dialogs.confirmation.settings.import.msg' => '协褌芯 锌械褉械蟹邪锌懈褕械褌 胁褋械 锌邪褉邪屑械褌褉褘 泻芯薪褎懈谐褍褉邪褑懈懈 锌褉械写芯褋褌邪胁谢械薪薪褘屑懈 蟹薪邪褔械薪懈褟屑懈. 袙褘 褍胁械褉械薪褘?',
			'dialogs.confirmation.profile.delete.title' => '校写邪谢懈褌褜 锌褉芯褎懈谢褜',
			'dialogs.confirmation.profile.delete.msg' => '袙褘 褍胁械褉械薪褘, 褔褌芯 褏芯褌懈褌械 薪邪胁褋械谐写邪 褍写邪谢懈褌褜 褝褌芯褌 锌褉芯褎懈谢褜?',
			'dialogs.confirmation.perAppProxy.shareOnGithub.title' => '校谢褍褔褕械薪懈械 邪胁褌芯胁褘斜芯褉邪',
			'dialogs.confirmation.perAppProxy.shareOnGithub.msg' => '袛械谢褟褋褜 胁褘斜褉邪薪薪褘屑懈 锌褉懈谢芯卸械薪懈褟屑懈, 胁褘 锌芯屑芯谐邪械褌械 锌芯锌芯谢薪懈褌褜 褋锌懈褋芯泻 "邪胁褌芯胁褘斜芯褉邪"',
			'dialogs.confirmation.perAppProxy.import.msg' => '协褌芯 蟹邪屑械薪懈褌 胁褋械 胁邪褕懈 褌械泻褍褖懈械 薪邪褋褌褉芯泄泻懈 锌褉芯泻褋懈 写谢褟 锌褉懈谢芯卸械薪懈泄. 袙褘 褍胁械褉械薪褘, 褔褌芯 褏芯褌懈褌械 锌褉芯写芯谢卸懈褌褜?',
			'dialogs.confirmation.routeRule.delete.title' => '校写邪谢懈褌褜 锌褉邪胁懈谢芯',
			'dialogs.confirmation.routeRule.delete.msg' => ({required Object rulename}) => '袙褘 褍胁械褉械薪褘, 褔褌芯 褏芯褌懈褌械 褍写邪谢懈褌褜 锌褉邪胁懈谢芯 "${rulename}"?',
			'dialogs.experimentalNotice.title' => '袠褋锌芯谢褜蟹褍褞褌褋褟 褝泻褋锌械褉懈屑械薪褌邪谢褜薪褘械 褎褍薪泻褑懈懈',
			'dialogs.experimentalNotice.msg' => '袙褘 胁泻谢褞褔懈谢懈 薪械泻芯褌芯褉褘械 褝泻褋锌械褉懈屑械薪褌邪谢褜薪褘械 褎褍薪泻褑懈懈, 泻芯褌芯褉褘械 屑芯谐褍褌 锌芯胁谢懈褟褌褜 薪邪 泻邪褔械褋褌胁芯 褋芯械写懈薪械薪懈褟 懈 胁褘蟹胁邪褌褜 薪械锌褉械写胁懈写械薪薪褘械 芯褕懈斜泻懈. 袙褘 胁褋械谐写邪 屑芯卸械褌械 懈蟹屑械薪懈褌褜 懈谢懈 褋斜褉芯褋懈褌褜 褝褌懈 锌邪褉邪屑械褌褉褘 薪邪 褋褌褉邪薪懈褑械 薪邪褋褌褉芯械泻.',
			'dialogs.experimentalNotice.disable' => '袘芯谢褜褕械 薪械 锌芯泻邪蟹褘胁邪褌褜',
			'dialogs.noActiveProfile.title' => '袙褘斜械褉懈褌械 锌褉芯褎懈谢褜',
			'dialogs.noActiveProfile.msg' => '袛邪胁邪泄褌械 薪邪褔薪械屑 褋 写芯斜邪胁谢械薪懈褟 锌褉芯褎懈谢褟 锌芯写泻谢褞褔械薪懈褟, 泻芯褌芯褉褘泄 褋芯写械褉卸懈褌 写邪薪薪褘械 胁邪褕械谐芯 VPN-褋芯械写懈薪械薪懈褟.\n\n袝褖械 薪械褌 VPN-褋械褉胁械褉邪? 袧械 斜械褋锌芯泻芯泄褌械褋褜 鈥?锌褉芯褋褌芯 褋谢械写褍泄褌械 褉褍泻芯胁芯写褋褌胁褍 薪懈卸械, 褔褌芯斜褘 斜褘褋褌褉芯 懈 斜械褋锌谢邪褌薪芯 薪邪褋褌褉芯懈褌褜 械谐芯.',
			'dialogs.noActiveProfile.helpBtn.label' => '袩芯泻邪卸懈褌械, 泻邪泻',
			'dialogs.noActiveProfile.helpBtn.url' => 'https://github.com/shulaiyun/Sloth-VPN.git',
			'dialogs.unknownDomainsWarning.title' => '袩褉械写褍锌褉械卸写械薪懈械 芯 胁薪械褕薪械泄 褋褋褘谢泻械',
			'dialogs.unknownDomainsWarning.youAreAboutToVisit' => '袙褘 褋芯斜懈褉邪械褌械褋褜 锌械褉械泄褌懈 薪邪 褋邪泄褌:',
			'dialogs.unknownDomainsWarning.thisWebsiteIsNotInOurTrustedList' => '协褌芯褌 褋邪泄褌 薪械 胁褏芯写懈褌 胁 薪邪褕 褋锌懈褋芯泻 写芯胁械褉械薪薪褘褏. 袩芯卸邪谢褍泄褋褌邪, 写械泄褋褌胁褍泄褌械 褋 芯褋褌芯褉芯卸薪芯褋褌褜褞.',
			'dialogs.proxyInfo.fullTag' => '袩芯谢薪褘泄 褌械谐:',
			'dialogs.proxyInfo.type' => '孝懈锌:',
			'dialogs.proxyInfo.testTime' => '袙褉械屑褟 褌械褋褌邪:',
			'dialogs.proxyInfo.testDelay' => '袟邪写械褉卸泻邪 褌械褋褌邪:',
			'dialogs.proxyInfo.isSelected' => '袙褘斜褉邪薪:',
			'dialogs.proxyInfo.isGroup' => '协褌芯 谐褉褍锌锌邪',
			'dialogs.proxyInfo.isSecure' => '袟邪褖懈褖械薪芯:',
			'dialogs.proxyInfo.port' => '袩芯褉褌:',
			'dialogs.proxyInfo.host' => '啸芯褋褌:',
			'dialogs.proxyInfo.ip' => 'IP:',
			'dialogs.proxyInfo.countryCode' => '袣芯写 褋褌褉邪薪褘:',
			'dialogs.proxyInfo.region' => '袪械谐懈芯薪:',
			'dialogs.proxyInfo.city' => '袚芯褉芯写:',
			'dialogs.proxyInfo.asn' => 'ASN:',
			'dialogs.proxyInfo.organization' => '袨褉谐邪薪懈蟹邪褑懈褟:',
			'dialogs.proxyInfo.location' => '袦械褋褌芯锌芯谢芯卸械薪懈械:',
			'dialogs.proxyInfo.postalCode' => '袩芯褔褌芯胁褘泄 懈薪写械泻褋:',
			'dialogs.windowClosing.askEachTime' => '小锌褉邪褕懈胁邪褌褜 泻邪卸写褘泄 褉邪蟹',
			'dialogs.windowClosing.alertMessage' => '小泻褉褘褌褜 懈谢懈 胁褘泄褌懈 懈蟹 锌褉懈谢芯卸械薪懈褟?',
			'dialogs.windowClosing.remember' => '袟邪锌芯屑薪懈褌褜 屑芯泄 胁褘斜芯褉',
			'connection.tapToConnect' => '袧邪卸屑懈褌械 写谢褟 锌芯写泻谢褞褔械薪懈褟',
			'connection.connect' => '袩芯写泻谢褞褔懈褌褜',
			'connection.connecting' => '袩芯写泻谢褞褔械薪懈械...',
			'connection.connected' => '袩芯写泻谢褞褔械薪芯',
			'connection.disconnect' => '袨褌泻谢褞褔懈褌褜',
			'connection.disconnecting' => '袨褌泻谢褞褔械薪懈械...',
			'connection.reconnect' => '袩械褉械锌芯写泻谢褞褔懈褌褜',
			'connection.reconnectMsg' => '袩械褉械锌芯写泻谢褞褔械薪懈械 写谢褟 褍褔械褌邪 懈蟹屑械薪械薪懈泄...',
			'connection.secure' => '袟邪褖懈褖械薪芯 褋 锌芯屑芯褖褜褞 WARP',
			'errors.unexpected' => '袧械锌褉械写胁懈写械薪薪邪褟 芯褕懈斜泻邪',
			'errors.connection.unexpected' => '袧械锌褉械写胁懈写械薪薪邪褟 芯褕懈斜泻邪 锌芯写泻谢褞褔械薪懈褟',
			'errors.connection.timeout' => '孝邪泄屑-邪褍褌 锌芯写泻谢褞褔械薪懈褟',
			'errors.connection.badResponse' => '袧械胁械褉薪褘泄 芯褌胁械褌',
			'errors.connection.connectionError' => '袨褕懈斜泻邪 锌芯写泻谢褞褔械薪懈褟',
			'errors.connection.badCertificate' => '袧械写械泄褋褌胁懈褌械谢褜薪褘泄 褋械褉褌懈褎懈泻邪褌',
			'errors.profiles.unexpected' => '袧械锌褉械写胁懈写械薪薪邪褟 芯褕懈斜泻邪',
			'errors.profiles.notFound' => '袩褉芯褎懈谢褜 薪械 薪邪泄写械薪',
			'errors.profiles.invalidConfig' => '袧械胁械褉薪邪褟 泻芯薪褎懈谐褍褉邪褑懈褟',
			'errors.profiles.invalidUrl' => '袧械胁械褉薪褘泄 URL',
			'errors.profiles.canceledByUser' => '袨褌屑械薪械薪芯 锌芯谢褜蟹芯胁邪褌械谢械屑',
			'errors.connectivity.unexpected' => '袧械锌褉械写胁懈写械薪薪褘泄 褋斜芯泄',
			'errors.connectivity.missingVpnPermission' => '袨褌褋褍褌褋褌胁褍械褌 褉邪蟹褉械褕械薪懈械 薪邪 VPN',
			'errors.connectivity.missingNotificationPermission' => '袨褌褋褍褌褋褌胁褍械褌 褉邪蟹褉械褕械薪懈械 薪邪 褍胁械写芯屑谢械薪懈褟',
			'errors.connectivity.core' => '袨褕懈斜泻邪 褟写褉邪',
			'errors.singbox.serviceNotRunning' => '小谢褍卸斜邪 薪械 蟹邪锌褍褖械薪邪',
			'errors.singbox.missingPrivilege' => '袨褌褋褍褌褋褌胁褍褞褌 锌褉邪胁邪',
			'errors.singbox.missingPrivilegeMsg' => '袪械卸懈屑 VPN 褌褉械斜褍械褌 锌褉邪胁 邪写屑懈薪懈褋褌褉邪褌芯褉邪. 袥懈斜芯 锌械褉械蟹邪锌褍褋褌懈褌械 锌褉懈谢芯卸械薪懈械 芯褌 懈屑械薪懈 邪写屑懈薪懈褋褌褉邪褌芯褉邪, 谢懈斜芯 懈蟹屑械薪懈褌械 褉械卸懈屑 褋谢褍卸斜褘.',
			'errors.singbox.invalidConfigOptions' => '袧械胁械褉薪褘械 锌邪褉邪屑械褌褉褘 泻芯薪褎懈谐褍褉邪褑懈懈',
			'errors.singbox.invalidConfig' => '袧械胁械褉薪邪褟 泻芯薪褎懈谐褍褉邪褑懈褟',
			'errors.warp.missingLicense' => '袨褌褋褍褌褋褌胁褍械褌 谢懈褑械薪蟹懈褟 Warp',
			'errors.warp.missingLicenseMsg' => '袙褘斜褉邪薪薪褘泄 锌褉芯褎懈谢褜 懈褋锌芯谢褜蟹褍械褌 褎褍薪泻褑懈褞 WARP; 写谢褟 懈褋锌芯谢褜蟹芯胁邪薪懈褟 褝褌芯泄 褎褍薪泻褑懈懈 薪械芯斜褏芯写懈屑芯 锌褉懈薪褟褌褜 谢懈褑械薪蟹懈褞 WARP.',
			_ => null,
		};
	}
}

