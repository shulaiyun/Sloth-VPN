///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsIntroEn intro = TranslationsIntroEn.internal(_root);
	late final TranslationsPagesEn pages = TranslationsPagesEn.internal(_root);
	late final TranslationsComponentsEn components = TranslationsComponentsEn.internal(_root);
	late final TranslationsDialogsEn dialogs = TranslationsDialogsEn.internal(_root);
	late final TranslationsConnectionEn connection = TranslationsConnectionEn.internal(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn.internal(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '树懒VPN'
	String get appTitle => '树懒VPN';

	/// en: 'Start'
	String get start => 'Start';

	/// en: 'Version'
	String get version => 'Version';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Continue'
	String get kContinue => 'Continue';

	/// en: 'Show more'
	String get showMore => 'Show more';

	/// en: 'Show less'
	String get showLess => 'Show less';

	/// en: 'Filter'
	String get filter => 'Filter';

	/// en: 'All'
	String get all => 'All';

	/// en: 'Pause'
	String get pause => 'Pause';

	/// en: 'Resume'
	String get resume => 'Resume';

	/// en: 'Clear'
	String get clear => 'Clear';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Auto'
	String get auto => 'Auto';

	/// en: 'Manually'
	String get manually => 'Manually';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'URL'
	String get url => 'URL';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Clipboard'
	String get clipboard => 'Clipboard';

	/// en: 'Add to clipboard'
	String get addToClipboard => 'Add to clipboard';

	/// en: 'Scan QR'
	String get scanQr => 'Scan QR';

	/// en: 'Free'
	String get free => 'Free';

	/// en: 'WARP'
	String get warp => 'WARP';

	/// en: 'Fragment'
	String get fragment => 'Fragment';

	/// en: 'Help'
	String get help => 'Help';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Update'
	String get update => 'Update';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Discard'
	String get discard => 'Discard';

	/// en: 'Import'
	String get import => 'Import';

	/// en: 'Export'
	String get export => 'Export';

	/// en: 'Later'
	String get later => 'Later';

	/// en: 'Ignore'
	String get ignore => 'Ignore';

	/// en: 'Quit'
	String get quit => 'Quit';

	/// en: 'Not set'
	String get notSet => 'Not set';

	/// en: 'Hide'
	String get hide => 'Hide';

	/// en: 'Exit'
	String get exit => 'Exit';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Decline'
	String get decline => 'Decline';

	/// en: 'Agree'
	String get agree => 'Agree';

	/// en: 'Empty'
	String get empty => 'Empty';

	/// en: 'Unknown'
	String get unknown => 'Unknown';

	/// en: 'Hidden'
	String get hidden => 'Hidden';

	/// en: 'Timeout'
	String get timeout => 'Timeout';

	/// en: 'Sort'
	String get sort => 'Sort';

	/// en: 'Dashboard'
	String get dashboard => 'Dashboard';

	late final TranslationsCommonIntervalEn interval = TranslationsCommonIntervalEn.internal(_root);
	late final TranslationsCommonMsgEn msg = TranslationsCommonMsgEn.internal(_root);
}

// Path: intro
class TranslationsIntroEn {
	TranslationsIntroEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All you need for an unrestricted internet'
	String get banner => 'All you need for an unrestricted internet';

	/// en: 'By continuing you agree to ${tap(Terms and conditions)}'
	TextSpan termsAndPolicyCaution({required InlineSpanBuilder tap}) => TextSpan(children: [
		const TextSpan(text: 'By continuing you agree to '),
		tap(_root.pages.about.termsAndConditions),
	]);

	/// en: 'Crafted for secure freedom by 树懒VPN - ${tap_source(Source Code)} (${tap_license(License)})'
	TextSpan info({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [
		const TextSpan(text: 'Crafted for secure freedom by 树懒VPN - '),
		tap_source('Source Code'),
		const TextSpan(text: ' ('),
		tap_license('License'),
		const TextSpan(text: ')'),
	]);
}

// Path: pages
class TranslationsPagesEn {
	TranslationsPagesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPagesHomeEn home = TranslationsPagesHomeEn.internal(_root);
	late final TranslationsPagesProxiesEn proxies = TranslationsPagesProxiesEn.internal(_root);
	late final TranslationsPagesProfilesEn profiles = TranslationsPagesProfilesEn.internal(_root);
	late final TranslationsPagesProfileDetailsEn profileDetails = TranslationsPagesProfileDetailsEn.internal(_root);
	late final TranslationsPagesLogsEn logs = TranslationsPagesLogsEn.internal(_root);
	late final TranslationsPagesAboutEn about = TranslationsPagesAboutEn.internal(_root);
	late final TranslationsPagesSettingsEn settings = TranslationsPagesSettingsEn.internal(_root);
}

// Path: components
class TranslationsComponentsEn {
	TranslationsComponentsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsComponentsStatsEn stats = TranslationsComponentsStatsEn.internal(_root);
	late final TranslationsComponentsSubscriptionInfoEn subscriptionInfo = TranslationsComponentsSubscriptionInfoEn.internal(_root);
}

// Path: dialogs
class TranslationsDialogsEn {
	TranslationsDialogsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsDialogsSortProfilesEn sortProfiles = TranslationsDialogsSortProfilesEn.internal(_root);
	late final TranslationsDialogsWarpLicenseEn warpLicense = TranslationsDialogsWarpLicenseEn.internal(_root);
	late final TranslationsDialogsNewVersionEn newVersion = TranslationsDialogsNewVersionEn.internal(_root);
	late final TranslationsDialogsConfirmationEn confirmation = TranslationsDialogsConfirmationEn.internal(_root);
	late final TranslationsDialogsExperimentalNoticeEn experimentalNotice = TranslationsDialogsExperimentalNoticeEn.internal(_root);
	late final TranslationsDialogsNoActiveProfileEn noActiveProfile = TranslationsDialogsNoActiveProfileEn.internal(_root);
	late final TranslationsDialogsUnknownDomainsWarningEn unknownDomainsWarning = TranslationsDialogsUnknownDomainsWarningEn.internal(_root);
	late final TranslationsDialogsProxyInfoEn proxyInfo = TranslationsDialogsProxyInfoEn.internal(_root);
	late final TranslationsDialogsWindowClosingEn windowClosing = TranslationsDialogsWindowClosingEn.internal(_root);
}

// Path: connection
class TranslationsConnectionEn {
	TranslationsConnectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tap to connect'
	String get tapToConnect => 'Tap to connect';

	/// en: 'Connect'
	String get connect => 'Connect';

	/// en: 'Connecting...'
	String get connecting => 'Connecting...';

	/// en: 'Connected'
	String get connected => 'Connected';

	/// en: 'Disconnect'
	String get disconnect => 'Disconnect';

	/// en: 'Disconnecting...'
	String get disconnecting => 'Disconnecting...';

	/// en: 'Reconnect'
	String get reconnect => 'Reconnect';

	/// en: 'Reconnecting for taking into account the changes...'
	String get reconnectMsg => 'Reconnecting for taking into account the changes...';

	/// en: 'Secured by WARP'
	String get secure => 'Secured by WARP';
}

// Path: errors
class TranslationsErrorsEn {
	TranslationsErrorsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unexpected error'
	String get unexpected => 'Unexpected error';

	late final TranslationsErrorsConnectionEn connection = TranslationsErrorsConnectionEn.internal(_root);
	late final TranslationsErrorsProfilesEn profiles = TranslationsErrorsProfilesEn.internal(_root);
	late final TranslationsErrorsConnectivityEn connectivity = TranslationsErrorsConnectivityEn.internal(_root);
	late final TranslationsErrorsSingboxEn singbox = TranslationsErrorsSingboxEn.internal(_root);
	late final TranslationsErrorsWarpEn warp = TranslationsErrorsWarpEn.internal(_root);
}

// Path: common.interval
class TranslationsCommonIntervalEn {
	TranslationsCommonIntervalEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '(zero) {} (one) {$n day} (other) {$n days}'
	String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: '',
		one: '${n} day',
		other: '${n} days',
	);

	/// en: '(zero) {} (one) {$n hour} (other) {$n hours}'
	String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: '',
		one: '${n} hour',
		other: '${n} hours',
	);
}

// Path: common.msg
class TranslationsCommonMsgEn {
	TranslationsCommonMsgEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsCommonMsgPermissionEn permission = TranslationsCommonMsgPermissionEn.internal(_root);
	late final TranslationsCommonMsgExportEn export = TranslationsCommonMsgExportEn.internal(_root);
	late final TranslationsCommonMsgImportEn import = TranslationsCommonMsgImportEn.internal(_root);
}

// Path: pages.home
class TranslationsPagesHomeEn {
	TranslationsPagesHomeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get title => 'Home';

	/// en: 'Quick settings'
	String get quickSettings => 'Quick settings';
}

// Path: pages.proxies
class TranslationsPagesProxiesEn {
	TranslationsPagesProxiesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Proxies'
	String get title => 'Proxies';

	/// en: 'Sort proxies'
	String get sort => 'Sort proxies';

	/// en: 'Test delay'
	String get testDelay => 'Test delay';

	/// en: 'No proxies available'
	String get empty => 'No proxies available';

	/// en: 'Active proxy'
	String get activeProxy => 'Active proxy';

	/// en: 'Unknown IP'
	String get unknownIp => 'Unknown IP';

	late final TranslationsPagesProxiesSortOptionsEn sortOptions = TranslationsPagesProxiesSortOptionsEn.internal(_root);
	late final TranslationsPagesProxiesIpInfoEn ipInfo = TranslationsPagesProxiesIpInfoEn.internal(_root);
	late final TranslationsPagesProxiesDelayEn delay = TranslationsPagesProxiesDelayEn.internal(_root);
}

// Path: pages.profiles
class TranslationsPagesProfilesEn {
	TranslationsPagesProfilesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profiles'
	String get title => 'Profiles';

	/// en: 'Add profile'
	String get add => 'Add profile';

	/// en: 'Update profile'
	String get update => 'Update profile';

	/// en: 'View all profiles'
	String get viewAllProfiles => 'View all profiles';

	/// en: 'Active profile name: "${name}".'
	String activeProfileName({required Object name}) => 'Active profile name: "${name}".';

	/// en: 'Select "${name}" as active profile'
	String nonActiveProfileName({required Object name}) => 'Select "${name}" as active profile';

	/// en: 'No free subscription was found'
	String get freeSubNotFound => 'No free subscription was found';

	/// en: 'No free subscription was found for "${region}" region.'
	String freeSubNotFoundForRegion({required Object region}) => 'No free subscription was found for "${region}" region.';

	/// en: 'Failed to load'
	String get failedToLoad => 'Failed to load';

	/// en: 'Update subscriptions'
	String get updateSubscriptions => 'Update subscriptions';

	late final TranslationsPagesProfilesShareEn share = TranslationsPagesProfilesShareEn.internal(_root);
	late final TranslationsPagesProfilesMsgEn msg = TranslationsPagesProfilesMsgEn.internal(_root);
}

// Path: pages.profileDetails
class TranslationsPagesProfileDetailsEn {
	TranslationsPagesProfileDetailsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile'
	String get title => 'Profile';

	/// en: 'Last update'
	String get lastUpdate => 'Last update';

	late final TranslationsPagesProfileDetailsFormEn form = TranslationsPagesProfileDetailsFormEn.internal(_root);
}

// Path: pages.logs
class TranslationsPagesLogsEn {
	TranslationsPagesLogsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Logs'
	String get title => 'Logs';

	/// en: 'Share core logs'
	String get shareCoreLogs => 'Share core logs';

	/// en: 'Share app logs'
	String get shareAppLogs => 'Share app logs';
}

// Path: pages.about
class TranslationsPagesAboutEn {
	TranslationsPagesAboutEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About'
	String get title => 'About';

	/// en: 'Already using the latest version'
	String get notAvailableMsg => 'Already using the latest version';

	/// en: 'Check for update'
	String get checkForUpdate => 'Check for update';

	/// en: 'Open working directory'
	String get openWorkingDir => 'Open working directory';

	/// en: 'Source code'
	String get sourceCode => 'Source code';

	/// en: 'Telegram channel'
	String get telegramChannel => 'Telegram channel';

	/// en: 'Terms and conditions'
	String get termsAndConditions => 'Terms and conditions';

	/// en: 'Privacy policy'
	String get privacyPolicy => 'Privacy policy';
}

// Path: pages.settings
class TranslationsPagesSettingsEn {
	TranslationsPagesSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	/// en: 'Reset VPN profile'
	String get resetTunnel => 'Reset VPN profile';

	/// en: 'Rebuild local tunnel status'
	String get resetTunnelSubtitle => 'Rebuild local tunnel status';

	/// en: 'Secure tuning center'
	String get heroSubtitle => 'Secure tuning center';

	/// en: 'Tap to open'
	String get sectionOpenHint => 'Tap to open';

	late final TranslationsPagesSettingsOptionsEn options = TranslationsPagesSettingsOptionsEn.internal(_root);
	late final TranslationsPagesSettingsGeneralEn general = TranslationsPagesSettingsGeneralEn.internal(_root);
	late final TranslationsPagesSettingsRoutingEn routing = TranslationsPagesSettingsRoutingEn.internal(_root);
	late final TranslationsPagesSettingsDnsEn dns = TranslationsPagesSettingsDnsEn.internal(_root);
	late final TranslationsPagesSettingsInboundEn inbound = TranslationsPagesSettingsInboundEn.internal(_root);
	late final TranslationsPagesSettingsTlsTricksEn tlsTricks = TranslationsPagesSettingsTlsTricksEn.internal(_root);
	late final TranslationsPagesSettingsWarpEn warp = TranslationsPagesSettingsWarpEn.internal(_root);
}

// Path: components.stats
class TranslationsComponentsStatsEn {
	TranslationsComponentsStatsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Connection'
	String get connection => 'Connection';

	/// en: 'Traffic'
	String get traffic => 'Traffic';

	/// en: 'Live traffic'
	String get trafficLive => 'Live traffic';

	/// en: 'Total traffic'
	String get trafficTotal => 'Total traffic';

	/// en: 'Uplink'
	String get uplink => 'Uplink';

	/// en: 'Downlink'
	String get downlink => 'Downlink';

	/// en: 'Speed'
	String get speed => 'Speed';

	/// en: 'Total transferred'
	String get totalTransferred => 'Total transferred';
}

// Path: components.subscriptionInfo
class TranslationsComponentsSubscriptionInfoEn {
	TranslationsComponentsSubscriptionInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Upload'
	String get upload => 'Upload';

	/// en: 'Download'
	String get download => 'Download';

	/// en: 'Total traffic'
	String get total => 'Total traffic';

	/// en: 'Expire date'
	String get expireDate => 'Expire date';

	/// en: 'Expired'
	String get expired => 'Expired';

	/// en: 'Out of quota'
	String get noTraffic => 'Out of quota';

	/// en: 'Remaining time'
	String get remainingTime => 'Remaining time';

	/// en: '${duration} days remaining'
	String remainingDuration({required Object duration}) => '${duration} days remaining';

	/// en: '${duration} days'
	String remainingDurationNew({required Object duration}) => '${duration} days';

	/// en: '${consumed} of ${total} traffic consumed'
	String remainingTrafficSemanticLabel({required Object consumed, required Object total}) => '${consumed} of ${total} traffic consumed';

	/// en: 'Remaining traffic'
	String get remainingTraffic => 'Remaining traffic';

	/// en: 'Remaining'
	String get remainingUsage => 'Remaining';

	/// en: 'Provider'
	String get profileSite => 'Provider';

	/// en: 'Support'
	String get profileSupport => 'Support';
}

// Path: dialogs.sortProfiles
class TranslationsDialogsSortProfilesEn {
	TranslationsDialogsSortProfilesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sort by'
	String get title => 'Sort by';

	late final TranslationsDialogsSortProfilesSortEn sort = TranslationsDialogsSortProfilesSortEn.internal(_root);
}

// Path: dialogs.warpLicense
class TranslationsDialogsWarpLicenseEn {
	TranslationsDialogsWarpLicenseEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cloudflare WARP consent'
	String get title => 'Cloudflare WARP consent';

	/// en: 'Cloudflare WARP is a free WireGuard VPN provider. By enabling this option you are agreeing to the Cloudflare WARP's ${tos(Terms of service)} and ${privacy(Privacy policy)}.'
	TextSpan description({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [
		const TextSpan(text: 'Cloudflare WARP is a free WireGuard VPN provider. By enabling this option you are agreeing to the Cloudflare WARP\'s '),
		tos('Terms of service'),
		const TextSpan(text: ' and '),
		privacy('Privacy policy'),
		const TextSpan(text: '.'),
	]);
}

// Path: dialogs.newVersion
class TranslationsDialogsNewVersionEn {
	TranslationsDialogsNewVersionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Update available'
	String get title => 'Update available';

	/// en: 'A new version of 树懒VPN is available. Would you like to update now?'
	String get msg => 'A new version of ${_root.common.appTitle} is available. Would you like to update now?';

	/// en: 'Current version: '
	String get currentVersion => 'Current version: ';

	/// en: 'New version: '
	String get newVersion => 'New version: ';

	/// en: 'Update now'
	String get updateNow => 'Update now';
}

// Path: dialogs.confirmation
class TranslationsDialogsConfirmationEn {
	TranslationsDialogsConfirmationEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsDialogsConfirmationSettingsEn settings = TranslationsDialogsConfirmationSettingsEn.internal(_root);
	late final TranslationsDialogsConfirmationProfileEn profile = TranslationsDialogsConfirmationProfileEn.internal(_root);
	late final TranslationsDialogsConfirmationPerAppProxyEn perAppProxy = TranslationsDialogsConfirmationPerAppProxyEn.internal(_root);
	late final TranslationsDialogsConfirmationRouteRuleEn routeRule = TranslationsDialogsConfirmationRouteRuleEn.internal(_root);
}

// Path: dialogs.experimentalNotice
class TranslationsDialogsExperimentalNoticeEn {
	TranslationsDialogsExperimentalNoticeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Experimental features in use'
	String get title => 'Experimental features in use';

	/// en: 'You've enabled some experimental features which might affect connection quality and cause unexpected errors. You can always change or reset these options from config options page.'
	String get msg => 'You\'ve enabled some experimental features which might affect connection quality and cause unexpected errors. You can always change or reset these options from config options page.';

	/// en: 'Don't show again'
	String get disable => 'Don\'t show again';
}

// Path: dialogs.noActiveProfile
class TranslationsDialogsNoActiveProfileEn {
	TranslationsDialogsNoActiveProfileEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose a profile'
	String get title => 'Choose a profile';

	/// en: 'Let's get started by adding a connection profile that includes your VPN connection details. Don鈥檛 have a VPN server yet? No worries鈥攋ust follow the tutorial below to set one up quickly and for free.'
	String get msg => 'Let\'s get started by adding a connection profile that includes your VPN connection details.\n\nDon鈥檛 have a VPN server yet? No worries鈥攋ust follow the tutorial below to set one up quickly and for free.';

	late final TranslationsDialogsNoActiveProfileHelpBtnEn helpBtn = TranslationsDialogsNoActiveProfileHelpBtnEn.internal(_root);
}

// Path: dialogs.unknownDomainsWarning
class TranslationsDialogsUnknownDomainsWarningEn {
	TranslationsDialogsUnknownDomainsWarningEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'External link warning'
	String get title => 'External link warning';

	/// en: 'You are about to visit :'
	String get youAreAboutToVisit => 'You are about to visit :';

	/// en: 'This website is not in our trusted list. Please proceed with caution.'
	String get thisWebsiteIsNotInOurTrustedList => 'This website is not in our trusted list. Please proceed with caution.';
}

// Path: dialogs.proxyInfo
class TranslationsDialogsProxyInfoEn {
	TranslationsDialogsProxyInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Full tag:'
	String get fullTag => 'Full tag:';

	/// en: 'Type:'
	String get type => 'Type:';

	/// en: 'Test time:'
	String get testTime => 'Test time:';

	/// en: 'Test delay:'
	String get testDelay => 'Test delay:';

	/// en: 'Is selected:'
	String get isSelected => 'Is selected:';

	/// en: 'Is group'
	String get isGroup => 'Is group';

	/// en: 'Is secure:'
	String get isSecure => 'Is secure:';

	/// en: 'Port:'
	String get port => 'Port:';

	/// en: 'Host:'
	String get host => 'Host:';

	/// en: 'IP:'
	String get ip => 'IP:';

	/// en: 'Country code:'
	String get countryCode => 'Country code:';

	/// en: 'Region:'
	String get region => 'Region:';

	/// en: 'City:'
	String get city => 'City:';

	/// en: 'ASN:'
	String get asn => 'ASN:';

	/// en: 'Organization:'
	String get organization => 'Organization:';

	/// en: 'Location:'
	String get location => 'Location:';

	/// en: 'Postal code:'
	String get postalCode => 'Postal code:';

	/// en: 'Download:'
	String get download => 'Download:';

	/// en: 'Upload:'
	String get upload => 'Upload:';
}

// Path: dialogs.windowClosing
class TranslationsDialogsWindowClosingEn {
	TranslationsDialogsWindowClosingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Ask each time'
	String get askEachTime => 'Ask each time';

	/// en: 'Hide or exit the application?'
	String get alertMessage => 'Hide or exit the application?';

	/// en: 'Remember my choice'
	String get remember => 'Remember my choice';
}

// Path: errors.connection
class TranslationsErrorsConnectionEn {
	TranslationsErrorsConnectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unexpected connection error'
	String get unexpected => 'Unexpected connection error';

	/// en: 'Connection timeout'
	String get timeout => 'Connection timeout';

	/// en: 'Bad response'
	String get badResponse => 'Bad response';

	/// en: 'Connection error'
	String get connectionError => 'Connection error';

	/// en: 'Bad certificate'
	String get badCertificate => 'Bad certificate';
}

// Path: errors.profiles
class TranslationsErrorsProfilesEn {
	TranslationsErrorsProfilesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unexpected error'
	String get unexpected => 'Unexpected error';

	/// en: 'Profile not found'
	String get notFound => 'Profile not found';

	/// en: 'Invalid configs'
	String get invalidConfig => 'Invalid configs';

	/// en: 'Invalid URL'
	String get invalidUrl => 'Invalid URL';

	/// en: 'Canceled by user'
	String get canceledByUser => 'Canceled by user';
}

// Path: errors.connectivity
class TranslationsErrorsConnectivityEn {
	TranslationsErrorsConnectivityEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unexpected failure'
	String get unexpected => 'Unexpected failure';

	/// en: 'Missing VPN permission'
	String get missingVpnPermission => 'Missing VPN permission';

	/// en: 'Missing notification permission'
	String get missingNotificationPermission => 'Missing notification permission';

	/// en: 'Core error'
	String get core => 'Core error';
}

// Path: errors.singbox
class TranslationsErrorsSingboxEn {
	TranslationsErrorsSingboxEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Service is not running'
	String get serviceNotRunning => 'Service is not running';

	/// en: 'Missing privilege'
	String get missingPrivilege => 'Missing privilege';

	/// en: 'VPN mode requires administrator privileges. Either relaunch the app as administrator or change service mode.'
	String get missingPrivilegeMsg => 'VPN mode requires administrator privileges. Either relaunch the app as administrator or change service mode.';

	/// en: 'Invalid configuration options'
	String get invalidConfigOptions => 'Invalid configuration options';

	/// en: 'Invalid configuration'
	String get invalidConfig => 'Invalid configuration';
}

// Path: errors.warp
class TranslationsErrorsWarpEn {
	TranslationsErrorsWarpEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Warp license'
	String get missingLicense => 'Warp license';

	/// en: 'The selected profile uses the WARP feature; to use this feature, the WARP license must be agreed to.'
	String get missingLicenseMsg => 'The selected profile uses the WARP feature; to use this feature, the WARP license must be agreed to.';
}

// Path: common.msg.permission
class TranslationsCommonMsgPermissionEn {
	TranslationsCommonMsgPermissionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Permission denied'
	String get denied => 'Permission denied';
}

// Path: common.msg.export
class TranslationsCommonMsgExportEn {
	TranslationsCommonMsgExportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsCommonMsgExportClipboardEn clipboard = TranslationsCommonMsgExportClipboardEn.internal(_root);
	late final TranslationsCommonMsgExportFileEn file = TranslationsCommonMsgExportFileEn.internal(_root);
}

// Path: common.msg.import
class TranslationsCommonMsgImportEn {
	TranslationsCommonMsgImportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Confirm import'
	String get confirm => 'Confirm import';

	/// en: 'Imported successfully'
	String get success => 'Imported successfully';

	/// en: 'Failed to import'
	String get failure => 'Failed to import';
}

// Path: pages.proxies.sortOptions
class TranslationsPagesProxiesSortOptionsEn {
	TranslationsPagesProxiesSortOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Default'
	String get unsorted => 'Default';

	/// en: 'Alphabetically'
	String get name => 'Alphabetically';

	/// en: 'By delay'
	String get delay => 'By delay';

	/// en: 'By usage'
	String get usage => 'By usage';
}

// Path: pages.proxies.ipInfo
class TranslationsPagesProxiesIpInfoEn {
	TranslationsPagesProxiesIpInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'IP address'
	String get address => 'IP address';

	/// en: 'Country'
	String get country => 'Country';

	/// en: 'Organization'
	String get organization => 'Organization';
}

// Path: pages.proxies.delay
class TranslationsPagesProxiesDelayEn {
	TranslationsPagesProxiesDelayEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delay: ${delay}ms'
	String result({required Object delay}) => 'Delay: ${delay}ms';

	/// en: 'Delay test timeout'
	String get timeout => 'Delay test timeout';

	/// en: 'Delay: testing...'
	String get testing => 'Delay: testing...';
}

// Path: pages.profiles.share
class TranslationsPagesProfilesShareEn {
	TranslationsPagesProfilesShareEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'URL to clipboard'
	String get urlToClipboard => 'URL to clipboard';

	/// en: 'Show URL QR'
	String get showUrlQr => 'Show URL QR';

	/// en: 'JSON to clipboard'
	String get jsonToClipboard => 'JSON to clipboard';
}

// Path: pages.profiles.msg
class TranslationsPagesProfilesMsgEn {
	TranslationsPagesProfilesMsgEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPagesProfilesMsgSaveEn save = TranslationsPagesProfilesMsgSaveEn.internal(_root);

	/// en: 'Invalid URL'
	String get invalidUrl => 'Invalid URL';

	late final TranslationsPagesProfilesMsgAddEn add = TranslationsPagesProfilesMsgAddEn.internal(_root);
	late final TranslationsPagesProfilesMsgUpdateEn update = TranslationsPagesProfilesMsgUpdateEn.internal(_root);
	late final TranslationsPagesProfilesMsgDeleteEn delete = TranslationsPagesProfilesMsgDeleteEn.internal(_root);
}

// Path: pages.profileDetails.form
class TranslationsPagesProfileDetailsFormEn {
	TranslationsPagesProfileDetailsFormEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile name'
	String get nameHint => 'Profile name';

	/// en: 'Name is required'
	String get emptyName => 'Name is required';

	/// en: 'Invalid URL'
	String get invalidUrl => 'Invalid URL';

	/// en: 'Full config URL'
	String get urlHint => 'Full config URL';

	/// en: 'Disable auto update'
	String get disableAutoUpdate => 'Disable auto update';

	/// en: 'Auto update interval'
	String get autoUpdateInterval => 'Auto update interval';

	/// en: 'Adding profile...'
	String get loading => 'Adding profile...';
}

// Path: pages.settings.options
class TranslationsPagesSettingsOptionsEn {
	TranslationsPagesSettingsOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPagesSettingsOptionsImportEn import = TranslationsPagesSettingsOptionsImportEn.internal(_root);
	late final TranslationsPagesSettingsOptionsExportEn export = TranslationsPagesSettingsOptionsExportEn.internal(_root);

	/// en: 'Reset options'
	String get reset => 'Reset options';
}

// Path: pages.settings.general
class TranslationsPagesSettingsGeneralEn {
	TranslationsPagesSettingsGeneralEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'General'
	String get title => 'General';

	/// en: 'Language'
	String get locale => 'Language';

	/// en: 'Theme mode'
	String get themeMode => 'Theme mode';

	late final TranslationsPagesSettingsGeneralThemeModesEn themeModes = TranslationsPagesSettingsGeneralThemeModesEn.internal(_root);

	/// en: 'Enable analytics'
	String get enableAnalytics => 'Enable analytics';

	/// en: 'Give permission to collect analytics and send crash reports to improve the app'
	String get enableAnalyticsMsg => 'Give permission to collect analytics and send crash reports to improve the app';

	/// en: 'Automatically check connection IP'
	String get autoIpCheck => 'Automatically check connection IP';

	/// en: 'Display speed in notification'
	String get dynamicNotification => 'Display speed in notification';

	/// en: 'Haptic feedback'
	String get hapticFeedback => 'Haptic feedback';

	/// en: 'Action at closing'
	String get actionAtClosing => 'Action at closing';

	/// en: 'Start at login'
	String get autoStart => 'Start at login';

	/// en: 'Start minimized'
	String get silentStart => 'Start minimized';

	/// en: 'Disable battery optimization'
	String get ignoreBatteryOptimizations => 'Disable battery optimization';

	/// en: 'Remove restrictions for optimal VPN performance'
	String get ignoreBatteryOptimizationsMsg => 'Remove restrictions for optimal VPN performance';

	/// en: 'Memory limit'
	String get memoryLimit => 'Memory limit';

	/// en: 'Enable if you're experiencing out of memory errors or frequent app crashes'
	String get memoryLimitMsg => 'Enable if you\'re experiencing out of memory errors or frequent app crashes';

	/// en: 'Debug mode'
	String get debugMode => 'Debug mode';

	/// en: 'Restart the app for applying this change'
	String get debugModeMsg => 'Restart the app for applying this change';

	/// en: 'Log level'
	String get logLevel => 'Log level';

	/// en: 'Connection test URL'
	String get connectionTestUrl => 'Connection test URL';

	/// en: 'URL test interval'
	String get urlTestInterval => 'URL test interval';

	/// en: 'Clash API port'
	String get clashApiPort => 'Clash API port';

	/// en: 'Use xray-core when possible'
	String get useXrayCoreWhenPossible => 'Use xray-core when possible';

	/// en: 'Use xray-core during parsing sub links. You need to reimport the sub link to enable this option.'
	String get useXrayCoreWhenPossibleMsg => 'Use xray-core during parsing sub links. You need to reimport the sub link to enable this option.';
}

// Path: pages.settings.routing
class TranslationsPagesSettingsRoutingEn {
	TranslationsPagesSettingsRoutingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Routing'
	String get title => 'Routing';

	late final TranslationsPagesSettingsRoutingPerAppProxyEn perAppProxy = TranslationsPagesSettingsRoutingPerAppProxyEn.internal(_root);

	/// en: 'Region'
	String get region => 'Region';

	late final TranslationsPagesSettingsRoutingRegionsEn regions = TranslationsPagesSettingsRoutingRegionsEn.internal(_root);
	late final TranslationsPagesSettingsRoutingBalancerStrategyEn balancerStrategy = TranslationsPagesSettingsRoutingBalancerStrategyEn.internal(_root);

	/// en: 'Block advertisements'
	String get blockAds => 'Block advertisements';

	/// en: 'Bypass LAN'
	String get bypassLan => 'Bypass LAN';

	/// en: 'Resolve destination'
	String get resolveDestination => 'Resolve destination';

	/// en: 'IPv6 route'
	String get ipv6Route => 'IPv6 route';

	late final TranslationsPagesSettingsRoutingIpv6ModesEn ipv6Modes = TranslationsPagesSettingsRoutingIpv6ModesEn.internal(_root);
	late final TranslationsPagesSettingsRoutingRouteRuleEn routeRule = TranslationsPagesSettingsRoutingRouteRuleEn.internal(_root);
}

// Path: pages.settings.dns
class TranslationsPagesSettingsDnsEn {
	TranslationsPagesSettingsDnsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'DNS'
	String get title => 'DNS';

	/// en: 'Remote DNS'
	String get remoteDns => 'Remote DNS';

	/// en: 'Remote DNS domain strategy'
	String get remoteDnsDomainStrategy => 'Remote DNS domain strategy';

	/// en: 'Outbound server resolver (direct)'
	String get directDns => 'Outbound server resolver (direct)';

	/// en: 'Outbound domain strategy'
	String get directDnsDomainStrategy => 'Outbound domain strategy';

	/// en: 'Enable DNS routing'
	String get enableDnsRouting => 'Enable DNS routing';

	/// en: 'Enable fake DNS'
	String get enableFakeDns => 'Enable fake DNS';

	late final TranslationsPagesSettingsDnsDomainStrategyEn domainStrategy = TranslationsPagesSettingsDnsDomainStrategyEn.internal(_root);
}

// Path: pages.settings.inbound
class TranslationsPagesSettingsInboundEn {
	TranslationsPagesSettingsInboundEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Inbound'
	String get title => 'Inbound';

	/// en: 'Service mode'
	String get serviceMode => 'Service mode';

	late final TranslationsPagesSettingsInboundServiceModesEn serviceModes = TranslationsPagesSettingsInboundServiceModesEn.internal(_root);
	late final TranslationsPagesSettingsInboundShortServiceModesEn shortServiceModes = TranslationsPagesSettingsInboundShortServiceModesEn.internal(_root);

	/// en: 'Strict route'
	String get strictRoute => 'Strict route';

	/// en: 'Tun implementation'
	String get tunImplementation => 'Tun implementation';

	late final TranslationsPagesSettingsInboundTunImplementationsEn tunImplementations = TranslationsPagesSettingsInboundTunImplementationsEn.internal(_root);

	/// en: 'Mixed port'
	String get mixedPort => 'Mixed port';

	/// en: 'Transparent proxy port'
	String get tproxyPort => 'Transparent proxy port';

	/// en: 'Direct port'
	String get directPort => 'Direct port';

	/// en: 'Redirect port'
	String get redirectPort => 'Redirect port';

	/// en: 'Share VPN in local network'
	String get allowConnectionFromLan => 'Share VPN in local network';
}

// Path: pages.settings.tlsTricks
class TranslationsPagesSettingsTlsTricksEn {
	TranslationsPagesSettingsTlsTricksEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'TLS tricks'
	String get title => 'TLS tricks';

	/// en: 'Enable fragment'
	String get enable => 'Enable fragment';

	/// en: 'Fragmentation Packets'
	String get packets => 'Fragmentation Packets';

	/// en: 'TLS Hello'
	String get packetsTlsHello => 'TLS Hello';

	/// en: '1-1'
	String get packets1_1 => '1-1';

	/// en: '1-2'
	String get packets1_2 => '1-2';

	/// en: '1-3'
	String get packets1_3 => '1-3';

	/// en: '1-4'
	String get packets1_4 => '1-4';

	/// en: '1-5'
	String get packets1_5 => '1-5';

	/// en: 'Fragment size'
	String get size => 'Fragment size';

	/// en: 'Fragment sleep'
	String get sleep => 'Fragment sleep';

	late final TranslationsPagesSettingsTlsTricksMixedSniCaseEn mixedSniCase = TranslationsPagesSettingsTlsTricksMixedSniCaseEn.internal(_root);
	late final TranslationsPagesSettingsTlsTricksPaddingEn padding = TranslationsPagesSettingsTlsTricksPaddingEn.internal(_root);
}

// Path: pages.settings.warp
class TranslationsPagesSettingsWarpEn {
	TranslationsPagesSettingsWarpEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'WARP'
	String get title => 'WARP';

	/// en: 'Enable WARP'
	String get enable => 'Enable WARP';

	/// en: 'Generate WARP config'
	String get generateConfig => 'Generate WARP config';

	/// en: 'Warp config is generated'
	String get configGenerated => 'Warp config is generated';

	/// en: 'Missing WARP config'
	String get missingConfig => 'Missing WARP config';

	/// en: 'Detour mode'
	String get detourMode => 'Detour mode';

	late final TranslationsPagesSettingsWarpDetourModesEn detourModes = TranslationsPagesSettingsWarpDetourModesEn.internal(_root);

	/// en: 'License key'
	String get licenseKey => 'License key';

	/// en: 'Clean IP'
	String get cleanIp => 'Clean IP';

	/// en: 'Port'
	String get port => 'Port';

	late final TranslationsPagesSettingsWarpNoiseEn noise = TranslationsPagesSettingsWarpNoiseEn.internal(_root);
}

// Path: dialogs.sortProfiles.sort
class TranslationsDialogsSortProfilesSortEn {
	TranslationsDialogsSortProfilesSortEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Alphabetically'
	String get name => 'Alphabetically';

	/// en: 'Recently updated'
	String get lastUpdate => 'Recently updated';
}

// Path: dialogs.confirmation.settings
class TranslationsDialogsConfirmationSettingsEn {
	TranslationsDialogsConfirmationSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsDialogsConfirmationSettingsImportEn import = TranslationsDialogsConfirmationSettingsImportEn.internal(_root);
}

// Path: dialogs.confirmation.profile
class TranslationsDialogsConfirmationProfileEn {
	TranslationsDialogsConfirmationProfileEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsDialogsConfirmationProfileDeleteEn delete = TranslationsDialogsConfirmationProfileDeleteEn.internal(_root);
}

// Path: dialogs.confirmation.perAppProxy
class TranslationsDialogsConfirmationPerAppProxyEn {
	TranslationsDialogsConfirmationPerAppProxyEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn shareOnGithub = TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn.internal(_root);
	late final TranslationsDialogsConfirmationPerAppProxyImportEn import = TranslationsDialogsConfirmationPerAppProxyImportEn.internal(_root);
}

// Path: dialogs.confirmation.routeRule
class TranslationsDialogsConfirmationRouteRuleEn {
	TranslationsDialogsConfirmationRouteRuleEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsDialogsConfirmationRouteRuleDeleteEn delete = TranslationsDialogsConfirmationRouteRuleDeleteEn.internal(_root);
}

// Path: dialogs.noActiveProfile.helpBtn
class TranslationsDialogsNoActiveProfileHelpBtnEn {
	TranslationsDialogsNoActiveProfileHelpBtnEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Show me how'
	String get label => 'Show me how';

	/// en: 'https://github.com/shulaiyun/Sloth-VPN.git'
	String get url => 'https://github.com/shulaiyun/Sloth-VPN.git';
}

// Path: common.msg.export.clipboard
class TranslationsCommonMsgExportClipboardEn {
	TranslationsCommonMsgExportClipboardEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Added to clipboard successfully'
	String get success => 'Added to clipboard successfully';

	/// en: 'Failed to copy to clipboard'
	String get failure => 'Failed to copy to clipboard';

	/// en: 'Content too large. Use export file instead'
	String get contentTooLarge => 'Content too large. Use export file instead';
}

// Path: common.msg.export.file
class TranslationsCommonMsgExportFileEn {
	TranslationsCommonMsgExportFileEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'JSON file created successfully'
	String get success => 'JSON file created successfully';

	/// en: 'Failed to create file'
	String get failure => 'Failed to create file';
}

// Path: pages.profiles.msg.save
class TranslationsPagesProfilesMsgSaveEn {
	TranslationsPagesProfilesMsgSaveEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile saved successfully'
	String get success => 'Profile saved successfully';
}

// Path: pages.profiles.msg.add
class TranslationsPagesProfilesMsgAddEn {
	TranslationsPagesProfilesMsgAddEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Failed to add profile'
	String get failure => 'Failed to add profile';
}

// Path: pages.profiles.msg.update
class TranslationsPagesProfilesMsgUpdateEn {
	TranslationsPagesProfilesMsgUpdateEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile updated successfully'
	String get success => 'Profile updated successfully';

	/// en: '"${name}" updated successfully'
	String successNamed({required Object name}) => '"${name}" updated successfully';

	/// en: 'Failed to update profile'
	String get failure => 'Failed to update profile';

	/// en: 'Failed to update "${name}"'
	String failureNamed({required Object name}) => 'Failed to update "${name}"';
}

// Path: pages.profiles.msg.delete
class TranslationsPagesProfilesMsgDeleteEn {
	TranslationsPagesProfilesMsgDeleteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile deleted successfully'
	String get success => 'Profile deleted successfully';
}

// Path: pages.settings.options.import
class TranslationsPagesSettingsOptionsImportEn {
	TranslationsPagesSettingsOptionsImportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Import options from clipboard'
	String get clipboard => 'Import options from clipboard';

	/// en: 'Import options from file'
	String get file => 'Import options from file';
}

// Path: pages.settings.options.export
class TranslationsPagesSettingsOptionsExportEn {
	TranslationsPagesSettingsOptionsExportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Copy anonymous options to clipboard'
	String get anonymousToClipboard => 'Copy anonymous options to clipboard';

	/// en: 'Export anonymous options to file'
	String get anonymousToFile => 'Export anonymous options to file';

	/// en: 'Copy all options to clipboard'
	String get allToClipboard => 'Copy all options to clipboard';

	/// en: 'Export all options to file'
	String get allToFile => 'Export all options to file';
}

// Path: pages.settings.general.themeModes
class TranslationsPagesSettingsGeneralThemeModesEn {
	TranslationsPagesSettingsGeneralThemeModesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'System default'
	String get system => 'System default';

	/// en: 'Dark mode'
	String get dark => 'Dark mode';

	/// en: 'Light mode'
	String get light => 'Light mode';

	/// en: 'Black mode'
	String get black => 'Black mode';
}

// Path: pages.settings.routing.perAppProxy
class TranslationsPagesSettingsRoutingPerAppProxyEn {
	TranslationsPagesSettingsRoutingPerAppProxyEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Per-app proxy'
	String get title => 'Per-app proxy';

	/// en: 'Hide system apps'
	String get hideSysApps => 'Hide system apps';

	late final TranslationsPagesSettingsRoutingPerAppProxyOptionsEn options = TranslationsPagesSettingsRoutingPerAppProxyOptionsEn.internal(_root);
	late final TranslationsPagesSettingsRoutingPerAppProxyModesEn modes = TranslationsPagesSettingsRoutingPerAppProxyModesEn.internal(_root);
	late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn autoSelection = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn.internal(_root);
}

// Path: pages.settings.routing.regions
class TranslationsPagesSettingsRoutingRegionsEn {
	TranslationsPagesSettingsRoutingRegionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Iran (ir)'
	String get ir => 'Iran (ir)';

	/// en: 'China (cn)'
	String get cn => 'China (cn)';

	/// en: 'Russia (ru)'
	String get ru => 'Russia (ru)';

	/// en: 'Afghanistan (af)'
	String get af => 'Afghanistan (af)';

	/// en: 'Indonesia (id)'
	String get id => 'Indonesia (id)';

	/// en: 'T眉rkiye (tr)'
	String get tr => 'T眉rkiye (tr)';

	/// en: 'Brazil (br)'
	String get br => 'Brazil (br)';

	/// en: 'Other'
	String get other => 'Other';
}

// Path: pages.settings.routing.balancerStrategy
class TranslationsPagesSettingsRoutingBalancerStrategyEn {
	TranslationsPagesSettingsRoutingBalancerStrategyEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Balancer strategy'
	String get title => 'Balancer strategy';

	/// en: 'Round robin'
	String get roundRobin => 'Round robin';

	/// en: 'Consistent hash'
	String get consistentHash => 'Consistent hash';

	/// en: 'Sticky session'
	String get stickySession => 'Sticky session';
}

// Path: pages.settings.routing.ipv6Modes
class TranslationsPagesSettingsRoutingIpv6ModesEn {
	TranslationsPagesSettingsRoutingIpv6ModesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Disable'
	String get disable => 'Disable';

	/// en: 'Enable'
	String get enable => 'Enable';

	/// en: 'Preferred'
	String get prefer => 'Preferred';

	/// en: 'Exclusive'
	String get only => 'Exclusive';
}

// Path: pages.settings.routing.routeRule
class TranslationsPagesSettingsRoutingRouteRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Route rules'
	String get title => 'Route rules';

	late final TranslationsPagesSettingsRoutingRouteRuleOptionsEn options = TranslationsPagesSettingsRoutingRouteRuleOptionsEn.internal(_root);

	/// en: 'Delete rule'
	String get deleteRule => 'Delete rule';

	/// en: 'Create new rule'
	String get createRule => 'Create new rule';

	late final TranslationsPagesSettingsRoutingRouteRuleRuleEn rule = TranslationsPagesSettingsRoutingRouteRuleRuleEn.internal(_root);
	late final TranslationsPagesSettingsRoutingRouteRuleGenericListEn genericList = TranslationsPagesSettingsRoutingRouteRuleGenericListEn.internal(_root);
	late final TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn androidApps = TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn.internal(_root);
}

// Path: pages.settings.dns.domainStrategy
class TranslationsPagesSettingsDnsDomainStrategyEn {
	TranslationsPagesSettingsDnsDomainStrategyEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Auto'
	String get auto => 'Auto';

	/// en: 'Prefer IPv6'
	String get preferIpv6 => 'Prefer IPv6';

	/// en: 'Prefer IPv4'
	String get preferIpv4 => 'Prefer IPv4';

	/// en: 'IPv4 only'
	String get ipv4Only => 'IPv4 only';

	/// en: 'IPv6 only'
	String get ipv6Only => 'IPv6 only';
}

// Path: pages.settings.inbound.serviceModes
class TranslationsPagesSettingsInboundServiceModesEn {
	TranslationsPagesSettingsInboundServiceModesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Proxy service only'
	String get proxy => 'Proxy service only';

	/// en: 'Set system proxy'
	String get systemProxy => 'Set system proxy';

	/// en: 'VPN'
	String get tun => 'VPN';

	/// en: 'VPN service'
	String get tunService => 'VPN service';
}

// Path: pages.settings.inbound.shortServiceModes
class TranslationsPagesSettingsInboundShortServiceModesEn {
	TranslationsPagesSettingsInboundShortServiceModesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Proxy'
	String get proxy => 'Proxy';

	/// en: 'System proxy'
	String get systemProxy => 'System proxy';

	/// en: 'VPN'
	String get tun => 'VPN';

	/// en: 'VPN service'
	String get tunService => 'VPN service';
}

// Path: pages.settings.inbound.tunImplementations
class TranslationsPagesSettingsInboundTunImplementationsEn {
	TranslationsPagesSettingsInboundTunImplementationsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Mixed'
	String get mixed => 'Mixed';

	/// en: 'System'
	String get system => 'System';

	/// en: 'gVisor'
	String get gvisor => 'gVisor';
}

// Path: pages.settings.tlsTricks.mixedSniCase
class TranslationsPagesSettingsTlsTricksMixedSniCaseEn {
	TranslationsPagesSettingsTlsTricksMixedSniCaseEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Enable mixed SNI case'
	String get enable => 'Enable mixed SNI case';
}

// Path: pages.settings.tlsTricks.padding
class TranslationsPagesSettingsTlsTricksPaddingEn {
	TranslationsPagesSettingsTlsTricksPaddingEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Enable padding'
	String get enable => 'Enable padding';

	/// en: 'Padding size'
	String get size => 'Padding size';
}

// Path: pages.settings.warp.detourModes
class TranslationsPagesSettingsWarpDetourModesEn {
	TranslationsPagesSettingsWarpDetourModesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Detour proxies through WARP '
	String get proxyOverWarp => 'Detour proxies through WARP ';

	/// en: 'Detour WARP through proxies'
	String get warpOverProxy => 'Detour WARP through proxies';

	/// en: 'Unblock proxies by WARP'
	String get proxyOverWarpExplain => 'Unblock proxies by WARP';

	/// en: 'Extra security by WARP'
	String get warpOverProxyExplain => 'Extra security by WARP';
}

// Path: pages.settings.warp.noise
class TranslationsPagesSettingsWarpNoiseEn {
	TranslationsPagesSettingsWarpNoiseEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Noise count'
	String get count => 'Noise count';

	/// en: 'Noise mode'
	String get mode => 'Noise mode';

	/// en: 'Noise size'
	String get size => 'Noise size';

	/// en: 'Noise delay'
	String get delay => 'Noise delay';
}

// Path: dialogs.confirmation.settings.import
class TranslationsDialogsConfirmationSettingsImportEn {
	TranslationsDialogsConfirmationSettingsImportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'This will rewrite all config options with provided values. Are you sure?'
	String get msg => 'This will rewrite all config options with provided values. Are you sure?';
}

// Path: dialogs.confirmation.profile.delete
class TranslationsDialogsConfirmationProfileDeleteEn {
	TranslationsDialogsConfirmationProfileDeleteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete profile'
	String get title => 'Delete profile';

	/// en: 'Are you sure you want to permanently delete this profile?'
	String get msg => 'Are you sure you want to permanently delete this profile?';
}

// Path: dialogs.confirmation.perAppProxy.shareOnGithub
class TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn {
	TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Improving auto selection'
	String get title => 'Improving auto selection';

	/// en: 'By sharing selected apps, you help complete the "auto selection" list'
	String get msg => 'By sharing selected apps, you help complete the "auto selection" list';
}

// Path: dialogs.confirmation.perAppProxy.import
class TranslationsDialogsConfirmationPerAppProxyImportEn {
	TranslationsDialogsConfirmationPerAppProxyImportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'This will replace all your current per-app proxy selections. Are you sure you want to continue?'
	String get msg => 'This will replace all your current per-app proxy selections. Are you sure you want to continue?';
}

// Path: dialogs.confirmation.routeRule.delete
class TranslationsDialogsConfirmationRouteRuleDeleteEn {
	TranslationsDialogsConfirmationRouteRuleDeleteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete rule'
	String get title => 'Delete rule';

	/// en: 'Are you sure you want to delete the "$rulename" rule?'
	String msg({required Object rulename}) => 'Are you sure you want to delete the "${rulename}" rule?';
}

// Path: pages.settings.routing.perAppProxy.options
class TranslationsPagesSettingsRoutingPerAppProxyOptionsEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn import = TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn.internal(_root);
	late final TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn export = TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn.internal(_root);

	/// en: 'Share to all'
	String get shareToAll => 'Share to all';

	/// en: 'Clear all selections'
	String get clearAllSelections => 'Clear all selections';
}

// Path: pages.settings.routing.perAppProxy.modes
class TranslationsPagesSettingsRoutingPerAppProxyModesEn {
	TranslationsPagesSettingsRoutingPerAppProxyModesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All'
	String get all => 'All';

	/// en: 'Proxy'
	String get proxy => 'Proxy';

	/// en: 'Bypass'
	String get bypass => 'Bypass';

	/// en: 'Proxy all apps'
	String get allMsg => 'Proxy all apps';

	/// en: 'Proxy only selected apps'
	String get proxyMsg => 'Proxy only selected apps';

	/// en: 'Do not proxy selected apps'
	String get bypassMsg => 'Do not proxy selected apps';
}

// Path: pages.settings.routing.perAppProxy.autoSelection
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Auto selection'
	String get title => 'Auto selection';

	/// en: 'Perform now'
	String get performNow => 'Perform now';

	/// en: 'Reset to default'
	String get resetToDefault => 'Reset to default';

	/// en: 'Auto update interval'
	String get autoUpdateInterval => 'Auto update interval';

	late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn toast = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn.internal(_root);
	late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn dialog = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn.internal(_root);
}

// Path: pages.settings.routing.routeRule.options
class TranslationsPagesSettingsRoutingRouteRuleOptionsEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn import = TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn.internal(_root);
	late final TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn export = TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn.internal(_root);

	/// en: 'Reset rules'
	String get reset => 'Reset rules';
}

// Path: pages.settings.routing.routeRule.rule
class TranslationsPagesSettingsRoutingRouteRuleRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleRuleEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Rule'
	String get title => 'Rule';

	/// en: 'Rule changed'
	String get ruleChanged => 'Rule changed';

	/// en: 'Do you want to save your edits?'
	String get ruleChangedMsg => 'Do you want to save your edits?';

	/// en: 'Available only in tun mode'
	String get onlyTunMode => 'Available only in tun mode';

	/// en: 'Not available in this platform'
	String get notAvailabeInThisPlatform => 'Not available in this platform';

	/// en: 'Can not be empty'
	String get canNotBeEmpty => 'Can not be empty';

	/// en: 'https://example.com'
	String get validUrlEx => 'https://example.com';

	/// en: 'Valid "URL" like https://example.com'
	String get validUrl => 'Valid "URL" like\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}';

	/// en: 'Chrome.exe or google chrome or chrome'
	String get validProcessNameEx => 'Chrome.exe or google chrome or chrome';

	/// en: 'Valid "Process Name" like Chrome.exe or google chrome or chrome'
	String get validProcessName => 'Valid "Process Name" like\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}';

	/// en: 'C:\Pro...\chrome.exe /App.../Google Chrome /usr/lib.../chrome'
	String get validProcessPathEx => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome';

	/// en: 'Valid "Process Path" like C:\Pro...\chrome.exe /App.../Google Chrome /usr/lib.../chrome'
	String get validProcessPath => 'Valid "Process Path" like\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}';

	/// en: '80 or 1-65000'
	String get validPortRangeEx => '80 or 1-65000';

	/// en: 'Valid "Port" or "Port Range" like 80 or 1-65000'
	String get validPortRange => 'Valid "Port" or "Port Range" like\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}';

	/// en: '8.8.8.8 or 10.0.0.0/24'
	String get validIpCidrEx => '8.8.8.8 or 10.0.0.0/24';

	/// en: 'Valid IP CIDR like 8.8.8.8 or 10.0.0.0/24'
	String get validIpCidr => 'Valid IP CIDR like\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}';

	/// en: 'Google.com or dl.google.com'
	String get validDomainEx => 'Google.com or dl.google.com';

	/// en: 'Valid "Domain" like Google.com or dl.google.com'
	String get validDomain => 'Valid "Domain" like\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}';

	/// en: '.com or .ir'
	String get validDomainSuffixEx => '.com or .ir';

	/// en: 'Valid "Domain Suffix" like .com or .ir'
	String get validDomainSuffix => 'Valid "Domain Suffix" like\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}';

	Map<String, String> get tileTitle => {
		'name': 'Name',
		'outbound': 'Outbound if match',
		'rule_set': 'Rule set URL',
		'package_name': 'Package names',
		'process_name': 'Process names',
		'process_path': 'Process paths',
		'network': 'Networks',
		'port_range': 'Destination ports',
		'source_port_range': 'Source ports',
		'protocol': 'Protocol',
		'ip_cidr': 'Destination IP CIDR',
		'source_ip_cidr': 'Source IP CIDR',
		'domain': 'Domain',
		'domain_suffixe': 'Domain suffix',
		'domain_keyword': 'Domain keyword',
		'domain_regex': 'Domain regex',
	};
	Map<String, String> get outbound => {
		'proxy': 'Proxy',
		'direct': 'Direct',
		'direct_with_fragment': 'Direct with fragment',
		'block': 'Block',
	};
	Map<String, String> get network => {
		'all': 'All',
		'tcp': 'TCP',
		'udp': 'UDP',
	};
	Map<String, String> get protocol => {
		'': 'All',
		'tls': 'TLS',
		'http': 'HTTP',
		'quic': 'QUIC',
		'stun': 'STUN',
		'dns': 'DNS',
		'bittorrent': 'BitTorrent',
	};
}

// Path: pages.settings.routing.routeRule.genericList
class TranslationsPagesSettingsRoutingRouteRuleGenericListEn {
	TranslationsPagesSettingsRoutingRouteRuleGenericListEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add new value'
	String get addNew => 'Add new value';

	/// en: 'Update value'
	String get update => 'Update value';

	/// en: 'Clear list'
	String get clearList => 'Clear list';

	/// en: 'All items are deleted'
	String get clearListMsg => 'All items are deleted';
}

// Path: pages.settings.routing.routeRule.androidApps
class TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn {
	TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Android apps'
	String get pageTitle => 'Android apps';

	/// en: 'Show system apps'
	String get showSystemApps => 'Show system apps';

	/// en: 'Hide system apps'
	String get hideSystemApps => 'Hide system apps';

	/// en: 'Clear selection'
	String get clearSelection => 'Clear selection';

	/// en: 'Uninstalled'
	String get uninstalled => 'Uninstalled';
}

// Path: pages.settings.routing.perAppProxy.options.import
class TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Import selection from clipboard'
	String get clipboard => 'Import selection from clipboard';

	/// en: 'Import selection from file'
	String get file => 'Import selection from file';

	/// en: 'Importing will replace your current selections. Are you sure you want to continue?'
	String get msg => 'Importing will replace your current selections. Are you sure you want to continue?';
}

// Path: pages.settings.routing.perAppProxy.options.export
class TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Copy selection to clipboard'
	String get clipboard => 'Copy selection to clipboard';

	/// en: 'Export selection to file'
	String get file => 'Export selection to file';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.toast
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Auto apps selection completed successfully'
	String get success => 'Auto apps selection completed successfully';

	/// en: 'Auto selection failed'
	String get failure => 'Auto selection failed';

	/// en: 'Auto selection not found, region "${region}"'
	String regionNotFound({required Object region}) => 'Auto selection not found, region "${region}"';

	/// en: 'Your selections are already in the auto-list'
	String get alreadyInAuto => 'Your selections are already in the auto-list';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.dialog
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Auto apps selection'
	String get title => 'Auto apps selection';

	/// en: 'The auto selection feature for per-app proxy was disabled due to the region change to "${region}"'
	String msg({required Object region}) => 'The auto selection feature for per-app proxy was disabled due to the region change to "${region}"';
}

// Path: pages.settings.routing.routeRule.options.import
class TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Import rules from clipboard'
	String get clipboard => 'Import rules from clipboard';

	/// en: 'Import rules from file'
	String get file => 'Import rules from file';
}

// Path: pages.settings.routing.routeRule.options.export
class TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Copy rules to clipboard'
	String get clipboard => 'Copy rules to clipboard';

	/// en: 'Save rules to file'
	String get file => 'Save rules to file';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appTitle' => '树懒VPN',
			'common.start' => 'Start',
			'common.version' => 'Version',
			'common.ok' => 'OK',
			'common.cancel' => 'Cancel',
			'common.kContinue' => 'Continue',
			'common.showMore' => 'Show more',
			'common.showLess' => 'Show less',
			'common.filter' => 'Filter',
			'common.all' => 'All',
			'common.pause' => 'Pause',
			'common.resume' => 'Resume',
			'common.clear' => 'Clear',
			'common.close' => 'Close',
			'common.auto' => 'Auto',
			'common.manually' => 'Manually',
			'common.name' => 'Name',
			'common.url' => 'URL',
			'common.add' => 'Add',
			'common.clipboard' => 'Clipboard',
			'common.addToClipboard' => 'Add to clipboard',
			'common.scanQr' => 'Scan QR',
			'common.free' => 'Free',
			'common.warp' => 'WARP',
			'common.fragment' => 'Fragment',
			'common.help' => 'Help',
			'common.save' => 'Save',
			'common.update' => 'Update',
			'common.share' => 'Share',
			'common.edit' => 'Edit',
			'common.delete' => 'Delete',
			'common.discard' => 'Discard',
			'common.import' => 'Import',
			'common.export' => 'Export',
			'common.later' => 'Later',
			'common.ignore' => 'Ignore',
			'common.quit' => 'Quit',
			'common.notSet' => 'Not set',
			'common.hide' => 'Hide',
			'common.exit' => 'Exit',
			'common.reset' => 'Reset',
			'common.done' => 'Done',
			'common.search' => 'Search',
			'common.decline' => 'Decline',
			'common.agree' => 'Agree',
			'common.empty' => 'Empty',
			'common.unknown' => 'Unknown',
			'common.hidden' => 'Hidden',
			'common.timeout' => 'Timeout',
			'common.sort' => 'Sort',
			'common.dashboard' => 'Dashboard',
			'common.interval.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: '', one: '${n} day', other: '${n} days', ), 
			'common.interval.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: '', one: '${n} hour', other: '${n} hours', ), 
			'common.msg.permission.denied' => 'Permission denied',
			'common.msg.export.clipboard.success' => 'Added to clipboard successfully',
			'common.msg.export.clipboard.failure' => 'Failed to copy to clipboard',
			'common.msg.export.clipboard.contentTooLarge' => 'Content too large. Use export file instead',
			'common.msg.export.file.success' => 'JSON file created successfully',
			'common.msg.export.file.failure' => 'Failed to create file',
			'common.msg.import.confirm' => 'Confirm import',
			'common.msg.import.success' => 'Imported successfully',
			'common.msg.import.failure' => 'Failed to import',
			'intro.banner' => 'All you need for an unrestricted internet',
			'intro.termsAndPolicyCaution' => ({required InlineSpanBuilder tap}) => TextSpan(children: [ const TextSpan(text: 'By continuing you agree to '), tap(_root.pages.about.termsAndConditions), ]), 
			'intro.info' => ({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [ const TextSpan(text: 'Crafted for secure freedom by 树懒VPN - '), tap_source('Source Code'), const TextSpan(text: ' ('), tap_license('License'), const TextSpan(text: ')'), ]), 
			'pages.home.title' => 'Home',
			'pages.home.quickSettings' => 'Quick settings',
			'pages.proxies.title' => 'Proxies',
			'pages.proxies.sort' => 'Sort proxies',
			'pages.proxies.testDelay' => 'Test delay',
			'pages.proxies.empty' => 'No proxies available',
			'pages.proxies.activeProxy' => 'Active proxy',
			'pages.proxies.unknownIp' => 'Unknown IP',
			'pages.proxies.sortOptions.unsorted' => 'Default',
			'pages.proxies.sortOptions.name' => 'Alphabetically',
			'pages.proxies.sortOptions.delay' => 'By delay',
			'pages.proxies.sortOptions.usage' => 'By usage',
			'pages.proxies.ipInfo.address' => 'IP address',
			'pages.proxies.ipInfo.country' => 'Country',
			'pages.proxies.ipInfo.organization' => 'Organization',
			'pages.proxies.delay.result' => ({required Object delay}) => 'Delay: ${delay}ms',
			'pages.proxies.delay.timeout' => 'Delay test timeout',
			'pages.proxies.delay.testing' => 'Delay: testing...',
			'pages.profiles.title' => 'Profiles',
			'pages.profiles.add' => 'Add profile',
			'pages.profiles.update' => 'Update profile',
			'pages.profiles.viewAllProfiles' => 'View all profiles',
			'pages.profiles.activeProfileName' => ({required Object name}) => 'Active profile name: "${name}".',
			'pages.profiles.nonActiveProfileName' => ({required Object name}) => 'Select "${name}" as active profile',
			'pages.profiles.freeSubNotFound' => 'No free subscription was found',
			'pages.profiles.freeSubNotFoundForRegion' => ({required Object region}) => 'No free subscription was found for "${region}" region.',
			'pages.profiles.failedToLoad' => 'Failed to load',
			'pages.profiles.updateSubscriptions' => 'Update subscriptions',
			'pages.profiles.share.urlToClipboard' => 'URL to clipboard',
			'pages.profiles.share.showUrlQr' => 'Show URL QR',
			'pages.profiles.share.jsonToClipboard' => 'JSON to clipboard',
			'pages.profiles.msg.save.success' => 'Profile saved successfully',
			'pages.profiles.msg.invalidUrl' => 'Invalid URL',
			'pages.profiles.msg.add.failure' => 'Failed to add profile',
			'pages.profiles.msg.update.success' => 'Profile updated successfully',
			'pages.profiles.msg.update.successNamed' => ({required Object name}) => '"${name}" updated successfully',
			'pages.profiles.msg.update.failure' => 'Failed to update profile',
			'pages.profiles.msg.update.failureNamed' => ({required Object name}) => 'Failed to update "${name}"',
			'pages.profiles.msg.delete.success' => 'Profile deleted successfully',
			'pages.profileDetails.title' => 'Profile',
			'pages.profileDetails.lastUpdate' => 'Last update',
			'pages.profileDetails.form.nameHint' => 'Profile name',
			'pages.profileDetails.form.emptyName' => 'Name is required',
			'pages.profileDetails.form.invalidUrl' => 'Invalid URL',
			'pages.profileDetails.form.urlHint' => 'Full config URL',
			'pages.profileDetails.form.disableAutoUpdate' => 'Disable auto update',
			'pages.profileDetails.form.autoUpdateInterval' => 'Auto update interval',
			'pages.profileDetails.form.loading' => 'Adding profile...',
			'pages.logs.title' => 'Logs',
			'pages.logs.shareCoreLogs' => 'Share core logs',
			'pages.logs.shareAppLogs' => 'Share app logs',
			'pages.about.title' => 'About',
			'pages.about.notAvailableMsg' => 'Already using the latest version',
			'pages.about.checkForUpdate' => 'Check for update',
			'pages.about.openWorkingDir' => 'Open working directory',
			'pages.about.sourceCode' => 'Source code',
			'pages.about.telegramChannel' => 'Telegram channel',
			'pages.about.termsAndConditions' => 'Terms and conditions',
			'pages.about.privacyPolicy' => 'Privacy policy',
			'pages.settings.title' => 'Settings',
			'pages.settings.resetTunnel' => 'Reset VPN profile',
			'pages.settings.resetTunnelSubtitle' => 'Rebuild local tunnel status',
			'pages.settings.heroSubtitle' => 'Secure tuning center',
			'pages.settings.sectionOpenHint' => 'Tap to open',
			'pages.settings.options.import.clipboard' => 'Import options from clipboard',
			'pages.settings.options.import.file' => 'Import options from file',
			'pages.settings.options.export.anonymousToClipboard' => 'Copy anonymous options to clipboard',
			'pages.settings.options.export.anonymousToFile' => 'Export anonymous options to file',
			'pages.settings.options.export.allToClipboard' => 'Copy all options to clipboard',
			'pages.settings.options.export.allToFile' => 'Export all options to file',
			'pages.settings.options.reset' => 'Reset options',
			'pages.settings.general.title' => 'General',
			'pages.settings.general.locale' => 'Language',
			'pages.settings.general.themeMode' => 'Theme mode',
			'pages.settings.general.themeModes.system' => 'System default',
			'pages.settings.general.themeModes.dark' => 'Dark mode',
			'pages.settings.general.themeModes.light' => 'Light mode',
			'pages.settings.general.themeModes.black' => 'Black mode',
			'pages.settings.general.enableAnalytics' => 'Enable analytics',
			'pages.settings.general.enableAnalyticsMsg' => 'Give permission to collect analytics and send crash reports to improve the app',
			'pages.settings.general.autoIpCheck' => 'Automatically check connection IP',
			'pages.settings.general.dynamicNotification' => 'Display speed in notification',
			'pages.settings.general.hapticFeedback' => 'Haptic feedback',
			'pages.settings.general.actionAtClosing' => 'Action at closing',
			'pages.settings.general.autoStart' => 'Start at login',
			'pages.settings.general.silentStart' => 'Start minimized',
			'pages.settings.general.ignoreBatteryOptimizations' => 'Disable battery optimization',
			'pages.settings.general.ignoreBatteryOptimizationsMsg' => 'Remove restrictions for optimal VPN performance',
			'pages.settings.general.memoryLimit' => 'Memory limit',
			'pages.settings.general.memoryLimitMsg' => 'Enable if you\'re experiencing out of memory errors or frequent app crashes',
			'pages.settings.general.debugMode' => 'Debug mode',
			'pages.settings.general.debugModeMsg' => 'Restart the app for applying this change',
			'pages.settings.general.logLevel' => 'Log level',
			'pages.settings.general.connectionTestUrl' => 'Connection test URL',
			'pages.settings.general.urlTestInterval' => 'URL test interval',
			'pages.settings.general.clashApiPort' => 'Clash API port',
			'pages.settings.general.useXrayCoreWhenPossible' => 'Use xray-core when possible',
			'pages.settings.general.useXrayCoreWhenPossibleMsg' => 'Use xray-core during parsing sub links. You need to reimport the sub link to enable this option.',
			'pages.settings.routing.title' => 'Routing',
			'pages.settings.routing.perAppProxy.title' => 'Per-app proxy',
			'pages.settings.routing.perAppProxy.hideSysApps' => 'Hide system apps',
			'pages.settings.routing.perAppProxy.options.import.clipboard' => 'Import selection from clipboard',
			'pages.settings.routing.perAppProxy.options.import.file' => 'Import selection from file',
			'pages.settings.routing.perAppProxy.options.import.msg' => 'Importing will replace your current selections. Are you sure you want to continue?',
			'pages.settings.routing.perAppProxy.options.export.clipboard' => 'Copy selection to clipboard',
			'pages.settings.routing.perAppProxy.options.export.file' => 'Export selection to file',
			'pages.settings.routing.perAppProxy.options.shareToAll' => 'Share to all',
			'pages.settings.routing.perAppProxy.options.clearAllSelections' => 'Clear all selections',
			'pages.settings.routing.perAppProxy.modes.all' => 'All',
			'pages.settings.routing.perAppProxy.modes.proxy' => 'Proxy',
			'pages.settings.routing.perAppProxy.modes.bypass' => 'Bypass',
			'pages.settings.routing.perAppProxy.modes.allMsg' => 'Proxy all apps',
			'pages.settings.routing.perAppProxy.modes.proxyMsg' => 'Proxy only selected apps',
			'pages.settings.routing.perAppProxy.modes.bypassMsg' => 'Do not proxy selected apps',
			'pages.settings.routing.perAppProxy.autoSelection.title' => 'Auto selection',
			'pages.settings.routing.perAppProxy.autoSelection.performNow' => 'Perform now',
			'pages.settings.routing.perAppProxy.autoSelection.resetToDefault' => 'Reset to default',
			'pages.settings.routing.perAppProxy.autoSelection.autoUpdateInterval' => 'Auto update interval',
			'pages.settings.routing.perAppProxy.autoSelection.toast.success' => 'Auto apps selection completed successfully',
			'pages.settings.routing.perAppProxy.autoSelection.toast.failure' => 'Auto selection failed',
			'pages.settings.routing.perAppProxy.autoSelection.toast.regionNotFound' => ({required Object region}) => 'Auto selection not found, region "${region}"',
			'pages.settings.routing.perAppProxy.autoSelection.toast.alreadyInAuto' => 'Your selections are already in the auto-list',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.title' => 'Auto apps selection',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.msg' => ({required Object region}) => 'The auto selection feature for per-app proxy was disabled due to the region change to "${region}"',
			'pages.settings.routing.region' => 'Region',
			'pages.settings.routing.regions.ir' => 'Iran (ir)',
			'pages.settings.routing.regions.cn' => 'China (cn)',
			'pages.settings.routing.regions.ru' => 'Russia (ru)',
			'pages.settings.routing.regions.af' => 'Afghanistan (af)',
			'pages.settings.routing.regions.id' => 'Indonesia (id)',
			'pages.settings.routing.regions.tr' => 'T眉rkiye (tr)',
			'pages.settings.routing.regions.br' => 'Brazil (br)',
			'pages.settings.routing.regions.other' => 'Other',
			'pages.settings.routing.balancerStrategy.title' => 'Balancer strategy',
			'pages.settings.routing.balancerStrategy.roundRobin' => 'Round robin',
			'pages.settings.routing.balancerStrategy.consistentHash' => 'Consistent hash',
			'pages.settings.routing.balancerStrategy.stickySession' => 'Sticky session',
			'pages.settings.routing.blockAds' => 'Block advertisements',
			'pages.settings.routing.bypassLan' => 'Bypass LAN',
			'pages.settings.routing.resolveDestination' => 'Resolve destination',
			'pages.settings.routing.ipv6Route' => 'IPv6 route',
			'pages.settings.routing.ipv6Modes.disable' => 'Disable',
			'pages.settings.routing.ipv6Modes.enable' => 'Enable',
			'pages.settings.routing.ipv6Modes.prefer' => 'Preferred',
			'pages.settings.routing.ipv6Modes.only' => 'Exclusive',
			'pages.settings.routing.routeRule.title' => 'Route rules',
			'pages.settings.routing.routeRule.options.import.clipboard' => 'Import rules from clipboard',
			'pages.settings.routing.routeRule.options.import.file' => 'Import rules from file',
			'pages.settings.routing.routeRule.options.export.clipboard' => 'Copy rules to clipboard',
			'pages.settings.routing.routeRule.options.export.file' => 'Save rules to file',
			'pages.settings.routing.routeRule.options.reset' => 'Reset rules',
			'pages.settings.routing.routeRule.deleteRule' => 'Delete rule',
			'pages.settings.routing.routeRule.createRule' => 'Create new rule',
			'pages.settings.routing.routeRule.rule.title' => 'Rule',
			'pages.settings.routing.routeRule.rule.ruleChanged' => 'Rule changed',
			'pages.settings.routing.routeRule.rule.ruleChangedMsg' => 'Do you want to save your edits?',
			'pages.settings.routing.routeRule.rule.onlyTunMode' => 'Available only in tun mode',
			'pages.settings.routing.routeRule.rule.notAvailabeInThisPlatform' => 'Not available in this platform',
			'pages.settings.routing.routeRule.rule.canNotBeEmpty' => 'Can not be empty',
			'pages.settings.routing.routeRule.rule.validUrlEx' => 'https://example.com',
			'pages.settings.routing.routeRule.rule.validUrl' => 'Valid "URL" like\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}',
			'pages.settings.routing.routeRule.rule.validProcessNameEx' => 'Chrome.exe or google chrome or chrome',
			'pages.settings.routing.routeRule.rule.validProcessName' => 'Valid "Process Name" like\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}',
			'pages.settings.routing.routeRule.rule.validProcessPathEx' => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome',
			'pages.settings.routing.routeRule.rule.validProcessPath' => 'Valid "Process Path" like\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}',
			'pages.settings.routing.routeRule.rule.validPortRangeEx' => '80 or 1-65000',
			'pages.settings.routing.routeRule.rule.validPortRange' => 'Valid "Port" or "Port Range" like\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}',
			'pages.settings.routing.routeRule.rule.validIpCidrEx' => '8.8.8.8 or 10.0.0.0/24',
			'pages.settings.routing.routeRule.rule.validIpCidr' => 'Valid IP CIDR like\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}',
			'pages.settings.routing.routeRule.rule.validDomainEx' => 'Google.com or dl.google.com',
			'pages.settings.routing.routeRule.rule.validDomain' => 'Valid "Domain" like\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}',
			'pages.settings.routing.routeRule.rule.validDomainSuffixEx' => '.com or .ir',
			'pages.settings.routing.routeRule.rule.validDomainSuffix' => 'Valid "Domain Suffix" like\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}',
			'pages.settings.routing.routeRule.rule.tileTitle.name' => 'Name',
			'pages.settings.routing.routeRule.rule.tileTitle.outbound' => 'Outbound if match',
			'pages.settings.routing.routeRule.rule.tileTitle.rule_set' => 'Rule set URL',
			'pages.settings.routing.routeRule.rule.tileTitle.package_name' => 'Package names',
			'pages.settings.routing.routeRule.rule.tileTitle.process_name' => 'Process names',
			'pages.settings.routing.routeRule.rule.tileTitle.process_path' => 'Process paths',
			'pages.settings.routing.routeRule.rule.tileTitle.network' => 'Networks',
			'pages.settings.routing.routeRule.rule.tileTitle.port_range' => 'Destination ports',
			'pages.settings.routing.routeRule.rule.tileTitle.source_port_range' => 'Source ports',
			'pages.settings.routing.routeRule.rule.tileTitle.protocol' => 'Protocol',
			'pages.settings.routing.routeRule.rule.tileTitle.ip_cidr' => 'Destination IP CIDR',
			'pages.settings.routing.routeRule.rule.tileTitle.source_ip_cidr' => 'Source IP CIDR',
			'pages.settings.routing.routeRule.rule.tileTitle.domain' => 'Domain',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_suffixe' => 'Domain suffix',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_keyword' => 'Domain keyword',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_regex' => 'Domain regex',
			'pages.settings.routing.routeRule.rule.outbound.proxy' => 'Proxy',
			'pages.settings.routing.routeRule.rule.outbound.direct' => 'Direct',
			'pages.settings.routing.routeRule.rule.outbound.direct_with_fragment' => 'Direct with fragment',
			'pages.settings.routing.routeRule.rule.outbound.block' => 'Block',
			'pages.settings.routing.routeRule.rule.network.all' => 'All',
			'pages.settings.routing.routeRule.rule.network.tcp' => 'TCP',
			'pages.settings.routing.routeRule.rule.network.udp' => 'UDP',
			'pages.settings.routing.routeRule.rule.protocol.' => 'All',
			'pages.settings.routing.routeRule.rule.protocol.tls' => 'TLS',
			'pages.settings.routing.routeRule.rule.protocol.http' => 'HTTP',
			'pages.settings.routing.routeRule.rule.protocol.quic' => 'QUIC',
			'pages.settings.routing.routeRule.rule.protocol.stun' => 'STUN',
			'pages.settings.routing.routeRule.rule.protocol.dns' => 'DNS',
			'pages.settings.routing.routeRule.rule.protocol.bittorrent' => 'BitTorrent',
			'pages.settings.routing.routeRule.genericList.addNew' => 'Add new value',
			'pages.settings.routing.routeRule.genericList.update' => 'Update value',
			'pages.settings.routing.routeRule.genericList.clearList' => 'Clear list',
			'pages.settings.routing.routeRule.genericList.clearListMsg' => 'All items are deleted',
			'pages.settings.routing.routeRule.androidApps.pageTitle' => 'Android apps',
			'pages.settings.routing.routeRule.androidApps.showSystemApps' => 'Show system apps',
			'pages.settings.routing.routeRule.androidApps.hideSystemApps' => 'Hide system apps',
			'pages.settings.routing.routeRule.androidApps.clearSelection' => 'Clear selection',
			'pages.settings.routing.routeRule.androidApps.uninstalled' => 'Uninstalled',
			'pages.settings.dns.title' => 'DNS',
			'pages.settings.dns.remoteDns' => 'Remote DNS',
			'pages.settings.dns.remoteDnsDomainStrategy' => 'Remote DNS domain strategy',
			'pages.settings.dns.directDns' => 'Outbound server resolver (direct)',
			'pages.settings.dns.directDnsDomainStrategy' => 'Outbound domain strategy',
			'pages.settings.dns.enableDnsRouting' => 'Enable DNS routing',
			'pages.settings.dns.enableFakeDns' => 'Enable fake DNS',
			'pages.settings.dns.domainStrategy.auto' => 'Auto',
			'pages.settings.dns.domainStrategy.preferIpv6' => 'Prefer IPv6',
			'pages.settings.dns.domainStrategy.preferIpv4' => 'Prefer IPv4',
			'pages.settings.dns.domainStrategy.ipv4Only' => 'IPv4 only',
			'pages.settings.dns.domainStrategy.ipv6Only' => 'IPv6 only',
			'pages.settings.inbound.title' => 'Inbound',
			'pages.settings.inbound.serviceMode' => 'Service mode',
			'pages.settings.inbound.serviceModes.proxy' => 'Proxy service only',
			'pages.settings.inbound.serviceModes.systemProxy' => 'Set system proxy',
			'pages.settings.inbound.serviceModes.tun' => 'VPN',
			'pages.settings.inbound.serviceModes.tunService' => 'VPN service',
			'pages.settings.inbound.shortServiceModes.proxy' => 'Proxy',
			'pages.settings.inbound.shortServiceModes.systemProxy' => 'System proxy',
			'pages.settings.inbound.shortServiceModes.tun' => 'VPN',
			'pages.settings.inbound.shortServiceModes.tunService' => 'VPN service',
			'pages.settings.inbound.strictRoute' => 'Strict route',
			'pages.settings.inbound.tunImplementation' => 'Tun implementation',
			'pages.settings.inbound.tunImplementations.mixed' => 'Mixed',
			'pages.settings.inbound.tunImplementations.system' => 'System',
			'pages.settings.inbound.tunImplementations.gvisor' => 'gVisor',
			'pages.settings.inbound.mixedPort' => 'Mixed port',
			'pages.settings.inbound.tproxyPort' => 'Transparent proxy port',
			'pages.settings.inbound.directPort' => 'Direct port',
			'pages.settings.inbound.redirectPort' => 'Redirect port',
			'pages.settings.inbound.allowConnectionFromLan' => 'Share VPN in local network',
			'pages.settings.tlsTricks.title' => 'TLS tricks',
			'pages.settings.tlsTricks.enable' => 'Enable fragment',
			'pages.settings.tlsTricks.packets' => 'Fragmentation Packets',
			'pages.settings.tlsTricks.packetsTlsHello' => 'TLS Hello',
			'pages.settings.tlsTricks.packets1_1' => '1-1',
			'pages.settings.tlsTricks.packets1_2' => '1-2',
			'pages.settings.tlsTricks.packets1_3' => '1-3',
			'pages.settings.tlsTricks.packets1_4' => '1-4',
			'pages.settings.tlsTricks.packets1_5' => '1-5',
			'pages.settings.tlsTricks.size' => 'Fragment size',
			'pages.settings.tlsTricks.sleep' => 'Fragment sleep',
			'pages.settings.tlsTricks.mixedSniCase.enable' => 'Enable mixed SNI case',
			'pages.settings.tlsTricks.padding.enable' => 'Enable padding',
			'pages.settings.tlsTricks.padding.size' => 'Padding size',
			'pages.settings.warp.title' => 'WARP',
			'pages.settings.warp.enable' => 'Enable WARP',
			'pages.settings.warp.generateConfig' => 'Generate WARP config',
			'pages.settings.warp.configGenerated' => 'Warp config is generated',
			'pages.settings.warp.missingConfig' => 'Missing WARP config',
			'pages.settings.warp.detourMode' => 'Detour mode',
			'pages.settings.warp.detourModes.proxyOverWarp' => 'Detour proxies through WARP ',
			'pages.settings.warp.detourModes.warpOverProxy' => 'Detour WARP through proxies',
			'pages.settings.warp.detourModes.proxyOverWarpExplain' => 'Unblock proxies by WARP',
			'pages.settings.warp.detourModes.warpOverProxyExplain' => 'Extra security by WARP',
			'pages.settings.warp.licenseKey' => 'License key',
			'pages.settings.warp.cleanIp' => 'Clean IP',
			'pages.settings.warp.port' => 'Port',
			'pages.settings.warp.noise.count' => 'Noise count',
			'pages.settings.warp.noise.mode' => 'Noise mode',
			'pages.settings.warp.noise.size' => 'Noise size',
			'pages.settings.warp.noise.delay' => 'Noise delay',
			'components.stats.connection' => 'Connection',
			'components.stats.traffic' => 'Traffic',
			'components.stats.trafficLive' => 'Live traffic',
			'components.stats.trafficTotal' => 'Total traffic',
			'components.stats.uplink' => 'Uplink',
			'components.stats.downlink' => 'Downlink',
			'components.stats.speed' => 'Speed',
			'components.stats.totalTransferred' => 'Total transferred',
			'components.subscriptionInfo.upload' => 'Upload',
			'components.subscriptionInfo.download' => 'Download',
			'components.subscriptionInfo.total' => 'Total traffic',
			'components.subscriptionInfo.expireDate' => 'Expire date',
			'components.subscriptionInfo.expired' => 'Expired',
			'components.subscriptionInfo.noTraffic' => 'Out of quota',
			'components.subscriptionInfo.remainingTime' => 'Remaining time',
			'components.subscriptionInfo.remainingDuration' => ({required Object duration}) => '${duration} days remaining',
			'components.subscriptionInfo.remainingDurationNew' => ({required Object duration}) => '${duration} days',
			'components.subscriptionInfo.remainingTrafficSemanticLabel' => ({required Object consumed, required Object total}) => '${consumed} of ${total} traffic consumed',
			'components.subscriptionInfo.remainingTraffic' => 'Remaining traffic',
			'components.subscriptionInfo.remainingUsage' => 'Remaining',
			'components.subscriptionInfo.profileSite' => 'Provider',
			'components.subscriptionInfo.profileSupport' => 'Support',
			'dialogs.sortProfiles.title' => 'Sort by',
			'dialogs.sortProfiles.sort.name' => 'Alphabetically',
			'dialogs.sortProfiles.sort.lastUpdate' => 'Recently updated',
			'dialogs.warpLicense.title' => 'Cloudflare WARP consent',
			'dialogs.warpLicense.description' => ({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [ const TextSpan(text: 'Cloudflare WARP is a free WireGuard VPN provider. By enabling this option you are agreeing to the Cloudflare WARP\'s '), tos('Terms of service'), const TextSpan(text: ' and '), privacy('Privacy policy'), const TextSpan(text: '.'), ]), 
			'dialogs.newVersion.title' => 'Update available',
			'dialogs.newVersion.msg' => 'A new version of ${_root.common.appTitle} is available. Would you like to update now?',
			'dialogs.newVersion.currentVersion' => 'Current version: ',
			'dialogs.newVersion.newVersion' => 'New version: ',
			'dialogs.newVersion.updateNow' => 'Update now',
			'dialogs.confirmation.settings.import.msg' => 'This will rewrite all config options with provided values. Are you sure?',
			'dialogs.confirmation.profile.delete.title' => 'Delete profile',
			'dialogs.confirmation.profile.delete.msg' => 'Are you sure you want to permanently delete this profile?',
			'dialogs.confirmation.perAppProxy.shareOnGithub.title' => 'Improving auto selection',
			'dialogs.confirmation.perAppProxy.shareOnGithub.msg' => 'By sharing selected apps, you help complete the "auto selection" list',
			'dialogs.confirmation.perAppProxy.import.msg' => 'This will replace all your current per-app proxy selections. Are you sure you want to continue?',
			'dialogs.confirmation.routeRule.delete.title' => 'Delete rule',
			'dialogs.confirmation.routeRule.delete.msg' => ({required Object rulename}) => 'Are you sure you want to delete the "${rulename}" rule?',
			'dialogs.experimentalNotice.title' => 'Experimental features in use',
			'dialogs.experimentalNotice.msg' => 'You\'ve enabled some experimental features which might affect connection quality and cause unexpected errors. You can always change or reset these options from config options page.',
			'dialogs.experimentalNotice.disable' => 'Don\'t show again',
			'dialogs.noActiveProfile.title' => 'Choose a profile',
			'dialogs.noActiveProfile.msg' => 'Let\'s get started by adding a connection profile that includes your VPN connection details.\n\nDon鈥檛 have a VPN server yet? No worries鈥攋ust follow the tutorial below to set one up quickly and for free.',
			'dialogs.noActiveProfile.helpBtn.label' => 'Show me how',
			'dialogs.noActiveProfile.helpBtn.url' => 'https://github.com/shulaiyun/Sloth-VPN.git',
			'dialogs.unknownDomainsWarning.title' => 'External link warning',
			'dialogs.unknownDomainsWarning.youAreAboutToVisit' => 'You are about to visit :',
			'dialogs.unknownDomainsWarning.thisWebsiteIsNotInOurTrustedList' => 'This website is not in our trusted list. Please proceed with caution.',
			'dialogs.proxyInfo.fullTag' => 'Full tag:',
			'dialogs.proxyInfo.type' => 'Type:',
			'dialogs.proxyInfo.testTime' => 'Test time:',
			'dialogs.proxyInfo.testDelay' => 'Test delay:',
			'dialogs.proxyInfo.isSelected' => 'Is selected:',
			'dialogs.proxyInfo.isGroup' => 'Is group',
			'dialogs.proxyInfo.isSecure' => 'Is secure:',
			'dialogs.proxyInfo.port' => 'Port:',
			'dialogs.proxyInfo.host' => 'Host:',
			'dialogs.proxyInfo.ip' => 'IP:',
			'dialogs.proxyInfo.countryCode' => 'Country code:',
			'dialogs.proxyInfo.region' => 'Region:',
			'dialogs.proxyInfo.city' => 'City:',
			'dialogs.proxyInfo.asn' => 'ASN:',
			'dialogs.proxyInfo.organization' => 'Organization:',
			'dialogs.proxyInfo.location' => 'Location:',
			'dialogs.proxyInfo.postalCode' => 'Postal code:',
			'dialogs.proxyInfo.download' => 'Download:',
			'dialogs.proxyInfo.upload' => 'Upload:',
			'dialogs.windowClosing.askEachTime' => 'Ask each time',
			'dialogs.windowClosing.alertMessage' => 'Hide or exit the application?',
			'dialogs.windowClosing.remember' => 'Remember my choice',
			'connection.tapToConnect' => 'Tap to connect',
			'connection.connect' => 'Connect',
			'connection.connecting' => 'Connecting...',
			'connection.connected' => 'Connected',
			'connection.disconnect' => 'Disconnect',
			'connection.disconnecting' => 'Disconnecting...',
			'connection.reconnect' => 'Reconnect',
			'connection.reconnectMsg' => 'Reconnecting for taking into account the changes...',
			'connection.secure' => 'Secured by WARP',
			'errors.unexpected' => 'Unexpected error',
			'errors.connection.unexpected' => 'Unexpected connection error',
			'errors.connection.timeout' => 'Connection timeout',
			'errors.connection.badResponse' => 'Bad response',
			'errors.connection.connectionError' => 'Connection error',
			'errors.connection.badCertificate' => 'Bad certificate',
			'errors.profiles.unexpected' => 'Unexpected error',
			'errors.profiles.notFound' => 'Profile not found',
			'errors.profiles.invalidConfig' => 'Invalid configs',
			'errors.profiles.invalidUrl' => 'Invalid URL',
			'errors.profiles.canceledByUser' => 'Canceled by user',
			'errors.connectivity.unexpected' => 'Unexpected failure',
			'errors.connectivity.missingVpnPermission' => 'Missing VPN permission',
			'errors.connectivity.missingNotificationPermission' => 'Missing notification permission',
			'errors.connectivity.core' => 'Core error',
			'errors.singbox.serviceNotRunning' => 'Service is not running',
			'errors.singbox.missingPrivilege' => 'Missing privilege',
			'errors.singbox.missingPrivilegeMsg' => 'VPN mode requires administrator privileges. Either relaunch the app as administrator or change service mode.',
			'errors.singbox.invalidConfigOptions' => 'Invalid configuration options',
			'errors.singbox.invalidConfig' => 'Invalid configuration',
			'errors.warp.missingLicense' => 'Warp license',
			'errors.warp.missingLicenseMsg' => 'The selected profile uses the WARP feature; to use this feature, the WARP license must be agreed to.',
			_ => null,
		};
	}
}

