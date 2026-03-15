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
class TranslationsTr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsTr _root = this; // ignore: unused_field

	@override 
	TranslationsTr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTr(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonTr common = TranslationsCommonTr._(_root);
	@override late final TranslationsIntroTr intro = TranslationsIntroTr._(_root);
	@override late final TranslationsPagesTr pages = TranslationsPagesTr._(_root);
	@override late final TranslationsComponentsTr components = TranslationsComponentsTr._(_root);
	@override late final TranslationsDialogsTr dialogs = TranslationsDialogsTr._(_root);
	@override late final TranslationsConnectionTr connection = TranslationsConnectionTr._(_root);
	@override late final TranslationsErrorsTr errors = TranslationsErrorsTr._(_root);
}

// Path: common
class TranslationsCommonTr extends TranslationsCommonEn {
	TranslationsCommonTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get appTitle => '树懒VPN';
	@override String get start => 'Ba艧lat';
	@override String get version => 'S眉r眉m';
	@override String get ok => 'Tamam';
	@override String get cancel => '陌ptal';
	@override String get kContinue => 'Devam et';
	@override String get showMore => 'Daha fazla g枚ster';
	@override String get showLess => 'Daha az g枚ster';
	@override String get filter => 'Filtrele';
	@override String get all => 'T眉m眉';
	@override String get pause => 'Duraklat';
	@override String get resume => 'Devam et';
	@override String get clear => 'Temizle';
	@override String get close => 'Kapat';
	@override String get auto => 'Otomatik';
	@override String get manually => 'Manuel';
	@override String get name => '陌sim';
	@override String get url => 'URL';
	@override String get add => 'Ekle';
	@override String get clipboard => 'Pano';
	@override String get addToClipboard => 'Panoya ekle';
	@override String get scanQr => 'QR Tara';
	@override String get free => '脺cretsiz';
	@override String get warp => 'WARP';
	@override String get fragment => 'Fragment';
	@override String get help => 'Yard谋m';
	@override String get save => 'Kaydet';
	@override String get update => 'G眉ncelle';
	@override String get share => 'Payla艧';
	@override String get edit => 'D眉zenle';
	@override String get delete => 'Sil';
	@override String get discard => 'Vazge莽';
	@override String get import => '陌莽e aktar';
	@override String get export => 'D谋艧a aktar';
	@override String get later => 'Daha sonra';
	@override String get ignore => 'Yoksay';
	@override String get quit => '脟谋k';
	@override String get notSet => 'Ayarlanmad谋';
	@override String get hide => 'Gizle';
	@override String get exit => '脟谋k谋艧';
	@override String get reset => 'S谋f谋rla';
	@override String get done => 'Bitti';
	@override String get search => 'Ara';
	@override String get decline => 'Reddet';
	@override String get agree => 'Kabul et';
	@override String get empty => 'Bo艧';
	@override String get unknown => 'Bilinmeyen';
	@override String get hidden => 'Gizli';
	@override String get timeout => 'Zaman a艧谋m谋';
	@override String get sort => 'S谋rala';
	@override String get dashboard => 'G枚sterge Paneli';
	@override late final TranslationsCommonIntervalTr interval = TranslationsCommonIntervalTr._(_root);
	@override late final TranslationsCommonMsgTr msg = TranslationsCommonMsgTr._(_root);
}

// Path: intro
class TranslationsIntroTr extends TranslationsIntroEn {
	TranslationsIntroTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get banner => 'S谋n谋rs谋z bir internet i莽in ihtiyac谋n谋z olan her 艧ey';
	@override TextSpan termsAndPolicyCaution({required InlineSpanBuilder tap}) => TextSpan(children: [
		const TextSpan(text: 'Devam ederek '),
		tap(_root.pages.about.termsAndConditions),
		const TextSpan(text: ' kabul etmi艧 olursunuz'),
	]);
	@override TextSpan info({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [
		const TextSpan(text: 'Hiddify taraf谋ndan 鉂わ笍 ile yap谋ld谋 - '),
		tap_source('A莽谋k Kaynak'),
		const TextSpan(text: ' ('),
		tap_license('Lisans'),
		const TextSpan(text: ')'),
	]);
}

// Path: pages
class TranslationsPagesTr extends TranslationsPagesEn {
	TranslationsPagesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesHomeTr home = TranslationsPagesHomeTr._(_root);
	@override late final TranslationsPagesProxiesTr proxies = TranslationsPagesProxiesTr._(_root);
	@override late final TranslationsPagesProfilesTr profiles = TranslationsPagesProfilesTr._(_root);
	@override late final TranslationsPagesProfileDetailsTr profileDetails = TranslationsPagesProfileDetailsTr._(_root);
	@override late final TranslationsPagesLogsTr logs = TranslationsPagesLogsTr._(_root);
	@override late final TranslationsPagesAboutTr about = TranslationsPagesAboutTr._(_root);
	@override late final TranslationsPagesSettingsTr settings = TranslationsPagesSettingsTr._(_root);
}

// Path: components
class TranslationsComponentsTr extends TranslationsComponentsEn {
	TranslationsComponentsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsComponentsStatsTr stats = TranslationsComponentsStatsTr._(_root);
	@override late final TranslationsComponentsSubscriptionInfoTr subscriptionInfo = TranslationsComponentsSubscriptionInfoTr._(_root);
}

// Path: dialogs
class TranslationsDialogsTr extends TranslationsDialogsEn {
	TranslationsDialogsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsSortProfilesTr sortProfiles = TranslationsDialogsSortProfilesTr._(_root);
	@override late final TranslationsDialogsWarpLicenseTr warpLicense = TranslationsDialogsWarpLicenseTr._(_root);
	@override late final TranslationsDialogsNewVersionTr newVersion = TranslationsDialogsNewVersionTr._(_root);
	@override late final TranslationsDialogsConfirmationTr confirmation = TranslationsDialogsConfirmationTr._(_root);
	@override late final TranslationsDialogsExperimentalNoticeTr experimentalNotice = TranslationsDialogsExperimentalNoticeTr._(_root);
	@override late final TranslationsDialogsNoActiveProfileTr noActiveProfile = TranslationsDialogsNoActiveProfileTr._(_root);
	@override late final TranslationsDialogsUnknownDomainsWarningTr unknownDomainsWarning = TranslationsDialogsUnknownDomainsWarningTr._(_root);
	@override late final TranslationsDialogsProxyInfoTr proxyInfo = TranslationsDialogsProxyInfoTr._(_root);
	@override late final TranslationsDialogsWindowClosingTr windowClosing = TranslationsDialogsWindowClosingTr._(_root);
}

// Path: connection
class TranslationsConnectionTr extends TranslationsConnectionEn {
	TranslationsConnectionTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get tapToConnect => 'Ba臒lanmak i莽in dokunun';
	@override String get connect => 'Ba臒lan';
	@override String get connecting => 'Ba臒lan谋yor...';
	@override String get connected => 'Ba臒l谋';
	@override String get disconnect => 'Ba臒lant谋y谋 kes';
	@override String get disconnecting => 'Ba臒lant谋 kesiliyor...';
	@override String get reconnect => 'Yeniden ba臒lan';
	@override String get reconnectMsg => 'De臒i艧iklikleri uygulamak i莽in yeniden ba臒lan谋l谋yor...';
	@override String get secure => 'WARP ile g眉vende';
}

// Path: errors
class TranslationsErrorsTr extends TranslationsErrorsEn {
	TranslationsErrorsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Beklenmeyen hata';
	@override late final TranslationsErrorsConnectionTr connection = TranslationsErrorsConnectionTr._(_root);
	@override late final TranslationsErrorsProfilesTr profiles = TranslationsErrorsProfilesTr._(_root);
	@override late final TranslationsErrorsConnectivityTr connectivity = TranslationsErrorsConnectivityTr._(_root);
	@override late final TranslationsErrorsSingboxTr singbox = TranslationsErrorsSingboxTr._(_root);
	@override late final TranslationsErrorsWarpTr warp = TranslationsErrorsWarpTr._(_root);
}

// Path: common.interval
class TranslationsCommonIntervalTr extends TranslationsCommonIntervalEn {
	TranslationsCommonIntervalTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(n,
		zero: '',
		one: '${n} g眉n',
		other: '${n} g眉n',
	);
	@override String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(n,
		zero: '',
		one: '${n} saat',
		other: '${n} saat',
	);
}

// Path: common.msg
class TranslationsCommonMsgTr extends TranslationsCommonMsgEn {
	TranslationsCommonMsgTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgPermissionTr permission = TranslationsCommonMsgPermissionTr._(_root);
	@override late final TranslationsCommonMsgExportTr export = TranslationsCommonMsgExportTr._(_root);
	@override late final TranslationsCommonMsgImportTr import = TranslationsCommonMsgImportTr._(_root);
}

// Path: pages.home
class TranslationsPagesHomeTr extends TranslationsPagesHomeEn {
	TranslationsPagesHomeTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ana Sayfa';
	@override String get quickSettings => 'H谋zl谋 ayarlar';
}

// Path: pages.proxies
class TranslationsPagesProxiesTr extends TranslationsPagesProxiesEn {
	TranslationsPagesProxiesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Proxy\'ler';
	@override String get sort => 'Proxy\'leri s谋rala';
	@override String get testDelay => 'Gecikmeyi test et';
	@override String get empty => 'Kullan谋labilir proxy yok';
	@override String get activeProxy => 'Aktif proxy';
	@override String get unknownIp => 'Bilinmeyen IP';
	@override late final TranslationsPagesProxiesSortOptionsTr sortOptions = TranslationsPagesProxiesSortOptionsTr._(_root);
	@override late final TranslationsPagesProxiesIpInfoTr ipInfo = TranslationsPagesProxiesIpInfoTr._(_root);
	@override late final TranslationsPagesProxiesDelayTr delay = TranslationsPagesProxiesDelayTr._(_root);
}

// Path: pages.profiles
class TranslationsPagesProfilesTr extends TranslationsPagesProfilesEn {
	TranslationsPagesProfilesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profiller';
	@override String get add => 'Profil ekle';
	@override String get update => 'Profili g眉ncelle';
	@override String get viewAllProfiles => 'T眉m profilleri g枚r眉nt眉le';
	@override String activeProfileName({required Object name}) => 'Aktif profil ad谋: "${name}".';
	@override String nonActiveProfileName({required Object name}) => 'Aktif profil olarak "${name}" se莽in';
	@override String get freeSubNotFound => '脺cretsiz abonelik bulunamad谋';
	@override String freeSubNotFoundForRegion({required Object region}) => '"${region}" b枚lgesi i莽in 眉cretsiz abonelik bulunamad谋';
	@override String get failedToLoad => 'Y眉klenemedi';
	@override String get updateSubscriptions => 'Abonelikleri g眉ncelle';
	@override late final TranslationsPagesProfilesShareTr share = TranslationsPagesProfilesShareTr._(_root);
	@override late final TranslationsPagesProfilesMsgTr msg = TranslationsPagesProfilesMsgTr._(_root);
}

// Path: pages.profileDetails
class TranslationsPagesProfileDetailsTr extends TranslationsPagesProfileDetailsEn {
	TranslationsPagesProfileDetailsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override String get lastUpdate => 'Son g眉ncelleme';
	@override late final TranslationsPagesProfileDetailsFormTr form = TranslationsPagesProfileDetailsFormTr._(_root);
}

// Path: pages.logs
class TranslationsPagesLogsTr extends TranslationsPagesLogsEn {
	TranslationsPagesLogsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Loglar';
	@override String get shareCoreLogs => '脟ekirdek loglar谋n谋 payla艧';
	@override String get shareAppLogs => 'Uygulama loglar谋n谋 payla艧';
}

// Path: pages.about
class TranslationsPagesAboutTr extends TranslationsPagesAboutEn {
	TranslationsPagesAboutTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hakk谋nda';
	@override String get notAvailableMsg => 'Zaten en son s眉r眉m眉 kullan谋yorsunuz';
	@override String get checkForUpdate => 'G眉ncellemeleri kontrol et';
	@override String get openWorkingDir => '脟al谋艧ma dizinini a莽';
	@override String get sourceCode => 'Kaynak kodu';
	@override String get telegramChannel => 'Telegram kanal谋';
	@override String get termsAndConditions => '艦artlar ve Ko艧ullar';
	@override String get privacyPolicy => 'Gizlilik Politikas谋';
}

// Path: pages.settings
class TranslationsPagesSettingsTr extends TranslationsPagesSettingsEn {
	TranslationsPagesSettingsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ayarlar';
	@override String get resetTunnel => 'VPN profilini s谋f谋rla';
	@override late final TranslationsPagesSettingsOptionsTr options = TranslationsPagesSettingsOptionsTr._(_root);
	@override late final TranslationsPagesSettingsGeneralTr general = TranslationsPagesSettingsGeneralTr._(_root);
	@override late final TranslationsPagesSettingsRoutingTr routing = TranslationsPagesSettingsRoutingTr._(_root);
	@override late final TranslationsPagesSettingsDnsTr dns = TranslationsPagesSettingsDnsTr._(_root);
	@override late final TranslationsPagesSettingsInboundTr inbound = TranslationsPagesSettingsInboundTr._(_root);
	@override late final TranslationsPagesSettingsTlsTricksTr tlsTricks = TranslationsPagesSettingsTlsTricksTr._(_root);
	@override late final TranslationsPagesSettingsWarpTr warp = TranslationsPagesSettingsWarpTr._(_root);
}

// Path: components.stats
class TranslationsComponentsStatsTr extends TranslationsComponentsStatsEn {
	TranslationsComponentsStatsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get connection => 'Ba臒lant谋';
	@override String get traffic => 'Trafik';
	@override String get trafficLive => 'Canl谋 trafik';
	@override String get trafficTotal => 'Toplam trafik';
	@override String get uplink => 'Y眉kleme';
	@override String get downlink => '陌ndirme';
	@override String get speed => 'H谋z';
	@override String get totalTransferred => 'Toplam aktar谋lan';
}

// Path: components.subscriptionInfo
class TranslationsComponentsSubscriptionInfoTr extends TranslationsComponentsSubscriptionInfoEn {
	TranslationsComponentsSubscriptionInfoTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get upload => 'Y眉kleme';
	@override String get download => '陌ndirme';
	@override String get total => 'Toplam trafik';
	@override String get expireDate => 'Biti艧 tarihi';
	@override String get expired => 'S眉resi doldu';
	@override String get noTraffic => 'Kota doldu';
	@override String get remainingTime => 'Kalan s眉re';
	@override String remainingDuration({required Object duration}) => 'kalan ${duration} g眉n';
	@override String remainingDurationNew({required Object duration}) => '${duration} g眉n';
	@override String remainingTrafficSemanticLabel({required Object consumed, required Object total}) => '${consumed} / ${total} trafik kullan谋ld谋';
	@override String get remainingTraffic => 'Kalan trafik';
	@override String get remainingUsage => 'Kalan';
	@override String get profileSite => 'Sa臒lay谋c谋';
	@override String get profileSupport => 'Destek';
}

// Path: dialogs.sortProfiles
class TranslationsDialogsSortProfilesTr extends TranslationsDialogsSortProfilesEn {
	TranslationsDialogsSortProfilesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'S谋ralama 枚l莽眉t眉';
	@override late final TranslationsDialogsSortProfilesSortTr sort = TranslationsDialogsSortProfilesSortTr._(_root);
}

// Path: dialogs.warpLicense
class TranslationsDialogsWarpLicenseTr extends TranslationsDialogsWarpLicenseEn {
	TranslationsDialogsWarpLicenseTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cloudflare WARP onay谋';
	@override TextSpan description({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [
		const TextSpan(text: 'Cloudflare WARP 眉cretsiz bir WireGuard VPN sa臒lay谋c谋s谋d谋r. Bu se莽ene臒i etkinle艧tirerek Cloudflare WARP\'谋n '),
		tos('Hizmet 艦artlar谋'),
		const TextSpan(text: '\'n谋 ve '),
		privacy('Gizlilik Politikas谋'),
		const TextSpan(text: '\'n谋 kabul etmi艧 olursunuz.'),
	]);
}

// Path: dialogs.newVersion
class TranslationsDialogsNewVersionTr extends TranslationsDialogsNewVersionEn {
	TranslationsDialogsNewVersionTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'G眉ncelleme mevcut';
	@override String get msg => '${_root.common.appTitle}\'谋n yeni bir s眉r眉m眉 mevcut. 艦imdi g眉ncellemek ister misiniz?';
	@override String get currentVersion => 'Mevcut s眉r眉m: ';
	@override String get newVersion => 'Yeni s眉r眉m: ';
	@override String get updateNow => '艦imdi g眉ncelle';
}

// Path: dialogs.confirmation
class TranslationsDialogsConfirmationTr extends TranslationsDialogsConfirmationEn {
	TranslationsDialogsConfirmationTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsTr settings = TranslationsDialogsConfirmationSettingsTr._(_root);
	@override late final TranslationsDialogsConfirmationProfileTr profile = TranslationsDialogsConfirmationProfileTr._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyTr perAppProxy = TranslationsDialogsConfirmationPerAppProxyTr._(_root);
	@override late final TranslationsDialogsConfirmationRouteRuleTr routeRule = TranslationsDialogsConfirmationRouteRuleTr._(_root);
}

// Path: dialogs.experimentalNotice
class TranslationsDialogsExperimentalNoticeTr extends TranslationsDialogsExperimentalNoticeEn {
	TranslationsDialogsExperimentalNoticeTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Deneysel 枚zellikler kullan谋l谋yor';
	@override String get msg => 'Ba臒lant谋 kalitesini etkileyebilecek ve beklenmedik hatalara neden olabilecek baz谋 deneysel 枚zellikleri etkinle艧tirdiniz. Bu se莽enekleri istedi臒iniz zaman yap谋land谋rma sayfas谋ndan de臒i艧tirebilir veya s谋f谋rlayabilirsiniz.';
	@override String get disable => 'Tekrar g枚sterme';
}

// Path: dialogs.noActiveProfile
class TranslationsDialogsNoActiveProfileTr extends TranslationsDialogsNoActiveProfileEn {
	TranslationsDialogsNoActiveProfileTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bir profil se莽in';
	@override String get msg => 'VPN ba臒lant谋 ayr谋nt谋lar谋n谋z谋 i莽eren bir ba臒lant谋 profili ekleyerek ba艧layal谋m.\n\nHen眉z bir VPN sunucunuz yok mu? Endi艧elenmeyin, h谋zl谋 ve 眉cretsiz bir 艧ekilde kurmak i莽in a艧a臒谋daki e臒itimi takip edin.';
	@override late final TranslationsDialogsNoActiveProfileHelpBtnTr helpBtn = TranslationsDialogsNoActiveProfileHelpBtnTr._(_root);
}

// Path: dialogs.unknownDomainsWarning
class TranslationsDialogsUnknownDomainsWarningTr extends TranslationsDialogsUnknownDomainsWarningEn {
	TranslationsDialogsUnknownDomainsWarningTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'D谋艧 ba臒lant谋 uyar谋s谋';
	@override String get youAreAboutToVisit => '艦u adresi ziyaret etmek 眉zeresiniz:';
	@override String get thisWebsiteIsNotInOurTrustedList => 'Bu web sitesi g眉venilir listemizde de臒il. L眉tfen dikkatli devam edin.';
}

// Path: dialogs.proxyInfo
class TranslationsDialogsProxyInfoTr extends TranslationsDialogsProxyInfoEn {
	TranslationsDialogsProxyInfoTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get fullTag => 'Tam etiket:';
	@override String get type => 'T眉r:';
	@override String get testTime => 'Test zaman谋:';
	@override String get testDelay => 'Test gecikmesi:';
	@override String get isSelected => 'Se莽ili:';
	@override String get isGroup => 'Grup';
	@override String get isSecure => 'G眉venli:';
	@override String get port => 'Port:';
	@override String get host => 'Sunucu:';
	@override String get ip => 'IP:';
	@override String get countryCode => '脺lke kodu:';
	@override String get region => 'B枚lge:';
	@override String get city => '艦ehir:';
	@override String get asn => 'ASN:';
	@override String get organization => 'Kurulu艧:';
	@override String get location => 'Konum:';
	@override String get postalCode => 'Posta kodu:';
}

// Path: dialogs.windowClosing
class TranslationsDialogsWindowClosingTr extends TranslationsDialogsWindowClosingEn {
	TranslationsDialogsWindowClosingTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get askEachTime => 'Her seferinde sor';
	@override String get alertMessage => 'Uygulama gizlensin mi, kapat谋ls谋n m谋?';
	@override String get remember => 'Se莽imimi hat谋rla';
}

// Path: errors.connection
class TranslationsErrorsConnectionTr extends TranslationsErrorsConnectionEn {
	TranslationsErrorsConnectionTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Beklenmeyen ba臒lant谋 hatas谋';
	@override String get timeout => 'Ba臒lant谋 zaman a艧谋m谋na u臒rad谋';
	@override String get badResponse => 'Hatal谋 yan谋t';
	@override String get connectionError => 'Ba臒lant谋 hatas谋';
	@override String get badCertificate => 'Ge莽ersiz sertifika';
}

// Path: errors.profiles
class TranslationsErrorsProfilesTr extends TranslationsErrorsProfilesEn {
	TranslationsErrorsProfilesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Beklenmeyen hata';
	@override String get notFound => 'Profil bulunamad谋';
	@override String get invalidConfig => 'Ge莽ersiz yap谋land谋rmalar';
	@override String get invalidUrl => 'Ge莽ersiz URL';
	@override String get canceledByUser => 'Kullan谋c谋 taraf谋ndan iptal edildi';
}

// Path: errors.connectivity
class TranslationsErrorsConnectivityTr extends TranslationsErrorsConnectivityEn {
	TranslationsErrorsConnectivityTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Beklenmeyen hata';
	@override String get missingVpnPermission => 'VPN izni eksik';
	@override String get missingNotificationPermission => 'Bildirim izni eksik';
	@override String get core => '脟ekirdek hatas谋';
}

// Path: errors.singbox
class TranslationsErrorsSingboxTr extends TranslationsErrorsSingboxEn {
	TranslationsErrorsSingboxTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get serviceNotRunning => 'Servis 莽al谋艧m谋yor';
	@override String get missingPrivilege => 'Eksik yetki';
	@override String get missingPrivilegeMsg => 'VPN modu y枚netici yetkisi gerektirir. L眉tfen uygulamay谋 y枚netici olarak yeniden ba艧lat谋n veya servis modunu de臒i艧tirin.';
	@override String get invalidConfigOptions => 'Ge莽ersiz yap谋land谋rma se莽enekleri';
	@override String get invalidConfig => 'Ge莽ersiz yap谋land谋rma';
}

// Path: errors.warp
class TranslationsErrorsWarpTr extends TranslationsErrorsWarpEn {
	TranslationsErrorsWarpTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get missingLicense => 'WARP lisans谋 eksik';
	@override String get missingLicenseMsg => 'Se莽ili profil WARP 枚zelli臒ini kullan谋yor. Bu 枚zelli臒i kullanmak i莽in WARP lisans谋n谋 kabul etmeniz gerekir.';
}

// Path: common.msg.permission
class TranslationsCommonMsgPermissionTr extends TranslationsCommonMsgPermissionEn {
	TranslationsCommonMsgPermissionTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get denied => '陌zin reddedildi';
}

// Path: common.msg.export
class TranslationsCommonMsgExportTr extends TranslationsCommonMsgExportEn {
	TranslationsCommonMsgExportTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgExportClipboardTr clipboard = TranslationsCommonMsgExportClipboardTr._(_root);
	@override late final TranslationsCommonMsgExportFileTr file = TranslationsCommonMsgExportFileTr._(_root);
}

// Path: common.msg.import
class TranslationsCommonMsgImportTr extends TranslationsCommonMsgImportEn {
	TranslationsCommonMsgImportTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get confirm => '陌莽e aktarmay谋 onayla';
	@override String get success => 'Ba艧ar谋yla i莽e aktar谋ld谋';
	@override String get failure => '陌莽e aktar谋lamad谋';
}

// Path: pages.proxies.sortOptions
class TranslationsPagesProxiesSortOptionsTr extends TranslationsPagesProxiesSortOptionsEn {
	TranslationsPagesProxiesSortOptionsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get unsorted => 'Varsay谋lan';
	@override String get name => 'Alfabetik';
	@override String get delay => 'Gecikmeye g枚re';
}

// Path: pages.proxies.ipInfo
class TranslationsPagesProxiesIpInfoTr extends TranslationsPagesProxiesIpInfoEn {
	TranslationsPagesProxiesIpInfoTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get address => 'IP adresi';
	@override String get country => '脺lke';
	@override String get organization => 'Kurulu艧';
}

// Path: pages.proxies.delay
class TranslationsPagesProxiesDelayTr extends TranslationsPagesProxiesDelayEn {
	TranslationsPagesProxiesDelayTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String result({required Object delay}) => 'Gecikme: ${delay}ms';
	@override String get timeout => 'Gecikme testi zaman a艧谋m谋na u臒rad谋';
	@override String get testing => 'Gecikme: test ediliyor...';
}

// Path: pages.profiles.share
class TranslationsPagesProfilesShareTr extends TranslationsPagesProfilesShareEn {
	TranslationsPagesProfilesShareTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get urlToClipboard => 'URL\'yi panoya kopyala';
	@override String get showUrlQr => 'URL QR kodunu g枚ster';
	@override String get jsonToClipboard => 'JSON\'u panoya kopyala';
}

// Path: pages.profiles.msg
class TranslationsPagesProfilesMsgTr extends TranslationsPagesProfilesMsgEn {
	TranslationsPagesProfilesMsgTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesProfilesMsgSaveTr save = TranslationsPagesProfilesMsgSaveTr._(_root);
	@override String get invalidUrl => 'Ge莽ersiz URL';
	@override late final TranslationsPagesProfilesMsgAddTr add = TranslationsPagesProfilesMsgAddTr._(_root);
	@override late final TranslationsPagesProfilesMsgUpdateTr update = TranslationsPagesProfilesMsgUpdateTr._(_root);
	@override late final TranslationsPagesProfilesMsgDeleteTr delete = TranslationsPagesProfilesMsgDeleteTr._(_root);
}

// Path: pages.profileDetails.form
class TranslationsPagesProfileDetailsFormTr extends TranslationsPagesProfileDetailsFormEn {
	TranslationsPagesProfileDetailsFormTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get nameHint => 'Profil ad谋';
	@override String get emptyName => '陌sim gerekli';
	@override String get invalidUrl => 'Ge莽ersiz URL';
	@override String get urlHint => 'Tam yap谋land谋rma URL\'si';
	@override String get disableAutoUpdate => 'Otomatik g眉ncellemeyi devre d谋艧谋 b谋rak';
	@override String get autoUpdateInterval => 'Otomatik g眉ncelleme aral谋臒谋';
	@override String get loading => 'Profil ekleniyor...';
}

// Path: pages.settings.options
class TranslationsPagesSettingsOptionsTr extends TranslationsPagesSettingsOptionsEn {
	TranslationsPagesSettingsOptionsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsOptionsImportTr import = TranslationsPagesSettingsOptionsImportTr._(_root);
	@override late final TranslationsPagesSettingsOptionsExportTr export = TranslationsPagesSettingsOptionsExportTr._(_root);
	@override String get reset => 'Se莽enekleri s谋f谋rla';
}

// Path: pages.settings.general
class TranslationsPagesSettingsGeneralTr extends TranslationsPagesSettingsGeneralEn {
	TranslationsPagesSettingsGeneralTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Genel';
	@override String get locale => 'Dil';
	@override String get themeMode => 'Tema modu';
	@override late final TranslationsPagesSettingsGeneralThemeModesTr themeModes = TranslationsPagesSettingsGeneralThemeModesTr._(_root);
	@override String get enableAnalytics => 'Analizi etkinle艧tir';
	@override String get enableAnalyticsMsg => 'Uygulamay谋 iyile艧tirmek i莽in analiz ve kilitlenme raporlar谋 toplanmas谋na izin verin';
	@override String get autoIpCheck => 'Ba臒lant谋 IP\'sini otomatik kontrol et';
	@override String get dynamicNotification => 'H谋z谋 bildirimde g枚ster';
	@override String get hapticFeedback => 'Dokunsal geri bildirim';
	@override String get actionAtClosing => 'Kapatma eylemi';
	@override String get autoStart => 'Oturum a莽谋l谋艧谋nda ba艧lat';
	@override String get silentStart => 'Simge durumunda ba艧lat';
	@override String get ignoreBatteryOptimizations => 'Pil optimizasyonunu devre d谋艧谋 b谋rak';
	@override String get ignoreBatteryOptimizationsMsg => 'Optimum VPN performans谋 i莽in k谋s谋tlamalar谋 kald谋r谋n';
	@override String get memoryLimit => 'Bellek limiti';
	@override String get memoryLimitMsg => 'Bellek yetersizli臒i hatalar谋 veya s谋k uygulama 莽枚kmeleri ya艧谋yorsan谋z etkinle艧tirin';
	@override String get debugMode => 'Hata ay谋klama modu';
	@override String get debugModeMsg => 'Bu de臒i艧ikli臒i uygulamak i莽in uygulamay谋 yeniden ba艧lat谋n';
	@override String get logLevel => 'Log seviyesi';
	@override String get connectionTestUrl => 'Ba臒lant谋 testi URL\'si';
	@override String get urlTestInterval => 'URL testi aral谋臒谋';
	@override String get clashApiPort => 'Clash API portu';
	@override String get useXrayCoreWhenPossible => 'M眉mk眉n oldu臒unda xray-core kullan';
	@override String get useXrayCoreWhenPossibleMsg => 'Abonelik ba臒lant谋lar谋n谋 ayr谋艧t谋r谋rken xray-core kullan谋n. Bu se莽ene臒i etkinle艧tirmek i莽in ba臒lant谋y谋 yeniden i莽e aktarman谋z gerekir.';
}

// Path: pages.settings.routing
class TranslationsPagesSettingsRoutingTr extends TranslationsPagesSettingsRoutingEn {
	TranslationsPagesSettingsRoutingTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Y枚nlendirme';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyTr perAppProxy = TranslationsPagesSettingsRoutingPerAppProxyTr._(_root);
	@override String get region => 'B枚lge';
	@override late final TranslationsPagesSettingsRoutingRegionsTr regions = TranslationsPagesSettingsRoutingRegionsTr._(_root);
	@override late final TranslationsPagesSettingsRoutingBalancerStrategyTr balancerStrategy = TranslationsPagesSettingsRoutingBalancerStrategyTr._(_root);
	@override String get blockAds => 'Reklamlar谋 engelle';
	@override String get bypassLan => 'LAN\'谋 atla';
	@override String get resolveDestination => 'Hedefi 莽枚z眉mle';
	@override String get ipv6Route => 'IPv6 rotas谋';
	@override late final TranslationsPagesSettingsRoutingIpv6ModesTr ipv6Modes = TranslationsPagesSettingsRoutingIpv6ModesTr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleTr routeRule = TranslationsPagesSettingsRoutingRouteRuleTr._(_root);
}

// Path: pages.settings.dns
class TranslationsPagesSettingsDnsTr extends TranslationsPagesSettingsDnsEn {
	TranslationsPagesSettingsDnsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'DNS';
	@override String get remoteDns => 'Uzak DNS';
	@override String get remoteDnsDomainStrategy => 'Uzak DNS alan ad谋 stratejisi';
	@override String get directDns => 'Giden sunucu 莽枚z眉mleyicisi (do臒rudan)';
	@override String get directDnsDomainStrategy => 'Giden alan ad谋 stratejisi';
	@override String get enableDnsRouting => 'DNS y枚nlendirmeyi etkinle艧tir';
	@override String get enableFakeDns => 'Sahte DNS\'i etkinle艧tir';
	@override late final TranslationsPagesSettingsDnsDomainStrategyTr domainStrategy = TranslationsPagesSettingsDnsDomainStrategyTr._(_root);
}

// Path: pages.settings.inbound
class TranslationsPagesSettingsInboundTr extends TranslationsPagesSettingsInboundEn {
	TranslationsPagesSettingsInboundTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gelen';
	@override String get serviceMode => 'Servis modu';
	@override late final TranslationsPagesSettingsInboundServiceModesTr serviceModes = TranslationsPagesSettingsInboundServiceModesTr._(_root);
	@override late final TranslationsPagesSettingsInboundShortServiceModesTr shortServiceModes = TranslationsPagesSettingsInboundShortServiceModesTr._(_root);
	@override String get strictRoute => 'Kat谋 y枚nlendirme';
	@override String get tunImplementation => 'TUN uygulamas谋';
	@override late final TranslationsPagesSettingsInboundTunImplementationsTr tunImplementations = TranslationsPagesSettingsInboundTunImplementationsTr._(_root);
	@override String get mixedPort => 'Kar谋艧谋k port';
	@override String get tproxyPort => '艦effaf proxy portu';
	@override String get directPort => 'Direct portu';
	@override String get redirectPort => 'Y枚nlendirme portu';
	@override String get allowConnectionFromLan => 'VPN\'i yerel a臒da payla艧';
}

// Path: pages.settings.tlsTricks
class TranslationsPagesSettingsTlsTricksTr extends TranslationsPagesSettingsTlsTricksEn {
	TranslationsPagesSettingsTlsTricksTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'TLS hileleri';
	@override String get enable => 'Fragment\'谋 etkinle艧tir';
	@override String get packets => 'Fragmentation Paketleri';
	@override String get packetsTlsHello => 'TLS Hello';
	@override String get packets1_1 => '1-1';
	@override String get packets1_2 => '1-2';
	@override String get packets1_3 => '1-3';
	@override String get packets1_4 => '1-4';
	@override String get packets1_5 => '1-5';
	@override String get size => 'Fragment boyutu';
	@override String get sleep => 'Fragment gecikmesi';
	@override late final TranslationsPagesSettingsTlsTricksMixedSniCaseTr mixedSniCase = TranslationsPagesSettingsTlsTricksMixedSniCaseTr._(_root);
	@override late final TranslationsPagesSettingsTlsTricksPaddingTr padding = TranslationsPagesSettingsTlsTricksPaddingTr._(_root);
}

// Path: pages.settings.warp
class TranslationsPagesSettingsWarpTr extends TranslationsPagesSettingsWarpEn {
	TranslationsPagesSettingsWarpTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'WARP';
	@override String get enable => 'WARP\'谋 etkinle艧tir';
	@override String get generateConfig => 'WARP yap谋land谋rmas谋 olu艧tur';
	@override String get configGenerated => 'WARP yap谋land谋rmas谋 olu艧turuldu';
	@override String get missingConfig => 'WARP yap谋land谋rmas谋 eksik';
	@override String get detourMode => 'Y枚nlendirme modu';
	@override late final TranslationsPagesSettingsWarpDetourModesTr detourModes = TranslationsPagesSettingsWarpDetourModesTr._(_root);
	@override String get licenseKey => 'Lisans anahtar谋';
	@override String get cleanIp => 'Temiz IP';
	@override String get port => 'Port';
	@override late final TranslationsPagesSettingsWarpNoiseTr noise = TranslationsPagesSettingsWarpNoiseTr._(_root);
}

// Path: dialogs.sortProfiles.sort
class TranslationsDialogsSortProfilesSortTr extends TranslationsDialogsSortProfilesSortEn {
	TranslationsDialogsSortProfilesSortTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Alfabetik';
	@override String get lastUpdate => 'Son g眉ncelleme';
}

// Path: dialogs.confirmation.settings
class TranslationsDialogsConfirmationSettingsTr extends TranslationsDialogsConfirmationSettingsEn {
	TranslationsDialogsConfirmationSettingsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsImportTr import = TranslationsDialogsConfirmationSettingsImportTr._(_root);
}

// Path: dialogs.confirmation.profile
class TranslationsDialogsConfirmationProfileTr extends TranslationsDialogsConfirmationProfileEn {
	TranslationsDialogsConfirmationProfileTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationProfileDeleteTr delete = TranslationsDialogsConfirmationProfileDeleteTr._(_root);
}

// Path: dialogs.confirmation.perAppProxy
class TranslationsDialogsConfirmationPerAppProxyTr extends TranslationsDialogsConfirmationPerAppProxyEn {
	TranslationsDialogsConfirmationPerAppProxyTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationPerAppProxyShareOnGithubTr shareOnGithub = TranslationsDialogsConfirmationPerAppProxyShareOnGithubTr._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyImportTr import = TranslationsDialogsConfirmationPerAppProxyImportTr._(_root);
}

// Path: dialogs.confirmation.routeRule
class TranslationsDialogsConfirmationRouteRuleTr extends TranslationsDialogsConfirmationRouteRuleEn {
	TranslationsDialogsConfirmationRouteRuleTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationRouteRuleDeleteTr delete = TranslationsDialogsConfirmationRouteRuleDeleteTr._(_root);
}

// Path: dialogs.noActiveProfile.helpBtn
class TranslationsDialogsNoActiveProfileHelpBtnTr extends TranslationsDialogsNoActiveProfileHelpBtnEn {
	TranslationsDialogsNoActiveProfileHelpBtnTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Nas谋l yap谋ld谋臒谋n谋 g枚ster';
	@override String get url => 'https://github.com/shulaiyun/Sloth-VPN.git';
}

// Path: common.msg.export.clipboard
class TranslationsCommonMsgExportClipboardTr extends TranslationsCommonMsgExportClipboardEn {
	TranslationsCommonMsgExportClipboardTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Panoya ba艧ar谋yla eklendi';
	@override String get failure => 'Panoya kopyalanamad谋';
	@override String get contentTooLarge => '陌莽erik 莽ok b眉y眉k. Bunun yerine dosyaya aktarmay谋 kullan谋n';
}

// Path: common.msg.export.file
class TranslationsCommonMsgExportFileTr extends TranslationsCommonMsgExportFileEn {
	TranslationsCommonMsgExportFileTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get success => 'JSON dosyas谋 ba艧ar谋yla olu艧turuldu';
	@override String get failure => 'Dosya olu艧turulamad谋';
}

// Path: pages.profiles.msg.save
class TranslationsPagesProfilesMsgSaveTr extends TranslationsPagesProfilesMsgSaveEn {
	TranslationsPagesProfilesMsgSaveTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Profil ba艧ar谋yla kaydedildi';
}

// Path: pages.profiles.msg.add
class TranslationsPagesProfilesMsgAddTr extends TranslationsPagesProfilesMsgAddEn {
	TranslationsPagesProfilesMsgAddTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get failure => 'Profil eklenemedi';
}

// Path: pages.profiles.msg.update
class TranslationsPagesProfilesMsgUpdateTr extends TranslationsPagesProfilesMsgUpdateEn {
	TranslationsPagesProfilesMsgUpdateTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Profil ba艧ar谋yla g眉ncellendi';
	@override String successNamed({required Object name}) => '"${name}" ba艧ar谋yla g眉ncellendi';
	@override String get failure => 'Profil g眉ncellenemedi';
	@override String failureNamed({required Object name}) => '"${name}" g眉ncellenemedi';
}

// Path: pages.profiles.msg.delete
class TranslationsPagesProfilesMsgDeleteTr extends TranslationsPagesProfilesMsgDeleteEn {
	TranslationsPagesProfilesMsgDeleteTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Profil ba艧ar谋yla silindi';
}

// Path: pages.settings.options.import
class TranslationsPagesSettingsOptionsImportTr extends TranslationsPagesSettingsOptionsImportEn {
	TranslationsPagesSettingsOptionsImportTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Se莽enekleri panodan i莽e aktar';
	@override String get file => 'Se莽enekleri dosyadan i莽e aktar';
}

// Path: pages.settings.options.export
class TranslationsPagesSettingsOptionsExportTr extends TranslationsPagesSettingsOptionsExportEn {
	TranslationsPagesSettingsOptionsExportTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get anonymousToClipboard => 'Anonim se莽enekleri panoya kopyala';
	@override String get anonymousToFile => 'Anonim se莽enekleri dosyaya aktar';
	@override String get allToClipboard => 'T眉m se莽enekleri panoya kopyala';
	@override String get allToFile => 'T眉m se莽enekleri dosyaya aktar';
}

// Path: pages.settings.general.themeModes
class TranslationsPagesSettingsGeneralThemeModesTr extends TranslationsPagesSettingsGeneralThemeModesEn {
	TranslationsPagesSettingsGeneralThemeModesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Sistem varsay谋lan谋';
	@override String get dark => 'Karanl谋k mod';
	@override String get light => 'A莽谋k mod';
	@override String get black => 'Siyah mod';
}

// Path: pages.settings.routing.perAppProxy
class TranslationsPagesSettingsRoutingPerAppProxyTr extends TranslationsPagesSettingsRoutingPerAppProxyEn {
	TranslationsPagesSettingsRoutingPerAppProxyTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Uygulama bazl谋 proxy';
	@override String get hideSysApps => 'Sistem uygulamalar谋n谋 gizle';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsTr options = TranslationsPagesSettingsRoutingPerAppProxyOptionsTr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyModesTr modes = TranslationsPagesSettingsRoutingPerAppProxyModesTr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionTr autoSelection = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionTr._(_root);
}

// Path: pages.settings.routing.regions
class TranslationsPagesSettingsRoutingRegionsTr extends TranslationsPagesSettingsRoutingRegionsEn {
	TranslationsPagesSettingsRoutingRegionsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get ir => '陌ran (ir)';
	@override String get cn => '脟in (cn)';
	@override String get ru => 'Rusya (ru)';
	@override String get af => 'Afganistan (af)';
	@override String get id => 'Endonezya (id)';
	@override String get tr => 'T眉rkiye (tr)';
	@override String get br => 'Brezilya (br)';
	@override String get other => 'Di臒er';
}

// Path: pages.settings.routing.balancerStrategy
class TranslationsPagesSettingsRoutingBalancerStrategyTr extends TranslationsPagesSettingsRoutingBalancerStrategyEn {
	TranslationsPagesSettingsRoutingBalancerStrategyTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Balancer stratejisi';
	@override String get roundRobin => 'Round robin';
	@override String get consistentHash => 'Consistent hash';
	@override String get stickySession => 'Sticky session';
}

// Path: pages.settings.routing.ipv6Modes
class TranslationsPagesSettingsRoutingIpv6ModesTr extends TranslationsPagesSettingsRoutingIpv6ModesEn {
	TranslationsPagesSettingsRoutingIpv6ModesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get disable => 'Devre d谋艧谋 b谋rak';
	@override String get enable => 'Etkinle艧tir';
	@override String get prefer => 'Tercih et';
	@override String get only => 'Sadece';
}

// Path: pages.settings.routing.routeRule
class TranslationsPagesSettingsRoutingRouteRuleTr extends TranslationsPagesSettingsRoutingRouteRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Y枚nlendirme kurallar谋';
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsTr options = TranslationsPagesSettingsRoutingRouteRuleOptionsTr._(_root);
	@override String get deleteRule => 'Kural谋 sil';
	@override String get createRule => 'Yeni kural olu艧tur';
	@override late final TranslationsPagesSettingsRoutingRouteRuleRuleTr rule = TranslationsPagesSettingsRoutingRouteRuleRuleTr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleGenericListTr genericList = TranslationsPagesSettingsRoutingRouteRuleGenericListTr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleAndroidAppsTr androidApps = TranslationsPagesSettingsRoutingRouteRuleAndroidAppsTr._(_root);
}

// Path: pages.settings.dns.domainStrategy
class TranslationsPagesSettingsDnsDomainStrategyTr extends TranslationsPagesSettingsDnsDomainStrategyEn {
	TranslationsPagesSettingsDnsDomainStrategyTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Otomatik';
	@override String get preferIpv6 => 'IPv6 tercih et';
	@override String get preferIpv4 => 'IPv4 tercih et';
	@override String get ipv4Only => 'Sadece IPv4';
	@override String get ipv6Only => 'Sadece IPv6';
}

// Path: pages.settings.inbound.serviceModes
class TranslationsPagesSettingsInboundServiceModesTr extends TranslationsPagesSettingsInboundServiceModesEn {
	TranslationsPagesSettingsInboundServiceModesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get proxy => 'Yaln谋zca proxy servisi';
	@override String get systemProxy => 'Sistem proxy\'sini ayarla';
	@override String get tun => 'VPN';
	@override String get tunService => 'VPN servisi';
}

// Path: pages.settings.inbound.shortServiceModes
class TranslationsPagesSettingsInboundShortServiceModesTr extends TranslationsPagesSettingsInboundShortServiceModesEn {
	TranslationsPagesSettingsInboundShortServiceModesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get proxy => 'Proxy';
	@override String get systemProxy => 'Sistem proxy\'si';
	@override String get tun => 'VPN';
	@override String get tunService => 'VPN servisi';
}

// Path: pages.settings.inbound.tunImplementations
class TranslationsPagesSettingsInboundTunImplementationsTr extends TranslationsPagesSettingsInboundTunImplementationsEn {
	TranslationsPagesSettingsInboundTunImplementationsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get mixed => 'Kar谋艧谋k';
	@override String get system => 'Sistem';
	@override String get gvisor => 'gVisor';
}

// Path: pages.settings.tlsTricks.mixedSniCase
class TranslationsPagesSettingsTlsTricksMixedSniCaseTr extends TranslationsPagesSettingsTlsTricksMixedSniCaseEn {
	TranslationsPagesSettingsTlsTricksMixedSniCaseTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get enable => 'Kar谋艧谋k SNI harf durumunu etkinle艧tir';
}

// Path: pages.settings.tlsTricks.padding
class TranslationsPagesSettingsTlsTricksPaddingTr extends TranslationsPagesSettingsTlsTricksPaddingEn {
	TranslationsPagesSettingsTlsTricksPaddingTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get enable => 'Dolguyu etkinle艧tir';
	@override String get size => 'Dolgu boyutu';
}

// Path: pages.settings.warp.detourModes
class TranslationsPagesSettingsWarpDetourModesTr extends TranslationsPagesSettingsWarpDetourModesEn {
	TranslationsPagesSettingsWarpDetourModesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get proxyOverWarp => 'Proxy\'leri WARP 眉zerinden y枚nlendir';
	@override String get warpOverProxy => 'WARP\'谋 proxy\'ler 眉zerinden y枚nlendir';
	@override String get proxyOverWarpExplain => 'Proxy\'lerin engelini WARP ile kald谋r';
	@override String get warpOverProxyExplain => 'WARP ile ekstra g眉venlik';
}

// Path: pages.settings.warp.noise
class TranslationsPagesSettingsWarpNoiseTr extends TranslationsPagesSettingsWarpNoiseEn {
	TranslationsPagesSettingsWarpNoiseTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get count => 'G眉r眉lt眉 say谋s谋';
	@override String get mode => 'G眉r眉lt眉 modu';
	@override String get size => 'G眉r眉lt眉 boyutu';
	@override String get delay => 'G眉r眉lt眉 gecikmesi';
}

// Path: dialogs.confirmation.settings.import
class TranslationsDialogsConfirmationSettingsImportTr extends TranslationsDialogsConfirmationSettingsImportEn {
	TranslationsDialogsConfirmationSettingsImportTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get msg => 'Bu i艧lem t眉m yap谋land谋rma se莽eneklerini verilen de臒erlerle yeniden yazacakt谋r. Emin misiniz?';
}

// Path: dialogs.confirmation.profile.delete
class TranslationsDialogsConfirmationProfileDeleteTr extends TranslationsDialogsConfirmationProfileDeleteEn {
	TranslationsDialogsConfirmationProfileDeleteTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profili sil';
	@override String get msg => 'Bu profili kal谋c谋 olarak silmek istedi臒inizden emin misiniz?';
}

// Path: dialogs.confirmation.perAppProxy.shareOnGithub
class TranslationsDialogsConfirmationPerAppProxyShareOnGithubTr extends TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn {
	TranslationsDialogsConfirmationPerAppProxyShareOnGithubTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Otomatik se莽imi iyile艧tirme';
	@override String get msg => 'Se莽ili uygulamalar谋 payla艧arak "otomatik se莽im" listesini tamamlamaya yard谋mc谋 olursunuz';
}

// Path: dialogs.confirmation.perAppProxy.import
class TranslationsDialogsConfirmationPerAppProxyImportTr extends TranslationsDialogsConfirmationPerAppProxyImportEn {
	TranslationsDialogsConfirmationPerAppProxyImportTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get msg => 'Bu i艧lem mevcut t眉m uygulama bazl谋 proxy se莽imlerinizi de臒i艧tirecektir. Devam etmek istedi臒inizden emin misiniz?';
}

// Path: dialogs.confirmation.routeRule.delete
class TranslationsDialogsConfirmationRouteRuleDeleteTr extends TranslationsDialogsConfirmationRouteRuleDeleteEn {
	TranslationsDialogsConfirmationRouteRuleDeleteTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kural谋 sil';
	@override String msg({required Object rulename}) => '"${rulename}" kural谋n谋 silmek istedi臒inizden emin misiniz?';
}

// Path: pages.settings.routing.perAppProxy.options
class TranslationsPagesSettingsRoutingPerAppProxyOptionsTr extends TranslationsPagesSettingsRoutingPerAppProxyOptionsEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsImportTr import = TranslationsPagesSettingsRoutingPerAppProxyOptionsImportTr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsExportTr export = TranslationsPagesSettingsRoutingPerAppProxyOptionsExportTr._(_root);
	@override String get shareToAll => 'Herkesle payla艧';
	@override String get clearAllSelections => 'T眉m se莽imleri temizle';
}

// Path: pages.settings.routing.perAppProxy.modes
class TranslationsPagesSettingsRoutingPerAppProxyModesTr extends TranslationsPagesSettingsRoutingPerAppProxyModesEn {
	TranslationsPagesSettingsRoutingPerAppProxyModesTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get all => 'T眉m眉';
	@override String get proxy => 'Proxy';
	@override String get bypass => 'Atla';
	@override String get allMsg => 'T眉m uygulamalar谋 proxy\'le';
	@override String get proxyMsg => 'Yaln谋zca se莽ili uygulamalar谋 proxy\'le';
	@override String get bypassMsg => 'Se莽ili uygulamalar谋 proxy\'leme';
}

// Path: pages.settings.routing.perAppProxy.autoSelection
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionTr extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Otomatik se莽im';
	@override String get performNow => '艦imdi ger莽ekle艧tir';
	@override String get resetToDefault => 'Varsay谋lana s谋f谋rla';
	@override String get autoUpdateInterval => 'Otomatik g眉ncelleme aral谋臒谋';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastTr toast = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastTr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogTr dialog = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogTr._(_root);
}

// Path: pages.settings.routing.routeRule.options
class TranslationsPagesSettingsRoutingRouteRuleOptionsTr extends TranslationsPagesSettingsRoutingRouteRuleOptionsEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsImportTr import = TranslationsPagesSettingsRoutingRouteRuleOptionsImportTr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsExportTr export = TranslationsPagesSettingsRoutingRouteRuleOptionsExportTr._(_root);
	@override String get reset => 'Kurallar谋 s谋f谋rla';
}

// Path: pages.settings.routing.routeRule.rule
class TranslationsPagesSettingsRoutingRouteRuleRuleTr extends TranslationsPagesSettingsRoutingRouteRuleRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleRuleTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kural';
	@override String get ruleChanged => 'Kural de臒i艧tirildi';
	@override String get ruleChangedMsg => 'D眉zenlemelerinizi kaydetmek istiyor musunuz?';
	@override String get onlyTunMode => 'Yaln谋zca TUN modunda kullan谋labilir';
	@override String get notAvailabeInThisPlatform => 'Bu platformda mevcut de臒il';
	@override String get canNotBeEmpty => 'Bo艧 olamaz';
	@override String get validUrlEx => 'https://example.com';
	@override String get validUrl => 'Ge莽erli "URL", 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}';
	@override String get validProcessNameEx => 'Chrome.exe veya google chrome veya chrome';
	@override String get validProcessName => 'Ge莽erli "陌艧lem Ad谋", 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}';
	@override String get validProcessPathEx => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome';
	@override String get validProcessPath => 'Ge莽erli "陌艧lem Yolu", 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}';
	@override String get validPortRangeEx => '80 veya 1-65000';
	@override String get validPortRange => 'Ge莽erli "Port" veya "Port Aral谋臒谋", 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}';
	@override String get validIpCidrEx => '8.8.8.8 veya 10.0.0.0/24';
	@override String get validIpCidr => 'Ge莽erli IP CIDR, 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}';
	@override String get validDomainEx => 'Google.com veya dl.google.com';
	@override String get validDomain => 'Ge莽erli "Alan Ad谋", 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}';
	@override String get validDomainSuffixEx => '.com veya .tr';
	@override String get validDomainSuffix => 'Ge莽erli "Alan Ad谋 Son Eki", 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}';
	@override Map<String, String> get tileTitle => {
		'name': '陌sim',
		'outbound': 'E艧le艧irse giden',
		'rule_set': 'Kural seti URL\'si',
		'package_name': 'Paket adlar谋',
		'process_name': '陌艧lem adlar谋',
		'process_path': '陌艧lem yollar谋',
		'network': 'A臒lar',
		'port_range': 'Hedef portlar',
		'source_port_range': 'Kaynak portlar',
		'protocol': 'Protokol',
		'ip_cidr': 'Hedef IP CIDR',
		'source_ip_cidr': 'Kaynak IP CIDR',
		'domain': 'Alan ad谋',
		'domain_suffixe': 'Alan ad谋 son eki',
		'domain_keyword': 'Alan ad谋 anahtar kelimesi',
		'domain_regex': 'Alan ad谋 regex',
	};
	@override Map<String, String> get outbound => {
		'proxy': 'Proxy',
		'direct': 'Do臒rudan',
		'direct_with_fragment': 'Do臒rudan (fragment ile)',
		'block': 'Engelle',
	};
	@override Map<String, String> get network => {
		'all': 'T眉m眉',
		'tcp': 'TCP',
		'udp': 'UDP',
	};
	@override Map<String, String> get protocol => {
		'': 'T眉m眉',
		'tls': 'TLS',
		'http': 'HTTP',
		'quic': 'QUIC',
		'stun': 'STUN',
		'dns': 'DNS',
		'bittorrent': 'BitTorrent',
	};
}

// Path: pages.settings.routing.routeRule.genericList
class TranslationsPagesSettingsRoutingRouteRuleGenericListTr extends TranslationsPagesSettingsRoutingRouteRuleGenericListEn {
	TranslationsPagesSettingsRoutingRouteRuleGenericListTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get addNew => 'Yeni de臒er ekle';
	@override String get update => 'De臒eri g眉ncelle';
	@override String get clearList => 'Listeyi temizle';
	@override String get clearListMsg => 'T眉m 枚臒eler silindi';
}

// Path: pages.settings.routing.routeRule.androidApps
class TranslationsPagesSettingsRoutingRouteRuleAndroidAppsTr extends TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn {
	TranslationsPagesSettingsRoutingRouteRuleAndroidAppsTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => 'Android uygulamalar谋';
	@override String get showSystemApps => 'Sistem uygulamalar谋n谋 g枚ster';
	@override String get hideSystemApps => 'Sistem uygulamalar谋n谋 gizle';
	@override String get clearSelection => 'Se莽imi temizle';
	@override String get uninstalled => 'Kald谋r谋ld谋';
}

// Path: pages.settings.routing.perAppProxy.options.import
class TranslationsPagesSettingsRoutingPerAppProxyOptionsImportTr extends TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsImportTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Se莽imi panodan i莽e aktar';
	@override String get file => 'Se莽imi dosyadan i莽e aktar';
	@override String get msg => '陌莽e aktarma mevcut se莽imlerinizin 眉zerine yazacakt谋r. Devam etmek istedi臒inizden emin misiniz?';
}

// Path: pages.settings.routing.perAppProxy.options.export
class TranslationsPagesSettingsRoutingPerAppProxyOptionsExportTr extends TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsExportTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Se莽imi panoya kopyala';
	@override String get file => 'Se莽imi dosyaya aktar';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.toast
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastTr extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Otomatik uygulama se莽imi ba艧ar谋yla tamamland谋';
	@override String get failure => 'Otomatik se莽im ba艧ar谋s谋z oldu';
	@override String regionNotFound({required Object region}) => '"${region}" b枚lgesi i莽in otomatik se莽im bulunamad谋';
	@override String get alreadyInAuto => 'Se莽imleriniz zaten otomatik listede';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.dialog
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogTr extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Otomatik uygulama se莽imi';
	@override String msg({required Object region}) => 'Uygulama bazl谋 proxy i莽in otomatik se莽im 枚zelli臒i, b枚lge "${region}" olarak de臒i艧tirildi臒i i莽in devre d谋艧谋 b谋rak谋ld谋';
}

// Path: pages.settings.routing.routeRule.options.import
class TranslationsPagesSettingsRoutingRouteRuleOptionsImportTr extends TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsImportTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Kurallar谋 panodan i莽e aktar';
	@override String get file => 'Kurallar谋 dosyadan i莽e aktar';
}

// Path: pages.settings.routing.routeRule.options.export
class TranslationsPagesSettingsRoutingRouteRuleOptionsExportTr extends TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsExportTr._(TranslationsTr root) : this._root = root, super.internal(root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Kurallar谋 panoya kopyala';
	@override String get file => 'Kurallar谋 dosyaya kaydet';
}

/// The flat map containing all translations for locale <tr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appTitle' => '树懒VPN',
			'common.start' => 'Ba艧lat',
			'common.version' => 'S眉r眉m',
			'common.ok' => 'Tamam',
			'common.cancel' => '陌ptal',
			'common.kContinue' => 'Devam et',
			'common.showMore' => 'Daha fazla g枚ster',
			'common.showLess' => 'Daha az g枚ster',
			'common.filter' => 'Filtrele',
			'common.all' => 'T眉m眉',
			'common.pause' => 'Duraklat',
			'common.resume' => 'Devam et',
			'common.clear' => 'Temizle',
			'common.close' => 'Kapat',
			'common.auto' => 'Otomatik',
			'common.manually' => 'Manuel',
			'common.name' => '陌sim',
			'common.url' => 'URL',
			'common.add' => 'Ekle',
			'common.clipboard' => 'Pano',
			'common.addToClipboard' => 'Panoya ekle',
			'common.scanQr' => 'QR Tara',
			'common.free' => '脺cretsiz',
			'common.warp' => 'WARP',
			'common.fragment' => 'Fragment',
			'common.help' => 'Yard谋m',
			'common.save' => 'Kaydet',
			'common.update' => 'G眉ncelle',
			'common.share' => 'Payla艧',
			'common.edit' => 'D眉zenle',
			'common.delete' => 'Sil',
			'common.discard' => 'Vazge莽',
			'common.import' => '陌莽e aktar',
			'common.export' => 'D谋艧a aktar',
			'common.later' => 'Daha sonra',
			'common.ignore' => 'Yoksay',
			'common.quit' => '脟谋k',
			'common.notSet' => 'Ayarlanmad谋',
			'common.hide' => 'Gizle',
			'common.exit' => '脟谋k谋艧',
			'common.reset' => 'S谋f谋rla',
			'common.done' => 'Bitti',
			'common.search' => 'Ara',
			'common.decline' => 'Reddet',
			'common.agree' => 'Kabul et',
			'common.empty' => 'Bo艧',
			'common.unknown' => 'Bilinmeyen',
			'common.hidden' => 'Gizli',
			'common.timeout' => 'Zaman a艧谋m谋',
			'common.sort' => 'S谋rala',
			'common.dashboard' => 'G枚sterge Paneli',
			'common.interval.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(n, zero: '', one: '${n} g眉n', other: '${n} g眉n', ), 
			'common.interval.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('tr'))(n, zero: '', one: '${n} saat', other: '${n} saat', ), 
			'common.msg.permission.denied' => '陌zin reddedildi',
			'common.msg.export.clipboard.success' => 'Panoya ba艧ar谋yla eklendi',
			'common.msg.export.clipboard.failure' => 'Panoya kopyalanamad谋',
			'common.msg.export.clipboard.contentTooLarge' => '陌莽erik 莽ok b眉y眉k. Bunun yerine dosyaya aktarmay谋 kullan谋n',
			'common.msg.export.file.success' => 'JSON dosyas谋 ba艧ar谋yla olu艧turuldu',
			'common.msg.export.file.failure' => 'Dosya olu艧turulamad谋',
			'common.msg.import.confirm' => '陌莽e aktarmay谋 onayla',
			'common.msg.import.success' => 'Ba艧ar谋yla i莽e aktar谋ld谋',
			'common.msg.import.failure' => '陌莽e aktar谋lamad谋',
			'intro.banner' => 'S谋n谋rs谋z bir internet i莽in ihtiyac谋n谋z olan her 艧ey',
			'intro.termsAndPolicyCaution' => ({required InlineSpanBuilder tap}) => TextSpan(children: [ const TextSpan(text: 'Devam ederek '), tap(_root.pages.about.termsAndConditions), const TextSpan(text: ' kabul etmi艧 olursunuz'), ]), 
			'intro.info' => ({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [ const TextSpan(text: 'Hiddify taraf谋ndan 鉂わ笍 ile yap谋ld谋 - '), tap_source('A莽谋k Kaynak'), const TextSpan(text: ' ('), tap_license('Lisans'), const TextSpan(text: ')'), ]), 
			'pages.home.title' => 'Ana Sayfa',
			'pages.home.quickSettings' => 'H谋zl谋 ayarlar',
			'pages.proxies.title' => 'Proxy\'ler',
			'pages.proxies.sort' => 'Proxy\'leri s谋rala',
			'pages.proxies.testDelay' => 'Gecikmeyi test et',
			'pages.proxies.empty' => 'Kullan谋labilir proxy yok',
			'pages.proxies.activeProxy' => 'Aktif proxy',
			'pages.proxies.unknownIp' => 'Bilinmeyen IP',
			'pages.proxies.sortOptions.unsorted' => 'Varsay谋lan',
			'pages.proxies.sortOptions.name' => 'Alfabetik',
			'pages.proxies.sortOptions.delay' => 'Gecikmeye g枚re',
			'pages.proxies.ipInfo.address' => 'IP adresi',
			'pages.proxies.ipInfo.country' => '脺lke',
			'pages.proxies.ipInfo.organization' => 'Kurulu艧',
			'pages.proxies.delay.result' => ({required Object delay}) => 'Gecikme: ${delay}ms',
			'pages.proxies.delay.timeout' => 'Gecikme testi zaman a艧谋m谋na u臒rad谋',
			'pages.proxies.delay.testing' => 'Gecikme: test ediliyor...',
			'pages.profiles.title' => 'Profiller',
			'pages.profiles.add' => 'Profil ekle',
			'pages.profiles.update' => 'Profili g眉ncelle',
			'pages.profiles.viewAllProfiles' => 'T眉m profilleri g枚r眉nt眉le',
			'pages.profiles.activeProfileName' => ({required Object name}) => 'Aktif profil ad谋: "${name}".',
			'pages.profiles.nonActiveProfileName' => ({required Object name}) => 'Aktif profil olarak "${name}" se莽in',
			'pages.profiles.freeSubNotFound' => '脺cretsiz abonelik bulunamad谋',
			'pages.profiles.freeSubNotFoundForRegion' => ({required Object region}) => '"${region}" b枚lgesi i莽in 眉cretsiz abonelik bulunamad谋',
			'pages.profiles.failedToLoad' => 'Y眉klenemedi',
			'pages.profiles.updateSubscriptions' => 'Abonelikleri g眉ncelle',
			'pages.profiles.share.urlToClipboard' => 'URL\'yi panoya kopyala',
			'pages.profiles.share.showUrlQr' => 'URL QR kodunu g枚ster',
			'pages.profiles.share.jsonToClipboard' => 'JSON\'u panoya kopyala',
			'pages.profiles.msg.save.success' => 'Profil ba艧ar谋yla kaydedildi',
			'pages.profiles.msg.invalidUrl' => 'Ge莽ersiz URL',
			'pages.profiles.msg.add.failure' => 'Profil eklenemedi',
			'pages.profiles.msg.update.success' => 'Profil ba艧ar谋yla g眉ncellendi',
			'pages.profiles.msg.update.successNamed' => ({required Object name}) => '"${name}" ba艧ar谋yla g眉ncellendi',
			'pages.profiles.msg.update.failure' => 'Profil g眉ncellenemedi',
			'pages.profiles.msg.update.failureNamed' => ({required Object name}) => '"${name}" g眉ncellenemedi',
			'pages.profiles.msg.delete.success' => 'Profil ba艧ar谋yla silindi',
			'pages.profileDetails.title' => 'Profil',
			'pages.profileDetails.lastUpdate' => 'Son g眉ncelleme',
			'pages.profileDetails.form.nameHint' => 'Profil ad谋',
			'pages.profileDetails.form.emptyName' => '陌sim gerekli',
			'pages.profileDetails.form.invalidUrl' => 'Ge莽ersiz URL',
			'pages.profileDetails.form.urlHint' => 'Tam yap谋land谋rma URL\'si',
			'pages.profileDetails.form.disableAutoUpdate' => 'Otomatik g眉ncellemeyi devre d谋艧谋 b谋rak',
			'pages.profileDetails.form.autoUpdateInterval' => 'Otomatik g眉ncelleme aral谋臒谋',
			'pages.profileDetails.form.loading' => 'Profil ekleniyor...',
			'pages.logs.title' => 'Loglar',
			'pages.logs.shareCoreLogs' => '脟ekirdek loglar谋n谋 payla艧',
			'pages.logs.shareAppLogs' => 'Uygulama loglar谋n谋 payla艧',
			'pages.about.title' => 'Hakk谋nda',
			'pages.about.notAvailableMsg' => 'Zaten en son s眉r眉m眉 kullan谋yorsunuz',
			'pages.about.checkForUpdate' => 'G眉ncellemeleri kontrol et',
			'pages.about.openWorkingDir' => '脟al谋艧ma dizinini a莽',
			'pages.about.sourceCode' => 'Kaynak kodu',
			'pages.about.telegramChannel' => 'Telegram kanal谋',
			'pages.about.termsAndConditions' => '艦artlar ve Ko艧ullar',
			'pages.about.privacyPolicy' => 'Gizlilik Politikas谋',
			'pages.settings.title' => 'Ayarlar',
			'pages.settings.resetTunnel' => 'VPN profilini s谋f谋rla',
			'pages.settings.options.import.clipboard' => 'Se莽enekleri panodan i莽e aktar',
			'pages.settings.options.import.file' => 'Se莽enekleri dosyadan i莽e aktar',
			'pages.settings.options.export.anonymousToClipboard' => 'Anonim se莽enekleri panoya kopyala',
			'pages.settings.options.export.anonymousToFile' => 'Anonim se莽enekleri dosyaya aktar',
			'pages.settings.options.export.allToClipboard' => 'T眉m se莽enekleri panoya kopyala',
			'pages.settings.options.export.allToFile' => 'T眉m se莽enekleri dosyaya aktar',
			'pages.settings.options.reset' => 'Se莽enekleri s谋f谋rla',
			'pages.settings.general.title' => 'Genel',
			'pages.settings.general.locale' => 'Dil',
			'pages.settings.general.themeMode' => 'Tema modu',
			'pages.settings.general.themeModes.system' => 'Sistem varsay谋lan谋',
			'pages.settings.general.themeModes.dark' => 'Karanl谋k mod',
			'pages.settings.general.themeModes.light' => 'A莽谋k mod',
			'pages.settings.general.themeModes.black' => 'Siyah mod',
			'pages.settings.general.enableAnalytics' => 'Analizi etkinle艧tir',
			'pages.settings.general.enableAnalyticsMsg' => 'Uygulamay谋 iyile艧tirmek i莽in analiz ve kilitlenme raporlar谋 toplanmas谋na izin verin',
			'pages.settings.general.autoIpCheck' => 'Ba臒lant谋 IP\'sini otomatik kontrol et',
			'pages.settings.general.dynamicNotification' => 'H谋z谋 bildirimde g枚ster',
			'pages.settings.general.hapticFeedback' => 'Dokunsal geri bildirim',
			'pages.settings.general.actionAtClosing' => 'Kapatma eylemi',
			'pages.settings.general.autoStart' => 'Oturum a莽谋l谋艧谋nda ba艧lat',
			'pages.settings.general.silentStart' => 'Simge durumunda ba艧lat',
			'pages.settings.general.ignoreBatteryOptimizations' => 'Pil optimizasyonunu devre d谋艧谋 b谋rak',
			'pages.settings.general.ignoreBatteryOptimizationsMsg' => 'Optimum VPN performans谋 i莽in k谋s谋tlamalar谋 kald谋r谋n',
			'pages.settings.general.memoryLimit' => 'Bellek limiti',
			'pages.settings.general.memoryLimitMsg' => 'Bellek yetersizli臒i hatalar谋 veya s谋k uygulama 莽枚kmeleri ya艧谋yorsan谋z etkinle艧tirin',
			'pages.settings.general.debugMode' => 'Hata ay谋klama modu',
			'pages.settings.general.debugModeMsg' => 'Bu de臒i艧ikli臒i uygulamak i莽in uygulamay谋 yeniden ba艧lat谋n',
			'pages.settings.general.logLevel' => 'Log seviyesi',
			'pages.settings.general.connectionTestUrl' => 'Ba臒lant谋 testi URL\'si',
			'pages.settings.general.urlTestInterval' => 'URL testi aral谋臒谋',
			'pages.settings.general.clashApiPort' => 'Clash API portu',
			'pages.settings.general.useXrayCoreWhenPossible' => 'M眉mk眉n oldu臒unda xray-core kullan',
			'pages.settings.general.useXrayCoreWhenPossibleMsg' => 'Abonelik ba臒lant谋lar谋n谋 ayr谋艧t谋r谋rken xray-core kullan谋n. Bu se莽ene臒i etkinle艧tirmek i莽in ba臒lant谋y谋 yeniden i莽e aktarman谋z gerekir.',
			'pages.settings.routing.title' => 'Y枚nlendirme',
			'pages.settings.routing.perAppProxy.title' => 'Uygulama bazl谋 proxy',
			'pages.settings.routing.perAppProxy.hideSysApps' => 'Sistem uygulamalar谋n谋 gizle',
			'pages.settings.routing.perAppProxy.options.import.clipboard' => 'Se莽imi panodan i莽e aktar',
			'pages.settings.routing.perAppProxy.options.import.file' => 'Se莽imi dosyadan i莽e aktar',
			'pages.settings.routing.perAppProxy.options.import.msg' => '陌莽e aktarma mevcut se莽imlerinizin 眉zerine yazacakt谋r. Devam etmek istedi臒inizden emin misiniz?',
			'pages.settings.routing.perAppProxy.options.export.clipboard' => 'Se莽imi panoya kopyala',
			'pages.settings.routing.perAppProxy.options.export.file' => 'Se莽imi dosyaya aktar',
			'pages.settings.routing.perAppProxy.options.shareToAll' => 'Herkesle payla艧',
			'pages.settings.routing.perAppProxy.options.clearAllSelections' => 'T眉m se莽imleri temizle',
			'pages.settings.routing.perAppProxy.modes.all' => 'T眉m眉',
			'pages.settings.routing.perAppProxy.modes.proxy' => 'Proxy',
			'pages.settings.routing.perAppProxy.modes.bypass' => 'Atla',
			'pages.settings.routing.perAppProxy.modes.allMsg' => 'T眉m uygulamalar谋 proxy\'le',
			'pages.settings.routing.perAppProxy.modes.proxyMsg' => 'Yaln谋zca se莽ili uygulamalar谋 proxy\'le',
			'pages.settings.routing.perAppProxy.modes.bypassMsg' => 'Se莽ili uygulamalar谋 proxy\'leme',
			'pages.settings.routing.perAppProxy.autoSelection.title' => 'Otomatik se莽im',
			'pages.settings.routing.perAppProxy.autoSelection.performNow' => '艦imdi ger莽ekle艧tir',
			'pages.settings.routing.perAppProxy.autoSelection.resetToDefault' => 'Varsay谋lana s谋f谋rla',
			'pages.settings.routing.perAppProxy.autoSelection.autoUpdateInterval' => 'Otomatik g眉ncelleme aral谋臒谋',
			'pages.settings.routing.perAppProxy.autoSelection.toast.success' => 'Otomatik uygulama se莽imi ba艧ar谋yla tamamland谋',
			'pages.settings.routing.perAppProxy.autoSelection.toast.failure' => 'Otomatik se莽im ba艧ar谋s谋z oldu',
			'pages.settings.routing.perAppProxy.autoSelection.toast.regionNotFound' => ({required Object region}) => '"${region}" b枚lgesi i莽in otomatik se莽im bulunamad谋',
			'pages.settings.routing.perAppProxy.autoSelection.toast.alreadyInAuto' => 'Se莽imleriniz zaten otomatik listede',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.title' => 'Otomatik uygulama se莽imi',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.msg' => ({required Object region}) => 'Uygulama bazl谋 proxy i莽in otomatik se莽im 枚zelli臒i, b枚lge "${region}" olarak de臒i艧tirildi臒i i莽in devre d谋艧谋 b谋rak谋ld谋',
			'pages.settings.routing.region' => 'B枚lge',
			'pages.settings.routing.regions.ir' => '陌ran (ir)',
			'pages.settings.routing.regions.cn' => '脟in (cn)',
			'pages.settings.routing.regions.ru' => 'Rusya (ru)',
			'pages.settings.routing.regions.af' => 'Afganistan (af)',
			'pages.settings.routing.regions.id' => 'Endonezya (id)',
			'pages.settings.routing.regions.tr' => 'T眉rkiye (tr)',
			'pages.settings.routing.regions.br' => 'Brezilya (br)',
			'pages.settings.routing.regions.other' => 'Di臒er',
			'pages.settings.routing.balancerStrategy.title' => 'Balancer stratejisi',
			'pages.settings.routing.balancerStrategy.roundRobin' => 'Round robin',
			'pages.settings.routing.balancerStrategy.consistentHash' => 'Consistent hash',
			'pages.settings.routing.balancerStrategy.stickySession' => 'Sticky session',
			'pages.settings.routing.blockAds' => 'Reklamlar谋 engelle',
			'pages.settings.routing.bypassLan' => 'LAN\'谋 atla',
			'pages.settings.routing.resolveDestination' => 'Hedefi 莽枚z眉mle',
			'pages.settings.routing.ipv6Route' => 'IPv6 rotas谋',
			'pages.settings.routing.ipv6Modes.disable' => 'Devre d谋艧谋 b谋rak',
			'pages.settings.routing.ipv6Modes.enable' => 'Etkinle艧tir',
			'pages.settings.routing.ipv6Modes.prefer' => 'Tercih et',
			'pages.settings.routing.ipv6Modes.only' => 'Sadece',
			'pages.settings.routing.routeRule.title' => 'Y枚nlendirme kurallar谋',
			'pages.settings.routing.routeRule.options.import.clipboard' => 'Kurallar谋 panodan i莽e aktar',
			'pages.settings.routing.routeRule.options.import.file' => 'Kurallar谋 dosyadan i莽e aktar',
			'pages.settings.routing.routeRule.options.export.clipboard' => 'Kurallar谋 panoya kopyala',
			'pages.settings.routing.routeRule.options.export.file' => 'Kurallar谋 dosyaya kaydet',
			'pages.settings.routing.routeRule.options.reset' => 'Kurallar谋 s谋f谋rla',
			'pages.settings.routing.routeRule.deleteRule' => 'Kural谋 sil',
			'pages.settings.routing.routeRule.createRule' => 'Yeni kural olu艧tur',
			'pages.settings.routing.routeRule.rule.title' => 'Kural',
			'pages.settings.routing.routeRule.rule.ruleChanged' => 'Kural de臒i艧tirildi',
			'pages.settings.routing.routeRule.rule.ruleChangedMsg' => 'D眉zenlemelerinizi kaydetmek istiyor musunuz?',
			'pages.settings.routing.routeRule.rule.onlyTunMode' => 'Yaln谋zca TUN modunda kullan谋labilir',
			'pages.settings.routing.routeRule.rule.notAvailabeInThisPlatform' => 'Bu platformda mevcut de臒il',
			'pages.settings.routing.routeRule.rule.canNotBeEmpty' => 'Bo艧 olamaz',
			'pages.settings.routing.routeRule.rule.validUrlEx' => 'https://example.com',
			'pages.settings.routing.routeRule.rule.validUrl' => 'Ge莽erli "URL", 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}',
			'pages.settings.routing.routeRule.rule.validProcessNameEx' => 'Chrome.exe veya google chrome veya chrome',
			'pages.settings.routing.routeRule.rule.validProcessName' => 'Ge莽erli "陌艧lem Ad谋", 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}',
			'pages.settings.routing.routeRule.rule.validProcessPathEx' => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome',
			'pages.settings.routing.routeRule.rule.validProcessPath' => 'Ge莽erli "陌艧lem Yolu", 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}',
			'pages.settings.routing.routeRule.rule.validPortRangeEx' => '80 veya 1-65000',
			'pages.settings.routing.routeRule.rule.validPortRange' => 'Ge莽erli "Port" veya "Port Aral谋臒谋", 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}',
			'pages.settings.routing.routeRule.rule.validIpCidrEx' => '8.8.8.8 veya 10.0.0.0/24',
			'pages.settings.routing.routeRule.rule.validIpCidr' => 'Ge莽erli IP CIDR, 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}',
			'pages.settings.routing.routeRule.rule.validDomainEx' => 'Google.com veya dl.google.com',
			'pages.settings.routing.routeRule.rule.validDomain' => 'Ge莽erli "Alan Ad谋", 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}',
			'pages.settings.routing.routeRule.rule.validDomainSuffixEx' => '.com veya .tr',
			'pages.settings.routing.routeRule.rule.validDomainSuffix' => 'Ge莽erli "Alan Ad谋 Son Eki", 枚rn.\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}',
			'pages.settings.routing.routeRule.rule.tileTitle.name' => '陌sim',
			'pages.settings.routing.routeRule.rule.tileTitle.outbound' => 'E艧le艧irse giden',
			'pages.settings.routing.routeRule.rule.tileTitle.rule_set' => 'Kural seti URL\'si',
			'pages.settings.routing.routeRule.rule.tileTitle.package_name' => 'Paket adlar谋',
			'pages.settings.routing.routeRule.rule.tileTitle.process_name' => '陌艧lem adlar谋',
			'pages.settings.routing.routeRule.rule.tileTitle.process_path' => '陌艧lem yollar谋',
			'pages.settings.routing.routeRule.rule.tileTitle.network' => 'A臒lar',
			'pages.settings.routing.routeRule.rule.tileTitle.port_range' => 'Hedef portlar',
			'pages.settings.routing.routeRule.rule.tileTitle.source_port_range' => 'Kaynak portlar',
			'pages.settings.routing.routeRule.rule.tileTitle.protocol' => 'Protokol',
			'pages.settings.routing.routeRule.rule.tileTitle.ip_cidr' => 'Hedef IP CIDR',
			'pages.settings.routing.routeRule.rule.tileTitle.source_ip_cidr' => 'Kaynak IP CIDR',
			'pages.settings.routing.routeRule.rule.tileTitle.domain' => 'Alan ad谋',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_suffixe' => 'Alan ad谋 son eki',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_keyword' => 'Alan ad谋 anahtar kelimesi',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_regex' => 'Alan ad谋 regex',
			'pages.settings.routing.routeRule.rule.outbound.proxy' => 'Proxy',
			'pages.settings.routing.routeRule.rule.outbound.direct' => 'Do臒rudan',
			'pages.settings.routing.routeRule.rule.outbound.direct_with_fragment' => 'Do臒rudan (fragment ile)',
			'pages.settings.routing.routeRule.rule.outbound.block' => 'Engelle',
			'pages.settings.routing.routeRule.rule.network.all' => 'T眉m眉',
			'pages.settings.routing.routeRule.rule.network.tcp' => 'TCP',
			'pages.settings.routing.routeRule.rule.network.udp' => 'UDP',
			'pages.settings.routing.routeRule.rule.protocol.' => 'T眉m眉',
			'pages.settings.routing.routeRule.rule.protocol.tls' => 'TLS',
			'pages.settings.routing.routeRule.rule.protocol.http' => 'HTTP',
			'pages.settings.routing.routeRule.rule.protocol.quic' => 'QUIC',
			'pages.settings.routing.routeRule.rule.protocol.stun' => 'STUN',
			'pages.settings.routing.routeRule.rule.protocol.dns' => 'DNS',
			'pages.settings.routing.routeRule.rule.protocol.bittorrent' => 'BitTorrent',
			'pages.settings.routing.routeRule.genericList.addNew' => 'Yeni de臒er ekle',
			'pages.settings.routing.routeRule.genericList.update' => 'De臒eri g眉ncelle',
			'pages.settings.routing.routeRule.genericList.clearList' => 'Listeyi temizle',
			'pages.settings.routing.routeRule.genericList.clearListMsg' => 'T眉m 枚臒eler silindi',
			'pages.settings.routing.routeRule.androidApps.pageTitle' => 'Android uygulamalar谋',
			'pages.settings.routing.routeRule.androidApps.showSystemApps' => 'Sistem uygulamalar谋n谋 g枚ster',
			'pages.settings.routing.routeRule.androidApps.hideSystemApps' => 'Sistem uygulamalar谋n谋 gizle',
			'pages.settings.routing.routeRule.androidApps.clearSelection' => 'Se莽imi temizle',
			'pages.settings.routing.routeRule.androidApps.uninstalled' => 'Kald谋r谋ld谋',
			'pages.settings.dns.title' => 'DNS',
			'pages.settings.dns.remoteDns' => 'Uzak DNS',
			'pages.settings.dns.remoteDnsDomainStrategy' => 'Uzak DNS alan ad谋 stratejisi',
			'pages.settings.dns.directDns' => 'Giden sunucu 莽枚z眉mleyicisi (do臒rudan)',
			'pages.settings.dns.directDnsDomainStrategy' => 'Giden alan ad谋 stratejisi',
			'pages.settings.dns.enableDnsRouting' => 'DNS y枚nlendirmeyi etkinle艧tir',
			'pages.settings.dns.enableFakeDns' => 'Sahte DNS\'i etkinle艧tir',
			'pages.settings.dns.domainStrategy.auto' => 'Otomatik',
			'pages.settings.dns.domainStrategy.preferIpv6' => 'IPv6 tercih et',
			'pages.settings.dns.domainStrategy.preferIpv4' => 'IPv4 tercih et',
			'pages.settings.dns.domainStrategy.ipv4Only' => 'Sadece IPv4',
			'pages.settings.dns.domainStrategy.ipv6Only' => 'Sadece IPv6',
			'pages.settings.inbound.title' => 'Gelen',
			'pages.settings.inbound.serviceMode' => 'Servis modu',
			'pages.settings.inbound.serviceModes.proxy' => 'Yaln谋zca proxy servisi',
			'pages.settings.inbound.serviceModes.systemProxy' => 'Sistem proxy\'sini ayarla',
			'pages.settings.inbound.serviceModes.tun' => 'VPN',
			'pages.settings.inbound.serviceModes.tunService' => 'VPN servisi',
			'pages.settings.inbound.shortServiceModes.proxy' => 'Proxy',
			'pages.settings.inbound.shortServiceModes.systemProxy' => 'Sistem proxy\'si',
			'pages.settings.inbound.shortServiceModes.tun' => 'VPN',
			'pages.settings.inbound.shortServiceModes.tunService' => 'VPN servisi',
			'pages.settings.inbound.strictRoute' => 'Kat谋 y枚nlendirme',
			'pages.settings.inbound.tunImplementation' => 'TUN uygulamas谋',
			'pages.settings.inbound.tunImplementations.mixed' => 'Kar谋艧谋k',
			'pages.settings.inbound.tunImplementations.system' => 'Sistem',
			'pages.settings.inbound.tunImplementations.gvisor' => 'gVisor',
			'pages.settings.inbound.mixedPort' => 'Kar谋艧谋k port',
			'pages.settings.inbound.tproxyPort' => '艦effaf proxy portu',
			'pages.settings.inbound.directPort' => 'Direct portu',
			'pages.settings.inbound.redirectPort' => 'Y枚nlendirme portu',
			'pages.settings.inbound.allowConnectionFromLan' => 'VPN\'i yerel a臒da payla艧',
			'pages.settings.tlsTricks.title' => 'TLS hileleri',
			'pages.settings.tlsTricks.enable' => 'Fragment\'谋 etkinle艧tir',
			'pages.settings.tlsTricks.packets' => 'Fragmentation Paketleri',
			'pages.settings.tlsTricks.packetsTlsHello' => 'TLS Hello',
			'pages.settings.tlsTricks.packets1_1' => '1-1',
			'pages.settings.tlsTricks.packets1_2' => '1-2',
			'pages.settings.tlsTricks.packets1_3' => '1-3',
			'pages.settings.tlsTricks.packets1_4' => '1-4',
			'pages.settings.tlsTricks.packets1_5' => '1-5',
			'pages.settings.tlsTricks.size' => 'Fragment boyutu',
			'pages.settings.tlsTricks.sleep' => 'Fragment gecikmesi',
			'pages.settings.tlsTricks.mixedSniCase.enable' => 'Kar谋艧谋k SNI harf durumunu etkinle艧tir',
			'pages.settings.tlsTricks.padding.enable' => 'Dolguyu etkinle艧tir',
			'pages.settings.tlsTricks.padding.size' => 'Dolgu boyutu',
			'pages.settings.warp.title' => 'WARP',
			'pages.settings.warp.enable' => 'WARP\'谋 etkinle艧tir',
			'pages.settings.warp.generateConfig' => 'WARP yap谋land谋rmas谋 olu艧tur',
			'pages.settings.warp.configGenerated' => 'WARP yap谋land谋rmas谋 olu艧turuldu',
			'pages.settings.warp.missingConfig' => 'WARP yap谋land谋rmas谋 eksik',
			'pages.settings.warp.detourMode' => 'Y枚nlendirme modu',
			'pages.settings.warp.detourModes.proxyOverWarp' => 'Proxy\'leri WARP 眉zerinden y枚nlendir',
			'pages.settings.warp.detourModes.warpOverProxy' => 'WARP\'谋 proxy\'ler 眉zerinden y枚nlendir',
			'pages.settings.warp.detourModes.proxyOverWarpExplain' => 'Proxy\'lerin engelini WARP ile kald谋r',
			'pages.settings.warp.detourModes.warpOverProxyExplain' => 'WARP ile ekstra g眉venlik',
			'pages.settings.warp.licenseKey' => 'Lisans anahtar谋',
			'pages.settings.warp.cleanIp' => 'Temiz IP',
			'pages.settings.warp.port' => 'Port',
			'pages.settings.warp.noise.count' => 'G眉r眉lt眉 say谋s谋',
			'pages.settings.warp.noise.mode' => 'G眉r眉lt眉 modu',
			'pages.settings.warp.noise.size' => 'G眉r眉lt眉 boyutu',
			'pages.settings.warp.noise.delay' => 'G眉r眉lt眉 gecikmesi',
			'components.stats.connection' => 'Ba臒lant谋',
			'components.stats.traffic' => 'Trafik',
			'components.stats.trafficLive' => 'Canl谋 trafik',
			'components.stats.trafficTotal' => 'Toplam trafik',
			'components.stats.uplink' => 'Y眉kleme',
			'components.stats.downlink' => '陌ndirme',
			'components.stats.speed' => 'H谋z',
			'components.stats.totalTransferred' => 'Toplam aktar谋lan',
			'components.subscriptionInfo.upload' => 'Y眉kleme',
			'components.subscriptionInfo.download' => '陌ndirme',
			'components.subscriptionInfo.total' => 'Toplam trafik',
			'components.subscriptionInfo.expireDate' => 'Biti艧 tarihi',
			'components.subscriptionInfo.expired' => 'S眉resi doldu',
			'components.subscriptionInfo.noTraffic' => 'Kota doldu',
			'components.subscriptionInfo.remainingTime' => 'Kalan s眉re',
			'components.subscriptionInfo.remainingDuration' => ({required Object duration}) => 'kalan ${duration} g眉n',
			'components.subscriptionInfo.remainingDurationNew' => ({required Object duration}) => '${duration} g眉n',
			'components.subscriptionInfo.remainingTrafficSemanticLabel' => ({required Object consumed, required Object total}) => '${consumed} / ${total} trafik kullan谋ld谋',
			'components.subscriptionInfo.remainingTraffic' => 'Kalan trafik',
			'components.subscriptionInfo.remainingUsage' => 'Kalan',
			'components.subscriptionInfo.profileSite' => 'Sa臒lay谋c谋',
			'components.subscriptionInfo.profileSupport' => 'Destek',
			'dialogs.sortProfiles.title' => 'S谋ralama 枚l莽眉t眉',
			'dialogs.sortProfiles.sort.name' => 'Alfabetik',
			'dialogs.sortProfiles.sort.lastUpdate' => 'Son g眉ncelleme',
			'dialogs.warpLicense.title' => 'Cloudflare WARP onay谋',
			'dialogs.warpLicense.description' => ({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [ const TextSpan(text: 'Cloudflare WARP 眉cretsiz bir WireGuard VPN sa臒lay谋c谋s谋d谋r. Bu se莽ene臒i etkinle艧tirerek Cloudflare WARP\'谋n '), tos('Hizmet 艦artlar谋'), const TextSpan(text: '\'n谋 ve '), privacy('Gizlilik Politikas谋'), const TextSpan(text: '\'n谋 kabul etmi艧 olursunuz.'), ]), 
			'dialogs.newVersion.title' => 'G眉ncelleme mevcut',
			'dialogs.newVersion.msg' => '${_root.common.appTitle}\'谋n yeni bir s眉r眉m眉 mevcut. 艦imdi g眉ncellemek ister misiniz?',
			'dialogs.newVersion.currentVersion' => 'Mevcut s眉r眉m: ',
			'dialogs.newVersion.newVersion' => 'Yeni s眉r眉m: ',
			'dialogs.newVersion.updateNow' => '艦imdi g眉ncelle',
			'dialogs.confirmation.settings.import.msg' => 'Bu i艧lem t眉m yap谋land谋rma se莽eneklerini verilen de臒erlerle yeniden yazacakt谋r. Emin misiniz?',
			'dialogs.confirmation.profile.delete.title' => 'Profili sil',
			'dialogs.confirmation.profile.delete.msg' => 'Bu profili kal谋c谋 olarak silmek istedi臒inizden emin misiniz?',
			'dialogs.confirmation.perAppProxy.shareOnGithub.title' => 'Otomatik se莽imi iyile艧tirme',
			'dialogs.confirmation.perAppProxy.shareOnGithub.msg' => 'Se莽ili uygulamalar谋 payla艧arak "otomatik se莽im" listesini tamamlamaya yard谋mc谋 olursunuz',
			'dialogs.confirmation.perAppProxy.import.msg' => 'Bu i艧lem mevcut t眉m uygulama bazl谋 proxy se莽imlerinizi de臒i艧tirecektir. Devam etmek istedi臒inizden emin misiniz?',
			'dialogs.confirmation.routeRule.delete.title' => 'Kural谋 sil',
			'dialogs.confirmation.routeRule.delete.msg' => ({required Object rulename}) => '"${rulename}" kural谋n谋 silmek istedi臒inizden emin misiniz?',
			'dialogs.experimentalNotice.title' => 'Deneysel 枚zellikler kullan谋l谋yor',
			'dialogs.experimentalNotice.msg' => 'Ba臒lant谋 kalitesini etkileyebilecek ve beklenmedik hatalara neden olabilecek baz谋 deneysel 枚zellikleri etkinle艧tirdiniz. Bu se莽enekleri istedi臒iniz zaman yap谋land谋rma sayfas谋ndan de臒i艧tirebilir veya s谋f谋rlayabilirsiniz.',
			'dialogs.experimentalNotice.disable' => 'Tekrar g枚sterme',
			'dialogs.noActiveProfile.title' => 'Bir profil se莽in',
			'dialogs.noActiveProfile.msg' => 'VPN ba臒lant谋 ayr谋nt谋lar谋n谋z谋 i莽eren bir ba臒lant谋 profili ekleyerek ba艧layal谋m.\n\nHen眉z bir VPN sunucunuz yok mu? Endi艧elenmeyin, h谋zl谋 ve 眉cretsiz bir 艧ekilde kurmak i莽in a艧a臒谋daki e臒itimi takip edin.',
			'dialogs.noActiveProfile.helpBtn.label' => 'Nas谋l yap谋ld谋臒谋n谋 g枚ster',
			'dialogs.noActiveProfile.helpBtn.url' => 'https://github.com/shulaiyun/Sloth-VPN.git',
			'dialogs.unknownDomainsWarning.title' => 'D谋艧 ba臒lant谋 uyar谋s谋',
			'dialogs.unknownDomainsWarning.youAreAboutToVisit' => '艦u adresi ziyaret etmek 眉zeresiniz:',
			'dialogs.unknownDomainsWarning.thisWebsiteIsNotInOurTrustedList' => 'Bu web sitesi g眉venilir listemizde de臒il. L眉tfen dikkatli devam edin.',
			'dialogs.proxyInfo.fullTag' => 'Tam etiket:',
			'dialogs.proxyInfo.type' => 'T眉r:',
			'dialogs.proxyInfo.testTime' => 'Test zaman谋:',
			'dialogs.proxyInfo.testDelay' => 'Test gecikmesi:',
			'dialogs.proxyInfo.isSelected' => 'Se莽ili:',
			'dialogs.proxyInfo.isGroup' => 'Grup',
			'dialogs.proxyInfo.isSecure' => 'G眉venli:',
			'dialogs.proxyInfo.port' => 'Port:',
			'dialogs.proxyInfo.host' => 'Sunucu:',
			'dialogs.proxyInfo.ip' => 'IP:',
			'dialogs.proxyInfo.countryCode' => '脺lke kodu:',
			'dialogs.proxyInfo.region' => 'B枚lge:',
			'dialogs.proxyInfo.city' => '艦ehir:',
			'dialogs.proxyInfo.asn' => 'ASN:',
			'dialogs.proxyInfo.organization' => 'Kurulu艧:',
			'dialogs.proxyInfo.location' => 'Konum:',
			'dialogs.proxyInfo.postalCode' => 'Posta kodu:',
			'dialogs.windowClosing.askEachTime' => 'Her seferinde sor',
			'dialogs.windowClosing.alertMessage' => 'Uygulama gizlensin mi, kapat谋ls谋n m谋?',
			'dialogs.windowClosing.remember' => 'Se莽imimi hat谋rla',
			'connection.tapToConnect' => 'Ba臒lanmak i莽in dokunun',
			'connection.connect' => 'Ba臒lan',
			'connection.connecting' => 'Ba臒lan谋yor...',
			'connection.connected' => 'Ba臒l谋',
			'connection.disconnect' => 'Ba臒lant谋y谋 kes',
			'connection.disconnecting' => 'Ba臒lant谋 kesiliyor...',
			'connection.reconnect' => 'Yeniden ba臒lan',
			'connection.reconnectMsg' => 'De臒i艧iklikleri uygulamak i莽in yeniden ba臒lan谋l谋yor...',
			'connection.secure' => 'WARP ile g眉vende',
			'errors.unexpected' => 'Beklenmeyen hata',
			'errors.connection.unexpected' => 'Beklenmeyen ba臒lant谋 hatas谋',
			'errors.connection.timeout' => 'Ba臒lant谋 zaman a艧谋m谋na u臒rad谋',
			'errors.connection.badResponse' => 'Hatal谋 yan谋t',
			'errors.connection.connectionError' => 'Ba臒lant谋 hatas谋',
			'errors.connection.badCertificate' => 'Ge莽ersiz sertifika',
			'errors.profiles.unexpected' => 'Beklenmeyen hata',
			'errors.profiles.notFound' => 'Profil bulunamad谋',
			'errors.profiles.invalidConfig' => 'Ge莽ersiz yap谋land谋rmalar',
			'errors.profiles.invalidUrl' => 'Ge莽ersiz URL',
			'errors.profiles.canceledByUser' => 'Kullan谋c谋 taraf谋ndan iptal edildi',
			'errors.connectivity.unexpected' => 'Beklenmeyen hata',
			'errors.connectivity.missingVpnPermission' => 'VPN izni eksik',
			'errors.connectivity.missingNotificationPermission' => 'Bildirim izni eksik',
			'errors.connectivity.core' => '脟ekirdek hatas谋',
			'errors.singbox.serviceNotRunning' => 'Servis 莽al谋艧m谋yor',
			'errors.singbox.missingPrivilege' => 'Eksik yetki',
			'errors.singbox.missingPrivilegeMsg' => 'VPN modu y枚netici yetkisi gerektirir. L眉tfen uygulamay谋 y枚netici olarak yeniden ba艧lat谋n veya servis modunu de臒i艧tirin.',
			'errors.singbox.invalidConfigOptions' => 'Ge莽ersiz yap谋land谋rma se莽enekleri',
			'errors.singbox.invalidConfig' => 'Ge莽ersiz yap谋land谋rma',
			'errors.warp.missingLicense' => 'WARP lisans谋 eksik',
			'errors.warp.missingLicenseMsg' => 'Se莽ili profil WARP 枚zelli臒ini kullan谋yor. Bu 枚zelli臒i kullanmak i莽in WARP lisans谋n谋 kabul etmeniz gerekir.',
			_ => null,
		};
	}
}

