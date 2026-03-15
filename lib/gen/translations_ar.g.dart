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
class TranslationsAr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonAr common = TranslationsCommonAr._(_root);
	@override late final TranslationsIntroAr intro = TranslationsIntroAr._(_root);
	@override late final TranslationsPagesAr pages = TranslationsPagesAr._(_root);
	@override late final TranslationsComponentsAr components = TranslationsComponentsAr._(_root);
	@override late final TranslationsDialogsAr dialogs = TranslationsDialogsAr._(_root);
	@override late final TranslationsConnectionAr connection = TranslationsConnectionAr._(_root);
	@override late final TranslationsErrorsAr errors = TranslationsErrorsAr._(_root);
}

// Path: common
class TranslationsCommonAr extends TranslationsCommonEn {
	TranslationsCommonAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get appTitle => '树懒VPN';
	@override String get start => '丕亘丿兀';
	@override String get version => '丕賱廿氐丿丕乇';
	@override String get ok => '賲賵丕賮賯';
	@override String get cancel => '廿賱睾丕亍';
	@override String get kContinue => '賲鬲丕亘毓丞';
	@override String get showMore => '毓乇囟 丕賱賲夭賷丿';
	@override String get showLess => '毓乇囟 兀賯賱';
	@override String get filter => '鬲氐賮賷丞';
	@override String get all => '丕賱賰賱';
	@override String get pause => '廿賷賯丕賮 賲丐賯鬲';
	@override String get resume => '丕爻鬲卅賳丕賮';
	@override String get clear => '賲爻丨';
	@override String get close => '廿睾賱丕賯';
	@override String get auto => '鬲賱賯丕卅賷';
	@override String get manually => '賷丿賵賷';
	@override String get name => '丕賱丕爻賲';
	@override String get url => '丕賱乇丕亘胤';
	@override String get add => '廿囟丕賮丞';
	@override String get clipboard => '丕賱丨丕賮馗丞';
	@override String get addToClipboard => '廿囟丕賮丞 廿賱賶 丕賱丨丕賮馗丞';
	@override String get scanQr => '賲爻丨 乇賲夭 QR';
	@override String get free => '賲噩丕賳賷';
	@override String get warp => 'WARP';
	@override String get fragment => 'Fragment';
	@override String get help => '賲爻丕毓丿丞';
	@override String get save => '丨賮馗';
	@override String get update => '鬲丨丿賷孬';
	@override String get share => '賲卮丕乇賰丞';
	@override String get edit => '鬲毓丿賷賱';
	@override String get delete => '丨匕賮';
	@override String get discard => '鬲噩丕賴賱';
	@override String get import => '丕爻鬲賷乇丕丿';
	@override String get export => '鬲氐丿賷乇';
	@override String get later => '賱丕丨賯賸丕';
	@override String get ignore => '鬲噩丕賴賱';
	@override String get quit => '禺乇賵噩';
	@override String get notSet => '睾賷乇 賲丨丿丿';
	@override String get hide => '廿禺賮丕亍';
	@override String get exit => '禺乇賵噩';
	@override String get reset => '廿毓丕丿丞 鬲毓賷賷賳';
	@override String get done => '鬲賲';
	@override String get search => '亘丨孬';
	@override String get decline => '乇賮囟';
	@override String get agree => '兀賵丕賮賯';
	@override String get empty => '賮丕乇睾';
	@override String get unknown => '睾賷乇 賲毓乇賵賮';
	@override String get hidden => '賲禺賮賷';
	@override String get timeout => '丕賳鬲賴賶 丕賱賵賯鬲';
	@override String get sort => '賮乇夭';
	@override String get dashboard => '賱賵丨丞 丕賱鬲丨賰賲';
	@override late final TranslationsCommonIntervalAr interval = TranslationsCommonIntervalAr._(_root);
	@override late final TranslationsCommonMsgAr msg = TranslationsCommonMsgAr._(_root);
}

// Path: intro
class TranslationsIntroAr extends TranslationsIntroEn {
	TranslationsIntroAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get banner => '賰賱 賲丕 鬲丨鬲丕噩賴 賱廿賳鬲乇賳鬲 亘賱丕 賯賷賵丿';
	@override TextSpan termsAndPolicyCaution({required InlineSpanBuilder tap}) => TextSpan(children: [
		const TextSpan(text: '亘丕賱丕爻鬲賲乇丕乇貙 兀賳鬲 鬲賵丕賮賯 毓賱賶 '),
		tap(_root.pages.about.termsAndConditions),
	]);
	@override TextSpan info({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [
		const TextSpan(text: '氐購賳毓 亘賭 鉂わ笍 亘賵丕爻胤丞 Hiddify - '),
		tap_source('賲賮鬲賵丨 丕賱賲氐丿乇'),
		const TextSpan(text: ' ('),
		tap_license('丕賱乇禺氐丞'),
		const TextSpan(text: ')'),
	]);
}

// Path: pages
class TranslationsPagesAr extends TranslationsPagesEn {
	TranslationsPagesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesHomeAr home = TranslationsPagesHomeAr._(_root);
	@override late final TranslationsPagesProxiesAr proxies = TranslationsPagesProxiesAr._(_root);
	@override late final TranslationsPagesProfilesAr profiles = TranslationsPagesProfilesAr._(_root);
	@override late final TranslationsPagesProfileDetailsAr profileDetails = TranslationsPagesProfileDetailsAr._(_root);
	@override late final TranslationsPagesLogsAr logs = TranslationsPagesLogsAr._(_root);
	@override late final TranslationsPagesAboutAr about = TranslationsPagesAboutAr._(_root);
	@override late final TranslationsPagesSettingsAr settings = TranslationsPagesSettingsAr._(_root);
}

// Path: components
class TranslationsComponentsAr extends TranslationsComponentsEn {
	TranslationsComponentsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsComponentsStatsAr stats = TranslationsComponentsStatsAr._(_root);
	@override late final TranslationsComponentsSubscriptionInfoAr subscriptionInfo = TranslationsComponentsSubscriptionInfoAr._(_root);
}

// Path: dialogs
class TranslationsDialogsAr extends TranslationsDialogsEn {
	TranslationsDialogsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsSortProfilesAr sortProfiles = TranslationsDialogsSortProfilesAr._(_root);
	@override late final TranslationsDialogsWarpLicenseAr warpLicense = TranslationsDialogsWarpLicenseAr._(_root);
	@override late final TranslationsDialogsNewVersionAr newVersion = TranslationsDialogsNewVersionAr._(_root);
	@override late final TranslationsDialogsConfirmationAr confirmation = TranslationsDialogsConfirmationAr._(_root);
	@override late final TranslationsDialogsExperimentalNoticeAr experimentalNotice = TranslationsDialogsExperimentalNoticeAr._(_root);
	@override late final TranslationsDialogsNoActiveProfileAr noActiveProfile = TranslationsDialogsNoActiveProfileAr._(_root);
	@override late final TranslationsDialogsUnknownDomainsWarningAr unknownDomainsWarning = TranslationsDialogsUnknownDomainsWarningAr._(_root);
	@override late final TranslationsDialogsProxyInfoAr proxyInfo = TranslationsDialogsProxyInfoAr._(_root);
	@override late final TranslationsDialogsWindowClosingAr windowClosing = TranslationsDialogsWindowClosingAr._(_root);
}

// Path: connection
class TranslationsConnectionAr extends TranslationsConnectionEn {
	TranslationsConnectionAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get tapToConnect => '丕賳賯乇 賱賱丕鬲氐丕賱';
	@override String get connect => '丕鬲氐丕賱';
	@override String get connecting => '噩丕乇 丕賱丕鬲氐丕賱...';
	@override String get connected => '賲鬲氐賱';
	@override String get disconnect => '賯胤毓 丕賱丕鬲氐丕賱';
	@override String get disconnecting => '噩丕乇賷 賯胤毓 丕賱丕鬲氐丕賱...';
	@override String get reconnect => '廿毓丕丿丞 丕賱丕鬲氐丕賱';
	@override String get reconnectMsg => '噩丕乇賷 廿毓丕丿丞 丕賱丕鬲氐丕賱 賱鬲胤亘賷賯 丕賱鬲睾賷賷乇丕鬲...';
	@override String get secure => '賲購丐賲賾賻賳 亘賵丕爻胤丞 WARP';
}

// Path: errors
class TranslationsErrorsAr extends TranslationsErrorsEn {
	TranslationsErrorsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '禺胤兀 睾賷乇 賲鬲賵賯毓';
	@override late final TranslationsErrorsConnectionAr connection = TranslationsErrorsConnectionAr._(_root);
	@override late final TranslationsErrorsProfilesAr profiles = TranslationsErrorsProfilesAr._(_root);
	@override late final TranslationsErrorsConnectivityAr connectivity = TranslationsErrorsConnectivityAr._(_root);
	@override late final TranslationsErrorsSingboxAr singbox = TranslationsErrorsSingboxAr._(_root);
	@override late final TranslationsErrorsWarpAr warp = TranslationsErrorsWarpAr._(_root);
}

// Path: common.interval
class TranslationsCommonIntervalAr extends TranslationsCommonIntervalEn {
	TranslationsCommonIntervalAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(n,
		zero: '',
		one: '賷賵賲 賵丕丨丿',
		two: '賷賵賲丕賳',
		few: '${n} 兀賷丕賲',
		many: '${n} 賷賵賲賸丕',
		other: '${n} 賷賵賲',
	);
	@override String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(n,
		zero: '',
		one: '爻丕毓丞 賵丕丨丿丞',
		two: '爻丕毓鬲丕賳',
		few: '${n} 爻丕毓丕鬲',
		many: '${n} 爻丕毓丞',
		other: '${n} 爻丕毓丞',
	);
}

// Path: common.msg
class TranslationsCommonMsgAr extends TranslationsCommonMsgEn {
	TranslationsCommonMsgAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgPermissionAr permission = TranslationsCommonMsgPermissionAr._(_root);
	@override late final TranslationsCommonMsgExportAr export = TranslationsCommonMsgExportAr._(_root);
	@override late final TranslationsCommonMsgImportAr import = TranslationsCommonMsgImportAr._(_root);
}

// Path: pages.home
class TranslationsPagesHomeAr extends TranslationsPagesHomeEn {
	TranslationsPagesHomeAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丕賱乇卅賷爻賷丞';
	@override String get quickSettings => '丕賱廿毓丿丕丿丕鬲 丕賱爻乇賷毓丞';
}

// Path: pages.proxies
class TranslationsPagesProxiesAr extends TranslationsPagesProxiesEn {
	TranslationsPagesProxiesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丕賱亘乇賵賰爻賷丕鬲';
	@override String get sort => '賮乇夭 丕賱亘乇賵賰爻賷丕鬲';
	@override String get testDelay => '丕禺鬲亘丕乇 丕賱鬲兀禺賷乇';
	@override String get empty => '賱丕 鬲賵噩丿 亘乇賵賰爻賷丕鬲 賲鬲丕丨丞';
	@override String get activeProxy => '丕賱亘乇賵賰爻賷 丕賱賳卮胤';
	@override String get unknownIp => 'IP 睾賷乇 賲毓乇賵賮';
	@override late final TranslationsPagesProxiesSortOptionsAr sortOptions = TranslationsPagesProxiesSortOptionsAr._(_root);
	@override late final TranslationsPagesProxiesIpInfoAr ipInfo = TranslationsPagesProxiesIpInfoAr._(_root);
	@override late final TranslationsPagesProxiesDelayAr delay = TranslationsPagesProxiesDelayAr._(_root);
}

// Path: pages.profiles
class TranslationsPagesProfilesAr extends TranslationsPagesProfilesEn {
	TranslationsPagesProfilesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丕賱賲賱賮丕鬲 丕賱卮禺氐賷丞';
	@override String get add => '廿囟丕賮丞 賲賱賮 卮禺氐賷';
	@override String get update => '鬲丨丿賷孬 丕賱賲賱賮 丕賱卮禺氐賷';
	@override String get viewAllProfiles => '毓乇囟 噩賲賷毓 丕賱賲賱賮丕鬲 丕賱卮禺氐賷丞';
	@override String activeProfileName({required Object name}) => '丕爻賲 丕賱賲賱賮 丕賱賳卮胤: "${name}".';
	@override String nonActiveProfileName({required Object name}) => '鬲丨丿賷丿 "${name}" 賰賲賱賮 賳卮胤';
	@override String get freeSubNotFound => '賱賲 賷鬲賲 丕賱毓孬賵乇 毓賱賶 丕卮鬲乇丕賰 賲噩丕賳賷';
	@override String freeSubNotFoundForRegion({required Object region}) => '賱賲 賷鬲賲 丕賱毓孬賵乇 毓賱賶 丕卮鬲乇丕賰 賲噩丕賳賷 賱賲賳胤賯丞 "${region}"';
	@override String get failedToLoad => '賮卮賱 丕賱鬲丨賲賷賱';
	@override String get updateSubscriptions => '鬲丨丿賷孬 丕賱丕卮鬲乇丕賰丕鬲';
	@override late final TranslationsPagesProfilesShareAr share = TranslationsPagesProfilesShareAr._(_root);
	@override late final TranslationsPagesProfilesMsgAr msg = TranslationsPagesProfilesMsgAr._(_root);
}

// Path: pages.profileDetails
class TranslationsPagesProfileDetailsAr extends TranslationsPagesProfileDetailsEn {
	TranslationsPagesProfileDetailsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丕賱賲賱賮 丕賱卮禺氐賷';
	@override String get lastUpdate => '丌禺乇 鬲丨丿賷孬';
	@override late final TranslationsPagesProfileDetailsFormAr form = TranslationsPagesProfileDetailsFormAr._(_root);
}

// Path: pages.logs
class TranslationsPagesLogsAr extends TranslationsPagesLogsEn {
	TranslationsPagesLogsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丕賱爻噩賱丕鬲';
	@override String get shareCoreLogs => '賲卮丕乇賰丞 爻噩賱丕鬲 丕賱賳賵丕丞';
	@override String get shareAppLogs => '賲卮丕乇賰丞 爻噩賱丕鬲 丕賱鬲胤亘賷賯';
}

// Path: pages.about
class TranslationsPagesAboutAr extends TranslationsPagesAboutEn {
	TranslationsPagesAboutAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丨賵賱 丕賱鬲胤亘賷賯';
	@override String get notAvailableMsg => '兀賳鬲 鬲爻鬲禺丿賲 兀丨丿孬 廿氐丿丕乇 亘丕賱賮毓賱';
	@override String get checkForUpdate => '丕賱鬲丨賯賯 賲賳 賵噩賵丿 鬲丨丿賷孬丕鬲';
	@override String get openWorkingDir => '賮鬲丨 賲噩賱丿 丕賱毓賲賱';
	@override String get sourceCode => '丕賱賰賵丿 丕賱賲氐丿乇賷';
	@override String get telegramChannel => '賯賳丕丞 丕賱鬲賷賱賷噩乇丕賲';
	@override String get termsAndConditions => '丕賱卮乇賵胤 賵丕賱兀丨賰丕賲';
	@override String get privacyPolicy => '爻賷丕爻丞 丕賱禺氐賵氐賷丞';
}

// Path: pages.settings
class TranslationsPagesSettingsAr extends TranslationsPagesSettingsEn {
	TranslationsPagesSettingsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丕賱廿毓丿丕丿丕鬲';
	@override String get resetTunnel => '廿毓丕丿丞 鬲毓賷賷賳 賲賱賮 VPN';
	@override late final TranslationsPagesSettingsOptionsAr options = TranslationsPagesSettingsOptionsAr._(_root);
	@override late final TranslationsPagesSettingsGeneralAr general = TranslationsPagesSettingsGeneralAr._(_root);
	@override late final TranslationsPagesSettingsRoutingAr routing = TranslationsPagesSettingsRoutingAr._(_root);
	@override late final TranslationsPagesSettingsDnsAr dns = TranslationsPagesSettingsDnsAr._(_root);
	@override late final TranslationsPagesSettingsInboundAr inbound = TranslationsPagesSettingsInboundAr._(_root);
	@override late final TranslationsPagesSettingsTlsTricksAr tlsTricks = TranslationsPagesSettingsTlsTricksAr._(_root);
	@override late final TranslationsPagesSettingsWarpAr warp = TranslationsPagesSettingsWarpAr._(_root);
}

// Path: components.stats
class TranslationsComponentsStatsAr extends TranslationsComponentsStatsEn {
	TranslationsComponentsStatsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get connection => '丕賱丕鬲氐丕賱';
	@override String get traffic => '丕賱亘賷丕賳丕鬲';
	@override String get trafficLive => '丕賱亘賷丕賳丕鬲 丕賱丨丕賱賷丞';
	@override String get trafficTotal => '廿噩賲丕賱賷 丕賱亘賷丕賳丕鬲';
	@override String get uplink => '丕賱廿乇爻丕賱';
	@override String get downlink => '丕賱丕爻鬲賯亘丕賱';
	@override String get speed => '丕賱爻乇毓丞';
	@override String get totalTransferred => '廿噩賲丕賱賷 丕賱賳賯賱';
}

// Path: components.subscriptionInfo
class TranslationsComponentsSubscriptionInfoAr extends TranslationsComponentsSubscriptionInfoEn {
	TranslationsComponentsSubscriptionInfoAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get upload => '丕賱乇賮毓';
	@override String get download => '丕賱鬲賳夭賷賱';
	@override String get total => '廿噩賲丕賱賷 丕賱亘賷丕賳丕鬲';
	@override String get expireDate => '鬲丕乇賷禺 丕賱丕賳鬲賴丕亍';
	@override String get expired => '賲賳鬲賴賷 丕賱氐賱丕丨賷丞';
	@override String get noTraffic => '賳賮丿鬲 丕賱亘丕賯丞';
	@override String get remainingTime => '丕賱賵賯鬲 丕賱賲鬲亘賯賷';
	@override String remainingDuration({required Object duration}) => '賲鬲亘賯賺 ${duration} 賷賵賲';
	@override String remainingDurationNew({required Object duration}) => '${duration} 賷賵賲';
	@override String remainingTrafficSemanticLabel({required Object consumed, required Object total}) => '鬲賲 丕爻鬲賴賱丕賰 ${consumed} 賲賳 ${total}';
	@override String get remainingTraffic => '丕賱亘賷丕賳丕鬲 丕賱賲鬲亘賯賷丞';
	@override String get remainingUsage => '丕賱賲鬲亘賯賷';
	@override String get profileSite => '丕賱賲夭賵賾丿';
	@override String get profileSupport => '丕賱丿毓賲';
}

// Path: dialogs.sortProfiles
class TranslationsDialogsSortProfilesAr extends TranslationsDialogsSortProfilesEn {
	TranslationsDialogsSortProfilesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '賮乇夭 丨爻亘';
	@override late final TranslationsDialogsSortProfilesSortAr sort = TranslationsDialogsSortProfilesSortAr._(_root);
}

// Path: dialogs.warpLicense
class TranslationsDialogsWarpLicenseAr extends TranslationsDialogsWarpLicenseEn {
	TranslationsDialogsWarpLicenseAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '賲賵丕賮賯丞 Cloudflare WARP';
	@override TextSpan description({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [
		const TextSpan(text: 'Cloudflare WARP 賴賵 賲夭賵丿 VPN 賲噩丕賳賷 賱賭 WireGuard. 亘鬲賮毓賷賱 賴匕丕 丕賱禺賷丕乇貙 賮廿賳賰 鬲賵丕賮賯 毓賱賶 '),
		tos('卮乇賵胤 丕賱禺丿賲丞'),
		const TextSpan(text: ' 賵 '),
		privacy('爻賷丕爻丞 丕賱禺氐賵氐賷丞'),
		const TextSpan(text: ' 丕賱禺丕氐丞 亘賭 Cloudflare WARP.'),
	]);
}

// Path: dialogs.newVersion
class TranslationsDialogsNewVersionAr extends TranslationsDialogsNewVersionEn {
	TranslationsDialogsNewVersionAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '鬲丨丿賷孬 賲鬲丕丨';
	@override String get msg => '廿氐丿丕乇 噩丿賷丿 賲賳 ${_root.common.appTitle} 賲鬲丕丨. 賴賱 鬲乇睾亘 賮賷 丕賱鬲丨丿賷孬 丕賱丌賳責';
	@override String get currentVersion => '丕賱廿氐丿丕乇 丕賱丨丕賱賷: ';
	@override String get newVersion => '丕賱廿氐丿丕乇 丕賱噩丿賷丿: ';
	@override String get updateNow => '丕賱鬲丨丿賷孬 丕賱丌賳';
}

// Path: dialogs.confirmation
class TranslationsDialogsConfirmationAr extends TranslationsDialogsConfirmationEn {
	TranslationsDialogsConfirmationAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsAr settings = TranslationsDialogsConfirmationSettingsAr._(_root);
	@override late final TranslationsDialogsConfirmationProfileAr profile = TranslationsDialogsConfirmationProfileAr._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyAr perAppProxy = TranslationsDialogsConfirmationPerAppProxyAr._(_root);
	@override late final TranslationsDialogsConfirmationRouteRuleAr routeRule = TranslationsDialogsConfirmationRouteRuleAr._(_root);
}

// Path: dialogs.experimentalNotice
class TranslationsDialogsExperimentalNoticeAr extends TranslationsDialogsExperimentalNoticeEn {
	TranslationsDialogsExperimentalNoticeAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '賲賷夭丕鬲 鬲噩乇賷亘賷丞 賯賷丿 丕賱丕爻鬲禺丿丕賲';
	@override String get msg => '賱賯丿 賮毓賾賱鬲 賲賷夭丕鬲 鬲噩乇賷亘賷丞 賯丿 鬲丐孬乇 毓賱賶 噩賵丿丞 丕賱丕鬲氐丕賱 賵鬲爻亘亘 兀禺胤丕亍 睾賷乇 賲鬲賵賯毓丞. 賷賲賰賳賰 丿丕卅賲賸丕 鬲睾賷賷乇 賴匕賴 丕賱禺賷丕乇丕鬲 兀賵 廿毓丕丿丞 鬲毓賷賷賳賴丕 賲賳 氐賮丨丞 丕賱廿毓丿丕丿丕鬲.';
	@override String get disable => '賱丕 鬲毓乇囟 賲乇丞 兀禺乇賶';
}

// Path: dialogs.noActiveProfile
class TranslationsDialogsNoActiveProfileAr extends TranslationsDialogsNoActiveProfileEn {
	TranslationsDialogsNoActiveProfileAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丕禺鬲乇 賲賱賮賸丕 卮禺氐賷賸丕';
	@override String get msg => '賱賱亘丿亍貙 賯賲 亘廿囟丕賮丞 賲賱賮 丕鬲氐丕賱 賷丨鬲賵賷 毓賱賶 鬲賮丕氐賷賱 丕鬲氐丕賱 VPN 丕賱禺丕氐丞 亘賰.\n\n兀賱賷爻 賱丿賷賰 禺丕丿賲 VPN 亘毓丿責 賱丕 鬲賯賱賯貙 丕鬲亘毓 丕賱丿賱賷賱 兀丿賳丕賴 賱廿毓丿丕丿 賵丕丨丿 亘爻乇毓丞 賵賲噩丕賳賸丕.';
	@override late final TranslationsDialogsNoActiveProfileHelpBtnAr helpBtn = TranslationsDialogsNoActiveProfileHelpBtnAr._(_root);
}

// Path: dialogs.unknownDomainsWarning
class TranslationsDialogsUnknownDomainsWarningAr extends TranslationsDialogsUnknownDomainsWarningEn {
	TranslationsDialogsUnknownDomainsWarningAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '鬲丨匕賷乇 賲賳 乇丕亘胤 禺丕乇噩賷';
	@override String get youAreAboutToVisit => '兀賳鬲 毓賱賶 賵卮賰 夭賷丕乇丞:';
	@override String get thisWebsiteIsNotInOurTrustedList => '賴匕丕 丕賱賲賵賯毓 賱賷爻 囟賲賳 賯丕卅賲丞 丕賱賲賵丕賯毓 丕賱賲賵孬賵賯丞 賱丿賷賳丕. 賷乇噩賶 丕賱賲鬲丕亘毓丞 亘丨匕乇.';
}

// Path: dialogs.proxyInfo
class TranslationsDialogsProxyInfoAr extends TranslationsDialogsProxyInfoEn {
	TranslationsDialogsProxyInfoAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get fullTag => '丕賱毓賱丕賲丞 丕賱賰丕賲賱丞:';
	@override String get type => '丕賱賳賵毓:';
	@override String get testTime => '賵賯鬲 丕賱丕禺鬲亘丕乇:';
	@override String get testDelay => '鬲兀禺賷乇 丕賱丕禺鬲亘丕乇:';
	@override String get isSelected => '賲丨丿丿:';
	@override String get isGroup => '賲噩賲賵毓丞';
	@override String get isSecure => '丌賲賳:';
	@override String get port => '丕賱賲賳賮匕:';
	@override String get host => '丕賱賲囟賷賮:';
	@override String get ip => 'IP:';
	@override String get countryCode => '乇賲夭 丕賱丿賵賱丞:';
	@override String get region => '丕賱賲賳胤賯丞:';
	@override String get city => '丕賱賲丿賷賳丞:';
	@override String get asn => 'ASN:';
	@override String get organization => '丕賱賲購賳馗賲丞:';
	@override String get location => '丕賱賲賵賯毓:';
	@override String get postalCode => '丕賱乇賲夭 丕賱亘乇賷丿賷:';
}

// Path: dialogs.windowClosing
class TranslationsDialogsWindowClosingAr extends TranslationsDialogsWindowClosingEn {
	TranslationsDialogsWindowClosingAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get askEachTime => '丕賱爻丐丕賱 賰賱 賲乇丞';
	@override String get alertMessage => '賴賱 鬲乇賷丿 廿禺賮丕亍 丕賱鬲胤亘賷賯 兀賲 丕賱禺乇賵噩 賲賳賴責';
	@override String get remember => '鬲匕賰乇 禺賷丕乇賷';
}

// Path: errors.connection
class TranslationsErrorsConnectionAr extends TranslationsErrorsConnectionEn {
	TranslationsErrorsConnectionAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '禺胤兀 丕鬲氐丕賱 睾賷乇 賲鬲賵賯毓';
	@override String get timeout => '丕賳鬲賴賶 賵賯鬲 丕賱丕鬲氐丕賱';
	@override String get badResponse => '丕爻鬲噩丕亘丞 睾賷乇 氐丕賱丨丞';
	@override String get connectionError => '禺胤兀 賮賷 丕賱丕鬲氐丕賱';
	@override String get badCertificate => '卮賴丕丿丞 睾賷乇 氐丕賱丨丞';
}

// Path: errors.profiles
class TranslationsErrorsProfilesAr extends TranslationsErrorsProfilesEn {
	TranslationsErrorsProfilesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '禺胤兀 睾賷乇 賲鬲賵賯毓';
	@override String get notFound => '賱賲 賷鬲賲 丕賱毓孬賵乇 毓賱賶 丕賱賲賱賮 丕賱卮禺氐賷';
	@override String get invalidConfig => '鬲賰賵賷賳丕鬲 睾賷乇 氐丕賱丨丞';
	@override String get invalidUrl => '乇丕亘胤 睾賷乇 氐丕賱丨';
	@override String get canceledByUser => '鬲賲 丕賱廿賱睾丕亍 賲賳 賯亘賱 丕賱賲爻鬲禺丿賲';
}

// Path: errors.connectivity
class TranslationsErrorsConnectivityAr extends TranslationsErrorsConnectivityEn {
	TranslationsErrorsConnectivityAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '賮卮賱 睾賷乇 賲鬲賵賯毓';
	@override String get missingVpnPermission => '廿匕賳 丕賱賭 VPN 賲賮賯賵丿';
	@override String get missingNotificationPermission => '廿匕賳 丕賱廿卮毓丕乇丕鬲 賲賮賯賵丿';
	@override String get core => '禺胤兀 賮賷 丕賱賳賵丕丞';
}

// Path: errors.singbox
class TranslationsErrorsSingboxAr extends TranslationsErrorsSingboxEn {
	TranslationsErrorsSingboxAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get serviceNotRunning => '丕賱禺丿賲丞 賱丕 鬲毓賲賱';
	@override String get missingPrivilege => '氐賱丕丨賷丕鬲 賲胤賱賵亘丞';
	@override String get missingPrivilegeMsg => '賵囟毓 丕賱賭 VPN 賷鬲胤賱亘 氐賱丕丨賷丕鬲 丕賱賲爻丐賵賱. 賷乇噩賶 廿毓丕丿丞 鬲卮睾賷賱 丕賱鬲胤亘賷賯 賰賲爻丐賵賱 兀賵 鬲睾賷賷乇 賵囟毓 丕賱禺丿賲丞.';
	@override String get invalidConfigOptions => '禺賷丕乇丕鬲 鬲賰賵賷賳 睾賷乇 氐丕賱丨丞';
	@override String get invalidConfig => '鬲賰賵賷賳 睾賷乇 氐丕賱丨';
}

// Path: errors.warp
class TranslationsErrorsWarpAr extends TranslationsErrorsWarpEn {
	TranslationsErrorsWarpAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get missingLicense => '乇禺氐丞 WARP 賲賮賯賵丿丞';
	@override String get missingLicenseMsg => '丕賱賲賱賮 丕賱卮禺氐賷 丕賱賲丨丿丿 賷爻鬲禺丿賲 賲賷夭丞 WARP. 賱丕爻鬲禺丿丕賲 賴匕賴 丕賱賲賷夭丞貙 賷噩亘 丕賱賲賵丕賮賯丞 毓賱賶 卮乇賵胤 乇禺氐丞 WARP.';
}

// Path: common.msg.permission
class TranslationsCommonMsgPermissionAr extends TranslationsCommonMsgPermissionEn {
	TranslationsCommonMsgPermissionAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get denied => '鬲賲 乇賮囟 丕賱廿匕賳';
}

// Path: common.msg.export
class TranslationsCommonMsgExportAr extends TranslationsCommonMsgExportEn {
	TranslationsCommonMsgExportAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgExportClipboardAr clipboard = TranslationsCommonMsgExportClipboardAr._(_root);
	@override late final TranslationsCommonMsgExportFileAr file = TranslationsCommonMsgExportFileAr._(_root);
}

// Path: common.msg.import
class TranslationsCommonMsgImportAr extends TranslationsCommonMsgImportEn {
	TranslationsCommonMsgImportAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get confirm => '鬲兀賰賷丿 丕賱丕爻鬲賷乇丕丿';
	@override String get success => '鬲賲 丕賱丕爻鬲賷乇丕丿 亘賳噩丕丨';
	@override String get failure => '賮卮賱 丕賱丕爻鬲賷乇丕丿';
}

// Path: pages.proxies.sortOptions
class TranslationsPagesProxiesSortOptionsAr extends TranslationsPagesProxiesSortOptionsEn {
	TranslationsPagesProxiesSortOptionsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get unsorted => '丕賱丕賮鬲乇丕囟賷';
	@override String get name => '兀亘噩丿賷賸丕';
	@override String get delay => '丨爻亘 丕賱鬲兀禺賷乇';
}

// Path: pages.proxies.ipInfo
class TranslationsPagesProxiesIpInfoAr extends TranslationsPagesProxiesIpInfoEn {
	TranslationsPagesProxiesIpInfoAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get address => '毓賳賵丕賳 IP';
	@override String get country => '丕賱丿賵賱丞';
	@override String get organization => '丕賱賲購賳馗賲丞';
}

// Path: pages.proxies.delay
class TranslationsPagesProxiesDelayAr extends TranslationsPagesProxiesDelayEn {
	TranslationsPagesProxiesDelayAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String result({required Object delay}) => '丕賱鬲兀禺賷乇: ${delay} 賲賱賱賷 孬丕賳賷丞';
	@override String get timeout => '丕賳鬲賴賶 賵賯鬲 丕禺鬲亘丕乇 丕賱鬲兀禺賷乇';
	@override String get testing => '丕賱鬲兀禺賷乇: 賯賷丿 丕賱丕禺鬲亘丕乇...';
}

// Path: pages.profiles.share
class TranslationsPagesProfilesShareAr extends TranslationsPagesProfilesShareEn {
	TranslationsPagesProfilesShareAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get urlToClipboard => '乇丕亘胤 URL 廿賱賶 丕賱丨丕賮馗丞';
	@override String get showUrlQr => '毓乇囟 乇賲夭 QR 賱賱乇丕亘胤';
	@override String get jsonToClipboard => 'JSON 廿賱賶 丕賱丨丕賮馗丞';
}

// Path: pages.profiles.msg
class TranslationsPagesProfilesMsgAr extends TranslationsPagesProfilesMsgEn {
	TranslationsPagesProfilesMsgAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesProfilesMsgSaveAr save = TranslationsPagesProfilesMsgSaveAr._(_root);
	@override String get invalidUrl => '乇丕亘胤 睾賷乇 氐丕賱丨';
	@override late final TranslationsPagesProfilesMsgAddAr add = TranslationsPagesProfilesMsgAddAr._(_root);
	@override late final TranslationsPagesProfilesMsgUpdateAr update = TranslationsPagesProfilesMsgUpdateAr._(_root);
	@override late final TranslationsPagesProfilesMsgDeleteAr delete = TranslationsPagesProfilesMsgDeleteAr._(_root);
}

// Path: pages.profileDetails.form
class TranslationsPagesProfileDetailsFormAr extends TranslationsPagesProfileDetailsFormEn {
	TranslationsPagesProfileDetailsFormAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get nameHint => '丕爻賲 丕賱賲賱賮 丕賱卮禺氐賷';
	@override String get emptyName => '丕賱丕爻賲 賲胤賱賵亘';
	@override String get invalidUrl => '乇丕亘胤 睾賷乇 氐丕賱丨';
	@override String get urlHint => '乇丕亘胤 丕賱廿毓丿丕丿丕鬲 丕賱賰丕賲賱';
	@override String get disableAutoUpdate => '鬲毓胤賷賱 丕賱鬲丨丿賷孬 丕賱鬲賱賯丕卅賷';
	@override String get autoUpdateInterval => '賮丕氐賱 丕賱鬲丨丿賷孬 丕賱鬲賱賯丕卅賷';
	@override String get loading => '噩丕乇賷 廿囟丕賮丞 丕賱賲賱賮 丕賱卮禺氐賷...';
}

// Path: pages.settings.options
class TranslationsPagesSettingsOptionsAr extends TranslationsPagesSettingsOptionsEn {
	TranslationsPagesSettingsOptionsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsOptionsImportAr import = TranslationsPagesSettingsOptionsImportAr._(_root);
	@override late final TranslationsPagesSettingsOptionsExportAr export = TranslationsPagesSettingsOptionsExportAr._(_root);
	@override String get reset => '廿毓丕丿丞 鬲毓賷賷賳 丕賱禺賷丕乇丕鬲';
}

// Path: pages.settings.general
class TranslationsPagesSettingsGeneralAr extends TranslationsPagesSettingsGeneralEn {
	TranslationsPagesSettingsGeneralAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '毓丕賲';
	@override String get locale => '丕賱賱睾丞';
	@override String get themeMode => '丕賱爻賲丞';
	@override late final TranslationsPagesSettingsGeneralThemeModesAr themeModes = TranslationsPagesSettingsGeneralThemeModesAr._(_root);
	@override String get enableAnalytics => '鬲賮毓賷賱 丕賱鬲丨賱賷賱丕鬲';
	@override String get enableAnalyticsMsg => '丕賱爻賲丕丨 亘噩賲毓 亘賷丕賳丕鬲 丕賱鬲丨賱賷賱 賵鬲賯丕乇賷乇 丕賱兀毓胤丕賱 賱鬲丨爻賷賳 丕賱鬲胤亘賷賯';
	@override String get autoIpCheck => '丕賱鬲丨賯賯 丕賱鬲賱賯丕卅賷 賲賳 IP 丕賱丕鬲氐丕賱';
	@override String get dynamicNotification => '毓乇囟 丕賱爻乇毓丞 賮賷 丕賱廿卮毓丕乇';
	@override String get hapticFeedback => '乇丿賵丿 丕賱賮毓賱 丕賱賱賲爻賷丞';
	@override String get actionAtClosing => '丕賱廿噩乇丕亍 毓賳丿 丕賱廿睾賱丕賯';
	@override String get autoStart => '丕賱亘丿亍 毓賳丿 鬲爻噩賷賱 丕賱丿禺賵賱';
	@override String get silentStart => '丕賱亘丿亍 賮賷 丕賱禺賱賮賷丞';
	@override String get ignoreBatteryOptimizations => '鬲噩丕賴賱 鬲丨爻賷賳丕鬲 丕賱亘胤丕乇賷丞';
	@override String get ignoreBatteryOptimizationsMsg => '廿夭丕賱丞 丕賱賯賷賵丿 賱賱丨氐賵賱 毓賱賶 兀賮囟賱 兀丿丕亍 賱賱賭 VPN';
	@override String get memoryLimit => '丨丿 丕賱匕丕賰乇丞';
	@override String get memoryLimitMsg => '賯賲 亘鬲賮毓賷賱 賴匕丕 丕賱禺賷丕乇 廿匕丕 賰賳鬲 鬲賵丕噩賴 兀禺胤丕亍 賳賮丕丿 丕賱匕丕賰乇丞 兀賵 鬲毓胤賱 丕賱鬲胤亘賷賯 亘卮賰賱 賲鬲賰乇乇';
	@override String get debugMode => '賵囟毓 丕賱鬲氐丨賷丨';
	@override String get debugModeMsg => '兀毓丿 鬲卮睾賷賱 丕賱鬲胤亘賷賯 賱鬲胤亘賷賯 賴匕丕 丕賱鬲睾賷賷乇';
	@override String get logLevel => '賲爻鬲賵賶 丕賱爻噩賱';
	@override String get connectionTestUrl => '乇丕亘胤 丕禺鬲亘丕乇 丕賱丕鬲氐丕賱';
	@override String get urlTestInterval => '賮丕氐賱 丕禺鬲亘丕乇 丕賱乇丕亘胤';
	@override String get clashApiPort => '賲賳賮匕 Clash API';
	@override String get useXrayCoreWhenPossible => '丕爻鬲禺丿丕賲 xray-core 毓賳丿 丕賱廿賲賰丕賳';
	@override String get useXrayCoreWhenPossibleMsg => '丕爻鬲禺丿賲 xray-core 毓賳丿 鬲丨賱賷賱 乇賵丕亘胤 丕賱丕卮鬲乇丕賰. 鬲丨鬲丕噩 廿賱賶 廿毓丕丿丞 丕爻鬲賷乇丕丿 丕賱乇丕亘胤 賱鬲賮毓賷賱 賴匕丕 丕賱禺賷丕乇';
}

// Path: pages.settings.routing
class TranslationsPagesSettingsRoutingAr extends TranslationsPagesSettingsRoutingEn {
	TranslationsPagesSettingsRoutingAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丕賱鬲賵噩賷賴';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAr perAppProxy = TranslationsPagesSettingsRoutingPerAppProxyAr._(_root);
	@override String get region => '丕賱賲賳胤賯丞';
	@override late final TranslationsPagesSettingsRoutingRegionsAr regions = TranslationsPagesSettingsRoutingRegionsAr._(_root);
	@override late final TranslationsPagesSettingsRoutingBalancerStrategyAr balancerStrategy = TranslationsPagesSettingsRoutingBalancerStrategyAr._(_root);
	@override String get blockAds => '丨馗乇 丕賱廿毓賱丕賳丕鬲';
	@override String get bypassLan => '鬲噩丕賵夭 丕賱卮亘賰丞 丕賱賲丨賱賷丞';
	@override String get resolveDestination => '鬲丨丿賷丿 賵噩賴丞 丕賱丕鬲氐丕賱';
	@override String get ipv6Route => '鬲賵噩賷賴 IPv6';
	@override late final TranslationsPagesSettingsRoutingIpv6ModesAr ipv6Modes = TranslationsPagesSettingsRoutingIpv6ModesAr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleAr routeRule = TranslationsPagesSettingsRoutingRouteRuleAr._(_root);
}

// Path: pages.settings.dns
class TranslationsPagesSettingsDnsAr extends TranslationsPagesSettingsDnsEn {
	TranslationsPagesSettingsDnsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'DNS';
	@override String get remoteDns => 'DNS 丕賱亘毓賷丿';
	@override String get remoteDnsDomainStrategy => '丕爻鬲乇丕鬲賷噩賷丞 賳胤丕賯 DNS 丕賱亘毓賷丿';
	@override String get directDns => '賲丨賱賱 禺丕丿賲 丕賱氐丕丿乇 (賲亘丕卮乇)';
	@override String get directDnsDomainStrategy => '丕爻鬲乇丕鬲賷噩賷丞 丕賱賳胤丕賯 丕賱氐丕丿乇';
	@override String get enableDnsRouting => '鬲賲賰賷賳 鬲賵噩賷賴 DNS';
	@override String get enableFakeDns => '鬲賲賰賷賳 DNS 丕賱賵賴賲賷';
	@override late final TranslationsPagesSettingsDnsDomainStrategyAr domainStrategy = TranslationsPagesSettingsDnsDomainStrategyAr._(_root);
}

// Path: pages.settings.inbound
class TranslationsPagesSettingsInboundAr extends TranslationsPagesSettingsInboundEn {
	TranslationsPagesSettingsInboundAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丕賱賵丕乇丿';
	@override String get serviceMode => '賵囟毓 丕賱禺丿賲丞';
	@override late final TranslationsPagesSettingsInboundServiceModesAr serviceModes = TranslationsPagesSettingsInboundServiceModesAr._(_root);
	@override late final TranslationsPagesSettingsInboundShortServiceModesAr shortServiceModes = TranslationsPagesSettingsInboundShortServiceModesAr._(_root);
	@override String get strictRoute => '鬲賵噩賷賴 氐丕乇賲';
	@override String get tunImplementation => '鬲賳賮賷匕 Tun';
	@override late final TranslationsPagesSettingsInboundTunImplementationsAr tunImplementations = TranslationsPagesSettingsInboundTunImplementationsAr._(_root);
	@override String get mixedPort => '賲賳賮匕 賲禺鬲賱胤';
	@override String get tproxyPort => '賲賳賮匕 丕賱亘乇賵賰爻賷 丕賱卮賮丕賮';
	@override String get directPort => '賲賳賮匕 賲亘丕卮乇';
	@override String get redirectPort => '賲賳賮匕 廿毓丕丿丞 丕賱鬲賵噩賷賴';
	@override String get allowConnectionFromLan => '賲卮丕乇賰丞 VPN 毓賱賶 丕賱卮亘賰丞 丕賱賲丨賱賷丞';
}

// Path: pages.settings.tlsTricks
class TranslationsPagesSettingsTlsTricksAr extends TranslationsPagesSettingsTlsTricksEn {
	TranslationsPagesSettingsTlsTricksAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丨賷賱 TLS';
	@override String get enable => '鬲賮毓賷賱 fragment';
	@override String get packets => '丨夭賲 丕賱鬲噩夭卅丞';
	@override String get packetsTlsHello => 'TLS Hello';
	@override String get packets1_1 => '1-1';
	@override String get packets1_2 => '1-2';
	@override String get packets1_3 => '1-3';
	@override String get packets1_4 => '1-4';
	@override String get packets1_5 => '1-5';
	@override String get size => '丨噩賲 fragment';
	@override String get sleep => '鬲兀禺賷乇 fragment';
	@override late final TranslationsPagesSettingsTlsTricksMixedSniCaseAr mixedSniCase = TranslationsPagesSettingsTlsTricksMixedSniCaseAr._(_root);
	@override late final TranslationsPagesSettingsTlsTricksPaddingAr padding = TranslationsPagesSettingsTlsTricksPaddingAr._(_root);
}

// Path: pages.settings.warp
class TranslationsPagesSettingsWarpAr extends TranslationsPagesSettingsWarpEn {
	TranslationsPagesSettingsWarpAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'WARP';
	@override String get enable => '鬲賮毓賷賱 WARP';
	@override String get generateConfig => '廿賳卮丕亍 鬲賰賵賷賳 WARP';
	@override String get configGenerated => '鬲賲 廿賳卮丕亍 鬲賰賵賷賳 WARP';
	@override String get missingConfig => '鬲賰賵賷賳 WARP 賲賮賯賵丿';
	@override String get detourMode => '賵囟毓 鬲賵噩賷賴 WARP';
	@override late final TranslationsPagesSettingsWarpDetourModesAr detourModes = TranslationsPagesSettingsWarpDetourModesAr._(_root);
	@override String get licenseKey => '賲賮鬲丕丨 丕賱鬲乇禺賷氐';
	@override String get cleanIp => 'IP 賳馗賷賮';
	@override String get port => '丕賱賲賳賮匕';
	@override late final TranslationsPagesSettingsWarpNoiseAr noise = TranslationsPagesSettingsWarpNoiseAr._(_root);
}

// Path: dialogs.sortProfiles.sort
class TranslationsDialogsSortProfilesSortAr extends TranslationsDialogsSortProfilesSortEn {
	TranslationsDialogsSortProfilesSortAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get name => '兀亘噩丿賷賸丕';
	@override String get lastUpdate => '丌禺乇 鬲丨丿賷孬';
}

// Path: dialogs.confirmation.settings
class TranslationsDialogsConfirmationSettingsAr extends TranslationsDialogsConfirmationSettingsEn {
	TranslationsDialogsConfirmationSettingsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsImportAr import = TranslationsDialogsConfirmationSettingsImportAr._(_root);
}

// Path: dialogs.confirmation.profile
class TranslationsDialogsConfirmationProfileAr extends TranslationsDialogsConfirmationProfileEn {
	TranslationsDialogsConfirmationProfileAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationProfileDeleteAr delete = TranslationsDialogsConfirmationProfileDeleteAr._(_root);
}

// Path: dialogs.confirmation.perAppProxy
class TranslationsDialogsConfirmationPerAppProxyAr extends TranslationsDialogsConfirmationPerAppProxyEn {
	TranslationsDialogsConfirmationPerAppProxyAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationPerAppProxyShareOnGithubAr shareOnGithub = TranslationsDialogsConfirmationPerAppProxyShareOnGithubAr._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyImportAr import = TranslationsDialogsConfirmationPerAppProxyImportAr._(_root);
}

// Path: dialogs.confirmation.routeRule
class TranslationsDialogsConfirmationRouteRuleAr extends TranslationsDialogsConfirmationRouteRuleEn {
	TranslationsDialogsConfirmationRouteRuleAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationRouteRuleDeleteAr delete = TranslationsDialogsConfirmationRouteRuleDeleteAr._(_root);
}

// Path: dialogs.noActiveProfile.helpBtn
class TranslationsDialogsNoActiveProfileHelpBtnAr extends TranslationsDialogsNoActiveProfileHelpBtnEn {
	TranslationsDialogsNoActiveProfileHelpBtnAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get label => '兀乇賳賷 賰賷賮';
	@override String get url => 'https://github.com/shulaiyun/Sloth-VPN.git';
}

// Path: common.msg.export.clipboard
class TranslationsCommonMsgExportClipboardAr extends TranslationsCommonMsgExportClipboardEn {
	TranslationsCommonMsgExportClipboardAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get success => '鬲賲鬲 丕賱廿囟丕賮丞 廿賱賶 丕賱丨丕賮馗丞 亘賳噩丕丨';
	@override String get failure => '賮卮賱 丕賱賳爻禺 廿賱賶 丕賱丨丕賮馗丞';
	@override String get contentTooLarge => '丕賱賲丨鬲賵賶 賰亘賷乇 噩丿賸丕. 丕爻鬲禺丿賲 鬲氐丿賷乇 丕賱賲賱賮 亘丿賱丕賸 賲賳 匕賱賰';
}

// Path: common.msg.export.file
class TranslationsCommonMsgExportFileAr extends TranslationsCommonMsgExportFileEn {
	TranslationsCommonMsgExportFileAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get success => '鬲賲 廿賳卮丕亍 賲賱賮 JSON 亘賳噩丕丨';
	@override String get failure => '賮卮賱 廿賳卮丕亍 丕賱賲賱賮';
}

// Path: pages.profiles.msg.save
class TranslationsPagesProfilesMsgSaveAr extends TranslationsPagesProfilesMsgSaveEn {
	TranslationsPagesProfilesMsgSaveAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get success => '鬲賲 丨賮馗 丕賱賲賱賮 丕賱卮禺氐賷 亘賳噩丕丨';
}

// Path: pages.profiles.msg.add
class TranslationsPagesProfilesMsgAddAr extends TranslationsPagesProfilesMsgAddEn {
	TranslationsPagesProfilesMsgAddAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get failure => '賮卮賱 廿囟丕賮丞 丕賱賲賱賮 丕賱卮禺氐賷';
}

// Path: pages.profiles.msg.update
class TranslationsPagesProfilesMsgUpdateAr extends TranslationsPagesProfilesMsgUpdateEn {
	TranslationsPagesProfilesMsgUpdateAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get success => '鬲賲 鬲丨丿賷孬 丕賱賲賱賮 丕賱卮禺氐賷 亘賳噩丕丨';
	@override String successNamed({required Object name}) => '鬲賲 鬲丨丿賷孬 "${name}" 亘賳噩丕丨';
	@override String get failure => '賮卮賱 鬲丨丿賷孬 丕賱賲賱賮 丕賱卮禺氐賷';
	@override String failureNamed({required Object name}) => '賮卮賱 鬲丨丿賷孬 "${name}"';
}

// Path: pages.profiles.msg.delete
class TranslationsPagesProfilesMsgDeleteAr extends TranslationsPagesProfilesMsgDeleteEn {
	TranslationsPagesProfilesMsgDeleteAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get success => '鬲賲 丨匕賮 丕賱賲賱賮 丕賱卮禺氐賷 亘賳噩丕丨';
}

// Path: pages.settings.options.import
class TranslationsPagesSettingsOptionsImportAr extends TranslationsPagesSettingsOptionsImportEn {
	TranslationsPagesSettingsOptionsImportAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '丕爻鬲賷乇丕丿 丕賱禺賷丕乇丕鬲 賲賳 丕賱丨丕賮馗丞';
	@override String get file => '丕爻鬲賷乇丕丿 丕賱禺賷丕乇丕鬲 賲賳 賲賱賮';
}

// Path: pages.settings.options.export
class TranslationsPagesSettingsOptionsExportAr extends TranslationsPagesSettingsOptionsExportEn {
	TranslationsPagesSettingsOptionsExportAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get anonymousToClipboard => '賳爻禺 丕賱禺賷丕乇丕鬲 丕賱賲噩賴賵賱丞 廿賱賶 丕賱丨丕賮馗丞';
	@override String get anonymousToFile => '鬲氐丿賷乇 丕賱禺賷丕乇丕鬲 丕賱賲噩賴賵賱丞 廿賱賶 賲賱賮';
	@override String get allToClipboard => '賳爻禺 噩賲賷毓 丕賱禺賷丕乇丕鬲 廿賱賶 丕賱丨丕賮馗丞';
	@override String get allToFile => '鬲氐丿賷乇 噩賲賷毓 丕賱禺賷丕乇丕鬲 廿賱賶 賲賱賮';
}

// Path: pages.settings.general.themeModes
class TranslationsPagesSettingsGeneralThemeModesAr extends TranslationsPagesSettingsGeneralThemeModesEn {
	TranslationsPagesSettingsGeneralThemeModesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get system => '爻賲丞 丕賱賳馗丕賲 丕賱丕賮鬲乇丕囟賷丞';
	@override String get dark => '丕賱賵囟毓 丕賱丿丕賰賳';
	@override String get light => '丕賱賵囟毓 丕賱賮丕鬲丨';
	@override String get black => '丕賱賵囟毓 丕賱兀爻賵丿';
}

// Path: pages.settings.routing.perAppProxy
class TranslationsPagesSettingsRoutingPerAppProxyAr extends TranslationsPagesSettingsRoutingPerAppProxyEn {
	TranslationsPagesSettingsRoutingPerAppProxyAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '亘乇賵賰爻賷 賱賰賱 鬲胤亘賷賯';
	@override String get hideSysApps => '廿禺賮丕亍 鬲胤亘賷賯丕鬲 丕賱賳馗丕賲';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsAr options = TranslationsPagesSettingsRoutingPerAppProxyOptionsAr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyModesAr modes = TranslationsPagesSettingsRoutingPerAppProxyModesAr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionAr autoSelection = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionAr._(_root);
}

// Path: pages.settings.routing.regions
class TranslationsPagesSettingsRoutingRegionsAr extends TranslationsPagesSettingsRoutingRegionsEn {
	TranslationsPagesSettingsRoutingRegionsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get ir => '廿賷乇丕賳 (ir)';
	@override String get cn => '丕賱氐賷賳 (cn)';
	@override String get ru => '乇賵爻賷丕 (ru)';
	@override String get af => '兀賮睾丕賳爻鬲丕賳 (af)';
	@override String get id => '廿賳丿賵賳賷爻賷丕 (id)';
	@override String get tr => '鬲乇賰賷丕 (tr)';
	@override String get br => '丕賱亘乇丕夭賷賱 (br)';
	@override String get other => '兀禺乇賶';
}

// Path: pages.settings.routing.balancerStrategy
class TranslationsPagesSettingsRoutingBalancerStrategyAr extends TranslationsPagesSettingsRoutingBalancerStrategyEn {
	TranslationsPagesSettingsRoutingBalancerStrategyAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丕爻鬲乇丕鬲賷噩賷丞 Balancer';
	@override String get roundRobin => 'Round robin';
	@override String get consistentHash => 'Consistent hash';
	@override String get stickySession => 'Sticky session';
}

// Path: pages.settings.routing.ipv6Modes
class TranslationsPagesSettingsRoutingIpv6ModesAr extends TranslationsPagesSettingsRoutingIpv6ModesEn {
	TranslationsPagesSettingsRoutingIpv6ModesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get disable => '鬲毓胤賷賱';
	@override String get enable => '鬲賮毓賷賱';
	@override String get prefer => '賲賮囟賱';
	@override String get only => '賮賯胤';
}

// Path: pages.settings.routing.routeRule
class TranslationsPagesSettingsRoutingRouteRuleAr extends TranslationsPagesSettingsRoutingRouteRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '賯賵丕毓丿 丕賱鬲賵噩賷賴';
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsAr options = TranslationsPagesSettingsRoutingRouteRuleOptionsAr._(_root);
	@override String get deleteRule => '丨匕賮 丕賱賯丕毓丿丞';
	@override String get createRule => '廿賳卮丕亍 賯丕毓丿丞 噩丿賷丿丞';
	@override late final TranslationsPagesSettingsRoutingRouteRuleRuleAr rule = TranslationsPagesSettingsRoutingRouteRuleRuleAr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleGenericListAr genericList = TranslationsPagesSettingsRoutingRouteRuleGenericListAr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleAndroidAppsAr androidApps = TranslationsPagesSettingsRoutingRouteRuleAndroidAppsAr._(_root);
}

// Path: pages.settings.dns.domainStrategy
class TranslationsPagesSettingsDnsDomainStrategyAr extends TranslationsPagesSettingsDnsDomainStrategyEn {
	TranslationsPagesSettingsDnsDomainStrategyAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get auto => '鬲賱賯丕卅賷';
	@override String get preferIpv6 => '鬲賮囟賷賱 IPv6';
	@override String get preferIpv4 => '鬲賮囟賷賱 IPv4';
	@override String get ipv4Only => 'IPv4 賮賯胤';
	@override String get ipv6Only => 'IPv6 賮賯胤';
}

// Path: pages.settings.inbound.serviceModes
class TranslationsPagesSettingsInboundServiceModesAr extends TranslationsPagesSettingsInboundServiceModesEn {
	TranslationsPagesSettingsInboundServiceModesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get proxy => '禺丿賲丞 丕賱亘乇賵賰爻賷 賮賯胤';
	@override String get systemProxy => '鬲毓賷賷賳 亘乇賵賰爻賷 丕賱賳馗丕賲';
	@override String get tun => 'VPN';
	@override String get tunService => '禺丿賲丞 VPN';
}

// Path: pages.settings.inbound.shortServiceModes
class TranslationsPagesSettingsInboundShortServiceModesAr extends TranslationsPagesSettingsInboundShortServiceModesEn {
	TranslationsPagesSettingsInboundShortServiceModesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get proxy => '亘乇賵賰爻賷';
	@override String get systemProxy => '亘乇賵賰爻賷 丕賱賳馗丕賲';
	@override String get tun => 'VPN';
	@override String get tunService => '禺丿賲丞 VPN';
}

// Path: pages.settings.inbound.tunImplementations
class TranslationsPagesSettingsInboundTunImplementationsAr extends TranslationsPagesSettingsInboundTunImplementationsEn {
	TranslationsPagesSettingsInboundTunImplementationsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get mixed => '賲禺鬲賱胤';
	@override String get system => '丕賱賳馗丕賲';
	@override String get gvisor => 'gVisor';
}

// Path: pages.settings.tlsTricks.mixedSniCase
class TranslationsPagesSettingsTlsTricksMixedSniCaseAr extends TranslationsPagesSettingsTlsTricksMixedSniCaseEn {
	TranslationsPagesSettingsTlsTricksMixedSniCaseAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get enable => '鬲賮毓賷賱 丕賱兀丨乇賮 丕賱賲禺鬲賱胤丞 賱賭 SNI';
}

// Path: pages.settings.tlsTricks.padding
class TranslationsPagesSettingsTlsTricksPaddingAr extends TranslationsPagesSettingsTlsTricksPaddingEn {
	TranslationsPagesSettingsTlsTricksPaddingAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get enable => '鬲賮毓賷賱 padding';
	@override String get size => '丨噩賲 padding';
}

// Path: pages.settings.warp.detourModes
class TranslationsPagesSettingsWarpDetourModesAr extends TranslationsPagesSettingsWarpDetourModesEn {
	TranslationsPagesSettingsWarpDetourModesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get proxyOverWarp => '鬲賵噩賷賴 丕賱亘乇賵賰爻賷丕鬲 毓亘乇 WARP';
	@override String get warpOverProxy => '鬲賵噩賷賴 WARP 毓亘乇 丕賱亘乇賵賰爻賷丕鬲';
	@override String get proxyOverWarpExplain => '賱廿賱睾丕亍 丨馗乇 丕賱亘乇賵賰爻賷丕鬲 亘賵丕爻胤丞 WARP';
	@override String get warpOverProxyExplain => '賱兀賲丕賳 廿囟丕賮賷 亘賵丕爻胤丞 WARP';
}

// Path: pages.settings.warp.noise
class TranslationsPagesSettingsWarpNoiseAr extends TranslationsPagesSettingsWarpNoiseEn {
	TranslationsPagesSettingsWarpNoiseAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get count => '毓丿丿 丕賱囟賵囟丕亍';
	@override String get mode => '賵囟毓 丕賱囟賵囟丕亍';
	@override String get size => '丨噩賲 丕賱囟賵囟丕亍';
	@override String get delay => '鬲兀禺賷乇 丕賱囟賵囟丕亍';
}

// Path: dialogs.confirmation.settings.import
class TranslationsDialogsConfirmationSettingsImportAr extends TranslationsDialogsConfirmationSettingsImportEn {
	TranslationsDialogsConfirmationSettingsImportAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get msg => '爻賷丐丿賷 賴匕丕 廿賱賶 丕爻鬲亘丿丕賱 噩賲賷毓 廿毓丿丕丿丕鬲賰 丕賱丨丕賱賷丞. 賴賱 兀賳鬲 賲鬲兀賰丿責';
}

// Path: dialogs.confirmation.profile.delete
class TranslationsDialogsConfirmationProfileDeleteAr extends TranslationsDialogsConfirmationProfileDeleteEn {
	TranslationsDialogsConfirmationProfileDeleteAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丨匕賮 丕賱賲賱賮 丕賱卮禺氐賷';
	@override String get msg => '賴賱 兀賳鬲 賲鬲兀賰丿 賲賳 乇睾亘鬲賰 賮賷 丨匕賮 賴匕丕 丕賱賲賱賮 丕賱卮禺氐賷 賳賴丕卅賷賸丕責';
}

// Path: dialogs.confirmation.perAppProxy.shareOnGithub
class TranslationsDialogsConfirmationPerAppProxyShareOnGithubAr extends TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn {
	TranslationsDialogsConfirmationPerAppProxyShareOnGithubAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '鬲丨爻賷賳 丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷';
	@override String get msg => '亘賲卮丕乇賰丞 丕賱鬲胤亘賷賯丕鬲 丕賱鬲賷 丕禺鬲乇鬲賴丕貙 賮廿賳賰 鬲爻丕毓丿 賮賷 廿賰賲丕賱 賯丕卅賲丞 "丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷"';
}

// Path: dialogs.confirmation.perAppProxy.import
class TranslationsDialogsConfirmationPerAppProxyImportAr extends TranslationsDialogsConfirmationPerAppProxyImportEn {
	TranslationsDialogsConfirmationPerAppProxyImportAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get msg => '爻賷丐丿賷 賴匕丕 廿賱賶 丕爻鬲亘丿丕賱 噩賲賷毓 鬲丨丿賷丿丕鬲賰 丕賱丨丕賱賷丞 賱亘乇賵賰爻賷 丕賱鬲胤亘賷賯丕鬲. 賴賱 兀賳鬲 賲鬲兀賰丿 賲賳 乇睾亘鬲賰 賮賷 丕賱賲鬲丕亘毓丞責';
}

// Path: dialogs.confirmation.routeRule.delete
class TranslationsDialogsConfirmationRouteRuleDeleteAr extends TranslationsDialogsConfirmationRouteRuleDeleteEn {
	TranslationsDialogsConfirmationRouteRuleDeleteAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丨匕賮 丕賱賯丕毓丿丞';
	@override String msg({required Object rulename}) => '賴賱 兀賳鬲 賲鬲兀賰丿 賲賳 乇睾亘鬲賰 賮賷 丨匕賮 賯丕毓丿丞 "${rulename}"責';
}

// Path: pages.settings.routing.perAppProxy.options
class TranslationsPagesSettingsRoutingPerAppProxyOptionsAr extends TranslationsPagesSettingsRoutingPerAppProxyOptionsEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsImportAr import = TranslationsPagesSettingsRoutingPerAppProxyOptionsImportAr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsExportAr export = TranslationsPagesSettingsRoutingPerAppProxyOptionsExportAr._(_root);
	@override String get shareToAll => '賲卮丕乇賰丞 賲毓 丕賱噩賲賷毓';
	@override String get clearAllSelections => '賲爻丨 噩賲賷毓 丕賱鬲丨丿賷丿丕鬲';
}

// Path: pages.settings.routing.perAppProxy.modes
class TranslationsPagesSettingsRoutingPerAppProxyModesAr extends TranslationsPagesSettingsRoutingPerAppProxyModesEn {
	TranslationsPagesSettingsRoutingPerAppProxyModesAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get all => '丕賱賰賱';
	@override String get proxy => '亘乇賵賰爻賷';
	@override String get bypass => '鬲噩丕賵夭';
	@override String get allMsg => '丕爻鬲禺丿丕賲 丕賱亘乇賵賰爻賷 賱噩賲賷毓 丕賱鬲胤亘賷賯丕鬲';
	@override String get proxyMsg => '丕爻鬲禺丿丕賲 丕賱亘乇賵賰爻賷 賱賱鬲胤亘賷賯丕鬲 丕賱賲丨丿丿丞 賮賯胤';
	@override String get bypassMsg => '毓丿賲 丕爻鬲禺丿丕賲 丕賱亘乇賵賰爻賷 賱賱鬲胤亘賷賯丕鬲 丕賱賲丨丿丿丞';
}

// Path: pages.settings.routing.perAppProxy.autoSelection
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionAr extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷';
	@override String get performNow => '鬲賳賮賷匕 丕賱丌賳';
	@override String get resetToDefault => '廿毓丕丿丞 丕賱鬲毓賷賷賳 廿賱賶 丕賱丕賮鬲乇丕囟賷';
	@override String get autoUpdateInterval => '賮丕氐賱 丕賱鬲丨丿賷孬 丕賱鬲賱賯丕卅賷';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastAr toast = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastAr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogAr dialog = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogAr._(_root);
}

// Path: pages.settings.routing.routeRule.options
class TranslationsPagesSettingsRoutingRouteRuleOptionsAr extends TranslationsPagesSettingsRoutingRouteRuleOptionsEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsImportAr import = TranslationsPagesSettingsRoutingRouteRuleOptionsImportAr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsExportAr export = TranslationsPagesSettingsRoutingRouteRuleOptionsExportAr._(_root);
	@override String get reset => '廿毓丕丿丞 鬲毓賷賷賳 丕賱賯賵丕毓丿';
}

// Path: pages.settings.routing.routeRule.rule
class TranslationsPagesSettingsRoutingRouteRuleRuleAr extends TranslationsPagesSettingsRoutingRouteRuleRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleRuleAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '賯丕毓丿丞';
	@override String get ruleChanged => '鬲賲 鬲睾賷賷乇 丕賱賯丕毓丿丞';
	@override String get ruleChangedMsg => '賴賱 鬲乇賷丿 丨賮馗 鬲毓丿賷賱丕鬲賰責';
	@override String get onlyTunMode => '賲鬲賵賮乇 賮賯胤 賮賷 賵囟毓 TUN';
	@override String get notAvailabeInThisPlatform => '睾賷乇 賲鬲賵賮乇 毓賱賶 賴匕丕 丕賱賳馗丕賲';
	@override String get canNotBeEmpty => '賱丕 賷賲賰賳 兀賳 賷賰賵賳 賮丕乇睾賸丕';
	@override String get validUrlEx => 'https://example.com';
	@override String get validUrl => '"URL" 氐丕賱丨 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}';
	@override String get validProcessNameEx => 'Chrome.exe or google chrome or chrome';
	@override String get validProcessName => '"丕爻賲 丕賱毓賲賱賷丞" 氐丕賱丨 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}';
	@override String get validProcessPathEx => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome';
	@override String get validProcessPath => '"賲爻丕乇 丕賱毓賲賱賷丞" 氐丕賱丨 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}';
	@override String get validPortRangeEx => '80 or 1-65000';
	@override String get validPortRange => '"賲賳賮匕" 兀賵 "賳胤丕賯 賲賳丕賮匕" 氐丕賱丨 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}';
	@override String get validIpCidrEx => '8.8.8.8 or 10.0.0.0/24';
	@override String get validIpCidr => 'IP CIDR 氐丕賱丨 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}';
	@override String get validDomainEx => 'Google.com or dl.google.com';
	@override String get validDomain => '"賳胤丕賯" 氐丕賱丨 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}';
	@override String get validDomainSuffixEx => '.com or .ir';
	@override String get validDomainSuffix => '"賱丕丨賯丞 賳胤丕賯" 氐丕賱丨丞 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}';
	@override Map<String, String> get tileTitle => {
		'name': '丕賱丕爻賲',
		'outbound': '丕賱鬲賵噩賷賴 毓賳丿 丕賱鬲胤丕亘賯',
		'rule_set': '乇丕亘胤 賲噩賲賵毓丞 丕賱賯賵丕毓丿',
		'package_name': '兀爻賲丕亍 丕賱丨夭賲',
		'process_name': '兀爻賲丕亍 丕賱毓賲賱賷丕鬲',
		'process_path': '賲爻丕乇丕鬲 丕賱毓賲賱賷丕鬲',
		'network': '丕賱卮亘賰丕鬲',
		'port_range': '賲賳丕賮匕 丕賱賵噩賴丞',
		'source_port_range': '賲賳丕賮匕 丕賱賲氐丿乇',
		'protocol': '丕賱亘乇賵鬲賵賰賵賱',
		'ip_cidr': 'IP CIDR 丕賱賵噩賴丞',
		'source_ip_cidr': 'IP CIDR 丕賱賲氐丿乇',
		'domain': '丕賱賳胤丕賯',
		'domain_suffixe': '賱丕丨賯丞 丕賱賳胤丕賯',
		'domain_keyword': '賰賱賲丞 賲賮鬲丕丨賷丞 賱賱賳胤丕賯',
		'domain_regex': '鬲毓亘賷乇 賳賲胤賷 賱賱賳胤丕賯',
	};
	@override Map<String, String> get outbound => {
		'proxy': '亘乇賵賰爻賷',
		'direct': '賲亘丕卮乇',
		'direct_with_fragment': '賲亘丕卮乇 賲毓 Fragment',
		'block': '丨馗乇',
	};
	@override Map<String, String> get network => {
		'all': '丕賱賰賱',
		'tcp': 'TCP',
		'udp': 'UDP',
	};
	@override Map<String, String> get protocol => {
		'': '丕賱賰賱',
		'tls': 'TLS',
		'http': 'HTTP',
		'quic': 'QUIC',
		'stun': 'STUN',
		'dns': 'DNS',
		'bittorrent': 'BitTorrent',
	};
}

// Path: pages.settings.routing.routeRule.genericList
class TranslationsPagesSettingsRoutingRouteRuleGenericListAr extends TranslationsPagesSettingsRoutingRouteRuleGenericListEn {
	TranslationsPagesSettingsRoutingRouteRuleGenericListAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get addNew => '廿囟丕賮丞 賯賷賲丞 噩丿賷丿丞';
	@override String get update => '鬲丨丿賷孬 丕賱賯賷賲丞';
	@override String get clearList => '賲爻丨 丕賱賯丕卅賲丞';
	@override String get clearListMsg => '鬲賲 丨匕賮 噩賲賷毓 丕賱毓賳丕氐乇';
}

// Path: pages.settings.routing.routeRule.androidApps
class TranslationsPagesSettingsRoutingRouteRuleAndroidAppsAr extends TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn {
	TranslationsPagesSettingsRoutingRouteRuleAndroidAppsAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => '鬲胤亘賷賯丕鬲 兀賳丿乇賵賷丿';
	@override String get showSystemApps => '毓乇囟 鬲胤亘賷賯丕鬲 丕賱賳馗丕賲';
	@override String get hideSystemApps => '廿禺賮丕亍 鬲胤亘賷賯丕鬲 丕賱賳馗丕賲';
	@override String get clearSelection => '賲爻丨 丕賱鬲丨丿賷丿';
	@override String get uninstalled => '睾賷乇 賲孬亘鬲';
}

// Path: pages.settings.routing.perAppProxy.options.import
class TranslationsPagesSettingsRoutingPerAppProxyOptionsImportAr extends TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsImportAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '丕爻鬲賷乇丕丿 丕賱鬲丨丿賷丿 賲賳 丕賱丨丕賮馗丞';
	@override String get file => '丕爻鬲賷乇丕丿 丕賱鬲丨丿賷丿 賲賳 賲賱賮';
	@override String get msg => '爻賷丐丿賷 丕賱丕爻鬲賷乇丕丿 廿賱賶 丕爻鬲亘丿丕賱 鬲丨丿賷丿丕鬲賰 丕賱丨丕賱賷丞. 賴賱 兀賳鬲 賲鬲兀賰丿 賲賳 乇睾亘鬲賰 賮賷 丕賱賲鬲丕亘毓丞責';
}

// Path: pages.settings.routing.perAppProxy.options.export
class TranslationsPagesSettingsRoutingPerAppProxyOptionsExportAr extends TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsExportAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '賳爻禺 丕賱鬲丨丿賷丿 廿賱賶 丕賱丨丕賮馗丞';
	@override String get file => '鬲氐丿賷乇 丕賱鬲丨丿賷丿 廿賱賶 賲賱賮';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.toast
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastAr extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get success => '丕賰鬲賲賱 丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷 賱賱鬲胤亘賷賯丕鬲 亘賳噩丕丨';
	@override String get failure => '賮卮賱 丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷';
	@override String regionNotFound({required Object region}) => '賱賲 賷鬲賲 丕賱毓孬賵乇 毓賱賶 丕禺鬲賷丕乇 鬲賱賯丕卅賷 賱賲賳胤賯丞 "${region}"';
	@override String get alreadyInAuto => '丕禺鬲賷丕乇丕鬲賰 賲賵噩賵丿丞 亘丕賱賮毓賱 賮賷 丕賱賯丕卅賲丞 丕賱鬲賱賯丕卅賷丞';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.dialog
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogAr extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => '丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷 賱賱鬲胤亘賷賯丕鬲';
	@override String msg({required Object region}) => '鬲賲 鬲毓胤賷賱 賲賷夭丞 丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷 賱賱亘乇賵賰爻賷 亘爻亘亘 鬲睾賷賷乇 丕賱賲賳胤賯丞 廿賱賶 "${region}"';
}

// Path: pages.settings.routing.routeRule.options.import
class TranslationsPagesSettingsRoutingRouteRuleOptionsImportAr extends TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsImportAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '丕爻鬲賷乇丕丿 丕賱賯賵丕毓丿 賲賳 丕賱丨丕賮馗丞';
	@override String get file => '丕爻鬲賷乇丕丿 丕賱賯賵丕毓丿 賲賳 賲賱賮';
}

// Path: pages.settings.routing.routeRule.options.export
class TranslationsPagesSettingsRoutingRouteRuleOptionsExportAr extends TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsExportAr._(TranslationsAr root) : this._root = root, super.internal(root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => '賳爻禺 丕賱賯賵丕毓丿 廿賱賶 丕賱丨丕賮馗丞';
	@override String get file => '丨賮馗 丕賱賯賵丕毓丿 賮賷 賲賱賮';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appTitle' => '树懒VPN',
			'common.start' => '丕亘丿兀',
			'common.version' => '丕賱廿氐丿丕乇',
			'common.ok' => '賲賵丕賮賯',
			'common.cancel' => '廿賱睾丕亍',
			'common.kContinue' => '賲鬲丕亘毓丞',
			'common.showMore' => '毓乇囟 丕賱賲夭賷丿',
			'common.showLess' => '毓乇囟 兀賯賱',
			'common.filter' => '鬲氐賮賷丞',
			'common.all' => '丕賱賰賱',
			'common.pause' => '廿賷賯丕賮 賲丐賯鬲',
			'common.resume' => '丕爻鬲卅賳丕賮',
			'common.clear' => '賲爻丨',
			'common.close' => '廿睾賱丕賯',
			'common.auto' => '鬲賱賯丕卅賷',
			'common.manually' => '賷丿賵賷',
			'common.name' => '丕賱丕爻賲',
			'common.url' => '丕賱乇丕亘胤',
			'common.add' => '廿囟丕賮丞',
			'common.clipboard' => '丕賱丨丕賮馗丞',
			'common.addToClipboard' => '廿囟丕賮丞 廿賱賶 丕賱丨丕賮馗丞',
			'common.scanQr' => '賲爻丨 乇賲夭 QR',
			'common.free' => '賲噩丕賳賷',
			'common.warp' => 'WARP',
			'common.fragment' => 'Fragment',
			'common.help' => '賲爻丕毓丿丞',
			'common.save' => '丨賮馗',
			'common.update' => '鬲丨丿賷孬',
			'common.share' => '賲卮丕乇賰丞',
			'common.edit' => '鬲毓丿賷賱',
			'common.delete' => '丨匕賮',
			'common.discard' => '鬲噩丕賴賱',
			'common.import' => '丕爻鬲賷乇丕丿',
			'common.export' => '鬲氐丿賷乇',
			'common.later' => '賱丕丨賯賸丕',
			'common.ignore' => '鬲噩丕賴賱',
			'common.quit' => '禺乇賵噩',
			'common.notSet' => '睾賷乇 賲丨丿丿',
			'common.hide' => '廿禺賮丕亍',
			'common.exit' => '禺乇賵噩',
			'common.reset' => '廿毓丕丿丞 鬲毓賷賷賳',
			'common.done' => '鬲賲',
			'common.search' => '亘丨孬',
			'common.decline' => '乇賮囟',
			'common.agree' => '兀賵丕賮賯',
			'common.empty' => '賮丕乇睾',
			'common.unknown' => '睾賷乇 賲毓乇賵賮',
			'common.hidden' => '賲禺賮賷',
			'common.timeout' => '丕賳鬲賴賶 丕賱賵賯鬲',
			'common.sort' => '賮乇夭',
			'common.dashboard' => '賱賵丨丞 丕賱鬲丨賰賲',
			'common.interval.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(n, zero: '', one: '賷賵賲 賵丕丨丿', two: '賷賵賲丕賳', few: '${n} 兀賷丕賲', many: '${n} 賷賵賲賸丕', other: '${n} 賷賵賲', ), 
			'common.interval.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(n, zero: '', one: '爻丕毓丞 賵丕丨丿丞', two: '爻丕毓鬲丕賳', few: '${n} 爻丕毓丕鬲', many: '${n} 爻丕毓丞', other: '${n} 爻丕毓丞', ), 
			'common.msg.permission.denied' => '鬲賲 乇賮囟 丕賱廿匕賳',
			'common.msg.export.clipboard.success' => '鬲賲鬲 丕賱廿囟丕賮丞 廿賱賶 丕賱丨丕賮馗丞 亘賳噩丕丨',
			'common.msg.export.clipboard.failure' => '賮卮賱 丕賱賳爻禺 廿賱賶 丕賱丨丕賮馗丞',
			'common.msg.export.clipboard.contentTooLarge' => '丕賱賲丨鬲賵賶 賰亘賷乇 噩丿賸丕. 丕爻鬲禺丿賲 鬲氐丿賷乇 丕賱賲賱賮 亘丿賱丕賸 賲賳 匕賱賰',
			'common.msg.export.file.success' => '鬲賲 廿賳卮丕亍 賲賱賮 JSON 亘賳噩丕丨',
			'common.msg.export.file.failure' => '賮卮賱 廿賳卮丕亍 丕賱賲賱賮',
			'common.msg.import.confirm' => '鬲兀賰賷丿 丕賱丕爻鬲賷乇丕丿',
			'common.msg.import.success' => '鬲賲 丕賱丕爻鬲賷乇丕丿 亘賳噩丕丨',
			'common.msg.import.failure' => '賮卮賱 丕賱丕爻鬲賷乇丕丿',
			'intro.banner' => '賰賱 賲丕 鬲丨鬲丕噩賴 賱廿賳鬲乇賳鬲 亘賱丕 賯賷賵丿',
			'intro.termsAndPolicyCaution' => ({required InlineSpanBuilder tap}) => TextSpan(children: [ const TextSpan(text: '亘丕賱丕爻鬲賲乇丕乇貙 兀賳鬲 鬲賵丕賮賯 毓賱賶 '), tap(_root.pages.about.termsAndConditions), ]), 
			'intro.info' => ({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [ const TextSpan(text: '氐購賳毓 亘賭 鉂わ笍 亘賵丕爻胤丞 Hiddify - '), tap_source('賲賮鬲賵丨 丕賱賲氐丿乇'), const TextSpan(text: ' ('), tap_license('丕賱乇禺氐丞'), const TextSpan(text: ')'), ]), 
			'pages.home.title' => '丕賱乇卅賷爻賷丞',
			'pages.home.quickSettings' => '丕賱廿毓丿丕丿丕鬲 丕賱爻乇賷毓丞',
			'pages.proxies.title' => '丕賱亘乇賵賰爻賷丕鬲',
			'pages.proxies.sort' => '賮乇夭 丕賱亘乇賵賰爻賷丕鬲',
			'pages.proxies.testDelay' => '丕禺鬲亘丕乇 丕賱鬲兀禺賷乇',
			'pages.proxies.empty' => '賱丕 鬲賵噩丿 亘乇賵賰爻賷丕鬲 賲鬲丕丨丞',
			'pages.proxies.activeProxy' => '丕賱亘乇賵賰爻賷 丕賱賳卮胤',
			'pages.proxies.unknownIp' => 'IP 睾賷乇 賲毓乇賵賮',
			'pages.proxies.sortOptions.unsorted' => '丕賱丕賮鬲乇丕囟賷',
			'pages.proxies.sortOptions.name' => '兀亘噩丿賷賸丕',
			'pages.proxies.sortOptions.delay' => '丨爻亘 丕賱鬲兀禺賷乇',
			'pages.proxies.ipInfo.address' => '毓賳賵丕賳 IP',
			'pages.proxies.ipInfo.country' => '丕賱丿賵賱丞',
			'pages.proxies.ipInfo.organization' => '丕賱賲購賳馗賲丞',
			'pages.proxies.delay.result' => ({required Object delay}) => '丕賱鬲兀禺賷乇: ${delay} 賲賱賱賷 孬丕賳賷丞',
			'pages.proxies.delay.timeout' => '丕賳鬲賴賶 賵賯鬲 丕禺鬲亘丕乇 丕賱鬲兀禺賷乇',
			'pages.proxies.delay.testing' => '丕賱鬲兀禺賷乇: 賯賷丿 丕賱丕禺鬲亘丕乇...',
			'pages.profiles.title' => '丕賱賲賱賮丕鬲 丕賱卮禺氐賷丞',
			'pages.profiles.add' => '廿囟丕賮丞 賲賱賮 卮禺氐賷',
			'pages.profiles.update' => '鬲丨丿賷孬 丕賱賲賱賮 丕賱卮禺氐賷',
			'pages.profiles.viewAllProfiles' => '毓乇囟 噩賲賷毓 丕賱賲賱賮丕鬲 丕賱卮禺氐賷丞',
			'pages.profiles.activeProfileName' => ({required Object name}) => '丕爻賲 丕賱賲賱賮 丕賱賳卮胤: "${name}".',
			'pages.profiles.nonActiveProfileName' => ({required Object name}) => '鬲丨丿賷丿 "${name}" 賰賲賱賮 賳卮胤',
			'pages.profiles.freeSubNotFound' => '賱賲 賷鬲賲 丕賱毓孬賵乇 毓賱賶 丕卮鬲乇丕賰 賲噩丕賳賷',
			'pages.profiles.freeSubNotFoundForRegion' => ({required Object region}) => '賱賲 賷鬲賲 丕賱毓孬賵乇 毓賱賶 丕卮鬲乇丕賰 賲噩丕賳賷 賱賲賳胤賯丞 "${region}"',
			'pages.profiles.failedToLoad' => '賮卮賱 丕賱鬲丨賲賷賱',
			'pages.profiles.updateSubscriptions' => '鬲丨丿賷孬 丕賱丕卮鬲乇丕賰丕鬲',
			'pages.profiles.share.urlToClipboard' => '乇丕亘胤 URL 廿賱賶 丕賱丨丕賮馗丞',
			'pages.profiles.share.showUrlQr' => '毓乇囟 乇賲夭 QR 賱賱乇丕亘胤',
			'pages.profiles.share.jsonToClipboard' => 'JSON 廿賱賶 丕賱丨丕賮馗丞',
			'pages.profiles.msg.save.success' => '鬲賲 丨賮馗 丕賱賲賱賮 丕賱卮禺氐賷 亘賳噩丕丨',
			'pages.profiles.msg.invalidUrl' => '乇丕亘胤 睾賷乇 氐丕賱丨',
			'pages.profiles.msg.add.failure' => '賮卮賱 廿囟丕賮丞 丕賱賲賱賮 丕賱卮禺氐賷',
			'pages.profiles.msg.update.success' => '鬲賲 鬲丨丿賷孬 丕賱賲賱賮 丕賱卮禺氐賷 亘賳噩丕丨',
			'pages.profiles.msg.update.successNamed' => ({required Object name}) => '鬲賲 鬲丨丿賷孬 "${name}" 亘賳噩丕丨',
			'pages.profiles.msg.update.failure' => '賮卮賱 鬲丨丿賷孬 丕賱賲賱賮 丕賱卮禺氐賷',
			'pages.profiles.msg.update.failureNamed' => ({required Object name}) => '賮卮賱 鬲丨丿賷孬 "${name}"',
			'pages.profiles.msg.delete.success' => '鬲賲 丨匕賮 丕賱賲賱賮 丕賱卮禺氐賷 亘賳噩丕丨',
			'pages.profileDetails.title' => '丕賱賲賱賮 丕賱卮禺氐賷',
			'pages.profileDetails.lastUpdate' => '丌禺乇 鬲丨丿賷孬',
			'pages.profileDetails.form.nameHint' => '丕爻賲 丕賱賲賱賮 丕賱卮禺氐賷',
			'pages.profileDetails.form.emptyName' => '丕賱丕爻賲 賲胤賱賵亘',
			'pages.profileDetails.form.invalidUrl' => '乇丕亘胤 睾賷乇 氐丕賱丨',
			'pages.profileDetails.form.urlHint' => '乇丕亘胤 丕賱廿毓丿丕丿丕鬲 丕賱賰丕賲賱',
			'pages.profileDetails.form.disableAutoUpdate' => '鬲毓胤賷賱 丕賱鬲丨丿賷孬 丕賱鬲賱賯丕卅賷',
			'pages.profileDetails.form.autoUpdateInterval' => '賮丕氐賱 丕賱鬲丨丿賷孬 丕賱鬲賱賯丕卅賷',
			'pages.profileDetails.form.loading' => '噩丕乇賷 廿囟丕賮丞 丕賱賲賱賮 丕賱卮禺氐賷...',
			'pages.logs.title' => '丕賱爻噩賱丕鬲',
			'pages.logs.shareCoreLogs' => '賲卮丕乇賰丞 爻噩賱丕鬲 丕賱賳賵丕丞',
			'pages.logs.shareAppLogs' => '賲卮丕乇賰丞 爻噩賱丕鬲 丕賱鬲胤亘賷賯',
			'pages.about.title' => '丨賵賱 丕賱鬲胤亘賷賯',
			'pages.about.notAvailableMsg' => '兀賳鬲 鬲爻鬲禺丿賲 兀丨丿孬 廿氐丿丕乇 亘丕賱賮毓賱',
			'pages.about.checkForUpdate' => '丕賱鬲丨賯賯 賲賳 賵噩賵丿 鬲丨丿賷孬丕鬲',
			'pages.about.openWorkingDir' => '賮鬲丨 賲噩賱丿 丕賱毓賲賱',
			'pages.about.sourceCode' => '丕賱賰賵丿 丕賱賲氐丿乇賷',
			'pages.about.telegramChannel' => '賯賳丕丞 丕賱鬲賷賱賷噩乇丕賲',
			'pages.about.termsAndConditions' => '丕賱卮乇賵胤 賵丕賱兀丨賰丕賲',
			'pages.about.privacyPolicy' => '爻賷丕爻丞 丕賱禺氐賵氐賷丞',
			'pages.settings.title' => '丕賱廿毓丿丕丿丕鬲',
			'pages.settings.resetTunnel' => '廿毓丕丿丞 鬲毓賷賷賳 賲賱賮 VPN',
			'pages.settings.options.import.clipboard' => '丕爻鬲賷乇丕丿 丕賱禺賷丕乇丕鬲 賲賳 丕賱丨丕賮馗丞',
			'pages.settings.options.import.file' => '丕爻鬲賷乇丕丿 丕賱禺賷丕乇丕鬲 賲賳 賲賱賮',
			'pages.settings.options.export.anonymousToClipboard' => '賳爻禺 丕賱禺賷丕乇丕鬲 丕賱賲噩賴賵賱丞 廿賱賶 丕賱丨丕賮馗丞',
			'pages.settings.options.export.anonymousToFile' => '鬲氐丿賷乇 丕賱禺賷丕乇丕鬲 丕賱賲噩賴賵賱丞 廿賱賶 賲賱賮',
			'pages.settings.options.export.allToClipboard' => '賳爻禺 噩賲賷毓 丕賱禺賷丕乇丕鬲 廿賱賶 丕賱丨丕賮馗丞',
			'pages.settings.options.export.allToFile' => '鬲氐丿賷乇 噩賲賷毓 丕賱禺賷丕乇丕鬲 廿賱賶 賲賱賮',
			'pages.settings.options.reset' => '廿毓丕丿丞 鬲毓賷賷賳 丕賱禺賷丕乇丕鬲',
			'pages.settings.general.title' => '毓丕賲',
			'pages.settings.general.locale' => '丕賱賱睾丞',
			'pages.settings.general.themeMode' => '丕賱爻賲丞',
			'pages.settings.general.themeModes.system' => '爻賲丞 丕賱賳馗丕賲 丕賱丕賮鬲乇丕囟賷丞',
			'pages.settings.general.themeModes.dark' => '丕賱賵囟毓 丕賱丿丕賰賳',
			'pages.settings.general.themeModes.light' => '丕賱賵囟毓 丕賱賮丕鬲丨',
			'pages.settings.general.themeModes.black' => '丕賱賵囟毓 丕賱兀爻賵丿',
			'pages.settings.general.enableAnalytics' => '鬲賮毓賷賱 丕賱鬲丨賱賷賱丕鬲',
			'pages.settings.general.enableAnalyticsMsg' => '丕賱爻賲丕丨 亘噩賲毓 亘賷丕賳丕鬲 丕賱鬲丨賱賷賱 賵鬲賯丕乇賷乇 丕賱兀毓胤丕賱 賱鬲丨爻賷賳 丕賱鬲胤亘賷賯',
			'pages.settings.general.autoIpCheck' => '丕賱鬲丨賯賯 丕賱鬲賱賯丕卅賷 賲賳 IP 丕賱丕鬲氐丕賱',
			'pages.settings.general.dynamicNotification' => '毓乇囟 丕賱爻乇毓丞 賮賷 丕賱廿卮毓丕乇',
			'pages.settings.general.hapticFeedback' => '乇丿賵丿 丕賱賮毓賱 丕賱賱賲爻賷丞',
			'pages.settings.general.actionAtClosing' => '丕賱廿噩乇丕亍 毓賳丿 丕賱廿睾賱丕賯',
			'pages.settings.general.autoStart' => '丕賱亘丿亍 毓賳丿 鬲爻噩賷賱 丕賱丿禺賵賱',
			'pages.settings.general.silentStart' => '丕賱亘丿亍 賮賷 丕賱禺賱賮賷丞',
			'pages.settings.general.ignoreBatteryOptimizations' => '鬲噩丕賴賱 鬲丨爻賷賳丕鬲 丕賱亘胤丕乇賷丞',
			'pages.settings.general.ignoreBatteryOptimizationsMsg' => '廿夭丕賱丞 丕賱賯賷賵丿 賱賱丨氐賵賱 毓賱賶 兀賮囟賱 兀丿丕亍 賱賱賭 VPN',
			'pages.settings.general.memoryLimit' => '丨丿 丕賱匕丕賰乇丞',
			'pages.settings.general.memoryLimitMsg' => '賯賲 亘鬲賮毓賷賱 賴匕丕 丕賱禺賷丕乇 廿匕丕 賰賳鬲 鬲賵丕噩賴 兀禺胤丕亍 賳賮丕丿 丕賱匕丕賰乇丞 兀賵 鬲毓胤賱 丕賱鬲胤亘賷賯 亘卮賰賱 賲鬲賰乇乇',
			'pages.settings.general.debugMode' => '賵囟毓 丕賱鬲氐丨賷丨',
			'pages.settings.general.debugModeMsg' => '兀毓丿 鬲卮睾賷賱 丕賱鬲胤亘賷賯 賱鬲胤亘賷賯 賴匕丕 丕賱鬲睾賷賷乇',
			'pages.settings.general.logLevel' => '賲爻鬲賵賶 丕賱爻噩賱',
			'pages.settings.general.connectionTestUrl' => '乇丕亘胤 丕禺鬲亘丕乇 丕賱丕鬲氐丕賱',
			'pages.settings.general.urlTestInterval' => '賮丕氐賱 丕禺鬲亘丕乇 丕賱乇丕亘胤',
			'pages.settings.general.clashApiPort' => '賲賳賮匕 Clash API',
			'pages.settings.general.useXrayCoreWhenPossible' => '丕爻鬲禺丿丕賲 xray-core 毓賳丿 丕賱廿賲賰丕賳',
			'pages.settings.general.useXrayCoreWhenPossibleMsg' => '丕爻鬲禺丿賲 xray-core 毓賳丿 鬲丨賱賷賱 乇賵丕亘胤 丕賱丕卮鬲乇丕賰. 鬲丨鬲丕噩 廿賱賶 廿毓丕丿丞 丕爻鬲賷乇丕丿 丕賱乇丕亘胤 賱鬲賮毓賷賱 賴匕丕 丕賱禺賷丕乇',
			'pages.settings.routing.title' => '丕賱鬲賵噩賷賴',
			'pages.settings.routing.perAppProxy.title' => '亘乇賵賰爻賷 賱賰賱 鬲胤亘賷賯',
			'pages.settings.routing.perAppProxy.hideSysApps' => '廿禺賮丕亍 鬲胤亘賷賯丕鬲 丕賱賳馗丕賲',
			'pages.settings.routing.perAppProxy.options.import.clipboard' => '丕爻鬲賷乇丕丿 丕賱鬲丨丿賷丿 賲賳 丕賱丨丕賮馗丞',
			'pages.settings.routing.perAppProxy.options.import.file' => '丕爻鬲賷乇丕丿 丕賱鬲丨丿賷丿 賲賳 賲賱賮',
			'pages.settings.routing.perAppProxy.options.import.msg' => '爻賷丐丿賷 丕賱丕爻鬲賷乇丕丿 廿賱賶 丕爻鬲亘丿丕賱 鬲丨丿賷丿丕鬲賰 丕賱丨丕賱賷丞. 賴賱 兀賳鬲 賲鬲兀賰丿 賲賳 乇睾亘鬲賰 賮賷 丕賱賲鬲丕亘毓丞責',
			'pages.settings.routing.perAppProxy.options.export.clipboard' => '賳爻禺 丕賱鬲丨丿賷丿 廿賱賶 丕賱丨丕賮馗丞',
			'pages.settings.routing.perAppProxy.options.export.file' => '鬲氐丿賷乇 丕賱鬲丨丿賷丿 廿賱賶 賲賱賮',
			'pages.settings.routing.perAppProxy.options.shareToAll' => '賲卮丕乇賰丞 賲毓 丕賱噩賲賷毓',
			'pages.settings.routing.perAppProxy.options.clearAllSelections' => '賲爻丨 噩賲賷毓 丕賱鬲丨丿賷丿丕鬲',
			'pages.settings.routing.perAppProxy.modes.all' => '丕賱賰賱',
			'pages.settings.routing.perAppProxy.modes.proxy' => '亘乇賵賰爻賷',
			'pages.settings.routing.perAppProxy.modes.bypass' => '鬲噩丕賵夭',
			'pages.settings.routing.perAppProxy.modes.allMsg' => '丕爻鬲禺丿丕賲 丕賱亘乇賵賰爻賷 賱噩賲賷毓 丕賱鬲胤亘賷賯丕鬲',
			'pages.settings.routing.perAppProxy.modes.proxyMsg' => '丕爻鬲禺丿丕賲 丕賱亘乇賵賰爻賷 賱賱鬲胤亘賷賯丕鬲 丕賱賲丨丿丿丞 賮賯胤',
			'pages.settings.routing.perAppProxy.modes.bypassMsg' => '毓丿賲 丕爻鬲禺丿丕賲 丕賱亘乇賵賰爻賷 賱賱鬲胤亘賷賯丕鬲 丕賱賲丨丿丿丞',
			'pages.settings.routing.perAppProxy.autoSelection.title' => '丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷',
			'pages.settings.routing.perAppProxy.autoSelection.performNow' => '鬲賳賮賷匕 丕賱丌賳',
			'pages.settings.routing.perAppProxy.autoSelection.resetToDefault' => '廿毓丕丿丞 丕賱鬲毓賷賷賳 廿賱賶 丕賱丕賮鬲乇丕囟賷',
			'pages.settings.routing.perAppProxy.autoSelection.autoUpdateInterval' => '賮丕氐賱 丕賱鬲丨丿賷孬 丕賱鬲賱賯丕卅賷',
			'pages.settings.routing.perAppProxy.autoSelection.toast.success' => '丕賰鬲賲賱 丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷 賱賱鬲胤亘賷賯丕鬲 亘賳噩丕丨',
			'pages.settings.routing.perAppProxy.autoSelection.toast.failure' => '賮卮賱 丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷',
			'pages.settings.routing.perAppProxy.autoSelection.toast.regionNotFound' => ({required Object region}) => '賱賲 賷鬲賲 丕賱毓孬賵乇 毓賱賶 丕禺鬲賷丕乇 鬲賱賯丕卅賷 賱賲賳胤賯丞 "${region}"',
			'pages.settings.routing.perAppProxy.autoSelection.toast.alreadyInAuto' => '丕禺鬲賷丕乇丕鬲賰 賲賵噩賵丿丞 亘丕賱賮毓賱 賮賷 丕賱賯丕卅賲丞 丕賱鬲賱賯丕卅賷丞',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.title' => '丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷 賱賱鬲胤亘賷賯丕鬲',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.msg' => ({required Object region}) => '鬲賲 鬲毓胤賷賱 賲賷夭丞 丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷 賱賱亘乇賵賰爻賷 亘爻亘亘 鬲睾賷賷乇 丕賱賲賳胤賯丞 廿賱賶 "${region}"',
			'pages.settings.routing.region' => '丕賱賲賳胤賯丞',
			'pages.settings.routing.regions.ir' => '廿賷乇丕賳 (ir)',
			'pages.settings.routing.regions.cn' => '丕賱氐賷賳 (cn)',
			'pages.settings.routing.regions.ru' => '乇賵爻賷丕 (ru)',
			'pages.settings.routing.regions.af' => '兀賮睾丕賳爻鬲丕賳 (af)',
			'pages.settings.routing.regions.id' => '廿賳丿賵賳賷爻賷丕 (id)',
			'pages.settings.routing.regions.tr' => '鬲乇賰賷丕 (tr)',
			'pages.settings.routing.regions.br' => '丕賱亘乇丕夭賷賱 (br)',
			'pages.settings.routing.regions.other' => '兀禺乇賶',
			'pages.settings.routing.balancerStrategy.title' => '丕爻鬲乇丕鬲賷噩賷丞 Balancer',
			'pages.settings.routing.balancerStrategy.roundRobin' => 'Round robin',
			'pages.settings.routing.balancerStrategy.consistentHash' => 'Consistent hash',
			'pages.settings.routing.balancerStrategy.stickySession' => 'Sticky session',
			'pages.settings.routing.blockAds' => '丨馗乇 丕賱廿毓賱丕賳丕鬲',
			'pages.settings.routing.bypassLan' => '鬲噩丕賵夭 丕賱卮亘賰丞 丕賱賲丨賱賷丞',
			'pages.settings.routing.resolveDestination' => '鬲丨丿賷丿 賵噩賴丞 丕賱丕鬲氐丕賱',
			'pages.settings.routing.ipv6Route' => '鬲賵噩賷賴 IPv6',
			'pages.settings.routing.ipv6Modes.disable' => '鬲毓胤賷賱',
			'pages.settings.routing.ipv6Modes.enable' => '鬲賮毓賷賱',
			'pages.settings.routing.ipv6Modes.prefer' => '賲賮囟賱',
			'pages.settings.routing.ipv6Modes.only' => '賮賯胤',
			'pages.settings.routing.routeRule.title' => '賯賵丕毓丿 丕賱鬲賵噩賷賴',
			'pages.settings.routing.routeRule.options.import.clipboard' => '丕爻鬲賷乇丕丿 丕賱賯賵丕毓丿 賲賳 丕賱丨丕賮馗丞',
			'pages.settings.routing.routeRule.options.import.file' => '丕爻鬲賷乇丕丿 丕賱賯賵丕毓丿 賲賳 賲賱賮',
			'pages.settings.routing.routeRule.options.export.clipboard' => '賳爻禺 丕賱賯賵丕毓丿 廿賱賶 丕賱丨丕賮馗丞',
			'pages.settings.routing.routeRule.options.export.file' => '丨賮馗 丕賱賯賵丕毓丿 賮賷 賲賱賮',
			'pages.settings.routing.routeRule.options.reset' => '廿毓丕丿丞 鬲毓賷賷賳 丕賱賯賵丕毓丿',
			'pages.settings.routing.routeRule.deleteRule' => '丨匕賮 丕賱賯丕毓丿丞',
			'pages.settings.routing.routeRule.createRule' => '廿賳卮丕亍 賯丕毓丿丞 噩丿賷丿丞',
			'pages.settings.routing.routeRule.rule.title' => '賯丕毓丿丞',
			'pages.settings.routing.routeRule.rule.ruleChanged' => '鬲賲 鬲睾賷賷乇 丕賱賯丕毓丿丞',
			'pages.settings.routing.routeRule.rule.ruleChangedMsg' => '賴賱 鬲乇賷丿 丨賮馗 鬲毓丿賷賱丕鬲賰責',
			'pages.settings.routing.routeRule.rule.onlyTunMode' => '賲鬲賵賮乇 賮賯胤 賮賷 賵囟毓 TUN',
			'pages.settings.routing.routeRule.rule.notAvailabeInThisPlatform' => '睾賷乇 賲鬲賵賮乇 毓賱賶 賴匕丕 丕賱賳馗丕賲',
			'pages.settings.routing.routeRule.rule.canNotBeEmpty' => '賱丕 賷賲賰賳 兀賳 賷賰賵賳 賮丕乇睾賸丕',
			'pages.settings.routing.routeRule.rule.validUrlEx' => 'https://example.com',
			'pages.settings.routing.routeRule.rule.validUrl' => '"URL" 氐丕賱丨 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}',
			'pages.settings.routing.routeRule.rule.validProcessNameEx' => 'Chrome.exe or google chrome or chrome',
			'pages.settings.routing.routeRule.rule.validProcessName' => '"丕爻賲 丕賱毓賲賱賷丞" 氐丕賱丨 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}',
			'pages.settings.routing.routeRule.rule.validProcessPathEx' => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome',
			'pages.settings.routing.routeRule.rule.validProcessPath' => '"賲爻丕乇 丕賱毓賲賱賷丞" 氐丕賱丨 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}',
			'pages.settings.routing.routeRule.rule.validPortRangeEx' => '80 or 1-65000',
			'pages.settings.routing.routeRule.rule.validPortRange' => '"賲賳賮匕" 兀賵 "賳胤丕賯 賲賳丕賮匕" 氐丕賱丨 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}',
			'pages.settings.routing.routeRule.rule.validIpCidrEx' => '8.8.8.8 or 10.0.0.0/24',
			'pages.settings.routing.routeRule.rule.validIpCidr' => 'IP CIDR 氐丕賱丨 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}',
			'pages.settings.routing.routeRule.rule.validDomainEx' => 'Google.com or dl.google.com',
			'pages.settings.routing.routeRule.rule.validDomain' => '"賳胤丕賯" 氐丕賱丨 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}',
			'pages.settings.routing.routeRule.rule.validDomainSuffixEx' => '.com or .ir',
			'pages.settings.routing.routeRule.rule.validDomainSuffix' => '"賱丕丨賯丞 賳胤丕賯" 氐丕賱丨丞 賲孬賱\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}',
			'pages.settings.routing.routeRule.rule.tileTitle.name' => '丕賱丕爻賲',
			'pages.settings.routing.routeRule.rule.tileTitle.outbound' => '丕賱鬲賵噩賷賴 毓賳丿 丕賱鬲胤丕亘賯',
			'pages.settings.routing.routeRule.rule.tileTitle.rule_set' => '乇丕亘胤 賲噩賲賵毓丞 丕賱賯賵丕毓丿',
			'pages.settings.routing.routeRule.rule.tileTitle.package_name' => '兀爻賲丕亍 丕賱丨夭賲',
			'pages.settings.routing.routeRule.rule.tileTitle.process_name' => '兀爻賲丕亍 丕賱毓賲賱賷丕鬲',
			'pages.settings.routing.routeRule.rule.tileTitle.process_path' => '賲爻丕乇丕鬲 丕賱毓賲賱賷丕鬲',
			'pages.settings.routing.routeRule.rule.tileTitle.network' => '丕賱卮亘賰丕鬲',
			'pages.settings.routing.routeRule.rule.tileTitle.port_range' => '賲賳丕賮匕 丕賱賵噩賴丞',
			'pages.settings.routing.routeRule.rule.tileTitle.source_port_range' => '賲賳丕賮匕 丕賱賲氐丿乇',
			'pages.settings.routing.routeRule.rule.tileTitle.protocol' => '丕賱亘乇賵鬲賵賰賵賱',
			'pages.settings.routing.routeRule.rule.tileTitle.ip_cidr' => 'IP CIDR 丕賱賵噩賴丞',
			'pages.settings.routing.routeRule.rule.tileTitle.source_ip_cidr' => 'IP CIDR 丕賱賲氐丿乇',
			'pages.settings.routing.routeRule.rule.tileTitle.domain' => '丕賱賳胤丕賯',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_suffixe' => '賱丕丨賯丞 丕賱賳胤丕賯',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_keyword' => '賰賱賲丞 賲賮鬲丕丨賷丞 賱賱賳胤丕賯',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_regex' => '鬲毓亘賷乇 賳賲胤賷 賱賱賳胤丕賯',
			'pages.settings.routing.routeRule.rule.outbound.proxy' => '亘乇賵賰爻賷',
			'pages.settings.routing.routeRule.rule.outbound.direct' => '賲亘丕卮乇',
			'pages.settings.routing.routeRule.rule.outbound.direct_with_fragment' => '賲亘丕卮乇 賲毓 Fragment',
			'pages.settings.routing.routeRule.rule.outbound.block' => '丨馗乇',
			'pages.settings.routing.routeRule.rule.network.all' => '丕賱賰賱',
			'pages.settings.routing.routeRule.rule.network.tcp' => 'TCP',
			'pages.settings.routing.routeRule.rule.network.udp' => 'UDP',
			'pages.settings.routing.routeRule.rule.protocol.' => '丕賱賰賱',
			'pages.settings.routing.routeRule.rule.protocol.tls' => 'TLS',
			'pages.settings.routing.routeRule.rule.protocol.http' => 'HTTP',
			'pages.settings.routing.routeRule.rule.protocol.quic' => 'QUIC',
			'pages.settings.routing.routeRule.rule.protocol.stun' => 'STUN',
			'pages.settings.routing.routeRule.rule.protocol.dns' => 'DNS',
			'pages.settings.routing.routeRule.rule.protocol.bittorrent' => 'BitTorrent',
			'pages.settings.routing.routeRule.genericList.addNew' => '廿囟丕賮丞 賯賷賲丞 噩丿賷丿丞',
			'pages.settings.routing.routeRule.genericList.update' => '鬲丨丿賷孬 丕賱賯賷賲丞',
			'pages.settings.routing.routeRule.genericList.clearList' => '賲爻丨 丕賱賯丕卅賲丞',
			'pages.settings.routing.routeRule.genericList.clearListMsg' => '鬲賲 丨匕賮 噩賲賷毓 丕賱毓賳丕氐乇',
			'pages.settings.routing.routeRule.androidApps.pageTitle' => '鬲胤亘賷賯丕鬲 兀賳丿乇賵賷丿',
			'pages.settings.routing.routeRule.androidApps.showSystemApps' => '毓乇囟 鬲胤亘賷賯丕鬲 丕賱賳馗丕賲',
			'pages.settings.routing.routeRule.androidApps.hideSystemApps' => '廿禺賮丕亍 鬲胤亘賷賯丕鬲 丕賱賳馗丕賲',
			'pages.settings.routing.routeRule.androidApps.clearSelection' => '賲爻丨 丕賱鬲丨丿賷丿',
			'pages.settings.routing.routeRule.androidApps.uninstalled' => '睾賷乇 賲孬亘鬲',
			'pages.settings.dns.title' => 'DNS',
			'pages.settings.dns.remoteDns' => 'DNS 丕賱亘毓賷丿',
			'pages.settings.dns.remoteDnsDomainStrategy' => '丕爻鬲乇丕鬲賷噩賷丞 賳胤丕賯 DNS 丕賱亘毓賷丿',
			'pages.settings.dns.directDns' => '賲丨賱賱 禺丕丿賲 丕賱氐丕丿乇 (賲亘丕卮乇)',
			'pages.settings.dns.directDnsDomainStrategy' => '丕爻鬲乇丕鬲賷噩賷丞 丕賱賳胤丕賯 丕賱氐丕丿乇',
			'pages.settings.dns.enableDnsRouting' => '鬲賲賰賷賳 鬲賵噩賷賴 DNS',
			'pages.settings.dns.enableFakeDns' => '鬲賲賰賷賳 DNS 丕賱賵賴賲賷',
			'pages.settings.dns.domainStrategy.auto' => '鬲賱賯丕卅賷',
			'pages.settings.dns.domainStrategy.preferIpv6' => '鬲賮囟賷賱 IPv6',
			'pages.settings.dns.domainStrategy.preferIpv4' => '鬲賮囟賷賱 IPv4',
			'pages.settings.dns.domainStrategy.ipv4Only' => 'IPv4 賮賯胤',
			'pages.settings.dns.domainStrategy.ipv6Only' => 'IPv6 賮賯胤',
			'pages.settings.inbound.title' => '丕賱賵丕乇丿',
			'pages.settings.inbound.serviceMode' => '賵囟毓 丕賱禺丿賲丞',
			'pages.settings.inbound.serviceModes.proxy' => '禺丿賲丞 丕賱亘乇賵賰爻賷 賮賯胤',
			'pages.settings.inbound.serviceModes.systemProxy' => '鬲毓賷賷賳 亘乇賵賰爻賷 丕賱賳馗丕賲',
			'pages.settings.inbound.serviceModes.tun' => 'VPN',
			'pages.settings.inbound.serviceModes.tunService' => '禺丿賲丞 VPN',
			'pages.settings.inbound.shortServiceModes.proxy' => '亘乇賵賰爻賷',
			'pages.settings.inbound.shortServiceModes.systemProxy' => '亘乇賵賰爻賷 丕賱賳馗丕賲',
			'pages.settings.inbound.shortServiceModes.tun' => 'VPN',
			'pages.settings.inbound.shortServiceModes.tunService' => '禺丿賲丞 VPN',
			'pages.settings.inbound.strictRoute' => '鬲賵噩賷賴 氐丕乇賲',
			'pages.settings.inbound.tunImplementation' => '鬲賳賮賷匕 Tun',
			'pages.settings.inbound.tunImplementations.mixed' => '賲禺鬲賱胤',
			'pages.settings.inbound.tunImplementations.system' => '丕賱賳馗丕賲',
			'pages.settings.inbound.tunImplementations.gvisor' => 'gVisor',
			'pages.settings.inbound.mixedPort' => '賲賳賮匕 賲禺鬲賱胤',
			'pages.settings.inbound.tproxyPort' => '賲賳賮匕 丕賱亘乇賵賰爻賷 丕賱卮賮丕賮',
			'pages.settings.inbound.directPort' => '賲賳賮匕 賲亘丕卮乇',
			'pages.settings.inbound.redirectPort' => '賲賳賮匕 廿毓丕丿丞 丕賱鬲賵噩賷賴',
			'pages.settings.inbound.allowConnectionFromLan' => '賲卮丕乇賰丞 VPN 毓賱賶 丕賱卮亘賰丞 丕賱賲丨賱賷丞',
			'pages.settings.tlsTricks.title' => '丨賷賱 TLS',
			'pages.settings.tlsTricks.enable' => '鬲賮毓賷賱 fragment',
			'pages.settings.tlsTricks.packets' => '丨夭賲 丕賱鬲噩夭卅丞',
			'pages.settings.tlsTricks.packetsTlsHello' => 'TLS Hello',
			'pages.settings.tlsTricks.packets1_1' => '1-1',
			'pages.settings.tlsTricks.packets1_2' => '1-2',
			'pages.settings.tlsTricks.packets1_3' => '1-3',
			'pages.settings.tlsTricks.packets1_4' => '1-4',
			'pages.settings.tlsTricks.packets1_5' => '1-5',
			'pages.settings.tlsTricks.size' => '丨噩賲 fragment',
			'pages.settings.tlsTricks.sleep' => '鬲兀禺賷乇 fragment',
			'pages.settings.tlsTricks.mixedSniCase.enable' => '鬲賮毓賷賱 丕賱兀丨乇賮 丕賱賲禺鬲賱胤丞 賱賭 SNI',
			'pages.settings.tlsTricks.padding.enable' => '鬲賮毓賷賱 padding',
			'pages.settings.tlsTricks.padding.size' => '丨噩賲 padding',
			'pages.settings.warp.title' => 'WARP',
			'pages.settings.warp.enable' => '鬲賮毓賷賱 WARP',
			'pages.settings.warp.generateConfig' => '廿賳卮丕亍 鬲賰賵賷賳 WARP',
			'pages.settings.warp.configGenerated' => '鬲賲 廿賳卮丕亍 鬲賰賵賷賳 WARP',
			'pages.settings.warp.missingConfig' => '鬲賰賵賷賳 WARP 賲賮賯賵丿',
			'pages.settings.warp.detourMode' => '賵囟毓 鬲賵噩賷賴 WARP',
			'pages.settings.warp.detourModes.proxyOverWarp' => '鬲賵噩賷賴 丕賱亘乇賵賰爻賷丕鬲 毓亘乇 WARP',
			'pages.settings.warp.detourModes.warpOverProxy' => '鬲賵噩賷賴 WARP 毓亘乇 丕賱亘乇賵賰爻賷丕鬲',
			'pages.settings.warp.detourModes.proxyOverWarpExplain' => '賱廿賱睾丕亍 丨馗乇 丕賱亘乇賵賰爻賷丕鬲 亘賵丕爻胤丞 WARP',
			'pages.settings.warp.detourModes.warpOverProxyExplain' => '賱兀賲丕賳 廿囟丕賮賷 亘賵丕爻胤丞 WARP',
			'pages.settings.warp.licenseKey' => '賲賮鬲丕丨 丕賱鬲乇禺賷氐',
			'pages.settings.warp.cleanIp' => 'IP 賳馗賷賮',
			'pages.settings.warp.port' => '丕賱賲賳賮匕',
			'pages.settings.warp.noise.count' => '毓丿丿 丕賱囟賵囟丕亍',
			'pages.settings.warp.noise.mode' => '賵囟毓 丕賱囟賵囟丕亍',
			'pages.settings.warp.noise.size' => '丨噩賲 丕賱囟賵囟丕亍',
			'pages.settings.warp.noise.delay' => '鬲兀禺賷乇 丕賱囟賵囟丕亍',
			'components.stats.connection' => '丕賱丕鬲氐丕賱',
			'components.stats.traffic' => '丕賱亘賷丕賳丕鬲',
			'components.stats.trafficLive' => '丕賱亘賷丕賳丕鬲 丕賱丨丕賱賷丞',
			'components.stats.trafficTotal' => '廿噩賲丕賱賷 丕賱亘賷丕賳丕鬲',
			'components.stats.uplink' => '丕賱廿乇爻丕賱',
			'components.stats.downlink' => '丕賱丕爻鬲賯亘丕賱',
			'components.stats.speed' => '丕賱爻乇毓丞',
			'components.stats.totalTransferred' => '廿噩賲丕賱賷 丕賱賳賯賱',
			'components.subscriptionInfo.upload' => '丕賱乇賮毓',
			'components.subscriptionInfo.download' => '丕賱鬲賳夭賷賱',
			'components.subscriptionInfo.total' => '廿噩賲丕賱賷 丕賱亘賷丕賳丕鬲',
			'components.subscriptionInfo.expireDate' => '鬲丕乇賷禺 丕賱丕賳鬲賴丕亍',
			'components.subscriptionInfo.expired' => '賲賳鬲賴賷 丕賱氐賱丕丨賷丞',
			'components.subscriptionInfo.noTraffic' => '賳賮丿鬲 丕賱亘丕賯丞',
			'components.subscriptionInfo.remainingTime' => '丕賱賵賯鬲 丕賱賲鬲亘賯賷',
			'components.subscriptionInfo.remainingDuration' => ({required Object duration}) => '賲鬲亘賯賺 ${duration} 賷賵賲',
			'components.subscriptionInfo.remainingDurationNew' => ({required Object duration}) => '${duration} 賷賵賲',
			'components.subscriptionInfo.remainingTrafficSemanticLabel' => ({required Object consumed, required Object total}) => '鬲賲 丕爻鬲賴賱丕賰 ${consumed} 賲賳 ${total}',
			'components.subscriptionInfo.remainingTraffic' => '丕賱亘賷丕賳丕鬲 丕賱賲鬲亘賯賷丞',
			'components.subscriptionInfo.remainingUsage' => '丕賱賲鬲亘賯賷',
			'components.subscriptionInfo.profileSite' => '丕賱賲夭賵賾丿',
			'components.subscriptionInfo.profileSupport' => '丕賱丿毓賲',
			'dialogs.sortProfiles.title' => '賮乇夭 丨爻亘',
			'dialogs.sortProfiles.sort.name' => '兀亘噩丿賷賸丕',
			'dialogs.sortProfiles.sort.lastUpdate' => '丌禺乇 鬲丨丿賷孬',
			'dialogs.warpLicense.title' => '賲賵丕賮賯丞 Cloudflare WARP',
			'dialogs.warpLicense.description' => ({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [ const TextSpan(text: 'Cloudflare WARP 賴賵 賲夭賵丿 VPN 賲噩丕賳賷 賱賭 WireGuard. 亘鬲賮毓賷賱 賴匕丕 丕賱禺賷丕乇貙 賮廿賳賰 鬲賵丕賮賯 毓賱賶 '), tos('卮乇賵胤 丕賱禺丿賲丞'), const TextSpan(text: ' 賵 '), privacy('爻賷丕爻丞 丕賱禺氐賵氐賷丞'), const TextSpan(text: ' 丕賱禺丕氐丞 亘賭 Cloudflare WARP.'), ]), 
			'dialogs.newVersion.title' => '鬲丨丿賷孬 賲鬲丕丨',
			'dialogs.newVersion.msg' => '廿氐丿丕乇 噩丿賷丿 賲賳 ${_root.common.appTitle} 賲鬲丕丨. 賴賱 鬲乇睾亘 賮賷 丕賱鬲丨丿賷孬 丕賱丌賳責',
			'dialogs.newVersion.currentVersion' => '丕賱廿氐丿丕乇 丕賱丨丕賱賷: ',
			'dialogs.newVersion.newVersion' => '丕賱廿氐丿丕乇 丕賱噩丿賷丿: ',
			'dialogs.newVersion.updateNow' => '丕賱鬲丨丿賷孬 丕賱丌賳',
			'dialogs.confirmation.settings.import.msg' => '爻賷丐丿賷 賴匕丕 廿賱賶 丕爻鬲亘丿丕賱 噩賲賷毓 廿毓丿丕丿丕鬲賰 丕賱丨丕賱賷丞. 賴賱 兀賳鬲 賲鬲兀賰丿責',
			'dialogs.confirmation.profile.delete.title' => '丨匕賮 丕賱賲賱賮 丕賱卮禺氐賷',
			'dialogs.confirmation.profile.delete.msg' => '賴賱 兀賳鬲 賲鬲兀賰丿 賲賳 乇睾亘鬲賰 賮賷 丨匕賮 賴匕丕 丕賱賲賱賮 丕賱卮禺氐賷 賳賴丕卅賷賸丕責',
			'dialogs.confirmation.perAppProxy.shareOnGithub.title' => '鬲丨爻賷賳 丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷',
			'dialogs.confirmation.perAppProxy.shareOnGithub.msg' => '亘賲卮丕乇賰丞 丕賱鬲胤亘賷賯丕鬲 丕賱鬲賷 丕禺鬲乇鬲賴丕貙 賮廿賳賰 鬲爻丕毓丿 賮賷 廿賰賲丕賱 賯丕卅賲丞 "丕賱丕禺鬲賷丕乇 丕賱鬲賱賯丕卅賷"',
			'dialogs.confirmation.perAppProxy.import.msg' => '爻賷丐丿賷 賴匕丕 廿賱賶 丕爻鬲亘丿丕賱 噩賲賷毓 鬲丨丿賷丿丕鬲賰 丕賱丨丕賱賷丞 賱亘乇賵賰爻賷 丕賱鬲胤亘賷賯丕鬲. 賴賱 兀賳鬲 賲鬲兀賰丿 賲賳 乇睾亘鬲賰 賮賷 丕賱賲鬲丕亘毓丞責',
			'dialogs.confirmation.routeRule.delete.title' => '丨匕賮 丕賱賯丕毓丿丞',
			'dialogs.confirmation.routeRule.delete.msg' => ({required Object rulename}) => '賴賱 兀賳鬲 賲鬲兀賰丿 賲賳 乇睾亘鬲賰 賮賷 丨匕賮 賯丕毓丿丞 "${rulename}"責',
			'dialogs.experimentalNotice.title' => '賲賷夭丕鬲 鬲噩乇賷亘賷丞 賯賷丿 丕賱丕爻鬲禺丿丕賲',
			'dialogs.experimentalNotice.msg' => '賱賯丿 賮毓賾賱鬲 賲賷夭丕鬲 鬲噩乇賷亘賷丞 賯丿 鬲丐孬乇 毓賱賶 噩賵丿丞 丕賱丕鬲氐丕賱 賵鬲爻亘亘 兀禺胤丕亍 睾賷乇 賲鬲賵賯毓丞. 賷賲賰賳賰 丿丕卅賲賸丕 鬲睾賷賷乇 賴匕賴 丕賱禺賷丕乇丕鬲 兀賵 廿毓丕丿丞 鬲毓賷賷賳賴丕 賲賳 氐賮丨丞 丕賱廿毓丿丕丿丕鬲.',
			'dialogs.experimentalNotice.disable' => '賱丕 鬲毓乇囟 賲乇丞 兀禺乇賶',
			'dialogs.noActiveProfile.title' => '丕禺鬲乇 賲賱賮賸丕 卮禺氐賷賸丕',
			'dialogs.noActiveProfile.msg' => '賱賱亘丿亍貙 賯賲 亘廿囟丕賮丞 賲賱賮 丕鬲氐丕賱 賷丨鬲賵賷 毓賱賶 鬲賮丕氐賷賱 丕鬲氐丕賱 VPN 丕賱禺丕氐丞 亘賰.\n\n兀賱賷爻 賱丿賷賰 禺丕丿賲 VPN 亘毓丿責 賱丕 鬲賯賱賯貙 丕鬲亘毓 丕賱丿賱賷賱 兀丿賳丕賴 賱廿毓丿丕丿 賵丕丨丿 亘爻乇毓丞 賵賲噩丕賳賸丕.',
			'dialogs.noActiveProfile.helpBtn.label' => '兀乇賳賷 賰賷賮',
			'dialogs.noActiveProfile.helpBtn.url' => 'https://github.com/shulaiyun/Sloth-VPN.git',
			'dialogs.unknownDomainsWarning.title' => '鬲丨匕賷乇 賲賳 乇丕亘胤 禺丕乇噩賷',
			'dialogs.unknownDomainsWarning.youAreAboutToVisit' => '兀賳鬲 毓賱賶 賵卮賰 夭賷丕乇丞:',
			'dialogs.unknownDomainsWarning.thisWebsiteIsNotInOurTrustedList' => '賴匕丕 丕賱賲賵賯毓 賱賷爻 囟賲賳 賯丕卅賲丞 丕賱賲賵丕賯毓 丕賱賲賵孬賵賯丞 賱丿賷賳丕. 賷乇噩賶 丕賱賲鬲丕亘毓丞 亘丨匕乇.',
			'dialogs.proxyInfo.fullTag' => '丕賱毓賱丕賲丞 丕賱賰丕賲賱丞:',
			'dialogs.proxyInfo.type' => '丕賱賳賵毓:',
			'dialogs.proxyInfo.testTime' => '賵賯鬲 丕賱丕禺鬲亘丕乇:',
			'dialogs.proxyInfo.testDelay' => '鬲兀禺賷乇 丕賱丕禺鬲亘丕乇:',
			'dialogs.proxyInfo.isSelected' => '賲丨丿丿:',
			'dialogs.proxyInfo.isGroup' => '賲噩賲賵毓丞',
			'dialogs.proxyInfo.isSecure' => '丌賲賳:',
			'dialogs.proxyInfo.port' => '丕賱賲賳賮匕:',
			'dialogs.proxyInfo.host' => '丕賱賲囟賷賮:',
			'dialogs.proxyInfo.ip' => 'IP:',
			'dialogs.proxyInfo.countryCode' => '乇賲夭 丕賱丿賵賱丞:',
			'dialogs.proxyInfo.region' => '丕賱賲賳胤賯丞:',
			'dialogs.proxyInfo.city' => '丕賱賲丿賷賳丞:',
			'dialogs.proxyInfo.asn' => 'ASN:',
			'dialogs.proxyInfo.organization' => '丕賱賲購賳馗賲丞:',
			'dialogs.proxyInfo.location' => '丕賱賲賵賯毓:',
			'dialogs.proxyInfo.postalCode' => '丕賱乇賲夭 丕賱亘乇賷丿賷:',
			'dialogs.windowClosing.askEachTime' => '丕賱爻丐丕賱 賰賱 賲乇丞',
			'dialogs.windowClosing.alertMessage' => '賴賱 鬲乇賷丿 廿禺賮丕亍 丕賱鬲胤亘賷賯 兀賲 丕賱禺乇賵噩 賲賳賴責',
			'dialogs.windowClosing.remember' => '鬲匕賰乇 禺賷丕乇賷',
			'connection.tapToConnect' => '丕賳賯乇 賱賱丕鬲氐丕賱',
			'connection.connect' => '丕鬲氐丕賱',
			'connection.connecting' => '噩丕乇 丕賱丕鬲氐丕賱...',
			'connection.connected' => '賲鬲氐賱',
			'connection.disconnect' => '賯胤毓 丕賱丕鬲氐丕賱',
			'connection.disconnecting' => '噩丕乇賷 賯胤毓 丕賱丕鬲氐丕賱...',
			'connection.reconnect' => '廿毓丕丿丞 丕賱丕鬲氐丕賱',
			'connection.reconnectMsg' => '噩丕乇賷 廿毓丕丿丞 丕賱丕鬲氐丕賱 賱鬲胤亘賷賯 丕賱鬲睾賷賷乇丕鬲...',
			'connection.secure' => '賲購丐賲賾賻賳 亘賵丕爻胤丞 WARP',
			'errors.unexpected' => '禺胤兀 睾賷乇 賲鬲賵賯毓',
			'errors.connection.unexpected' => '禺胤兀 丕鬲氐丕賱 睾賷乇 賲鬲賵賯毓',
			'errors.connection.timeout' => '丕賳鬲賴賶 賵賯鬲 丕賱丕鬲氐丕賱',
			'errors.connection.badResponse' => '丕爻鬲噩丕亘丞 睾賷乇 氐丕賱丨丞',
			'errors.connection.connectionError' => '禺胤兀 賮賷 丕賱丕鬲氐丕賱',
			'errors.connection.badCertificate' => '卮賴丕丿丞 睾賷乇 氐丕賱丨丞',
			'errors.profiles.unexpected' => '禺胤兀 睾賷乇 賲鬲賵賯毓',
			'errors.profiles.notFound' => '賱賲 賷鬲賲 丕賱毓孬賵乇 毓賱賶 丕賱賲賱賮 丕賱卮禺氐賷',
			'errors.profiles.invalidConfig' => '鬲賰賵賷賳丕鬲 睾賷乇 氐丕賱丨丞',
			'errors.profiles.invalidUrl' => '乇丕亘胤 睾賷乇 氐丕賱丨',
			'errors.profiles.canceledByUser' => '鬲賲 丕賱廿賱睾丕亍 賲賳 賯亘賱 丕賱賲爻鬲禺丿賲',
			'errors.connectivity.unexpected' => '賮卮賱 睾賷乇 賲鬲賵賯毓',
			'errors.connectivity.missingVpnPermission' => '廿匕賳 丕賱賭 VPN 賲賮賯賵丿',
			'errors.connectivity.missingNotificationPermission' => '廿匕賳 丕賱廿卮毓丕乇丕鬲 賲賮賯賵丿',
			'errors.connectivity.core' => '禺胤兀 賮賷 丕賱賳賵丕丞',
			'errors.singbox.serviceNotRunning' => '丕賱禺丿賲丞 賱丕 鬲毓賲賱',
			'errors.singbox.missingPrivilege' => '氐賱丕丨賷丕鬲 賲胤賱賵亘丞',
			'errors.singbox.missingPrivilegeMsg' => '賵囟毓 丕賱賭 VPN 賷鬲胤賱亘 氐賱丕丨賷丕鬲 丕賱賲爻丐賵賱. 賷乇噩賶 廿毓丕丿丞 鬲卮睾賷賱 丕賱鬲胤亘賷賯 賰賲爻丐賵賱 兀賵 鬲睾賷賷乇 賵囟毓 丕賱禺丿賲丞.',
			'errors.singbox.invalidConfigOptions' => '禺賷丕乇丕鬲 鬲賰賵賷賳 睾賷乇 氐丕賱丨丞',
			'errors.singbox.invalidConfig' => '鬲賰賵賷賳 睾賷乇 氐丕賱丨',
			'errors.warp.missingLicense' => '乇禺氐丞 WARP 賲賮賯賵丿丞',
			'errors.warp.missingLicenseMsg' => '丕賱賲賱賮 丕賱卮禺氐賷 丕賱賲丨丿丿 賷爻鬲禺丿賲 賲賷夭丞 WARP. 賱丕爻鬲禺丿丕賲 賴匕賴 丕賱賲賷夭丞貙 賷噩亘 丕賱賲賵丕賮賯丞 毓賱賶 卮乇賵胤 乇禺氐丞 WARP.',
			_ => null,
		};
	}
}

