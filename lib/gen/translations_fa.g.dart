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
class TranslationsFa extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fa,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fa>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFa _root = this; // ignore: unused_field

	@override 
	TranslationsFa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFa(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonFa common = TranslationsCommonFa._(_root);
	@override late final TranslationsIntroFa intro = TranslationsIntroFa._(_root);
	@override late final TranslationsPagesFa pages = TranslationsPagesFa._(_root);
	@override late final TranslationsComponentsFa components = TranslationsComponentsFa._(_root);
	@override late final TranslationsDialogsFa dialogs = TranslationsDialogsFa._(_root);
	@override late final TranslationsConnectionFa connection = TranslationsConnectionFa._(_root);
	@override late final TranslationsErrorsFa errors = TranslationsErrorsFa._(_root);
}

// Path: common
class TranslationsCommonFa extends TranslationsCommonEn {
	TranslationsCommonFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get appTitle => 'هیدیفای';
	@override String get start => 'شروع';
	@override String get version => 'نسخه';
	@override String get ok => 'باشه';
	@override String get cancel => 'لغو';
	@override String get kContinue => 'ادامه';
	@override String get showMore => 'نمایش بیشتر';
	@override String get showLess => 'نمایش کمتر';
	@override String get filter => 'فیلتر';
	@override String get all => 'همه';
	@override String get pause => 'مکث';
	@override String get resume => 'ادامه';
	@override String get clear => 'پاک‌سازی';
	@override String get close => 'بستن';
	@override String get auto => 'خودکار';
	@override String get manually => 'دستی';
	@override String get name => 'نام';
	@override String get url => 'URL';
	@override String get add => 'افزودن';
	@override String get clipboard => 'کلیپ‌بورد';
	@override String get addToClipboard => 'افزودن به کلیپ‌بورد';
	@override String get scanQr => 'اسکن QR';
	@override String get free => 'رایگان';
	@override String get warp => 'WARP';
	@override String get fragment => 'Fragment';
	@override String get help => 'راهنما';
	@override String get save => 'ذخیره';
	@override String get update => 'به‌روزرسانی';
	@override String get share => 'اشتراک‌گذاری';
	@override String get edit => 'ویرایش';
	@override String get delete => 'حذف';
	@override String get discard => 'صرف‌نظر';
	@override String get import => 'وارد کردن';
	@override String get export => 'خروجی گرفتن';
	@override String get later => 'بعداً';
	@override String get ignore => 'نادیده گرفتن';
	@override String get quit => 'خروج';
	@override String get notSet => 'تنظیم نشده';
	@override String get hide => 'پنهان کردن';
	@override String get exit => 'خروج';
	@override String get reset => 'بازنشانی';
	@override String get done => 'انجام شد';
	@override String get search => 'جستجو';
	@override String get decline => 'رد کردن';
	@override String get agree => 'موافقم';
	@override String get empty => 'خالی';
	@override String get unknown => 'ناشناخته';
	@override String get hidden => 'پنهان';
	@override String get timeout => 'عدم پاسخ';
	@override String get sort => 'مرتب‌سازی';
	@override String get dashboard => 'داشبورد';
	@override late final TranslationsCommonIntervalFa interval = TranslationsCommonIntervalFa._(_root);
	@override late final TranslationsCommonMsgFa msg = TranslationsCommonMsgFa._(_root);
}

// Path: intro
class TranslationsIntroFa extends TranslationsIntroEn {
	TranslationsIntroFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get banner => 'هرآنچه برای اینترنت بدون محدودیت نیاز دارید';
	@override TextSpan termsAndPolicyCaution({required InlineSpanBuilder tap}) => TextSpan(children: [
		const TextSpan(text: 'با ادامه، شما با '),
		tap(_root.pages.about.termsAndConditions),
		const TextSpan(text: ' موافقت می‌کنید'),
	]);
	@override TextSpan info({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [
		const TextSpan(text: 'ساخته شده با ❤️ توسط هیدیفای - '),
		tap_source('متن‌باز'),
		const TextSpan(text: ' ('),
		tap_license('مجوز'),
		const TextSpan(text: ')'),
	]);
}

// Path: pages
class TranslationsPagesFa extends TranslationsPagesEn {
	TranslationsPagesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesHomeFa home = TranslationsPagesHomeFa._(_root);
	@override late final TranslationsPagesProxiesFa proxies = TranslationsPagesProxiesFa._(_root);
	@override late final TranslationsPagesProfilesFa profiles = TranslationsPagesProfilesFa._(_root);
	@override late final TranslationsPagesProfileDetailsFa profileDetails = TranslationsPagesProfileDetailsFa._(_root);
	@override late final TranslationsPagesLogsFa logs = TranslationsPagesLogsFa._(_root);
	@override late final TranslationsPagesAboutFa about = TranslationsPagesAboutFa._(_root);
	@override late final TranslationsPagesSettingsFa settings = TranslationsPagesSettingsFa._(_root);
}

// Path: components
class TranslationsComponentsFa extends TranslationsComponentsEn {
	TranslationsComponentsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsComponentsStatsFa stats = TranslationsComponentsStatsFa._(_root);
	@override late final TranslationsComponentsSubscriptionInfoFa subscriptionInfo = TranslationsComponentsSubscriptionInfoFa._(_root);
}

// Path: dialogs
class TranslationsDialogsFa extends TranslationsDialogsEn {
	TranslationsDialogsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsSortProfilesFa sortProfiles = TranslationsDialogsSortProfilesFa._(_root);
	@override late final TranslationsDialogsWarpLicenseFa warpLicense = TranslationsDialogsWarpLicenseFa._(_root);
	@override late final TranslationsDialogsNewVersionFa newVersion = TranslationsDialogsNewVersionFa._(_root);
	@override late final TranslationsDialogsConfirmationFa confirmation = TranslationsDialogsConfirmationFa._(_root);
	@override late final TranslationsDialogsExperimentalNoticeFa experimentalNotice = TranslationsDialogsExperimentalNoticeFa._(_root);
	@override late final TranslationsDialogsNoActiveProfileFa noActiveProfile = TranslationsDialogsNoActiveProfileFa._(_root);
	@override late final TranslationsDialogsUnknownDomainsWarningFa unknownDomainsWarning = TranslationsDialogsUnknownDomainsWarningFa._(_root);
	@override late final TranslationsDialogsProxyInfoFa proxyInfo = TranslationsDialogsProxyInfoFa._(_root);
	@override late final TranslationsDialogsWindowClosingFa windowClosing = TranslationsDialogsWindowClosingFa._(_root);
}

// Path: connection
class TranslationsConnectionFa extends TranslationsConnectionEn {
	TranslationsConnectionFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get tapToConnect => 'برای اتصال ضربه بزنید';
	@override String get connect => 'اتصال';
	@override String get connecting => 'در حال اتصال...';
	@override String get connected => 'متصل شد';
	@override String get disconnect => 'قطع اتصال';
	@override String get disconnecting => 'در حال قطع اتصال...';
	@override String get reconnect => 'اتصال مجدد';
	@override String get reconnectMsg => 'در حال اتصال مجدد برای اعمال تغییرات...';
	@override String get secure => 'ایمن شده با WARP';
}

// Path: errors
class TranslationsErrorsFa extends TranslationsErrorsEn {
	TranslationsErrorsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'خطای غیرمنتظره';
	@override late final TranslationsErrorsConnectionFa connection = TranslationsErrorsConnectionFa._(_root);
	@override late final TranslationsErrorsProfilesFa profiles = TranslationsErrorsProfilesFa._(_root);
	@override late final TranslationsErrorsConnectivityFa connectivity = TranslationsErrorsConnectivityFa._(_root);
	@override late final TranslationsErrorsSingboxFa singbox = TranslationsErrorsSingboxFa._(_root);
	@override late final TranslationsErrorsWarpFa warp = TranslationsErrorsWarpFa._(_root);
}

// Path: common.interval
class TranslationsCommonIntervalFa extends TranslationsCommonIntervalEn {
	TranslationsCommonIntervalFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fa'))(n,
		zero: '',
		one: '${n} روز',
		other: '${n} روز',
	);
	@override String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fa'))(n,
		zero: '',
		one: '${n} ساعت',
		other: '${n} ساعت',
	);
}

// Path: common.msg
class TranslationsCommonMsgFa extends TranslationsCommonMsgEn {
	TranslationsCommonMsgFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgPermissionFa permission = TranslationsCommonMsgPermissionFa._(_root);
	@override late final TranslationsCommonMsgExportFa export = TranslationsCommonMsgExportFa._(_root);
	@override late final TranslationsCommonMsgImportFa import = TranslationsCommonMsgImportFa._(_root);
}

// Path: pages.home
class TranslationsPagesHomeFa extends TranslationsPagesHomeEn {
	TranslationsPagesHomeFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'خانه';
	@override String get quickSettings => 'تنظیمات سریع';
}

// Path: pages.proxies
class TranslationsPagesProxiesFa extends TranslationsPagesProxiesEn {
	TranslationsPagesProxiesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'پروکسی‌ها';
	@override String get sort => 'مرتب‌سازی پروکسی‌ها';
	@override String get testDelay => 'تست تأخیر';
	@override String get empty => 'هیچ پروکسی موجود نیست';
	@override String get activeProxy => 'پروکسی فعال';
	@override String get unknownIp => 'IP ناشناخته';
	@override late final TranslationsPagesProxiesSortOptionsFa sortOptions = TranslationsPagesProxiesSortOptionsFa._(_root);
	@override late final TranslationsPagesProxiesIpInfoFa ipInfo = TranslationsPagesProxiesIpInfoFa._(_root);
	@override late final TranslationsPagesProxiesDelayFa delay = TranslationsPagesProxiesDelayFa._(_root);
}

// Path: pages.profiles
class TranslationsPagesProfilesFa extends TranslationsPagesProfilesEn {
	TranslationsPagesProfilesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'پروفایل‌ها';
	@override String get add => 'افزودن پروفایل';
	@override String get update => 'به‌روزرسانی پروفایل';
	@override String get viewAllProfiles => 'مشاهده همه پروفایل‌ها';
	@override String activeProfileName({required Object name}) => 'نام پروفایل فعال: «${name}»';
	@override String nonActiveProfileName({required Object name}) => 'انتخاب «${name}» به عنوان پروفایل فعال';
	@override String get freeSubNotFound => 'اشتراک رایگان یافت نشد';
	@override String freeSubNotFoundForRegion({required Object region}) => 'اشتراک رایگان برای منطقه «${region}» یافت نشد';
	@override String get failedToLoad => 'بارگذاری ناموفق بود';
	@override String get updateSubscriptions => 'به‌روزرسانی اشتراک‌ها';
	@override late final TranslationsPagesProfilesShareFa share = TranslationsPagesProfilesShareFa._(_root);
	@override late final TranslationsPagesProfilesMsgFa msg = TranslationsPagesProfilesMsgFa._(_root);
}

// Path: pages.profileDetails
class TranslationsPagesProfileDetailsFa extends TranslationsPagesProfileDetailsEn {
	TranslationsPagesProfileDetailsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'پروفایل';
	@override String get lastUpdate => 'آخرین به‌روزرسانی';
	@override late final TranslationsPagesProfileDetailsFormFa form = TranslationsPagesProfileDetailsFormFa._(_root);
}

// Path: pages.logs
class TranslationsPagesLogsFa extends TranslationsPagesLogsEn {
	TranslationsPagesLogsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'گزارش‌ها';
	@override String get shareCoreLogs => 'اشتراک‌گذاری گزارش‌های هسته';
	@override String get shareAppLogs => 'اشتراک‌گذاری گزارش‌های برنامه';
}

// Path: pages.about
class TranslationsPagesAboutFa extends TranslationsPagesAboutEn {
	TranslationsPagesAboutFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'درباره';
	@override String get notAvailableMsg => 'شما در حال استفاده از آخرین نسخه هستید';
	@override String get checkForUpdate => 'بررسی برای به‌روزرسانی';
	@override String get openWorkingDir => 'باز کردن پوشه کاری';
	@override String get sourceCode => 'کد منبع';
	@override String get telegramChannel => 'کانال تلگرام';
	@override String get termsAndConditions => 'شرایط و ضوابط';
	@override String get privacyPolicy => 'سیاست حفظ حریم خصوصی';
}

// Path: pages.settings
class TranslationsPagesSettingsFa extends TranslationsPagesSettingsEn {
	TranslationsPagesSettingsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'تنظیمات';
	@override String get resetTunnel => 'بازنشانی پروفایل VPN';
	@override late final TranslationsPagesSettingsOptionsFa options = TranslationsPagesSettingsOptionsFa._(_root);
	@override late final TranslationsPagesSettingsGeneralFa general = TranslationsPagesSettingsGeneralFa._(_root);
	@override late final TranslationsPagesSettingsRoutingFa routing = TranslationsPagesSettingsRoutingFa._(_root);
	@override late final TranslationsPagesSettingsDnsFa dns = TranslationsPagesSettingsDnsFa._(_root);
	@override late final TranslationsPagesSettingsInboundFa inbound = TranslationsPagesSettingsInboundFa._(_root);
	@override late final TranslationsPagesSettingsTlsTricksFa tlsTricks = TranslationsPagesSettingsTlsTricksFa._(_root);
	@override late final TranslationsPagesSettingsWarpFa warp = TranslationsPagesSettingsWarpFa._(_root);
}

// Path: components.stats
class TranslationsComponentsStatsFa extends TranslationsComponentsStatsEn {
	TranslationsComponentsStatsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get connection => 'اتصال';
	@override String get traffic => 'ترافیک';
	@override String get trafficLive => 'ترافیک لحظه‌ای';
	@override String get trafficTotal => 'ترافیک کل';
	@override String get uplink => 'ارسال';
	@override String get downlink => 'دریافت';
	@override String get speed => 'سرعت';
	@override String get totalTransferred => 'کل منتقل شده';
}

// Path: components.subscriptionInfo
class TranslationsComponentsSubscriptionInfoFa extends TranslationsComponentsSubscriptionInfoEn {
	TranslationsComponentsSubscriptionInfoFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get upload => 'آپلود';
	@override String get download => 'دانلود';
	@override String get total => 'کل ترافیک';
	@override String get expireDate => 'تاریخ انقضا';
	@override String get expired => 'منقضی شده';
	@override String get noTraffic => 'حجم تمام شده';
	@override String get remainingTime => 'زمان باقی‌مانده';
	@override String remainingDuration({required Object duration}) => '${duration} روز باقی‌مانده';
	@override String remainingDurationNew({required Object duration}) => '${duration} روز';
	@override String remainingTrafficSemanticLabel({required Object consumed, required Object total}) => '${consumed} از ${total} ترافیک مصرف شده';
	@override String get remainingTraffic => 'ترافیک باقی‌مانده';
	@override String get remainingUsage => 'باقی‌مانده';
	@override String get profileSite => 'سرویس‌دهنده';
	@override String get profileSupport => 'پشتیبانی';
}

// Path: dialogs.sortProfiles
class TranslationsDialogsSortProfilesFa extends TranslationsDialogsSortProfilesEn {
	TranslationsDialogsSortProfilesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'مرتب‌سازی بر اساس';
	@override late final TranslationsDialogsSortProfilesSortFa sort = TranslationsDialogsSortProfilesSortFa._(_root);
}

// Path: dialogs.warpLicense
class TranslationsDialogsWarpLicenseFa extends TranslationsDialogsWarpLicenseEn {
	TranslationsDialogsWarpLicenseFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'رضایت‌نامه Cloudflare WARP';
	@override TextSpan description({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [
		const TextSpan(text: 'Cloudflare WARP یک ارائه‌دهنده رایگان WireGuard VPN است. با فعال کردن این گزینه، شما با '),
		tos('شرایط خدمات'),
		const TextSpan(text: ' و '),
		privacy('سیاست حفظ حریم خصوصی'),
		const TextSpan(text: ' Cloudflare WARP موافقت می‌کنید.'),
	]);
}

// Path: dialogs.newVersion
class TranslationsDialogsNewVersionFa extends TranslationsDialogsNewVersionEn {
	TranslationsDialogsNewVersionFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'به‌روزرسانی موجود است';
	@override String get msg => 'نسخه جدیدی از ${_root.common.appTitle} در دسترس است. آیا مایل به به‌روزرسانی هستید؟';
	@override String get currentVersion => 'نسخه فعلی: ';
	@override String get newVersion => 'نسخه جدید: ';
	@override String get updateNow => 'اکنون به‌روزرسانی کن';
}

// Path: dialogs.confirmation
class TranslationsDialogsConfirmationFa extends TranslationsDialogsConfirmationEn {
	TranslationsDialogsConfirmationFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsFa settings = TranslationsDialogsConfirmationSettingsFa._(_root);
	@override late final TranslationsDialogsConfirmationProfileFa profile = TranslationsDialogsConfirmationProfileFa._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyFa perAppProxy = TranslationsDialogsConfirmationPerAppProxyFa._(_root);
	@override late final TranslationsDialogsConfirmationRouteRuleFa routeRule = TranslationsDialogsConfirmationRouteRuleFa._(_root);
}

// Path: dialogs.experimentalNotice
class TranslationsDialogsExperimentalNoticeFa extends TranslationsDialogsExperimentalNoticeEn {
	TranslationsDialogsExperimentalNoticeFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ویژگی‌های آزمایشی در حال استفاده';
	@override String get msg => 'شما برخی ویژگی‌های آزمایشی را فعال کرده‌اید که ممکن است بر کیفیت اتصال تأثیر گذاشته و باعث خطاهای غیرمنتظره شوند. همیشه می‌توانید این گزینه‌ها را از صفحه تنظیمات تغییر داده یا بازنشانی کنید.';
	@override String get disable => 'دیگر نمایش نده';
}

// Path: dialogs.noActiveProfile
class TranslationsDialogsNoActiveProfileFa extends TranslationsDialogsNoActiveProfileEn {
	TranslationsDialogsNoActiveProfileFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'یک پروفایل انتخاب کنید';
	@override String get msg => 'بیایید با افزودن یک پروفایل اتصال که شامل جزئیات اتصال VPN شماست، شروع کنیم.\n\nهنوز سرور VPN ندارید؟ نگران نباشید، با دنبال کردن راهنمای زیر می‌توانید به سرعت و رایگان یکی برای خودتان بسازید.';
	@override late final TranslationsDialogsNoActiveProfileHelpBtnFa helpBtn = TranslationsDialogsNoActiveProfileHelpBtnFa._(_root);
}

// Path: dialogs.unknownDomainsWarning
class TranslationsDialogsUnknownDomainsWarningFa extends TranslationsDialogsUnknownDomainsWarningEn {
	TranslationsDialogsUnknownDomainsWarningFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'هشدار لینک خارجی';
	@override String get youAreAboutToVisit => 'شما در حال بازدید از این آدرس هستید:';
	@override String get thisWebsiteIsNotInOurTrustedList => 'این وب‌سایت در لیست مورد اعتماد ما نیست. لطفاً با احتیاط ادامه دهید.';
}

// Path: dialogs.proxyInfo
class TranslationsDialogsProxyInfoFa extends TranslationsDialogsProxyInfoEn {
	TranslationsDialogsProxyInfoFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get fullTag => 'تگ کامل:';
	@override String get type => 'نوع:';
	@override String get testTime => 'زمان تست:';
	@override String get testDelay => 'تأخیر تست:';
	@override String get isSelected => 'انتخاب شده:';
	@override String get isGroup => 'گروه است';
	@override String get isSecure => 'امن است:';
	@override String get port => 'پورت:';
	@override String get host => 'میزبان:';
	@override String get ip => 'IP:';
	@override String get countryCode => 'کد کشور:';
	@override String get region => 'منطقه:';
	@override String get city => 'شهر:';
	@override String get asn => 'ASN:';
	@override String get organization => 'سازمان:';
	@override String get location => 'مکان:';
	@override String get postalCode => 'کد پستی:';
}

// Path: dialogs.windowClosing
class TranslationsDialogsWindowClosingFa extends TranslationsDialogsWindowClosingEn {
	TranslationsDialogsWindowClosingFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get askEachTime => 'هر بار بپرس';
	@override String get alertMessage => 'پنهان کردن یا خروج از برنامه؟';
	@override String get remember => 'انتخابم را به خاطر بسپار';
}

// Path: errors.connection
class TranslationsErrorsConnectionFa extends TranslationsErrorsConnectionEn {
	TranslationsErrorsConnectionFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'خطای غیرمنتظره در اتصال';
	@override String get timeout => 'اتصال با وقفه زمانی مواجه شد';
	@override String get badResponse => 'پاسخ نامعتبر';
	@override String get connectionError => 'خطای اتصال';
	@override String get badCertificate => 'گواهی‌نامه نامعتبر';
}

// Path: errors.profiles
class TranslationsErrorsProfilesFa extends TranslationsErrorsProfilesEn {
	TranslationsErrorsProfilesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'خطای غیرمنتظره';
	@override String get notFound => 'پروفایل یافت نشد';
	@override String get invalidConfig => 'کانفیگ‌های نامعتبر';
	@override String get invalidUrl => 'URL نامعتبر';
	@override String get canceledByUser => 'توسط کاربر لغو شد';
}

// Path: errors.connectivity
class TranslationsErrorsConnectivityFa extends TranslationsErrorsConnectivityEn {
	TranslationsErrorsConnectivityFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'شکست غیرمنتظره';
	@override String get missingVpnPermission => 'مجوز VPN وجود ندارد';
	@override String get missingNotificationPermission => 'مجوز اعلان وجود ندارد';
	@override String get core => 'خطای هسته';
}

// Path: errors.singbox
class TranslationsErrorsSingboxFa extends TranslationsErrorsSingboxEn {
	TranslationsErrorsSingboxFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get serviceNotRunning => 'سرویس در حال اجرا نیست';
	@override String get missingPrivilege => 'دسترسی وجود ندارد';
	@override String get missingPrivilegeMsg => 'حالت VPN به دسترسی ادمین نیاز دارد. یا برنامه را به عنوان ادمین مجدداً راه‌اندازی کنید یا حالت سرویس را تغییر دهید.';
	@override String get invalidConfigOptions => 'گزینه‌های پیکربندی نامعتبر';
	@override String get invalidConfig => 'پیکربندی نامعتبر';
}

// Path: errors.warp
class TranslationsErrorsWarpFa extends TranslationsErrorsWarpEn {
	TranslationsErrorsWarpFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get missingLicense => 'لایسنس Warp';
	@override String get missingLicenseMsg => 'پروفایل انتخاب‌شده از ویژگی WARP استفاده می‌کند؛ برای استفاده از این قابلیت، باید با لایسنس WARP موافقت شود.';
}

// Path: common.msg.permission
class TranslationsCommonMsgPermissionFa extends TranslationsCommonMsgPermissionEn {
	TranslationsCommonMsgPermissionFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get denied => 'دسترسی رد شد';
}

// Path: common.msg.export
class TranslationsCommonMsgExportFa extends TranslationsCommonMsgExportEn {
	TranslationsCommonMsgExportFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgExportClipboardFa clipboard = TranslationsCommonMsgExportClipboardFa._(_root);
	@override late final TranslationsCommonMsgExportFileFa file = TranslationsCommonMsgExportFileFa._(_root);
}

// Path: common.msg.import
class TranslationsCommonMsgImportFa extends TranslationsCommonMsgImportEn {
	TranslationsCommonMsgImportFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'تأیید ورود اطلاعات';
	@override String get success => 'با موفقیت وارد شد';
	@override String get failure => 'وارد کردن ناموفق بود';
}

// Path: pages.proxies.sortOptions
class TranslationsPagesProxiesSortOptionsFa extends TranslationsPagesProxiesSortOptionsEn {
	TranslationsPagesProxiesSortOptionsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get unsorted => 'پیش‌فرض';
	@override String get name => 'بر اساس نام';
	@override String get delay => 'بر اساس تأخیر';
}

// Path: pages.proxies.ipInfo
class TranslationsPagesProxiesIpInfoFa extends TranslationsPagesProxiesIpInfoEn {
	TranslationsPagesProxiesIpInfoFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get address => 'آدرس IP';
	@override String get country => 'کشور';
	@override String get organization => 'سازمان';
}

// Path: pages.proxies.delay
class TranslationsPagesProxiesDelayFa extends TranslationsPagesProxiesDelayEn {
	TranslationsPagesProxiesDelayFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String result({required Object delay}) => 'تأخیر: ${delay} میلی‌ثانیه';
	@override String get timeout => 'تست تأخیر ناموفق بود';
	@override String get testing => 'تأخیر: در حال تست...';
}

// Path: pages.profiles.share
class TranslationsPagesProfilesShareFa extends TranslationsPagesProfilesShareEn {
	TranslationsPagesProfilesShareFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get urlToClipboard => 'URL به کلیپ‌بورد';
	@override String get showUrlQr => 'نمایش QR کد URL';
	@override String get jsonToClipboard => 'JSON به کلیپ‌بورد';
}

// Path: pages.profiles.msg
class TranslationsPagesProfilesMsgFa extends TranslationsPagesProfilesMsgEn {
	TranslationsPagesProfilesMsgFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesProfilesMsgSaveFa save = TranslationsPagesProfilesMsgSaveFa._(_root);
	@override String get invalidUrl => 'URL نامعتبر است';
	@override late final TranslationsPagesProfilesMsgAddFa add = TranslationsPagesProfilesMsgAddFa._(_root);
	@override late final TranslationsPagesProfilesMsgUpdateFa update = TranslationsPagesProfilesMsgUpdateFa._(_root);
	@override late final TranslationsPagesProfilesMsgDeleteFa delete = TranslationsPagesProfilesMsgDeleteFa._(_root);
}

// Path: pages.profileDetails.form
class TranslationsPagesProfileDetailsFormFa extends TranslationsPagesProfileDetailsFormEn {
	TranslationsPagesProfileDetailsFormFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get nameHint => 'نام پروفایل';
	@override String get emptyName => 'نام الزامی است';
	@override String get invalidUrl => 'URL نامعتبر است';
	@override String get urlHint => 'URL کامل کانفیگ';
	@override String get disableAutoUpdate => 'غیرفعال کردن به‌روزرسانی خودکار';
	@override String get autoUpdateInterval => 'فاصله زمانی به‌روزرسانی خودکار';
	@override String get loading => 'در حال افزودن پروفایل...';
}

// Path: pages.settings.options
class TranslationsPagesSettingsOptionsFa extends TranslationsPagesSettingsOptionsEn {
	TranslationsPagesSettingsOptionsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsOptionsImportFa import = TranslationsPagesSettingsOptionsImportFa._(_root);
	@override late final TranslationsPagesSettingsOptionsExportFa export = TranslationsPagesSettingsOptionsExportFa._(_root);
	@override String get reset => 'بازنشانی تنظیمات';
}

// Path: pages.settings.general
class TranslationsPagesSettingsGeneralFa extends TranslationsPagesSettingsGeneralEn {
	TranslationsPagesSettingsGeneralFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'عمومی';
	@override String get locale => 'زبان';
	@override String get themeMode => 'حالت پوسته';
	@override late final TranslationsPagesSettingsGeneralThemeModesFa themeModes = TranslationsPagesSettingsGeneralThemeModesFa._(_root);
	@override String get enableAnalytics => 'فعال‌سازی آمار';
	@override String get enableAnalyticsMsg => 'اجازه جمع‌آوری آمار و ارسال گزارش‌های خطا برای بهبود برنامه';
	@override String get autoIpCheck => 'بررسی خودکار IP اتصال';
	@override String get dynamicNotification => 'نمایش سرعت در اعلان';
	@override String get hapticFeedback => 'بازخورد لرزشی';
	@override String get actionAtClosing => 'اقدام هنگام بستن';
	@override String get autoStart => 'شروع هنگام ورود به سیستم';
	@override String get silentStart => 'شروع در حالت کمینه';
	@override String get ignoreBatteryOptimizations => 'غیرفعال کردن بهینه‌سازی باتری';
	@override String get ignoreBatteryOptimizationsMsg => 'حذف محدودیت‌ها برای عملکرد بهینه VPN';
	@override String get memoryLimit => 'محدودیت حافظه';
	@override String get memoryLimitMsg => 'در صورت مواجهه با خطای کمبود حافظه یا بسته‌شدن‌های مکرر برنامه، این گزینه را فعال کنید';
	@override String get debugMode => 'حالت اشکال‌زدایی';
	@override String get debugModeMsg => 'برای اعمال این تغییر، برنامه را مجدداً راه‌اندازی کنید';
	@override String get logLevel => 'سطح گزارش‌گیری';
	@override String get connectionTestUrl => 'URL تست اتصال';
	@override String get urlTestInterval => 'فاصله زمانی تست URL';
	@override String get clashApiPort => 'پورت Clash API';
	@override String get useXrayCoreWhenPossible => 'استفاده از xray-core در صورت امکان';
	@override String get useXrayCoreWhenPossibleMsg => 'هنگام پردازش لینک‌های اشتراک از xray-core استفاده شود. برای فعال‌سازی این گزینه باید لینک اشتراک را مجدداً وارد کنید.';
}

// Path: pages.settings.routing
class TranslationsPagesSettingsRoutingFa extends TranslationsPagesSettingsRoutingEn {
	TranslationsPagesSettingsRoutingFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'مسیریابی';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyFa perAppProxy = TranslationsPagesSettingsRoutingPerAppProxyFa._(_root);
	@override String get region => 'منطقه';
	@override late final TranslationsPagesSettingsRoutingRegionsFa regions = TranslationsPagesSettingsRoutingRegionsFa._(_root);
	@override late final TranslationsPagesSettingsRoutingBalancerStrategyFa balancerStrategy = TranslationsPagesSettingsRoutingBalancerStrategyFa._(_root);
	@override String get blockAds => 'مسدودسازی تبلیغات';
	@override String get bypassLan => 'دور زدن LAN';
	@override String get resolveDestination => 'تحلیل آدرس مقصد';
	@override String get ipv6Route => 'مسیریابی IPv6';
	@override late final TranslationsPagesSettingsRoutingIpv6ModesFa ipv6Modes = TranslationsPagesSettingsRoutingIpv6ModesFa._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleFa routeRule = TranslationsPagesSettingsRoutingRouteRuleFa._(_root);
}

// Path: pages.settings.dns
class TranslationsPagesSettingsDnsFa extends TranslationsPagesSettingsDnsEn {
	TranslationsPagesSettingsDnsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'DNS';
	@override String get remoteDns => 'DNS اصلی (ریموت)';
	@override String get remoteDnsDomainStrategy => 'استراتژی دامنه DNS';
	@override String get directDns => 'DNS پروکسی‌ها (مستقیم)';
	@override String get directDnsDomainStrategy => 'استراتژی دامنه DNS مستقیم';
	@override String get enableDnsRouting => 'فعال‌سازی مسیریابی DNS';
	@override String get enableFakeDns => 'فعال‌سازی DNS جعلی';
	@override late final TranslationsPagesSettingsDnsDomainStrategyFa domainStrategy = TranslationsPagesSettingsDnsDomainStrategyFa._(_root);
}

// Path: pages.settings.inbound
class TranslationsPagesSettingsInboundFa extends TranslationsPagesSettingsInboundEn {
	TranslationsPagesSettingsInboundFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ورودی';
	@override String get serviceMode => 'حالت سرویس';
	@override late final TranslationsPagesSettingsInboundServiceModesFa serviceModes = TranslationsPagesSettingsInboundServiceModesFa._(_root);
	@override late final TranslationsPagesSettingsInboundShortServiceModesFa shortServiceModes = TranslationsPagesSettingsInboundShortServiceModesFa._(_root);
	@override String get strictRoute => 'مسیربندی سخت‌گیرانه';
	@override String get tunImplementation => 'پیاده‌سازی Tun';
	@override late final TranslationsPagesSettingsInboundTunImplementationsFa tunImplementations = TranslationsPagesSettingsInboundTunImplementationsFa._(_root);
	@override String get mixedPort => 'پورت ترکیبی';
	@override String get tproxyPort => 'پورت پروکسی شفاف';
	@override String get directPort => 'پورت مستقیم';
	@override String get redirectPort => 'پورت تغییر مسیر';
	@override String get allowConnectionFromLan => 'اشتراک VPN در شبکه محلی';
}

// Path: pages.settings.tlsTricks
class TranslationsPagesSettingsTlsTricksFa extends TranslationsPagesSettingsTlsTricksEn {
	TranslationsPagesSettingsTlsTricksFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'ترفندهای TLS';
	@override String get enable => 'فعال‌سازی fragment';
	@override String get packets => 'بسته‌های Fragment';
	@override String get packetsTlsHello => 'TLS Hello';
	@override String get packets1_1 => '1-1';
	@override String get packets1_2 => '1-2';
	@override String get packets1_3 => '1-3';
	@override String get packets1_4 => '1-4';
	@override String get packets1_5 => '1-5';
	@override String get size => 'اندازه fragment';
	@override String get sleep => 'تأخیر fragment';
	@override late final TranslationsPagesSettingsTlsTricksMixedSniCaseFa mixedSniCase = TranslationsPagesSettingsTlsTricksMixedSniCaseFa._(_root);
	@override late final TranslationsPagesSettingsTlsTricksPaddingFa padding = TranslationsPagesSettingsTlsTricksPaddingFa._(_root);
}

// Path: pages.settings.warp
class TranslationsPagesSettingsWarpFa extends TranslationsPagesSettingsWarpEn {
	TranslationsPagesSettingsWarpFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'WARP';
	@override String get enable => 'فعال‌سازی WARP';
	@override String get generateConfig => 'ایجاد کانفیگ WARP';
	@override String get configGenerated => 'کانفیگ Warp ایجاد شد';
	@override String get missingConfig => 'کانفیگ WARP موجود نیست';
	@override String get detourMode => 'حالت مسیریابی WARP';
	@override late final TranslationsPagesSettingsWarpDetourModesFa detourModes = TranslationsPagesSettingsWarpDetourModesFa._(_root);
	@override String get licenseKey => 'کلید لایسنس';
	@override String get cleanIp => 'IP تمیز';
	@override String get port => 'پورت';
	@override late final TranslationsPagesSettingsWarpNoiseFa noise = TranslationsPagesSettingsWarpNoiseFa._(_root);
}

// Path: dialogs.sortProfiles.sort
class TranslationsDialogsSortProfilesSortFa extends TranslationsDialogsSortProfilesSortEn {
	TranslationsDialogsSortProfilesSortFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get name => 'بر اساس نام';
	@override String get lastUpdate => 'آخرین به‌روزرسانی';
}

// Path: dialogs.confirmation.settings
class TranslationsDialogsConfirmationSettingsFa extends TranslationsDialogsConfirmationSettingsEn {
	TranslationsDialogsConfirmationSettingsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsImportFa import = TranslationsDialogsConfirmationSettingsImportFa._(_root);
}

// Path: dialogs.confirmation.profile
class TranslationsDialogsConfirmationProfileFa extends TranslationsDialogsConfirmationProfileEn {
	TranslationsDialogsConfirmationProfileFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationProfileDeleteFa delete = TranslationsDialogsConfirmationProfileDeleteFa._(_root);
}

// Path: dialogs.confirmation.perAppProxy
class TranslationsDialogsConfirmationPerAppProxyFa extends TranslationsDialogsConfirmationPerAppProxyEn {
	TranslationsDialogsConfirmationPerAppProxyFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationPerAppProxyShareOnGithubFa shareOnGithub = TranslationsDialogsConfirmationPerAppProxyShareOnGithubFa._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyImportFa import = TranslationsDialogsConfirmationPerAppProxyImportFa._(_root);
}

// Path: dialogs.confirmation.routeRule
class TranslationsDialogsConfirmationRouteRuleFa extends TranslationsDialogsConfirmationRouteRuleEn {
	TranslationsDialogsConfirmationRouteRuleFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationRouteRuleDeleteFa delete = TranslationsDialogsConfirmationRouteRuleDeleteFa._(_root);
}

// Path: dialogs.noActiveProfile.helpBtn
class TranslationsDialogsNoActiveProfileHelpBtnFa extends TranslationsDialogsNoActiveProfileHelpBtnEn {
	TranslationsDialogsNoActiveProfileHelpBtnFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get label => 'راهنمایی کن';
	@override String get url => 'https://github.com/shulaiyun/Sloth-VPN.git';
}

// Path: common.msg.export.clipboard
class TranslationsCommonMsgExportClipboardFa extends TranslationsCommonMsgExportClipboardEn {
	TranslationsCommonMsgExportClipboardFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get success => 'با موفقیت در کلیپ‌بورد کپی شد';
	@override String get failure => 'کپی در کلیپ‌بورد ناموفق بود';
	@override String get contentTooLarge => 'محتوا بیش از حد بزرگ است. به جای آن از خروجی فایل استفاده کنید';
}

// Path: common.msg.export.file
class TranslationsCommonMsgExportFileFa extends TranslationsCommonMsgExportFileEn {
	TranslationsCommonMsgExportFileFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get success => 'فایل JSON با موفقیت ایجاد شد';
	@override String get failure => 'ایجاد فایل ناموفق بود';
}

// Path: pages.profiles.msg.save
class TranslationsPagesProfilesMsgSaveFa extends TranslationsPagesProfilesMsgSaveEn {
	TranslationsPagesProfilesMsgSaveFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get success => 'پروفایل با موفقیت ذخیره شد';
}

// Path: pages.profiles.msg.add
class TranslationsPagesProfilesMsgAddFa extends TranslationsPagesProfilesMsgAddEn {
	TranslationsPagesProfilesMsgAddFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get failure => 'افزودن پروفایل ناموفق بود';
}

// Path: pages.profiles.msg.update
class TranslationsPagesProfilesMsgUpdateFa extends TranslationsPagesProfilesMsgUpdateEn {
	TranslationsPagesProfilesMsgUpdateFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get success => 'پروفایل با موفقیت به‌روز شد';
	@override String successNamed({required Object name}) => '«${name}» با موفقیت به‌روز شد';
	@override String get failure => 'به‌روزرسانی پروفایل ناموفق بود';
	@override String failureNamed({required Object name}) => 'به‌روزرسانی «${name}» ناموفق بود';
}

// Path: pages.profiles.msg.delete
class TranslationsPagesProfilesMsgDeleteFa extends TranslationsPagesProfilesMsgDeleteEn {
	TranslationsPagesProfilesMsgDeleteFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get success => 'پروفایل با موفقیت حذف شد';
}

// Path: pages.settings.options.import
class TranslationsPagesSettingsOptionsImportFa extends TranslationsPagesSettingsOptionsImportEn {
	TranslationsPagesSettingsOptionsImportFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'وارد کردن تنظیمات از کلیپ‌بورد';
	@override String get file => 'وارد کردن تنظیمات از فایل';
}

// Path: pages.settings.options.export
class TranslationsPagesSettingsOptionsExportFa extends TranslationsPagesSettingsOptionsExportEn {
	TranslationsPagesSettingsOptionsExportFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get anonymousToClipboard => 'کپی تنظیمات ناشناس به کلیپ‌بورد';
	@override String get anonymousToFile => 'خروجی تنظیمات ناشناس به فایل';
	@override String get allToClipboard => 'کپی تمام تنظیمات به کلیپ‌بورد';
	@override String get allToFile => 'خروجی تمام تنظیمات به فایل';
}

// Path: pages.settings.general.themeModes
class TranslationsPagesSettingsGeneralThemeModesFa extends TranslationsPagesSettingsGeneralThemeModesEn {
	TranslationsPagesSettingsGeneralThemeModesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get system => 'پیش‌فرض سیستم';
	@override String get dark => 'حالت تیره';
	@override String get light => 'حالت روشن';
	@override String get black => 'حالت مشکی';
}

// Path: pages.settings.routing.perAppProxy
class TranslationsPagesSettingsRoutingPerAppProxyFa extends TranslationsPagesSettingsRoutingPerAppProxyEn {
	TranslationsPagesSettingsRoutingPerAppProxyFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'پروکسی برای هر برنامه';
	@override String get hideSysApps => 'پنهان کردن برنامه‌های سیستمی';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsFa options = TranslationsPagesSettingsRoutingPerAppProxyOptionsFa._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyModesFa modes = TranslationsPagesSettingsRoutingPerAppProxyModesFa._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionFa autoSelection = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionFa._(_root);
}

// Path: pages.settings.routing.regions
class TranslationsPagesSettingsRoutingRegionsFa extends TranslationsPagesSettingsRoutingRegionsEn {
	TranslationsPagesSettingsRoutingRegionsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get ir => 'ایران (ir)';
	@override String get cn => 'چین (cn)';
	@override String get ru => 'روسیه (ru)';
	@override String get af => 'افغانستان (af)';
	@override String get id => 'اندونزی (id)';
	@override String get tr => 'ترکیه (tr)';
	@override String get br => 'برزیل (br)';
	@override String get other => 'سایر';
}

// Path: pages.settings.routing.balancerStrategy
class TranslationsPagesSettingsRoutingBalancerStrategyFa extends TranslationsPagesSettingsRoutingBalancerStrategyEn {
	TranslationsPagesSettingsRoutingBalancerStrategyFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'استراتژی Balancer';
	@override String get roundRobin => 'Round robin';
	@override String get consistentHash => 'Consistent hash';
	@override String get stickySession => 'Sticky session';
}

// Path: pages.settings.routing.ipv6Modes
class TranslationsPagesSettingsRoutingIpv6ModesFa extends TranslationsPagesSettingsRoutingIpv6ModesEn {
	TranslationsPagesSettingsRoutingIpv6ModesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get disable => 'غیرفعال';
	@override String get enable => 'فعال';
	@override String get prefer => 'ترجیحی';
	@override String get only => 'انحصاری';
}

// Path: pages.settings.routing.routeRule
class TranslationsPagesSettingsRoutingRouteRuleFa extends TranslationsPagesSettingsRoutingRouteRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'قوانین مسیریابی';
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsFa options = TranslationsPagesSettingsRoutingRouteRuleOptionsFa._(_root);
	@override String get deleteRule => 'حذف قانون';
	@override String get createRule => 'ایجاد قانون جدید';
	@override late final TranslationsPagesSettingsRoutingRouteRuleRuleFa rule = TranslationsPagesSettingsRoutingRouteRuleRuleFa._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleGenericListFa genericList = TranslationsPagesSettingsRoutingRouteRuleGenericListFa._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleAndroidAppsFa androidApps = TranslationsPagesSettingsRoutingRouteRuleAndroidAppsFa._(_root);
}

// Path: pages.settings.dns.domainStrategy
class TranslationsPagesSettingsDnsDomainStrategyFa extends TranslationsPagesSettingsDnsDomainStrategyEn {
	TranslationsPagesSettingsDnsDomainStrategyFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get auto => 'خودکار';
	@override String get preferIpv6 => 'ترجیح IPv6';
	@override String get preferIpv4 => 'ترجیح IPv4';
	@override String get ipv4Only => 'فقط IPv4';
	@override String get ipv6Only => 'فقط IPv6';
}

// Path: pages.settings.inbound.serviceModes
class TranslationsPagesSettingsInboundServiceModesFa extends TranslationsPagesSettingsInboundServiceModesEn {
	TranslationsPagesSettingsInboundServiceModesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get proxy => 'فقط سرویس پروکسی';
	@override String get systemProxy => 'تنظیم پروکسی سیستم';
	@override String get tun => 'VPN';
	@override String get tunService => 'سرویس VPN';
}

// Path: pages.settings.inbound.shortServiceModes
class TranslationsPagesSettingsInboundShortServiceModesFa extends TranslationsPagesSettingsInboundShortServiceModesEn {
	TranslationsPagesSettingsInboundShortServiceModesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get proxy => 'پروکسی';
	@override String get systemProxy => 'پروکسی سیستم';
	@override String get tun => 'VPN';
	@override String get tunService => 'سرویس VPN';
}

// Path: pages.settings.inbound.tunImplementations
class TranslationsPagesSettingsInboundTunImplementationsFa extends TranslationsPagesSettingsInboundTunImplementationsEn {
	TranslationsPagesSettingsInboundTunImplementationsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get mixed => 'ترکیبی';
	@override String get system => 'سیستم';
	@override String get gvisor => 'gVisor';
}

// Path: pages.settings.tlsTricks.mixedSniCase
class TranslationsPagesSettingsTlsTricksMixedSniCaseFa extends TranslationsPagesSettingsTlsTricksMixedSniCaseEn {
	TranslationsPagesSettingsTlsTricksMixedSniCaseFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get enable => 'فعال‌سازی mixed SNI case';
}

// Path: pages.settings.tlsTricks.padding
class TranslationsPagesSettingsTlsTricksPaddingFa extends TranslationsPagesSettingsTlsTricksPaddingEn {
	TranslationsPagesSettingsTlsTricksPaddingFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get enable => 'فعال‌سازی padding';
	@override String get size => 'اندازه padding';
}

// Path: pages.settings.warp.detourModes
class TranslationsPagesSettingsWarpDetourModesFa extends TranslationsPagesSettingsWarpDetourModesEn {
	TranslationsPagesSettingsWarpDetourModesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get proxyOverWarp => 'عبور پروکسی‌ها از طریق WARP';
	@override String get warpOverProxy => 'عبور WARP از طریق پروکسی‌ها';
	@override String get proxyOverWarpExplain => 'رفع انسداد پروکسی‌ها با WARP';
	@override String get warpOverProxyExplain => 'امنیت بیشتر با WARP';
}

// Path: pages.settings.warp.noise
class TranslationsPagesSettingsWarpNoiseFa extends TranslationsPagesSettingsWarpNoiseEn {
	TranslationsPagesSettingsWarpNoiseFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get count => 'تعداد نویز';
	@override String get mode => 'حالت نویز';
	@override String get size => 'اندازه نویز';
	@override String get delay => 'تأخیر نویز';
}

// Path: dialogs.confirmation.settings.import
class TranslationsDialogsConfirmationSettingsImportFa extends TranslationsDialogsConfirmationSettingsImportEn {
	TranslationsDialogsConfirmationSettingsImportFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get msg => 'این عمل تمام تنظیمات فعلی شما را بازنویسی خواهد کرد. آیا مطمئن هستید؟';
}

// Path: dialogs.confirmation.profile.delete
class TranslationsDialogsConfirmationProfileDeleteFa extends TranslationsDialogsConfirmationProfileDeleteEn {
	TranslationsDialogsConfirmationProfileDeleteFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'حذف پروفایل';
	@override String get msg => 'آیا از حذف دائمی این پروفایل مطمئن هستید؟';
}

// Path: dialogs.confirmation.perAppProxy.shareOnGithub
class TranslationsDialogsConfirmationPerAppProxyShareOnGithubFa extends TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn {
	TranslationsDialogsConfirmationPerAppProxyShareOnGithubFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'بهبود انتخاب خودکار';
	@override String get msg => 'با اشتراک‌گذاری برنامه‌های انتخاب‌شده، به تکمیل لیست «انتخاب خودکار» کمک می‌کنید';
}

// Path: dialogs.confirmation.perAppProxy.import
class TranslationsDialogsConfirmationPerAppProxyImportFa extends TranslationsDialogsConfirmationPerAppProxyImportEn {
	TranslationsDialogsConfirmationPerAppProxyImportFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get msg => 'این عمل تمام انتخاب‌های فعلی شما برای پروکسی برنامه‌ها را جایگزین خواهد کرد. آیا مطمئن هستید؟';
}

// Path: dialogs.confirmation.routeRule.delete
class TranslationsDialogsConfirmationRouteRuleDeleteFa extends TranslationsDialogsConfirmationRouteRuleDeleteEn {
	TranslationsDialogsConfirmationRouteRuleDeleteFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'حذف قانون';
	@override String msg({required Object rulename}) => 'آیا از حذف قانون «${rulename}» مطمئن هستید؟';
}

// Path: pages.settings.routing.perAppProxy.options
class TranslationsPagesSettingsRoutingPerAppProxyOptionsFa extends TranslationsPagesSettingsRoutingPerAppProxyOptionsEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsImportFa import = TranslationsPagesSettingsRoutingPerAppProxyOptionsImportFa._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsExportFa export = TranslationsPagesSettingsRoutingPerAppProxyOptionsExportFa._(_root);
	@override String get shareToAll => 'اشتراک‌گذاری با همه';
	@override String get clearAllSelections => 'پاک کردن تمام انتخاب‌ها';
}

// Path: pages.settings.routing.perAppProxy.modes
class TranslationsPagesSettingsRoutingPerAppProxyModesFa extends TranslationsPagesSettingsRoutingPerAppProxyModesEn {
	TranslationsPagesSettingsRoutingPerAppProxyModesFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get all => 'همه';
	@override String get proxy => 'پروکسی';
	@override String get bypass => 'دور زدن';
	@override String get allMsg => 'پروکسی کردن تمام برنامه‌ها';
	@override String get proxyMsg => 'فقط برنامه‌های انتخاب‌شده پروکسی شوند';
	@override String get bypassMsg => 'برنامه‌های انتخاب‌شده پروکسی نشوند';
}

// Path: pages.settings.routing.perAppProxy.autoSelection
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionFa extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'انتخاب خودکار';
	@override String get performNow => 'اکنون انجام بده';
	@override String get resetToDefault => 'بازنشانی به پیش‌فرض';
	@override String get autoUpdateInterval => 'فاصله زمانی به‌روزرسانی خودکار';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastFa toast = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastFa._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogFa dialog = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogFa._(_root);
}

// Path: pages.settings.routing.routeRule.options
class TranslationsPagesSettingsRoutingRouteRuleOptionsFa extends TranslationsPagesSettingsRoutingRouteRuleOptionsEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsImportFa import = TranslationsPagesSettingsRoutingRouteRuleOptionsImportFa._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsExportFa export = TranslationsPagesSettingsRoutingRouteRuleOptionsExportFa._(_root);
	@override String get reset => 'بازنشانی قوانین';
}

// Path: pages.settings.routing.routeRule.rule
class TranslationsPagesSettingsRoutingRouteRuleRuleFa extends TranslationsPagesSettingsRoutingRouteRuleRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleRuleFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'قانون';
	@override String get ruleChanged => 'قانون تغییر کرد';
	@override String get ruleChangedMsg => 'آیا می‌خواهید ویرایش‌های خود را ذخیره کنید؟';
	@override String get onlyTunMode => 'فقط در حالت TUN در دسترس است';
	@override String get notAvailabeInThisPlatform => 'در این پلتفرم در دسترس نیست';
	@override String get canNotBeEmpty => 'نمی‌تواند خالی باشد';
	@override String get validUrlEx => 'https://example.com';
	@override String get validUrl => '«URL» معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}';
	@override String get validProcessNameEx => 'Chrome.exe یا google chrome یا chrome';
	@override String get validProcessName => '«نام فرآیند» معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}';
	@override String get validProcessPathEx => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome';
	@override String get validProcessPath => '«مسیر فرآیند» معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}';
	@override String get validPortRangeEx => '80 یا 1-65000';
	@override String get validPortRange => '«پورت» یا «محدوده پورت» معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}';
	@override String get validIpCidrEx => '8.8.8.8 یا 10.0.0.0/24';
	@override String get validIpCidr => 'IP CIDR معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}';
	@override String get validDomainEx => 'Google.com یا dl.google.com';
	@override String get validDomain => '«دامنه» معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}';
	@override String get validDomainSuffixEx => '.com یا .ir';
	@override String get validDomainSuffix => '«پسوند دامنه» معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}';
	@override Map<String, String> get tileTitle => {
		'name': 'نام',
		'outbound': 'خروجی در صورت تطابق',
		'rule_set': 'URL مجموعه قوانین',
		'package_name': 'نام‌های بسته',
		'process_name': 'نام‌های فرآیند',
		'process_path': 'مسیرهای فرآیند',
		'network': 'شبکه‌ها',
		'port_range': 'پورت‌های مقصد',
		'source_port_range': 'پورت‌های مبدأ',
		'protocol': 'پروتکل',
		'ip_cidr': 'IP CIDR مقصد',
		'source_ip_cidr': 'IP CIDR مبدأ',
		'domain': 'دامنه',
		'domain_suffixe': 'پسوند دامنه',
		'domain_keyword': 'کلمه کلیدی دامنه',
		'domain_regex': 'عبارت منظم دامنه',
	};
	@override Map<String, String> get outbound => {
		'proxy': 'پروکسی',
		'direct': 'مستقیم',
		'direct_with_fragment': 'مستقیم با فرگمنت',
		'block': 'مسدود',
	};
	@override Map<String, String> get network => {
		'all': 'همه',
		'tcp': 'TCP',
		'udp': 'UDP',
	};
	@override Map<String, String> get protocol => {
		'': 'همه',
		'tls': 'TLS',
		'http': 'HTTP',
		'quic': 'QUIC',
		'stun': 'STUN',
		'dns': 'DNS',
		'bittorrent': 'BitTorrent',
	};
}

// Path: pages.settings.routing.routeRule.genericList
class TranslationsPagesSettingsRoutingRouteRuleGenericListFa extends TranslationsPagesSettingsRoutingRouteRuleGenericListEn {
	TranslationsPagesSettingsRoutingRouteRuleGenericListFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get addNew => 'افزودن مقدار جدید';
	@override String get update => 'به‌روزرسانی مقدار';
	@override String get clearList => 'پاک کردن لیست';
	@override String get clearListMsg => 'تمام موارد حذف شدند';
}

// Path: pages.settings.routing.routeRule.androidApps
class TranslationsPagesSettingsRoutingRouteRuleAndroidAppsFa extends TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn {
	TranslationsPagesSettingsRoutingRouteRuleAndroidAppsFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => 'برنامه‌های اندروید';
	@override String get showSystemApps => 'نمایش برنامه‌های سیستمی';
	@override String get hideSystemApps => 'پنهان کردن برنامه‌های سیستمی';
	@override String get clearSelection => 'پاک کردن انتخاب‌ها';
	@override String get uninstalled => 'نصب نشده';
}

// Path: pages.settings.routing.perAppProxy.options.import
class TranslationsPagesSettingsRoutingPerAppProxyOptionsImportFa extends TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsImportFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'وارد کردن انتخاب‌ها از کلیپ‌بورد';
	@override String get file => 'وارد کردن انتخاب‌ها از فایل';
	@override String get msg => 'وارد کردن، انتخاب‌های فعلی شما را جایگزین خواهد کرد. آیا مطمئن هستید که می‌خواهید ادامه دهید؟';
}

// Path: pages.settings.routing.perAppProxy.options.export
class TranslationsPagesSettingsRoutingPerAppProxyOptionsExportFa extends TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsExportFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'کپی انتخاب‌ها به کلیپ‌بورد';
	@override String get file => 'خروجی انتخاب‌ها به فایل';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.toast
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastFa extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get success => 'انتخاب خودکار برنامه‌ها با موفقیت انجام شد';
	@override String get failure => 'انتخاب خودکار ناموفق بود';
	@override String regionNotFound({required Object region}) => 'انتخاب خودکار برای منطقه «${region}» یافت نشد';
	@override String get alreadyInAuto => 'انتخاب‌های شما از قبل در لیست خودکار موجود است';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.dialog
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogFa extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get title => 'انتخاب خودکار برنامه‌ها';
	@override String msg({required Object region}) => 'قابلیت انتخاب خودکار برای پروکسی هر برنامه به دلیل تغییر منطقه به «${region}» غیرفعال شد';
}

// Path: pages.settings.routing.routeRule.options.import
class TranslationsPagesSettingsRoutingRouteRuleOptionsImportFa extends TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsImportFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'وارد کردن قوانین از کلیپ‌بورد';
	@override String get file => 'وارد کردن قوانین از فایل';
}

// Path: pages.settings.routing.routeRule.options.export
class TranslationsPagesSettingsRoutingRouteRuleOptionsExportFa extends TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsExportFa._(TranslationsFa root) : this._root = root, super.internal(root);

	final TranslationsFa _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'کپی قوانین در کلیپ‌بورد';
	@override String get file => 'ذخیره قوانین در فایل';
}

/// The flat map containing all translations for locale <fa>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appTitle' => 'هیدیفای',
			'common.start' => 'شروع',
			'common.version' => 'نسخه',
			'common.ok' => 'باشه',
			'common.cancel' => 'لغو',
			'common.kContinue' => 'ادامه',
			'common.showMore' => 'نمایش بیشتر',
			'common.showLess' => 'نمایش کمتر',
			'common.filter' => 'فیلتر',
			'common.all' => 'همه',
			'common.pause' => 'مکث',
			'common.resume' => 'ادامه',
			'common.clear' => 'پاک‌سازی',
			'common.close' => 'بستن',
			'common.auto' => 'خودکار',
			'common.manually' => 'دستی',
			'common.name' => 'نام',
			'common.url' => 'URL',
			'common.add' => 'افزودن',
			'common.clipboard' => 'کلیپ‌بورد',
			'common.addToClipboard' => 'افزودن به کلیپ‌بورد',
			'common.scanQr' => 'اسکن QR',
			'common.free' => 'رایگان',
			'common.warp' => 'WARP',
			'common.fragment' => 'Fragment',
			'common.help' => 'راهنما',
			'common.save' => 'ذخیره',
			'common.update' => 'به‌روزرسانی',
			'common.share' => 'اشتراک‌گذاری',
			'common.edit' => 'ویرایش',
			'common.delete' => 'حذف',
			'common.discard' => 'صرف‌نظر',
			'common.import' => 'وارد کردن',
			'common.export' => 'خروجی گرفتن',
			'common.later' => 'بعداً',
			'common.ignore' => 'نادیده گرفتن',
			'common.quit' => 'خروج',
			'common.notSet' => 'تنظیم نشده',
			'common.hide' => 'پنهان کردن',
			'common.exit' => 'خروج',
			'common.reset' => 'بازنشانی',
			'common.done' => 'انجام شد',
			'common.search' => 'جستجو',
			'common.decline' => 'رد کردن',
			'common.agree' => 'موافقم',
			'common.empty' => 'خالی',
			'common.unknown' => 'ناشناخته',
			'common.hidden' => 'پنهان',
			'common.timeout' => 'عدم پاسخ',
			'common.sort' => 'مرتب‌سازی',
			'common.dashboard' => 'داشبورد',
			'common.interval.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fa'))(n, zero: '', one: '${n} روز', other: '${n} روز', ), 
			'common.interval.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fa'))(n, zero: '', one: '${n} ساعت', other: '${n} ساعت', ), 
			'common.msg.permission.denied' => 'دسترسی رد شد',
			'common.msg.export.clipboard.success' => 'با موفقیت در کلیپ‌بورد کپی شد',
			'common.msg.export.clipboard.failure' => 'کپی در کلیپ‌بورد ناموفق بود',
			'common.msg.export.clipboard.contentTooLarge' => 'محتوا بیش از حد بزرگ است. به جای آن از خروجی فایل استفاده کنید',
			'common.msg.export.file.success' => 'فایل JSON با موفقیت ایجاد شد',
			'common.msg.export.file.failure' => 'ایجاد فایل ناموفق بود',
			'common.msg.import.confirm' => 'تأیید ورود اطلاعات',
			'common.msg.import.success' => 'با موفقیت وارد شد',
			'common.msg.import.failure' => 'وارد کردن ناموفق بود',
			'intro.banner' => 'هرآنچه برای اینترنت بدون محدودیت نیاز دارید',
			'intro.termsAndPolicyCaution' => ({required InlineSpanBuilder tap}) => TextSpan(children: [ const TextSpan(text: 'با ادامه، شما با '), tap(_root.pages.about.termsAndConditions), const TextSpan(text: ' موافقت می‌کنید'), ]), 
			'intro.info' => ({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [ const TextSpan(text: 'ساخته شده با ❤️ توسط هیدیفای - '), tap_source('متن‌باز'), const TextSpan(text: ' ('), tap_license('مجوز'), const TextSpan(text: ')'), ]), 
			'pages.home.title' => 'خانه',
			'pages.home.quickSettings' => 'تنظیمات سریع',
			'pages.proxies.title' => 'پروکسی‌ها',
			'pages.proxies.sort' => 'مرتب‌سازی پروکسی‌ها',
			'pages.proxies.testDelay' => 'تست تأخیر',
			'pages.proxies.empty' => 'هیچ پروکسی موجود نیست',
			'pages.proxies.activeProxy' => 'پروکسی فعال',
			'pages.proxies.unknownIp' => 'IP ناشناخته',
			'pages.proxies.sortOptions.unsorted' => 'پیش‌فرض',
			'pages.proxies.sortOptions.name' => 'بر اساس نام',
			'pages.proxies.sortOptions.delay' => 'بر اساس تأخیر',
			'pages.proxies.ipInfo.address' => 'آدرس IP',
			'pages.proxies.ipInfo.country' => 'کشور',
			'pages.proxies.ipInfo.organization' => 'سازمان',
			'pages.proxies.delay.result' => ({required Object delay}) => 'تأخیر: ${delay} میلی‌ثانیه',
			'pages.proxies.delay.timeout' => 'تست تأخیر ناموفق بود',
			'pages.proxies.delay.testing' => 'تأخیر: در حال تست...',
			'pages.profiles.title' => 'پروفایل‌ها',
			'pages.profiles.add' => 'افزودن پروفایل',
			'pages.profiles.update' => 'به‌روزرسانی پروفایل',
			'pages.profiles.viewAllProfiles' => 'مشاهده همه پروفایل‌ها',
			'pages.profiles.activeProfileName' => ({required Object name}) => 'نام پروفایل فعال: «${name}»',
			'pages.profiles.nonActiveProfileName' => ({required Object name}) => 'انتخاب «${name}» به عنوان پروفایل فعال',
			'pages.profiles.freeSubNotFound' => 'اشتراک رایگان یافت نشد',
			'pages.profiles.freeSubNotFoundForRegion' => ({required Object region}) => 'اشتراک رایگان برای منطقه «${region}» یافت نشد',
			'pages.profiles.failedToLoad' => 'بارگذاری ناموفق بود',
			'pages.profiles.updateSubscriptions' => 'به‌روزرسانی اشتراک‌ها',
			'pages.profiles.share.urlToClipboard' => 'URL به کلیپ‌بورد',
			'pages.profiles.share.showUrlQr' => 'نمایش QR کد URL',
			'pages.profiles.share.jsonToClipboard' => 'JSON به کلیپ‌بورد',
			'pages.profiles.msg.save.success' => 'پروفایل با موفقیت ذخیره شد',
			'pages.profiles.msg.invalidUrl' => 'URL نامعتبر است',
			'pages.profiles.msg.add.failure' => 'افزودن پروفایل ناموفق بود',
			'pages.profiles.msg.update.success' => 'پروفایل با موفقیت به‌روز شد',
			'pages.profiles.msg.update.successNamed' => ({required Object name}) => '«${name}» با موفقیت به‌روز شد',
			'pages.profiles.msg.update.failure' => 'به‌روزرسانی پروفایل ناموفق بود',
			'pages.profiles.msg.update.failureNamed' => ({required Object name}) => 'به‌روزرسانی «${name}» ناموفق بود',
			'pages.profiles.msg.delete.success' => 'پروفایل با موفقیت حذف شد',
			'pages.profileDetails.title' => 'پروفایل',
			'pages.profileDetails.lastUpdate' => 'آخرین به‌روزرسانی',
			'pages.profileDetails.form.nameHint' => 'نام پروفایل',
			'pages.profileDetails.form.emptyName' => 'نام الزامی است',
			'pages.profileDetails.form.invalidUrl' => 'URL نامعتبر است',
			'pages.profileDetails.form.urlHint' => 'URL کامل کانفیگ',
			'pages.profileDetails.form.disableAutoUpdate' => 'غیرفعال کردن به‌روزرسانی خودکار',
			'pages.profileDetails.form.autoUpdateInterval' => 'فاصله زمانی به‌روزرسانی خودکار',
			'pages.profileDetails.form.loading' => 'در حال افزودن پروفایل...',
			'pages.logs.title' => 'گزارش‌ها',
			'pages.logs.shareCoreLogs' => 'اشتراک‌گذاری گزارش‌های هسته',
			'pages.logs.shareAppLogs' => 'اشتراک‌گذاری گزارش‌های برنامه',
			'pages.about.title' => 'درباره',
			'pages.about.notAvailableMsg' => 'شما در حال استفاده از آخرین نسخه هستید',
			'pages.about.checkForUpdate' => 'بررسی برای به‌روزرسانی',
			'pages.about.openWorkingDir' => 'باز کردن پوشه کاری',
			'pages.about.sourceCode' => 'کد منبع',
			'pages.about.telegramChannel' => 'کانال تلگرام',
			'pages.about.termsAndConditions' => 'شرایط و ضوابط',
			'pages.about.privacyPolicy' => 'سیاست حفظ حریم خصوصی',
			'pages.settings.title' => 'تنظیمات',
			'pages.settings.resetTunnel' => 'بازنشانی پروفایل VPN',
			'pages.settings.options.import.clipboard' => 'وارد کردن تنظیمات از کلیپ‌بورد',
			'pages.settings.options.import.file' => 'وارد کردن تنظیمات از فایل',
			'pages.settings.options.export.anonymousToClipboard' => 'کپی تنظیمات ناشناس به کلیپ‌بورد',
			'pages.settings.options.export.anonymousToFile' => 'خروجی تنظیمات ناشناس به فایل',
			'pages.settings.options.export.allToClipboard' => 'کپی تمام تنظیمات به کلیپ‌بورد',
			'pages.settings.options.export.allToFile' => 'خروجی تمام تنظیمات به فایل',
			'pages.settings.options.reset' => 'بازنشانی تنظیمات',
			'pages.settings.general.title' => 'عمومی',
			'pages.settings.general.locale' => 'زبان',
			'pages.settings.general.themeMode' => 'حالت پوسته',
			'pages.settings.general.themeModes.system' => 'پیش‌فرض سیستم',
			'pages.settings.general.themeModes.dark' => 'حالت تیره',
			'pages.settings.general.themeModes.light' => 'حالت روشن',
			'pages.settings.general.themeModes.black' => 'حالت مشکی',
			'pages.settings.general.enableAnalytics' => 'فعال‌سازی آمار',
			'pages.settings.general.enableAnalyticsMsg' => 'اجازه جمع‌آوری آمار و ارسال گزارش‌های خطا برای بهبود برنامه',
			'pages.settings.general.autoIpCheck' => 'بررسی خودکار IP اتصال',
			'pages.settings.general.dynamicNotification' => 'نمایش سرعت در اعلان',
			'pages.settings.general.hapticFeedback' => 'بازخورد لرزشی',
			'pages.settings.general.actionAtClosing' => 'اقدام هنگام بستن',
			'pages.settings.general.autoStart' => 'شروع هنگام ورود به سیستم',
			'pages.settings.general.silentStart' => 'شروع در حالت کمینه',
			'pages.settings.general.ignoreBatteryOptimizations' => 'غیرفعال کردن بهینه‌سازی باتری',
			'pages.settings.general.ignoreBatteryOptimizationsMsg' => 'حذف محدودیت‌ها برای عملکرد بهینه VPN',
			'pages.settings.general.memoryLimit' => 'محدودیت حافظه',
			'pages.settings.general.memoryLimitMsg' => 'در صورت مواجهه با خطای کمبود حافظه یا بسته‌شدن‌های مکرر برنامه، این گزینه را فعال کنید',
			'pages.settings.general.debugMode' => 'حالت اشکال‌زدایی',
			'pages.settings.general.debugModeMsg' => 'برای اعمال این تغییر، برنامه را مجدداً راه‌اندازی کنید',
			'pages.settings.general.logLevel' => 'سطح گزارش‌گیری',
			'pages.settings.general.connectionTestUrl' => 'URL تست اتصال',
			'pages.settings.general.urlTestInterval' => 'فاصله زمانی تست URL',
			'pages.settings.general.clashApiPort' => 'پورت Clash API',
			'pages.settings.general.useXrayCoreWhenPossible' => 'استفاده از xray-core در صورت امکان',
			'pages.settings.general.useXrayCoreWhenPossibleMsg' => 'هنگام پردازش لینک‌های اشتراک از xray-core استفاده شود. برای فعال‌سازی این گزینه باید لینک اشتراک را مجدداً وارد کنید.',
			'pages.settings.routing.title' => 'مسیریابی',
			'pages.settings.routing.perAppProxy.title' => 'پروکسی برای هر برنامه',
			'pages.settings.routing.perAppProxy.hideSysApps' => 'پنهان کردن برنامه‌های سیستمی',
			'pages.settings.routing.perAppProxy.options.import.clipboard' => 'وارد کردن انتخاب‌ها از کلیپ‌بورد',
			'pages.settings.routing.perAppProxy.options.import.file' => 'وارد کردن انتخاب‌ها از فایل',
			'pages.settings.routing.perAppProxy.options.import.msg' => 'وارد کردن، انتخاب‌های فعلی شما را جایگزین خواهد کرد. آیا مطمئن هستید که می‌خواهید ادامه دهید؟',
			'pages.settings.routing.perAppProxy.options.export.clipboard' => 'کپی انتخاب‌ها به کلیپ‌بورد',
			'pages.settings.routing.perAppProxy.options.export.file' => 'خروجی انتخاب‌ها به فایل',
			'pages.settings.routing.perAppProxy.options.shareToAll' => 'اشتراک‌گذاری با همه',
			'pages.settings.routing.perAppProxy.options.clearAllSelections' => 'پاک کردن تمام انتخاب‌ها',
			'pages.settings.routing.perAppProxy.modes.all' => 'همه',
			'pages.settings.routing.perAppProxy.modes.proxy' => 'پروکسی',
			'pages.settings.routing.perAppProxy.modes.bypass' => 'دور زدن',
			'pages.settings.routing.perAppProxy.modes.allMsg' => 'پروکسی کردن تمام برنامه‌ها',
			'pages.settings.routing.perAppProxy.modes.proxyMsg' => 'فقط برنامه‌های انتخاب‌شده پروکسی شوند',
			'pages.settings.routing.perAppProxy.modes.bypassMsg' => 'برنامه‌های انتخاب‌شده پروکسی نشوند',
			'pages.settings.routing.perAppProxy.autoSelection.title' => 'انتخاب خودکار',
			'pages.settings.routing.perAppProxy.autoSelection.performNow' => 'اکنون انجام بده',
			'pages.settings.routing.perAppProxy.autoSelection.resetToDefault' => 'بازنشانی به پیش‌فرض',
			'pages.settings.routing.perAppProxy.autoSelection.autoUpdateInterval' => 'فاصله زمانی به‌روزرسانی خودکار',
			'pages.settings.routing.perAppProxy.autoSelection.toast.success' => 'انتخاب خودکار برنامه‌ها با موفقیت انجام شد',
			'pages.settings.routing.perAppProxy.autoSelection.toast.failure' => 'انتخاب خودکار ناموفق بود',
			'pages.settings.routing.perAppProxy.autoSelection.toast.regionNotFound' => ({required Object region}) => 'انتخاب خودکار برای منطقه «${region}» یافت نشد',
			'pages.settings.routing.perAppProxy.autoSelection.toast.alreadyInAuto' => 'انتخاب‌های شما از قبل در لیست خودکار موجود است',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.title' => 'انتخاب خودکار برنامه‌ها',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.msg' => ({required Object region}) => 'قابلیت انتخاب خودکار برای پروکسی هر برنامه به دلیل تغییر منطقه به «${region}» غیرفعال شد',
			'pages.settings.routing.region' => 'منطقه',
			'pages.settings.routing.regions.ir' => 'ایران (ir)',
			'pages.settings.routing.regions.cn' => 'چین (cn)',
			'pages.settings.routing.regions.ru' => 'روسیه (ru)',
			'pages.settings.routing.regions.af' => 'افغانستان (af)',
			'pages.settings.routing.regions.id' => 'اندونزی (id)',
			'pages.settings.routing.regions.tr' => 'ترکیه (tr)',
			'pages.settings.routing.regions.br' => 'برزیل (br)',
			'pages.settings.routing.regions.other' => 'سایر',
			'pages.settings.routing.balancerStrategy.title' => 'استراتژی Balancer',
			'pages.settings.routing.balancerStrategy.roundRobin' => 'Round robin',
			'pages.settings.routing.balancerStrategy.consistentHash' => 'Consistent hash',
			'pages.settings.routing.balancerStrategy.stickySession' => 'Sticky session',
			'pages.settings.routing.blockAds' => 'مسدودسازی تبلیغات',
			'pages.settings.routing.bypassLan' => 'دور زدن LAN',
			'pages.settings.routing.resolveDestination' => 'تحلیل آدرس مقصد',
			'pages.settings.routing.ipv6Route' => 'مسیریابی IPv6',
			'pages.settings.routing.ipv6Modes.disable' => 'غیرفعال',
			'pages.settings.routing.ipv6Modes.enable' => 'فعال',
			'pages.settings.routing.ipv6Modes.prefer' => 'ترجیحی',
			'pages.settings.routing.ipv6Modes.only' => 'انحصاری',
			'pages.settings.routing.routeRule.title' => 'قوانین مسیریابی',
			'pages.settings.routing.routeRule.options.import.clipboard' => 'وارد کردن قوانین از کلیپ‌بورد',
			'pages.settings.routing.routeRule.options.import.file' => 'وارد کردن قوانین از فایل',
			'pages.settings.routing.routeRule.options.export.clipboard' => 'کپی قوانین در کلیپ‌بورد',
			'pages.settings.routing.routeRule.options.export.file' => 'ذخیره قوانین در فایل',
			'pages.settings.routing.routeRule.options.reset' => 'بازنشانی قوانین',
			'pages.settings.routing.routeRule.deleteRule' => 'حذف قانون',
			'pages.settings.routing.routeRule.createRule' => 'ایجاد قانون جدید',
			'pages.settings.routing.routeRule.rule.title' => 'قانون',
			'pages.settings.routing.routeRule.rule.ruleChanged' => 'قانون تغییر کرد',
			'pages.settings.routing.routeRule.rule.ruleChangedMsg' => 'آیا می‌خواهید ویرایش‌های خود را ذخیره کنید؟',
			'pages.settings.routing.routeRule.rule.onlyTunMode' => 'فقط در حالت TUN در دسترس است',
			'pages.settings.routing.routeRule.rule.notAvailabeInThisPlatform' => 'در این پلتفرم در دسترس نیست',
			'pages.settings.routing.routeRule.rule.canNotBeEmpty' => 'نمی‌تواند خالی باشد',
			'pages.settings.routing.routeRule.rule.validUrlEx' => 'https://example.com',
			'pages.settings.routing.routeRule.rule.validUrl' => '«URL» معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}',
			'pages.settings.routing.routeRule.rule.validProcessNameEx' => 'Chrome.exe یا google chrome یا chrome',
			'pages.settings.routing.routeRule.rule.validProcessName' => '«نام فرآیند» معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}',
			'pages.settings.routing.routeRule.rule.validProcessPathEx' => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome',
			'pages.settings.routing.routeRule.rule.validProcessPath' => '«مسیر فرآیند» معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}',
			'pages.settings.routing.routeRule.rule.validPortRangeEx' => '80 یا 1-65000',
			'pages.settings.routing.routeRule.rule.validPortRange' => '«پورت» یا «محدوده پورت» معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}',
			'pages.settings.routing.routeRule.rule.validIpCidrEx' => '8.8.8.8 یا 10.0.0.0/24',
			'pages.settings.routing.routeRule.rule.validIpCidr' => 'IP CIDR معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}',
			'pages.settings.routing.routeRule.rule.validDomainEx' => 'Google.com یا dl.google.com',
			'pages.settings.routing.routeRule.rule.validDomain' => '«دامنه» معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}',
			'pages.settings.routing.routeRule.rule.validDomainSuffixEx' => '.com یا .ir',
			'pages.settings.routing.routeRule.rule.validDomainSuffix' => '«پسوند دامنه» معتبر مانند\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}',
			'pages.settings.routing.routeRule.rule.tileTitle.name' => 'نام',
			'pages.settings.routing.routeRule.rule.tileTitle.outbound' => 'خروجی در صورت تطابق',
			'pages.settings.routing.routeRule.rule.tileTitle.rule_set' => 'URL مجموعه قوانین',
			'pages.settings.routing.routeRule.rule.tileTitle.package_name' => 'نام‌های بسته',
			'pages.settings.routing.routeRule.rule.tileTitle.process_name' => 'نام‌های فرآیند',
			'pages.settings.routing.routeRule.rule.tileTitle.process_path' => 'مسیرهای فرآیند',
			'pages.settings.routing.routeRule.rule.tileTitle.network' => 'شبکه‌ها',
			'pages.settings.routing.routeRule.rule.tileTitle.port_range' => 'پورت‌های مقصد',
			'pages.settings.routing.routeRule.rule.tileTitle.source_port_range' => 'پورت‌های مبدأ',
			'pages.settings.routing.routeRule.rule.tileTitle.protocol' => 'پروتکل',
			'pages.settings.routing.routeRule.rule.tileTitle.ip_cidr' => 'IP CIDR مقصد',
			'pages.settings.routing.routeRule.rule.tileTitle.source_ip_cidr' => 'IP CIDR مبدأ',
			'pages.settings.routing.routeRule.rule.tileTitle.domain' => 'دامنه',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_suffixe' => 'پسوند دامنه',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_keyword' => 'کلمه کلیدی دامنه',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_regex' => 'عبارت منظم دامنه',
			'pages.settings.routing.routeRule.rule.outbound.proxy' => 'پروکسی',
			'pages.settings.routing.routeRule.rule.outbound.direct' => 'مستقیم',
			'pages.settings.routing.routeRule.rule.outbound.direct_with_fragment' => 'مستقیم با فرگمنت',
			'pages.settings.routing.routeRule.rule.outbound.block' => 'مسدود',
			'pages.settings.routing.routeRule.rule.network.all' => 'همه',
			'pages.settings.routing.routeRule.rule.network.tcp' => 'TCP',
			'pages.settings.routing.routeRule.rule.network.udp' => 'UDP',
			'pages.settings.routing.routeRule.rule.protocol.' => 'همه',
			'pages.settings.routing.routeRule.rule.protocol.tls' => 'TLS',
			'pages.settings.routing.routeRule.rule.protocol.http' => 'HTTP',
			'pages.settings.routing.routeRule.rule.protocol.quic' => 'QUIC',
			'pages.settings.routing.routeRule.rule.protocol.stun' => 'STUN',
			'pages.settings.routing.routeRule.rule.protocol.dns' => 'DNS',
			'pages.settings.routing.routeRule.rule.protocol.bittorrent' => 'BitTorrent',
			'pages.settings.routing.routeRule.genericList.addNew' => 'افزودن مقدار جدید',
			'pages.settings.routing.routeRule.genericList.update' => 'به‌روزرسانی مقدار',
			'pages.settings.routing.routeRule.genericList.clearList' => 'پاک کردن لیست',
			'pages.settings.routing.routeRule.genericList.clearListMsg' => 'تمام موارد حذف شدند',
			'pages.settings.routing.routeRule.androidApps.pageTitle' => 'برنامه‌های اندروید',
			'pages.settings.routing.routeRule.androidApps.showSystemApps' => 'نمایش برنامه‌های سیستمی',
			'pages.settings.routing.routeRule.androidApps.hideSystemApps' => 'پنهان کردن برنامه‌های سیستمی',
			'pages.settings.routing.routeRule.androidApps.clearSelection' => 'پاک کردن انتخاب‌ها',
			'pages.settings.routing.routeRule.androidApps.uninstalled' => 'نصب نشده',
			'pages.settings.dns.title' => 'DNS',
			'pages.settings.dns.remoteDns' => 'DNS اصلی (ریموت)',
			'pages.settings.dns.remoteDnsDomainStrategy' => 'استراتژی دامنه DNS',
			'pages.settings.dns.directDns' => 'DNS پروکسی‌ها (مستقیم)',
			'pages.settings.dns.directDnsDomainStrategy' => 'استراتژی دامنه DNS مستقیم',
			'pages.settings.dns.enableDnsRouting' => 'فعال‌سازی مسیریابی DNS',
			'pages.settings.dns.enableFakeDns' => 'فعال‌سازی DNS جعلی',
			'pages.settings.dns.domainStrategy.auto' => 'خودکار',
			'pages.settings.dns.domainStrategy.preferIpv6' => 'ترجیح IPv6',
			'pages.settings.dns.domainStrategy.preferIpv4' => 'ترجیح IPv4',
			'pages.settings.dns.domainStrategy.ipv4Only' => 'فقط IPv4',
			'pages.settings.dns.domainStrategy.ipv6Only' => 'فقط IPv6',
			'pages.settings.inbound.title' => 'ورودی',
			'pages.settings.inbound.serviceMode' => 'حالت سرویس',
			'pages.settings.inbound.serviceModes.proxy' => 'فقط سرویس پروکسی',
			'pages.settings.inbound.serviceModes.systemProxy' => 'تنظیم پروکسی سیستم',
			'pages.settings.inbound.serviceModes.tun' => 'VPN',
			'pages.settings.inbound.serviceModes.tunService' => 'سرویس VPN',
			'pages.settings.inbound.shortServiceModes.proxy' => 'پروکسی',
			'pages.settings.inbound.shortServiceModes.systemProxy' => 'پروکسی سیستم',
			'pages.settings.inbound.shortServiceModes.tun' => 'VPN',
			'pages.settings.inbound.shortServiceModes.tunService' => 'سرویس VPN',
			'pages.settings.inbound.strictRoute' => 'مسیربندی سخت‌گیرانه',
			'pages.settings.inbound.tunImplementation' => 'پیاده‌سازی Tun',
			'pages.settings.inbound.tunImplementations.mixed' => 'ترکیبی',
			'pages.settings.inbound.tunImplementations.system' => 'سیستم',
			'pages.settings.inbound.tunImplementations.gvisor' => 'gVisor',
			'pages.settings.inbound.mixedPort' => 'پورت ترکیبی',
			'pages.settings.inbound.tproxyPort' => 'پورت پروکسی شفاف',
			'pages.settings.inbound.directPort' => 'پورت مستقیم',
			'pages.settings.inbound.redirectPort' => 'پورت تغییر مسیر',
			'pages.settings.inbound.allowConnectionFromLan' => 'اشتراک VPN در شبکه محلی',
			'pages.settings.tlsTricks.title' => 'ترفندهای TLS',
			'pages.settings.tlsTricks.enable' => 'فعال‌سازی fragment',
			'pages.settings.tlsTricks.packets' => 'بسته‌های Fragment',
			'pages.settings.tlsTricks.packetsTlsHello' => 'TLS Hello',
			'pages.settings.tlsTricks.packets1_1' => '1-1',
			'pages.settings.tlsTricks.packets1_2' => '1-2',
			'pages.settings.tlsTricks.packets1_3' => '1-3',
			'pages.settings.tlsTricks.packets1_4' => '1-4',
			'pages.settings.tlsTricks.packets1_5' => '1-5',
			'pages.settings.tlsTricks.size' => 'اندازه fragment',
			'pages.settings.tlsTricks.sleep' => 'تأخیر fragment',
			'pages.settings.tlsTricks.mixedSniCase.enable' => 'فعال‌سازی mixed SNI case',
			'pages.settings.tlsTricks.padding.enable' => 'فعال‌سازی padding',
			'pages.settings.tlsTricks.padding.size' => 'اندازه padding',
			'pages.settings.warp.title' => 'WARP',
			'pages.settings.warp.enable' => 'فعال‌سازی WARP',
			'pages.settings.warp.generateConfig' => 'ایجاد کانفیگ WARP',
			'pages.settings.warp.configGenerated' => 'کانفیگ Warp ایجاد شد',
			'pages.settings.warp.missingConfig' => 'کانفیگ WARP موجود نیست',
			'pages.settings.warp.detourMode' => 'حالت مسیریابی WARP',
			'pages.settings.warp.detourModes.proxyOverWarp' => 'عبور پروکسی‌ها از طریق WARP',
			'pages.settings.warp.detourModes.warpOverProxy' => 'عبور WARP از طریق پروکسی‌ها',
			'pages.settings.warp.detourModes.proxyOverWarpExplain' => 'رفع انسداد پروکسی‌ها با WARP',
			'pages.settings.warp.detourModes.warpOverProxyExplain' => 'امنیت بیشتر با WARP',
			'pages.settings.warp.licenseKey' => 'کلید لایسنس',
			'pages.settings.warp.cleanIp' => 'IP تمیز',
			'pages.settings.warp.port' => 'پورت',
			'pages.settings.warp.noise.count' => 'تعداد نویز',
			'pages.settings.warp.noise.mode' => 'حالت نویز',
			'pages.settings.warp.noise.size' => 'اندازه نویز',
			'pages.settings.warp.noise.delay' => 'تأخیر نویز',
			'components.stats.connection' => 'اتصال',
			'components.stats.traffic' => 'ترافیک',
			'components.stats.trafficLive' => 'ترافیک لحظه‌ای',
			'components.stats.trafficTotal' => 'ترافیک کل',
			'components.stats.uplink' => 'ارسال',
			'components.stats.downlink' => 'دریافت',
			'components.stats.speed' => 'سرعت',
			'components.stats.totalTransferred' => 'کل منتقل شده',
			'components.subscriptionInfo.upload' => 'آپلود',
			'components.subscriptionInfo.download' => 'دانلود',
			'components.subscriptionInfo.total' => 'کل ترافیک',
			'components.subscriptionInfo.expireDate' => 'تاریخ انقضا',
			'components.subscriptionInfo.expired' => 'منقضی شده',
			'components.subscriptionInfo.noTraffic' => 'حجم تمام شده',
			'components.subscriptionInfo.remainingTime' => 'زمان باقی‌مانده',
			'components.subscriptionInfo.remainingDuration' => ({required Object duration}) => '${duration} روز باقی‌مانده',
			'components.subscriptionInfo.remainingDurationNew' => ({required Object duration}) => '${duration} روز',
			'components.subscriptionInfo.remainingTrafficSemanticLabel' => ({required Object consumed, required Object total}) => '${consumed} از ${total} ترافیک مصرف شده',
			'components.subscriptionInfo.remainingTraffic' => 'ترافیک باقی‌مانده',
			'components.subscriptionInfo.remainingUsage' => 'باقی‌مانده',
			'components.subscriptionInfo.profileSite' => 'سرویس‌دهنده',
			'components.subscriptionInfo.profileSupport' => 'پشتیبانی',
			'dialogs.sortProfiles.title' => 'مرتب‌سازی بر اساس',
			'dialogs.sortProfiles.sort.name' => 'بر اساس نام',
			'dialogs.sortProfiles.sort.lastUpdate' => 'آخرین به‌روزرسانی',
			'dialogs.warpLicense.title' => 'رضایت‌نامه Cloudflare WARP',
			'dialogs.warpLicense.description' => ({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [ const TextSpan(text: 'Cloudflare WARP یک ارائه‌دهنده رایگان WireGuard VPN است. با فعال کردن این گزینه، شما با '), tos('شرایط خدمات'), const TextSpan(text: ' و '), privacy('سیاست حفظ حریم خصوصی'), const TextSpan(text: ' Cloudflare WARP موافقت می‌کنید.'), ]), 
			'dialogs.newVersion.title' => 'به‌روزرسانی موجود است',
			'dialogs.newVersion.msg' => 'نسخه جدیدی از ${_root.common.appTitle} در دسترس است. آیا مایل به به‌روزرسانی هستید؟',
			'dialogs.newVersion.currentVersion' => 'نسخه فعلی: ',
			'dialogs.newVersion.newVersion' => 'نسخه جدید: ',
			'dialogs.newVersion.updateNow' => 'اکنون به‌روزرسانی کن',
			'dialogs.confirmation.settings.import.msg' => 'این عمل تمام تنظیمات فعلی شما را بازنویسی خواهد کرد. آیا مطمئن هستید؟',
			'dialogs.confirmation.profile.delete.title' => 'حذف پروفایل',
			'dialogs.confirmation.profile.delete.msg' => 'آیا از حذف دائمی این پروفایل مطمئن هستید؟',
			'dialogs.confirmation.perAppProxy.shareOnGithub.title' => 'بهبود انتخاب خودکار',
			'dialogs.confirmation.perAppProxy.shareOnGithub.msg' => 'با اشتراک‌گذاری برنامه‌های انتخاب‌شده، به تکمیل لیست «انتخاب خودکار» کمک می‌کنید',
			'dialogs.confirmation.perAppProxy.import.msg' => 'این عمل تمام انتخاب‌های فعلی شما برای پروکسی برنامه‌ها را جایگزین خواهد کرد. آیا مطمئن هستید؟',
			'dialogs.confirmation.routeRule.delete.title' => 'حذف قانون',
			'dialogs.confirmation.routeRule.delete.msg' => ({required Object rulename}) => 'آیا از حذف قانون «${rulename}» مطمئن هستید؟',
			'dialogs.experimentalNotice.title' => 'ویژگی‌های آزمایشی در حال استفاده',
			'dialogs.experimentalNotice.msg' => 'شما برخی ویژگی‌های آزمایشی را فعال کرده‌اید که ممکن است بر کیفیت اتصال تأثیر گذاشته و باعث خطاهای غیرمنتظره شوند. همیشه می‌توانید این گزینه‌ها را از صفحه تنظیمات تغییر داده یا بازنشانی کنید.',
			'dialogs.experimentalNotice.disable' => 'دیگر نمایش نده',
			'dialogs.noActiveProfile.title' => 'یک پروفایل انتخاب کنید',
			'dialogs.noActiveProfile.msg' => 'بیایید با افزودن یک پروفایل اتصال که شامل جزئیات اتصال VPN شماست، شروع کنیم.\n\nهنوز سرور VPN ندارید؟ نگران نباشید، با دنبال کردن راهنمای زیر می‌توانید به سرعت و رایگان یکی برای خودتان بسازید.',
			'dialogs.noActiveProfile.helpBtn.label' => 'راهنمایی کن',
			'dialogs.noActiveProfile.helpBtn.url' => 'https://github.com/shulaiyun/Sloth-VPN.git',
			'dialogs.unknownDomainsWarning.title' => 'هشدار لینک خارجی',
			'dialogs.unknownDomainsWarning.youAreAboutToVisit' => 'شما در حال بازدید از این آدرس هستید:',
			'dialogs.unknownDomainsWarning.thisWebsiteIsNotInOurTrustedList' => 'این وب‌سایت در لیست مورد اعتماد ما نیست. لطفاً با احتیاط ادامه دهید.',
			'dialogs.proxyInfo.fullTag' => 'تگ کامل:',
			'dialogs.proxyInfo.type' => 'نوع:',
			'dialogs.proxyInfo.testTime' => 'زمان تست:',
			'dialogs.proxyInfo.testDelay' => 'تأخیر تست:',
			'dialogs.proxyInfo.isSelected' => 'انتخاب شده:',
			'dialogs.proxyInfo.isGroup' => 'گروه است',
			'dialogs.proxyInfo.isSecure' => 'امن است:',
			'dialogs.proxyInfo.port' => 'پورت:',
			'dialogs.proxyInfo.host' => 'میزبان:',
			'dialogs.proxyInfo.ip' => 'IP:',
			'dialogs.proxyInfo.countryCode' => 'کد کشور:',
			'dialogs.proxyInfo.region' => 'منطقه:',
			'dialogs.proxyInfo.city' => 'شهر:',
			'dialogs.proxyInfo.asn' => 'ASN:',
			'dialogs.proxyInfo.organization' => 'سازمان:',
			'dialogs.proxyInfo.location' => 'مکان:',
			'dialogs.proxyInfo.postalCode' => 'کد پستی:',
			'dialogs.windowClosing.askEachTime' => 'هر بار بپرس',
			'dialogs.windowClosing.alertMessage' => 'پنهان کردن یا خروج از برنامه؟',
			'dialogs.windowClosing.remember' => 'انتخابم را به خاطر بسپار',
			'connection.tapToConnect' => 'برای اتصال ضربه بزنید',
			'connection.connect' => 'اتصال',
			'connection.connecting' => 'در حال اتصال...',
			'connection.connected' => 'متصل شد',
			'connection.disconnect' => 'قطع اتصال',
			'connection.disconnecting' => 'در حال قطع اتصال...',
			'connection.reconnect' => 'اتصال مجدد',
			'connection.reconnectMsg' => 'در حال اتصال مجدد برای اعمال تغییرات...',
			'connection.secure' => 'ایمن شده با WARP',
			'errors.unexpected' => 'خطای غیرمنتظره',
			'errors.connection.unexpected' => 'خطای غیرمنتظره در اتصال',
			'errors.connection.timeout' => 'اتصال با وقفه زمانی مواجه شد',
			'errors.connection.badResponse' => 'پاسخ نامعتبر',
			'errors.connection.connectionError' => 'خطای اتصال',
			'errors.connection.badCertificate' => 'گواهی‌نامه نامعتبر',
			'errors.profiles.unexpected' => 'خطای غیرمنتظره',
			'errors.profiles.notFound' => 'پروفایل یافت نشد',
			'errors.profiles.invalidConfig' => 'کانفیگ‌های نامعتبر',
			'errors.profiles.invalidUrl' => 'URL نامعتبر',
			'errors.profiles.canceledByUser' => 'توسط کاربر لغو شد',
			'errors.connectivity.unexpected' => 'شکست غیرمنتظره',
			'errors.connectivity.missingVpnPermission' => 'مجوز VPN وجود ندارد',
			'errors.connectivity.missingNotificationPermission' => 'مجوز اعلان وجود ندارد',
			'errors.connectivity.core' => 'خطای هسته',
			'errors.singbox.serviceNotRunning' => 'سرویس در حال اجرا نیست',
			'errors.singbox.missingPrivilege' => 'دسترسی وجود ندارد',
			'errors.singbox.missingPrivilegeMsg' => 'حالت VPN به دسترسی ادمین نیاز دارد. یا برنامه را به عنوان ادمین مجدداً راه‌اندازی کنید یا حالت سرویس را تغییر دهید.',
			'errors.singbox.invalidConfigOptions' => 'گزینه‌های پیکربندی نامعتبر',
			'errors.singbox.invalidConfig' => 'پیکربندی نامعتبر',
			'errors.warp.missingLicense' => 'لایسنس Warp',
			'errors.warp.missingLicenseMsg' => 'پروفایل انتخاب‌شده از ویژگی WARP استفاده می‌کند؛ برای استفاده از این قابلیت، باید با لایسنس WARP موافقت شود.',
			_ => null,
		};
	}
}

