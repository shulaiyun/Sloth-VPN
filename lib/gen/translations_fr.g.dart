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
class TranslationsFr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonFr common = TranslationsCommonFr._(_root);
	@override late final TranslationsIntroFr intro = TranslationsIntroFr._(_root);
	@override late final TranslationsPagesFr pages = TranslationsPagesFr._(_root);
	@override late final TranslationsComponentsFr components = TranslationsComponentsFr._(_root);
	@override late final TranslationsDialogsFr dialogs = TranslationsDialogsFr._(_root);
	@override late final TranslationsConnectionFr connection = TranslationsConnectionFr._(_root);
	@override late final TranslationsErrorsFr errors = TranslationsErrorsFr._(_root);
}

// Path: common
class TranslationsCommonFr extends TranslationsCommonEn {
	TranslationsCommonFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get appTitle => '树懒VPN';
	@override String get start => 'Commencer';
	@override String get version => 'Version';
	@override String get ok => 'OK';
	@override String get cancel => 'Annuler';
	@override String get kContinue => 'Continuer';
	@override String get showMore => 'Afficher plus';
	@override String get showLess => 'Afficher moins';
	@override String get filter => 'Filtrer';
	@override String get all => 'Tous';
	@override String get pause => 'Pause';
	@override String get resume => 'Reprendre';
	@override String get clear => 'Effacer';
	@override String get close => 'Fermer';
	@override String get auto => 'Automatique';
	@override String get manually => 'Manuellement';
	@override String get name => 'Nom';
	@override String get url => 'URL';
	@override String get add => 'Ajouter';
	@override String get clipboard => 'Presse-papiers';
	@override String get addToClipboard => 'Ajouter au presse-papiers';
	@override String get scanQr => 'Scanner le QR code';
	@override String get free => 'Gratuit';
	@override String get warp => 'WARP';
	@override String get fragment => 'Fragment';
	@override String get help => 'Aide';
	@override String get save => 'Enregistrer';
	@override String get update => 'Mettre 脿 jour';
	@override String get share => 'Partager';
	@override String get edit => 'Modifier';
	@override String get delete => 'Supprimer';
	@override String get discard => 'Ignorer';
	@override String get import => 'Importer';
	@override String get export => 'Exporter';
	@override String get later => 'Plus tard';
	@override String get ignore => 'Ignorer';
	@override String get quit => 'Quitter';
	@override String get notSet => 'Non d茅fini';
	@override String get hide => 'Masquer';
	@override String get exit => 'Quitter';
	@override String get reset => 'R茅initialiser';
	@override String get done => 'Termin茅';
	@override String get search => 'Rechercher';
	@override String get decline => 'Refuser';
	@override String get agree => 'Accepter';
	@override String get empty => 'Vide';
	@override String get unknown => 'Inconnu';
	@override String get hidden => 'Cach茅';
	@override String get timeout => 'D茅lai expir茅';
	@override String get sort => 'Trier';
	@override String get dashboard => 'Tableau de bord';
	@override late final TranslationsCommonIntervalFr interval = TranslationsCommonIntervalFr._(_root);
	@override late final TranslationsCommonMsgFr msg = TranslationsCommonMsgFr._(_root);
}

// Path: intro
class TranslationsIntroFr extends TranslationsIntroEn {
	TranslationsIntroFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get banner => 'Tout ce dont vous avez besoin pour un internet sans restrictions';
	@override TextSpan termsAndPolicyCaution({required InlineSpanBuilder tap}) => TextSpan(children: [
		const TextSpan(text: 'En continuant, vous acceptez les '),
		tap(_root.pages.about.termsAndConditions),
	]);
	@override TextSpan info({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [
		const TextSpan(text: 'Fait avec 鉂わ笍 par Hiddify - '),
		tap_source('Open Source'),
		const TextSpan(text: ' ('),
		tap_license('Licence'),
		const TextSpan(text: ')'),
	]);
}

// Path: pages
class TranslationsPagesFr extends TranslationsPagesEn {
	TranslationsPagesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesHomeFr home = TranslationsPagesHomeFr._(_root);
	@override late final TranslationsPagesProxiesFr proxies = TranslationsPagesProxiesFr._(_root);
	@override late final TranslationsPagesProfilesFr profiles = TranslationsPagesProfilesFr._(_root);
	@override late final TranslationsPagesProfileDetailsFr profileDetails = TranslationsPagesProfileDetailsFr._(_root);
	@override late final TranslationsPagesLogsFr logs = TranslationsPagesLogsFr._(_root);
	@override late final TranslationsPagesAboutFr about = TranslationsPagesAboutFr._(_root);
	@override late final TranslationsPagesSettingsFr settings = TranslationsPagesSettingsFr._(_root);
}

// Path: components
class TranslationsComponentsFr extends TranslationsComponentsEn {
	TranslationsComponentsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsComponentsStatsFr stats = TranslationsComponentsStatsFr._(_root);
	@override late final TranslationsComponentsSubscriptionInfoFr subscriptionInfo = TranslationsComponentsSubscriptionInfoFr._(_root);
}

// Path: dialogs
class TranslationsDialogsFr extends TranslationsDialogsEn {
	TranslationsDialogsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsSortProfilesFr sortProfiles = TranslationsDialogsSortProfilesFr._(_root);
	@override late final TranslationsDialogsWarpLicenseFr warpLicense = TranslationsDialogsWarpLicenseFr._(_root);
	@override late final TranslationsDialogsNewVersionFr newVersion = TranslationsDialogsNewVersionFr._(_root);
	@override late final TranslationsDialogsConfirmationFr confirmation = TranslationsDialogsConfirmationFr._(_root);
	@override late final TranslationsDialogsExperimentalNoticeFr experimentalNotice = TranslationsDialogsExperimentalNoticeFr._(_root);
	@override late final TranslationsDialogsNoActiveProfileFr noActiveProfile = TranslationsDialogsNoActiveProfileFr._(_root);
	@override late final TranslationsDialogsUnknownDomainsWarningFr unknownDomainsWarning = TranslationsDialogsUnknownDomainsWarningFr._(_root);
	@override late final TranslationsDialogsProxyInfoFr proxyInfo = TranslationsDialogsProxyInfoFr._(_root);
	@override late final TranslationsDialogsWindowClosingFr windowClosing = TranslationsDialogsWindowClosingFr._(_root);
}

// Path: connection
class TranslationsConnectionFr extends TranslationsConnectionEn {
	TranslationsConnectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get tapToConnect => 'Appuyez pour vous connecter';
	@override String get connect => 'Connecter';
	@override String get connecting => 'Connexion en cours...';
	@override String get connected => 'Connect茅';
	@override String get disconnect => 'D茅connecter';
	@override String get disconnecting => 'D茅connexion en cours...';
	@override String get reconnect => 'Reconnecter';
	@override String get reconnectMsg => 'Reconnexion pour prendre en compte les changements...';
	@override String get secure => 'S茅curis茅 par WARP';
}

// Path: errors
class TranslationsErrorsFr extends TranslationsErrorsEn {
	TranslationsErrorsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Erreur inattendue';
	@override late final TranslationsErrorsConnectionFr connection = TranslationsErrorsConnectionFr._(_root);
	@override late final TranslationsErrorsProfilesFr profiles = TranslationsErrorsProfilesFr._(_root);
	@override late final TranslationsErrorsConnectivityFr connectivity = TranslationsErrorsConnectivityFr._(_root);
	@override late final TranslationsErrorsSingboxFr singbox = TranslationsErrorsSingboxFr._(_root);
	@override late final TranslationsErrorsWarpFr warp = TranslationsErrorsWarpFr._(_root);
}

// Path: common.interval
class TranslationsCommonIntervalFr extends TranslationsCommonIntervalEn {
	TranslationsCommonIntervalFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: '',
		one: '${n} jour',
		other: '${n} jours',
	);
	@override String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: '',
		one: '${n} heure',
		other: '${n} heures',
	);
}

// Path: common.msg
class TranslationsCommonMsgFr extends TranslationsCommonMsgEn {
	TranslationsCommonMsgFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgPermissionFr permission = TranslationsCommonMsgPermissionFr._(_root);
	@override late final TranslationsCommonMsgExportFr export = TranslationsCommonMsgExportFr._(_root);
	@override late final TranslationsCommonMsgImportFr import = TranslationsCommonMsgImportFr._(_root);
}

// Path: pages.home
class TranslationsPagesHomeFr extends TranslationsPagesHomeEn {
	TranslationsPagesHomeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Accueil';
	@override String get quickSettings => 'R茅glages rapides';
}

// Path: pages.proxies
class TranslationsPagesProxiesFr extends TranslationsPagesProxiesEn {
	TranslationsPagesProxiesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Proxys';
	@override String get sort => 'Trier les proxys';
	@override String get testDelay => 'Tester le d茅lai';
	@override String get empty => 'Aucun proxy disponible';
	@override String get activeProxy => 'Proxy actif';
	@override String get unknownIp => 'IP inconnue';
	@override late final TranslationsPagesProxiesSortOptionsFr sortOptions = TranslationsPagesProxiesSortOptionsFr._(_root);
	@override late final TranslationsPagesProxiesIpInfoFr ipInfo = TranslationsPagesProxiesIpInfoFr._(_root);
	@override late final TranslationsPagesProxiesDelayFr delay = TranslationsPagesProxiesDelayFr._(_root);
}

// Path: pages.profiles
class TranslationsPagesProfilesFr extends TranslationsPagesProfilesEn {
	TranslationsPagesProfilesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profils';
	@override String get add => 'Ajouter un profil';
	@override String get update => 'Mettre 脿 jour le profil';
	@override String get viewAllProfiles => 'Voir tous les profils';
	@override String activeProfileName({required Object name}) => 'Nom du profil actif : "${name}".';
	@override String nonActiveProfileName({required Object name}) => 'S茅lectionner "${name}" comme profil actif';
	@override String get freeSubNotFound => 'Aucun abonnement gratuit trouv茅';
	@override String freeSubNotFoundForRegion({required Object region}) => 'Aucun abonnement gratuit trouv茅 pour la r茅gion "${region}"';
	@override String get failedToLoad => '脡chec du chargement';
	@override String get updateSubscriptions => 'Mettre 脿 jour les abonnements';
	@override late final TranslationsPagesProfilesShareFr share = TranslationsPagesProfilesShareFr._(_root);
	@override late final TranslationsPagesProfilesMsgFr msg = TranslationsPagesProfilesMsgFr._(_root);
}

// Path: pages.profileDetails
class TranslationsPagesProfileDetailsFr extends TranslationsPagesProfileDetailsEn {
	TranslationsPagesProfileDetailsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override String get lastUpdate => 'Derni猫re mise 脿 jour';
	@override late final TranslationsPagesProfileDetailsFormFr form = TranslationsPagesProfileDetailsFormFr._(_root);
}

// Path: pages.logs
class TranslationsPagesLogsFr extends TranslationsPagesLogsEn {
	TranslationsPagesLogsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Journaux';
	@override String get shareCoreLogs => 'Partager les journaux du noyau';
	@override String get shareAppLogs => 'Partager les journaux de l\'application';
}

// Path: pages.about
class TranslationsPagesAboutFr extends TranslationsPagesAboutEn {
	TranslationsPagesAboutFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => '脌 propos';
	@override String get notAvailableMsg => 'Vous utilisez d茅j脿 la derni猫re version';
	@override String get checkForUpdate => 'V茅rifier les mises 脿 jour';
	@override String get openWorkingDir => 'Ouvrir le r茅pertoire de travail';
	@override String get sourceCode => 'Code source';
	@override String get telegramChannel => 'Canal Telegram';
	@override String get termsAndConditions => 'Conditions d\'utilisation';
	@override String get privacyPolicy => 'Politique de confidentialit茅';
}

// Path: pages.settings
class TranslationsPagesSettingsFr extends TranslationsPagesSettingsEn {
	TranslationsPagesSettingsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Param猫tres';
	@override String get resetTunnel => 'R茅initialiser le profil VPN';
	@override late final TranslationsPagesSettingsOptionsFr options = TranslationsPagesSettingsOptionsFr._(_root);
	@override late final TranslationsPagesSettingsGeneralFr general = TranslationsPagesSettingsGeneralFr._(_root);
	@override late final TranslationsPagesSettingsRoutingFr routing = TranslationsPagesSettingsRoutingFr._(_root);
	@override late final TranslationsPagesSettingsDnsFr dns = TranslationsPagesSettingsDnsFr._(_root);
	@override late final TranslationsPagesSettingsInboundFr inbound = TranslationsPagesSettingsInboundFr._(_root);
	@override late final TranslationsPagesSettingsTlsTricksFr tlsTricks = TranslationsPagesSettingsTlsTricksFr._(_root);
	@override late final TranslationsPagesSettingsWarpFr warp = TranslationsPagesSettingsWarpFr._(_root);
}

// Path: components.stats
class TranslationsComponentsStatsFr extends TranslationsComponentsStatsEn {
	TranslationsComponentsStatsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get connection => 'Connexion';
	@override String get traffic => 'Trafic';
	@override String get trafficLive => 'Trafic en direct';
	@override String get trafficTotal => 'Trafic total';
	@override String get uplink => 'Envoi';
	@override String get downlink => 'R茅ception';
	@override String get speed => 'Vitesse';
	@override String get totalTransferred => 'Total transf茅r茅';
}

// Path: components.subscriptionInfo
class TranslationsComponentsSubscriptionInfoFr extends TranslationsComponentsSubscriptionInfoEn {
	TranslationsComponentsSubscriptionInfoFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get upload => 'Envoi';
	@override String get download => 'T茅l茅chargement';
	@override String get total => 'Trafic total';
	@override String get expireDate => 'Date d\'expiration';
	@override String get expired => 'Expir茅';
	@override String get noTraffic => 'Quota 茅puis茅';
	@override String get remainingTime => 'Temps restant';
	@override String remainingDuration({required Object duration}) => '${duration} jours restants';
	@override String remainingDurationNew({required Object duration}) => '${duration} jours';
	@override String remainingTrafficSemanticLabel({required Object consumed, required Object total}) => '${consumed} sur ${total} de trafic consomm茅';
	@override String get remainingTraffic => 'Trafic restant';
	@override String get remainingUsage => 'Restant';
	@override String get profileSite => 'Fournisseur';
	@override String get profileSupport => 'Support';
}

// Path: dialogs.sortProfiles
class TranslationsDialogsSortProfilesFr extends TranslationsDialogsSortProfilesEn {
	TranslationsDialogsSortProfilesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Trier par';
	@override late final TranslationsDialogsSortProfilesSortFr sort = TranslationsDialogsSortProfilesSortFr._(_root);
}

// Path: dialogs.warpLicense
class TranslationsDialogsWarpLicenseFr extends TranslationsDialogsWarpLicenseEn {
	TranslationsDialogsWarpLicenseFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Consentement Cloudflare WARP';
	@override TextSpan description({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [
		const TextSpan(text: 'Cloudflare WARP est un fournisseur VPN WireGuard gratuit. En activant cette option, vous acceptez les '),
		tos('Conditions d\'utilisation'),
		const TextSpan(text: ' et la '),
		privacy('Politique de confidentialit茅'),
		const TextSpan(text: ' de Cloudflare WARP.'),
	]);
}

// Path: dialogs.newVersion
class TranslationsDialogsNewVersionFr extends TranslationsDialogsNewVersionEn {
	TranslationsDialogsNewVersionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mise 脿 jour disponible';
	@override String get msg => 'Une nouvelle version de ${_root.common.appTitle} est disponible. Voulez-vous mettre 脿 jour maintenant ?';
	@override String get currentVersion => 'Version actuelle : ';
	@override String get newVersion => 'Nouvelle version : ';
	@override String get updateNow => 'Mettre 脿 jour';
}

// Path: dialogs.confirmation
class TranslationsDialogsConfirmationFr extends TranslationsDialogsConfirmationEn {
	TranslationsDialogsConfirmationFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsFr settings = TranslationsDialogsConfirmationSettingsFr._(_root);
	@override late final TranslationsDialogsConfirmationProfileFr profile = TranslationsDialogsConfirmationProfileFr._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyFr perAppProxy = TranslationsDialogsConfirmationPerAppProxyFr._(_root);
	@override late final TranslationsDialogsConfirmationRouteRuleFr routeRule = TranslationsDialogsConfirmationRouteRuleFr._(_root);
}

// Path: dialogs.experimentalNotice
class TranslationsDialogsExperimentalNoticeFr extends TranslationsDialogsExperimentalNoticeEn {
	TranslationsDialogsExperimentalNoticeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fonctionnalit茅s exp茅rimentales en cours d\'utilisation';
	@override String get msg => 'Vous avez activ茅 des fonctionnalit茅s exp茅rimentales qui pourraient affecter la qualit茅 de la connexion et causer des erreurs inattendues. Vous pouvez toujours modifier ou r茅initialiser ces options depuis la page de configuration.';
	@override String get disable => 'Ne plus afficher';
}

// Path: dialogs.noActiveProfile
class TranslationsDialogsNoActiveProfileFr extends TranslationsDialogsNoActiveProfileEn {
	TranslationsDialogsNoActiveProfileFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Choisissez un profil';
	@override String get msg => 'Pour commencer, ajoutez un profil de connexion qui inclut les d茅tails de votre connexion VPN.\n\nVous n\'avez pas encore de serveur VPN ? Pas de probl猫me, suivez le tutoriel ci-dessous pour en configurer un rapidement et gratuitement.';
	@override late final TranslationsDialogsNoActiveProfileHelpBtnFr helpBtn = TranslationsDialogsNoActiveProfileHelpBtnFr._(_root);
}

// Path: dialogs.unknownDomainsWarning
class TranslationsDialogsUnknownDomainsWarningFr extends TranslationsDialogsUnknownDomainsWarningEn {
	TranslationsDialogsUnknownDomainsWarningFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Avertissement de lien externe';
	@override String get youAreAboutToVisit => 'Vous 锚tes sur le point de visiter :';
	@override String get thisWebsiteIsNotInOurTrustedList => 'Ce site web ne figure pas dans notre liste de confiance. Veuillez proc茅der avec prudence.';
}

// Path: dialogs.proxyInfo
class TranslationsDialogsProxyInfoFr extends TranslationsDialogsProxyInfoEn {
	TranslationsDialogsProxyInfoFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get fullTag => 'Tag complet :';
	@override String get type => 'Type :';
	@override String get testTime => 'Heure du test :';
	@override String get testDelay => 'D茅lai du test :';
	@override String get isSelected => 'S茅lectionn茅 :';
	@override String get isGroup => 'Est un groupe';
	@override String get isSecure => 'Est s茅curis茅 :';
	@override String get port => 'Port :';
	@override String get host => 'H么te :';
	@override String get ip => 'IP :';
	@override String get countryCode => 'Code pays :';
	@override String get region => 'R茅gion :';
	@override String get city => 'Ville :';
	@override String get asn => 'ASN :';
	@override String get organization => 'Organisation :';
	@override String get location => 'Emplacement :';
	@override String get postalCode => 'Code postal :';
}

// Path: dialogs.windowClosing
class TranslationsDialogsWindowClosingFr extends TranslationsDialogsWindowClosingEn {
	TranslationsDialogsWindowClosingFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get askEachTime => 'Demander 脿 chaque fois';
	@override String get alertMessage => 'Masquer ou quitter l\'application ?';
	@override String get remember => 'M茅moriser mon choix';
}

// Path: errors.connection
class TranslationsErrorsConnectionFr extends TranslationsErrorsConnectionEn {
	TranslationsErrorsConnectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Erreur de connexion inattendue';
	@override String get timeout => 'D茅lai de connexion expir茅';
	@override String get badResponse => 'Mauvaise r茅ponse';
	@override String get connectionError => 'Erreur de connexion';
	@override String get badCertificate => 'Certificat invalide';
}

// Path: errors.profiles
class TranslationsErrorsProfilesFr extends TranslationsErrorsProfilesEn {
	TranslationsErrorsProfilesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Erreur inattendue';
	@override String get notFound => 'Profil non trouv茅';
	@override String get invalidConfig => 'Configurations invalides';
	@override String get invalidUrl => 'URL invalide';
	@override String get canceledByUser => 'Annul茅 par l\'utilisateur';
}

// Path: errors.connectivity
class TranslationsErrorsConnectivityFr extends TranslationsErrorsConnectivityEn {
	TranslationsErrorsConnectivityFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => '脡chec inattendu';
	@override String get missingVpnPermission => 'Autorisation VPN manquante';
	@override String get missingNotificationPermission => 'Autorisation de notification manquante';
	@override String get core => 'Erreur du noyau';
}

// Path: errors.singbox
class TranslationsErrorsSingboxFr extends TranslationsErrorsSingboxEn {
	TranslationsErrorsSingboxFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get serviceNotRunning => 'Le service n\'est pas en cours d\'ex茅cution';
	@override String get missingPrivilege => 'Autorisation manquante';
	@override String get missingPrivilegeMsg => 'Le mode VPN n茅cessite des droits d\'administrateur. Veuillez relancer l\'application en tant qu\'administrateur ou changer le mode de service.';
	@override String get invalidConfigOptions => 'Options de configuration invalides';
	@override String get invalidConfig => 'Configuration invalide';
}

// Path: errors.warp
class TranslationsErrorsWarpFr extends TranslationsErrorsWarpEn {
	TranslationsErrorsWarpFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get missingLicense => 'Licence WARP manquante';
	@override String get missingLicenseMsg => 'Le profil s茅lectionn茅 utilise la fonctionnalit茅 WARP. Pour utiliser cette fonctionnalit茅, vous devez accepter la licence WARP.';
}

// Path: common.msg.permission
class TranslationsCommonMsgPermissionFr extends TranslationsCommonMsgPermissionEn {
	TranslationsCommonMsgPermissionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get denied => 'Permission refus茅e';
}

// Path: common.msg.export
class TranslationsCommonMsgExportFr extends TranslationsCommonMsgExportEn {
	TranslationsCommonMsgExportFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgExportClipboardFr clipboard = TranslationsCommonMsgExportClipboardFr._(_root);
	@override late final TranslationsCommonMsgExportFileFr file = TranslationsCommonMsgExportFileFr._(_root);
}

// Path: common.msg.import
class TranslationsCommonMsgImportFr extends TranslationsCommonMsgImportEn {
	TranslationsCommonMsgImportFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Confirmer l\'importation';
	@override String get success => 'Import茅 avec succ猫s';
	@override String get failure => '脡chec de l\'importation';
}

// Path: pages.proxies.sortOptions
class TranslationsPagesProxiesSortOptionsFr extends TranslationsPagesProxiesSortOptionsEn {
	TranslationsPagesProxiesSortOptionsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get unsorted => 'Par d茅faut';
	@override String get name => 'Alphab茅tiquement';
	@override String get delay => 'Par latence';
}

// Path: pages.proxies.ipInfo
class TranslationsPagesProxiesIpInfoFr extends TranslationsPagesProxiesIpInfoEn {
	TranslationsPagesProxiesIpInfoFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get address => 'Adresse IP';
	@override String get country => 'Pays';
	@override String get organization => 'Organisation';
}

// Path: pages.proxies.delay
class TranslationsPagesProxiesDelayFr extends TranslationsPagesProxiesDelayEn {
	TranslationsPagesProxiesDelayFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String result({required Object delay}) => 'Latence : ${delay} ms';
	@override String get timeout => 'D茅lai du test de latence expir茅';
	@override String get testing => 'Latence : test en cours...';
}

// Path: pages.profiles.share
class TranslationsPagesProfilesShareFr extends TranslationsPagesProfilesShareEn {
	TranslationsPagesProfilesShareFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get urlToClipboard => 'URL dans le presse-papiers';
	@override String get showUrlQr => 'Afficher le QR code de l\'URL';
	@override String get jsonToClipboard => 'JSON dans le presse-papiers';
}

// Path: pages.profiles.msg
class TranslationsPagesProfilesMsgFr extends TranslationsPagesProfilesMsgEn {
	TranslationsPagesProfilesMsgFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesProfilesMsgSaveFr save = TranslationsPagesProfilesMsgSaveFr._(_root);
	@override String get invalidUrl => 'URL invalide';
	@override late final TranslationsPagesProfilesMsgAddFr add = TranslationsPagesProfilesMsgAddFr._(_root);
	@override late final TranslationsPagesProfilesMsgUpdateFr update = TranslationsPagesProfilesMsgUpdateFr._(_root);
	@override late final TranslationsPagesProfilesMsgDeleteFr delete = TranslationsPagesProfilesMsgDeleteFr._(_root);
}

// Path: pages.profileDetails.form
class TranslationsPagesProfileDetailsFormFr extends TranslationsPagesProfileDetailsFormEn {
	TranslationsPagesProfileDetailsFormFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get nameHint => 'Nom du profil';
	@override String get emptyName => 'Le nom est requis';
	@override String get invalidUrl => 'URL invalide';
	@override String get urlHint => 'URL compl猫te de la configuration';
	@override String get disableAutoUpdate => 'D茅sactiver la mise 脿 jour automatique';
	@override String get autoUpdateInterval => 'Intervalle de mise 脿 jour automatique';
	@override String get loading => 'Ajout du profil...';
}

// Path: pages.settings.options
class TranslationsPagesSettingsOptionsFr extends TranslationsPagesSettingsOptionsEn {
	TranslationsPagesSettingsOptionsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsOptionsImportFr import = TranslationsPagesSettingsOptionsImportFr._(_root);
	@override late final TranslationsPagesSettingsOptionsExportFr export = TranslationsPagesSettingsOptionsExportFr._(_root);
	@override String get reset => 'R茅initialiser les options';
}

// Path: pages.settings.general
class TranslationsPagesSettingsGeneralFr extends TranslationsPagesSettingsGeneralEn {
	TranslationsPagesSettingsGeneralFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'G茅n茅ral';
	@override String get locale => 'Langue';
	@override String get themeMode => 'Th猫me';
	@override late final TranslationsPagesSettingsGeneralThemeModesFr themeModes = TranslationsPagesSettingsGeneralThemeModesFr._(_root);
	@override String get enableAnalytics => 'Activer les statistiques';
	@override String get enableAnalyticsMsg => 'Autoriser la collecte de statistiques et de rapports d\'erreurs pour am茅liorer l\'application';
	@override String get autoIpCheck => 'V茅rifier automatiquement l\'IP de connexion';
	@override String get dynamicNotification => 'Afficher la vitesse dans la notification';
	@override String get hapticFeedback => 'Retour haptique';
	@override String get actionAtClosing => 'Action 脿 la fermeture';
	@override String get autoStart => 'Lancer au d茅marrage';
	@override String get silentStart => 'D茅marrer r茅duit';
	@override String get ignoreBatteryOptimizations => 'D茅sactiver l\'optimisation de la batterie';
	@override String get ignoreBatteryOptimizationsMsg => 'Supprimer les restrictions pour une performance VPN optimale';
	@override String get memoryLimit => 'Limite de m茅moire';
	@override String get memoryLimitMsg => 'Activer si vous rencontrez des erreurs de m茅moire insuffisante ou des plantages fr茅quents de l\'application';
	@override String get debugMode => 'Mode de d茅bogage';
	@override String get debugModeMsg => 'Red茅marrez l\'application pour appliquer cette modification';
	@override String get logLevel => 'Niveau de journalisation';
	@override String get connectionTestUrl => 'URL de test de connexion';
	@override String get urlTestInterval => 'Intervalle de test de l\'URL';
	@override String get clashApiPort => 'Port de l\'API Clash';
	@override String get useXrayCoreWhenPossible => 'Utiliser xray-core si possible';
	@override String get useXrayCoreWhenPossibleMsg => 'Utilisez xray-core lors de l\'analyse des liens d\'abonnement. Vous devez r茅importer le lien pour activer cette option';
}

// Path: pages.settings.routing
class TranslationsPagesSettingsRoutingFr extends TranslationsPagesSettingsRoutingEn {
	TranslationsPagesSettingsRoutingFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Routage';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyFr perAppProxy = TranslationsPagesSettingsRoutingPerAppProxyFr._(_root);
	@override String get region => 'R茅gion';
	@override late final TranslationsPagesSettingsRoutingRegionsFr regions = TranslationsPagesSettingsRoutingRegionsFr._(_root);
	@override late final TranslationsPagesSettingsRoutingBalancerStrategyFr balancerStrategy = TranslationsPagesSettingsRoutingBalancerStrategyFr._(_root);
	@override String get blockAds => 'Bloquer les publicit茅s';
	@override String get bypassLan => 'Contourner le LAN';
	@override String get resolveDestination => 'R茅soudre la destination';
	@override String get ipv6Route => 'Route IPv6';
	@override late final TranslationsPagesSettingsRoutingIpv6ModesFr ipv6Modes = TranslationsPagesSettingsRoutingIpv6ModesFr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleFr routeRule = TranslationsPagesSettingsRoutingRouteRuleFr._(_root);
}

// Path: pages.settings.dns
class TranslationsPagesSettingsDnsFr extends TranslationsPagesSettingsDnsEn {
	TranslationsPagesSettingsDnsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'DNS';
	@override String get remoteDns => 'DNS distant';
	@override String get remoteDnsDomainStrategy => 'Strat茅gie de domaine DNS distant';
	@override String get directDns => 'R茅solveur de serveur sortant (direct)';
	@override String get directDnsDomainStrategy => 'Strat茅gie de domaine sortant';
	@override String get enableDnsRouting => 'Activer le routage DNS';
	@override String get enableFakeDns => 'Activer le faux DNS';
	@override late final TranslationsPagesSettingsDnsDomainStrategyFr domainStrategy = TranslationsPagesSettingsDnsDomainStrategyFr._(_root);
}

// Path: pages.settings.inbound
class TranslationsPagesSettingsInboundFr extends TranslationsPagesSettingsInboundEn {
	TranslationsPagesSettingsInboundFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Entrant';
	@override String get serviceMode => 'Mode de service';
	@override late final TranslationsPagesSettingsInboundServiceModesFr serviceModes = TranslationsPagesSettingsInboundServiceModesFr._(_root);
	@override late final TranslationsPagesSettingsInboundShortServiceModesFr shortServiceModes = TranslationsPagesSettingsInboundShortServiceModesFr._(_root);
	@override String get strictRoute => 'Routage strict';
	@override String get tunImplementation => 'Impl茅mentation TUN';
	@override late final TranslationsPagesSettingsInboundTunImplementationsFr tunImplementations = TranslationsPagesSettingsInboundTunImplementationsFr._(_root);
	@override String get mixedPort => 'Port mixte';
	@override String get tproxyPort => 'Port de proxy transparent';
	@override String get directPort => 'Port direct local';
	@override String get redirectPort => 'Port de redirection';
	@override String get allowConnectionFromLan => 'Partager le VPN sur le r茅seau local';
}

// Path: pages.settings.tlsTricks
class TranslationsPagesSettingsTlsTricksFr extends TranslationsPagesSettingsTlsTricksEn {
	TranslationsPagesSettingsTlsTricksFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Astuces TLS';
	@override String get enable => 'Activer le fragment';
	@override String get packets => 'Paquets de fragmentation';
	@override String get packetsTlsHello => 'TLS Hello';
	@override String get packets1_1 => '1-1';
	@override String get packets1_2 => '1-2';
	@override String get packets1_3 => '1-3';
	@override String get packets1_4 => '1-4';
	@override String get packets1_5 => '1-5';
	@override String get size => 'Taille du fragment';
	@override String get sleep => 'D茅lai du fragment';
	@override late final TranslationsPagesSettingsTlsTricksMixedSniCaseFr mixedSniCase = TranslationsPagesSettingsTlsTricksMixedSniCaseFr._(_root);
	@override late final TranslationsPagesSettingsTlsTricksPaddingFr padding = TranslationsPagesSettingsTlsTricksPaddingFr._(_root);
}

// Path: pages.settings.warp
class TranslationsPagesSettingsWarpFr extends TranslationsPagesSettingsWarpEn {
	TranslationsPagesSettingsWarpFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'WARP';
	@override String get enable => 'Activer WARP';
	@override String get generateConfig => 'G茅n茅rer la configuration WARP';
	@override String get configGenerated => 'Configuration WARP g茅n茅r茅e';
	@override String get missingConfig => 'Configuration WARP manquante';
	@override String get detourMode => 'Mode de d茅tour';
	@override late final TranslationsPagesSettingsWarpDetourModesFr detourModes = TranslationsPagesSettingsWarpDetourModesFr._(_root);
	@override String get licenseKey => 'Cl茅 de licence';
	@override String get cleanIp => 'IP propre';
	@override String get port => 'Port';
	@override late final TranslationsPagesSettingsWarpNoiseFr noise = TranslationsPagesSettingsWarpNoiseFr._(_root);
}

// Path: dialogs.sortProfiles.sort
class TranslationsDialogsSortProfilesSortFr extends TranslationsDialogsSortProfilesSortEn {
	TranslationsDialogsSortProfilesSortFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Alphab茅tiquement';
	@override String get lastUpdate => 'Derni猫re mise 脿 jour';
}

// Path: dialogs.confirmation.settings
class TranslationsDialogsConfirmationSettingsFr extends TranslationsDialogsConfirmationSettingsEn {
	TranslationsDialogsConfirmationSettingsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsImportFr import = TranslationsDialogsConfirmationSettingsImportFr._(_root);
}

// Path: dialogs.confirmation.profile
class TranslationsDialogsConfirmationProfileFr extends TranslationsDialogsConfirmationProfileEn {
	TranslationsDialogsConfirmationProfileFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationProfileDeleteFr delete = TranslationsDialogsConfirmationProfileDeleteFr._(_root);
}

// Path: dialogs.confirmation.perAppProxy
class TranslationsDialogsConfirmationPerAppProxyFr extends TranslationsDialogsConfirmationPerAppProxyEn {
	TranslationsDialogsConfirmationPerAppProxyFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationPerAppProxyShareOnGithubFr shareOnGithub = TranslationsDialogsConfirmationPerAppProxyShareOnGithubFr._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyImportFr import = TranslationsDialogsConfirmationPerAppProxyImportFr._(_root);
}

// Path: dialogs.confirmation.routeRule
class TranslationsDialogsConfirmationRouteRuleFr extends TranslationsDialogsConfirmationRouteRuleEn {
	TranslationsDialogsConfirmationRouteRuleFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationRouteRuleDeleteFr delete = TranslationsDialogsConfirmationRouteRuleDeleteFr._(_root);
}

// Path: dialogs.noActiveProfile.helpBtn
class TranslationsDialogsNoActiveProfileHelpBtnFr extends TranslationsDialogsNoActiveProfileHelpBtnEn {
	TranslationsDialogsNoActiveProfileHelpBtnFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Montrez-moi comment';
	@override String get url => 'https://github.com/shulaiyun/Sloth-VPN.git';
}

// Path: common.msg.export.clipboard
class TranslationsCommonMsgExportClipboardFr extends TranslationsCommonMsgExportClipboardEn {
	TranslationsCommonMsgExportClipboardFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Ajout茅 au presse-papiers avec succ猫s';
	@override String get failure => '脡chec de la copie dans le presse-papiers';
	@override String get contentTooLarge => 'Contenu trop volumineux. Utilisez plut么t l\'exportation de fichier';
}

// Path: common.msg.export.file
class TranslationsCommonMsgExportFileFr extends TranslationsCommonMsgExportFileEn {
	TranslationsCommonMsgExportFileFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Fichier JSON cr茅茅 avec succ猫s';
	@override String get failure => '脡chec de la cr茅ation du fichier';
}

// Path: pages.profiles.msg.save
class TranslationsPagesProfilesMsgSaveFr extends TranslationsPagesProfilesMsgSaveEn {
	TranslationsPagesProfilesMsgSaveFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Profil enregistr茅 avec succ猫s';
}

// Path: pages.profiles.msg.add
class TranslationsPagesProfilesMsgAddFr extends TranslationsPagesProfilesMsgAddEn {
	TranslationsPagesProfilesMsgAddFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get failure => '脡chec de l\'ajout du profil';
}

// Path: pages.profiles.msg.update
class TranslationsPagesProfilesMsgUpdateFr extends TranslationsPagesProfilesMsgUpdateEn {
	TranslationsPagesProfilesMsgUpdateFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Profil mis 脿 jour avec succ猫s';
	@override String successNamed({required Object name}) => '"${name}" a 茅t茅 mis 脿 jour avec succ猫s';
	@override String get failure => '脡chec de la mise 脿 jour du profil';
	@override String failureNamed({required Object name}) => '脡chec de la mise 脿 jour de "${name}"';
}

// Path: pages.profiles.msg.delete
class TranslationsPagesProfilesMsgDeleteFr extends TranslationsPagesProfilesMsgDeleteEn {
	TranslationsPagesProfilesMsgDeleteFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Profil supprim茅 avec succ猫s';
}

// Path: pages.settings.options.import
class TranslationsPagesSettingsOptionsImportFr extends TranslationsPagesSettingsOptionsImportEn {
	TranslationsPagesSettingsOptionsImportFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Importer les options depuis le presse-papiers';
	@override String get file => 'Importer les options depuis un fichier';
}

// Path: pages.settings.options.export
class TranslationsPagesSettingsOptionsExportFr extends TranslationsPagesSettingsOptionsExportEn {
	TranslationsPagesSettingsOptionsExportFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get anonymousToClipboard => 'Copier les options anonymes dans le presse-papiers';
	@override String get anonymousToFile => 'Exporter les options anonymes vers un fichier';
	@override String get allToClipboard => 'Copier toutes les options dans le presse-papiers';
	@override String get allToFile => 'Exporter toutes les options vers un fichier';
}

// Path: pages.settings.general.themeModes
class TranslationsPagesSettingsGeneralThemeModesFr extends TranslationsPagesSettingsGeneralThemeModesEn {
	TranslationsPagesSettingsGeneralThemeModesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Th猫me du syst猫me par d茅faut';
	@override String get dark => 'Mode sombre';
	@override String get light => 'Mode clair';
	@override String get black => 'Mode noir';
}

// Path: pages.settings.routing.perAppProxy
class TranslationsPagesSettingsRoutingPerAppProxyFr extends TranslationsPagesSettingsRoutingPerAppProxyEn {
	TranslationsPagesSettingsRoutingPerAppProxyFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Proxy par application';
	@override String get hideSysApps => 'Masquer les applications syst猫me';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsFr options = TranslationsPagesSettingsRoutingPerAppProxyOptionsFr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyModesFr modes = TranslationsPagesSettingsRoutingPerAppProxyModesFr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionFr autoSelection = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionFr._(_root);
}

// Path: pages.settings.routing.regions
class TranslationsPagesSettingsRoutingRegionsFr extends TranslationsPagesSettingsRoutingRegionsEn {
	TranslationsPagesSettingsRoutingRegionsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get ir => 'Iran (ir)';
	@override String get cn => 'Chine (cn)';
	@override String get ru => 'Russie (ru)';
	@override String get af => 'Afghanistan (af)';
	@override String get id => 'Indon茅sie (id)';
	@override String get tr => 'Turquie (tr)';
	@override String get br => 'Br茅sil (br)';
	@override String get other => 'Autre';
}

// Path: pages.settings.routing.balancerStrategy
class TranslationsPagesSettingsRoutingBalancerStrategyFr extends TranslationsPagesSettingsRoutingBalancerStrategyEn {
	TranslationsPagesSettingsRoutingBalancerStrategyFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Strat茅gie de Balancer';
	@override String get roundRobin => 'Round robin';
	@override String get consistentHash => 'Consistent hash';
	@override String get stickySession => 'Sticky session';
}

// Path: pages.settings.routing.ipv6Modes
class TranslationsPagesSettingsRoutingIpv6ModesFr extends TranslationsPagesSettingsRoutingIpv6ModesEn {
	TranslationsPagesSettingsRoutingIpv6ModesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get disable => 'D茅sactiver';
	@override String get enable => 'Activer';
	@override String get prefer => 'Pr茅f茅r茅';
	@override String get only => 'Uniquement';
}

// Path: pages.settings.routing.routeRule
class TranslationsPagesSettingsRoutingRouteRuleFr extends TranslationsPagesSettingsRoutingRouteRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'R猫gles de routage';
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsFr options = TranslationsPagesSettingsRoutingRouteRuleOptionsFr._(_root);
	@override String get deleteRule => 'Supprimer la r猫gle';
	@override String get createRule => 'Cr茅er une nouvelle r猫gle';
	@override late final TranslationsPagesSettingsRoutingRouteRuleRuleFr rule = TranslationsPagesSettingsRoutingRouteRuleRuleFr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleGenericListFr genericList = TranslationsPagesSettingsRoutingRouteRuleGenericListFr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleAndroidAppsFr androidApps = TranslationsPagesSettingsRoutingRouteRuleAndroidAppsFr._(_root);
}

// Path: pages.settings.dns.domainStrategy
class TranslationsPagesSettingsDnsDomainStrategyFr extends TranslationsPagesSettingsDnsDomainStrategyEn {
	TranslationsPagesSettingsDnsDomainStrategyFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Auto';
	@override String get preferIpv6 => 'Pr茅f茅rer IPv6';
	@override String get preferIpv4 => 'Pr茅f茅rer IPv4';
	@override String get ipv4Only => 'IPv4 uniquement';
	@override String get ipv6Only => 'IPv6 uniquement';
}

// Path: pages.settings.inbound.serviceModes
class TranslationsPagesSettingsInboundServiceModesFr extends TranslationsPagesSettingsInboundServiceModesEn {
	TranslationsPagesSettingsInboundServiceModesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get proxy => 'Service proxy uniquement';
	@override String get systemProxy => 'D茅finir le proxy syst猫me';
	@override String get tun => 'VPN';
	@override String get tunService => 'Service VPN';
}

// Path: pages.settings.inbound.shortServiceModes
class TranslationsPagesSettingsInboundShortServiceModesFr extends TranslationsPagesSettingsInboundShortServiceModesEn {
	TranslationsPagesSettingsInboundShortServiceModesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get proxy => 'Proxy';
	@override String get systemProxy => 'Proxy syst猫me';
	@override String get tun => 'VPN';
	@override String get tunService => 'Service VPN';
}

// Path: pages.settings.inbound.tunImplementations
class TranslationsPagesSettingsInboundTunImplementationsFr extends TranslationsPagesSettingsInboundTunImplementationsEn {
	TranslationsPagesSettingsInboundTunImplementationsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get mixed => 'Mixte';
	@override String get system => 'Syst猫me';
	@override String get gvisor => 'gVisor';
}

// Path: pages.settings.tlsTricks.mixedSniCase
class TranslationsPagesSettingsTlsTricksMixedSniCaseFr extends TranslationsPagesSettingsTlsTricksMixedSniCaseEn {
	TranslationsPagesSettingsTlsTricksMixedSniCaseFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get enable => 'Activer la casse mixte pour SNI';
}

// Path: pages.settings.tlsTricks.padding
class TranslationsPagesSettingsTlsTricksPaddingFr extends TranslationsPagesSettingsTlsTricksPaddingEn {
	TranslationsPagesSettingsTlsTricksPaddingFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get enable => 'Activer le remplissage';
	@override String get size => 'Taille du remplissage';
}

// Path: pages.settings.warp.detourModes
class TranslationsPagesSettingsWarpDetourModesFr extends TranslationsPagesSettingsWarpDetourModesEn {
	TranslationsPagesSettingsWarpDetourModesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get proxyOverWarp => 'D茅tourner les proxys via WARP';
	@override String get warpOverProxy => 'D茅tourner WARP via les proxys';
	@override String get proxyOverWarpExplain => 'D茅bloquer les proxys avec WARP';
	@override String get warpOverProxyExplain => 'S茅curit茅 suppl茅mentaire avec WARP';
}

// Path: pages.settings.warp.noise
class TranslationsPagesSettingsWarpNoiseFr extends TranslationsPagesSettingsWarpNoiseEn {
	TranslationsPagesSettingsWarpNoiseFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get count => 'Nombre de bruits';
	@override String get mode => 'Mode bruit';
	@override String get size => 'Taille du bruit';
	@override String get delay => 'D茅lai du bruit';
}

// Path: dialogs.confirmation.settings.import
class TranslationsDialogsConfirmationSettingsImportFr extends TranslationsDialogsConfirmationSettingsImportEn {
	TranslationsDialogsConfirmationSettingsImportFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get msg => 'Cette action remplacera toutes les options de configuration par les valeurs fournies. 脢tes-vous s没r ?';
}

// Path: dialogs.confirmation.profile.delete
class TranslationsDialogsConfirmationProfileDeleteFr extends TranslationsDialogsConfirmationProfileDeleteEn {
	TranslationsDialogsConfirmationProfileDeleteFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Supprimer le profil';
	@override String get msg => '脢tes-vous s没r de vouloir supprimer ce profil d茅finitivement ?';
}

// Path: dialogs.confirmation.perAppProxy.shareOnGithub
class TranslationsDialogsConfirmationPerAppProxyShareOnGithubFr extends TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn {
	TranslationsDialogsConfirmationPerAppProxyShareOnGithubFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Am茅liorer la s茅lection automatique';
	@override String get msg => 'En partageant les applications s茅lectionn茅es, vous aidez 脿 compl茅ter la liste de "s茅lection automatique"';
}

// Path: dialogs.confirmation.perAppProxy.import
class TranslationsDialogsConfirmationPerAppProxyImportFr extends TranslationsDialogsConfirmationPerAppProxyImportEn {
	TranslationsDialogsConfirmationPerAppProxyImportFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get msg => 'Cette action remplacera toutes vos s茅lections actuelles de proxy par application. 脢tes-vous s没r de vouloir continuer ?';
}

// Path: dialogs.confirmation.routeRule.delete
class TranslationsDialogsConfirmationRouteRuleDeleteFr extends TranslationsDialogsConfirmationRouteRuleDeleteEn {
	TranslationsDialogsConfirmationRouteRuleDeleteFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Supprimer la r猫gle';
	@override String msg({required Object rulename}) => '脢tes-vous s没r de vouloir supprimer la r猫gle "${rulename}" ?';
}

// Path: pages.settings.routing.perAppProxy.options
class TranslationsPagesSettingsRoutingPerAppProxyOptionsFr extends TranslationsPagesSettingsRoutingPerAppProxyOptionsEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsImportFr import = TranslationsPagesSettingsRoutingPerAppProxyOptionsImportFr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsExportFr export = TranslationsPagesSettingsRoutingPerAppProxyOptionsExportFr._(_root);
	@override String get shareToAll => 'Partager avec tous';
	@override String get clearAllSelections => 'Effacer toutes les s茅lections';
}

// Path: pages.settings.routing.perAppProxy.modes
class TranslationsPagesSettingsRoutingPerAppProxyModesFr extends TranslationsPagesSettingsRoutingPerAppProxyModesEn {
	TranslationsPagesSettingsRoutingPerAppProxyModesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get all => 'Toutes';
	@override String get proxy => 'Proxy';
	@override String get bypass => 'Contourner';
	@override String get allMsg => 'Utiliser le proxy pour toutes les applications';
	@override String get proxyMsg => 'Utiliser le proxy uniquement pour les applications s茅lectionn茅es';
	@override String get bypassMsg => 'Ne pas utiliser le proxy pour les applications s茅lectionn茅es';
}

// Path: pages.settings.routing.perAppProxy.autoSelection
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionFr extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'S茅lection automatique';
	@override String get performNow => 'Ex茅cuter maintenant';
	@override String get resetToDefault => 'R茅initialiser par d茅faut';
	@override String get autoUpdateInterval => 'Intervalle de mise 脿 jour automatique';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastFr toast = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastFr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogFr dialog = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogFr._(_root);
}

// Path: pages.settings.routing.routeRule.options
class TranslationsPagesSettingsRoutingRouteRuleOptionsFr extends TranslationsPagesSettingsRoutingRouteRuleOptionsEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsImportFr import = TranslationsPagesSettingsRoutingRouteRuleOptionsImportFr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsExportFr export = TranslationsPagesSettingsRoutingRouteRuleOptionsExportFr._(_root);
	@override String get reset => 'R茅initialiser les r猫gles';
}

// Path: pages.settings.routing.routeRule.rule
class TranslationsPagesSettingsRoutingRouteRuleRuleFr extends TranslationsPagesSettingsRoutingRouteRuleRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleRuleFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'R猫gle';
	@override String get ruleChanged => 'R猫gle modifi茅e';
	@override String get ruleChangedMsg => 'Voulez-vous enregistrer vos modifications ?';
	@override String get onlyTunMode => 'Disponible uniquement en mode TUN';
	@override String get notAvailabeInThisPlatform => 'Non disponible sur cette plateforme';
	@override String get canNotBeEmpty => 'Ne peut pas 锚tre vide';
	@override String get validUrlEx => 'https://example.com';
	@override String get validUrl => '"URL" valide comme\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}';
	@override String get validProcessNameEx => 'Chrome.exe ou google chrome ou chrome';
	@override String get validProcessName => '"Nom de processus" valide comme\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}';
	@override String get validProcessPathEx => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome';
	@override String get validProcessPath => '"Chemin de processus" valide comme\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}';
	@override String get validPortRangeEx => '80 ou 1-65000';
	@override String get validPortRange => '"Port" ou "Plage de ports" valide comme\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}';
	@override String get validIpCidrEx => '8.8.8.8 ou 10.0.0.0/24';
	@override String get validIpCidr => 'IP CIDR valide comme\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}';
	@override String get validDomainEx => 'Google.com ou dl.google.com';
	@override String get validDomain => '"Domaine" valide comme\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}';
	@override String get validDomainSuffixEx => '.com ou .ir';
	@override String get validDomainSuffix => '"Suffixe de domaine" valide comme\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}';
	@override Map<String, String> get tileTitle => {
		'name': 'Nom',
		'outbound': 'Sortie si correspondance',
		'rule_set': 'URL de l\'ensemble de r猫gles',
		'package_name': 'Noms de paquets',
		'process_name': 'Noms de processus',
		'process_path': 'Chemins de processus',
		'network': 'R茅seaux',
		'port_range': 'Ports de destination',
		'source_port_range': 'Ports source',
		'protocol': 'Protocole',
		'ip_cidr': 'IP CIDR de destination',
		'source_ip_cidr': 'IP CIDR source',
		'domain': 'Domaine',
		'domain_suffixe': 'Suffixe de domaine',
		'domain_keyword': 'Mot-cl茅 de domaine',
		'domain_regex': 'Expression r茅guli猫re de domaine',
	};
	@override Map<String, String> get outbound => {
		'proxy': 'Proxy',
		'direct': 'Direct',
		'direct_with_fragment': 'Direct avec fragment',
		'block': 'Bloquer',
	};
	@override Map<String, String> get network => {
		'all': 'Tous',
		'tcp': 'TCP',
		'udp': 'UDP',
	};
	@override Map<String, String> get protocol => {
		'': 'Tous',
		'tls': 'TLS',
		'http': 'HTTP',
		'quic': 'QUIC',
		'stun': 'STUN',
		'dns': 'DNS',
		'bittorrent': 'BitTorrent',
	};
}

// Path: pages.settings.routing.routeRule.genericList
class TranslationsPagesSettingsRoutingRouteRuleGenericListFr extends TranslationsPagesSettingsRoutingRouteRuleGenericListEn {
	TranslationsPagesSettingsRoutingRouteRuleGenericListFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get addNew => 'Ajouter une nouvelle valeur';
	@override String get update => 'Mettre 脿 jour la valeur';
	@override String get clearList => 'Vider la liste';
	@override String get clearListMsg => 'Tous les 茅l茅ments ont 茅t茅 supprim茅s';
}

// Path: pages.settings.routing.routeRule.androidApps
class TranslationsPagesSettingsRoutingRouteRuleAndroidAppsFr extends TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn {
	TranslationsPagesSettingsRoutingRouteRuleAndroidAppsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => 'Applications Android';
	@override String get showSystemApps => 'Afficher les applications syst猫me';
	@override String get hideSystemApps => 'Masquer les applications syst猫me';
	@override String get clearSelection => 'Effacer la s茅lection';
	@override String get uninstalled => 'D茅sinstall茅';
}

// Path: pages.settings.routing.perAppProxy.options.import
class TranslationsPagesSettingsRoutingPerAppProxyOptionsImportFr extends TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsImportFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Importer la s茅lection depuis le presse-papiers';
	@override String get file => 'Importer la s茅lection depuis un fichier';
	@override String get msg => 'L\'importation remplacera vos s茅lections actuelles. 脢tes-vous s没r de vouloir continuer ?';
}

// Path: pages.settings.routing.perAppProxy.options.export
class TranslationsPagesSettingsRoutingPerAppProxyOptionsExportFr extends TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsExportFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Copier la s茅lection dans le presse-papiers';
	@override String get file => 'Exporter la s茅lection vers un fichier';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.toast
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastFr extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get success => 'S茅lection automatique des applications termin茅e avec succ猫s';
	@override String get failure => '脡chec de la s茅lection automatique';
	@override String regionNotFound({required Object region}) => 'S茅lection automatique non trouv茅e pour la r茅gion "${region}"';
	@override String get alreadyInAuto => 'Vos s茅lections sont d茅j脿 dans la liste automatique';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.dialog
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogFr extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'S茅lection automatique des applications';
	@override String msg({required Object region}) => 'La fonction de s茅lection automatique pour le proxy par application a 茅t茅 d茅sactiv茅e en raison du changement de r茅gion vers "${region}"';
}

// Path: pages.settings.routing.routeRule.options.import
class TranslationsPagesSettingsRoutingRouteRuleOptionsImportFr extends TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsImportFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Importer les r猫gles depuis le presse-papiers';
	@override String get file => 'Importer les r猫gles depuis un fichier';
}

// Path: pages.settings.routing.routeRule.options.export
class TranslationsPagesSettingsRoutingRouteRuleOptionsExportFr extends TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsExportFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Copier les r猫gles dans le presse-papiers';
	@override String get file => 'Enregistrer les r猫gles dans un fichier';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appTitle' => '树懒VPN',
			'common.start' => 'Commencer',
			'common.version' => 'Version',
			'common.ok' => 'OK',
			'common.cancel' => 'Annuler',
			'common.kContinue' => 'Continuer',
			'common.showMore' => 'Afficher plus',
			'common.showLess' => 'Afficher moins',
			'common.filter' => 'Filtrer',
			'common.all' => 'Tous',
			'common.pause' => 'Pause',
			'common.resume' => 'Reprendre',
			'common.clear' => 'Effacer',
			'common.close' => 'Fermer',
			'common.auto' => 'Automatique',
			'common.manually' => 'Manuellement',
			'common.name' => 'Nom',
			'common.url' => 'URL',
			'common.add' => 'Ajouter',
			'common.clipboard' => 'Presse-papiers',
			'common.addToClipboard' => 'Ajouter au presse-papiers',
			'common.scanQr' => 'Scanner le QR code',
			'common.free' => 'Gratuit',
			'common.warp' => 'WARP',
			'common.fragment' => 'Fragment',
			'common.help' => 'Aide',
			'common.save' => 'Enregistrer',
			'common.update' => 'Mettre 脿 jour',
			'common.share' => 'Partager',
			'common.edit' => 'Modifier',
			'common.delete' => 'Supprimer',
			'common.discard' => 'Ignorer',
			'common.import' => 'Importer',
			'common.export' => 'Exporter',
			'common.later' => 'Plus tard',
			'common.ignore' => 'Ignorer',
			'common.quit' => 'Quitter',
			'common.notSet' => 'Non d茅fini',
			'common.hide' => 'Masquer',
			'common.exit' => 'Quitter',
			'common.reset' => 'R茅initialiser',
			'common.done' => 'Termin茅',
			'common.search' => 'Rechercher',
			'common.decline' => 'Refuser',
			'common.agree' => 'Accepter',
			'common.empty' => 'Vide',
			'common.unknown' => 'Inconnu',
			'common.hidden' => 'Cach茅',
			'common.timeout' => 'D茅lai expir茅',
			'common.sort' => 'Trier',
			'common.dashboard' => 'Tableau de bord',
			'common.interval.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: '', one: '${n} jour', other: '${n} jours', ), 
			'common.interval.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: '', one: '${n} heure', other: '${n} heures', ), 
			'common.msg.permission.denied' => 'Permission refus茅e',
			'common.msg.export.clipboard.success' => 'Ajout茅 au presse-papiers avec succ猫s',
			'common.msg.export.clipboard.failure' => '脡chec de la copie dans le presse-papiers',
			'common.msg.export.clipboard.contentTooLarge' => 'Contenu trop volumineux. Utilisez plut么t l\'exportation de fichier',
			'common.msg.export.file.success' => 'Fichier JSON cr茅茅 avec succ猫s',
			'common.msg.export.file.failure' => '脡chec de la cr茅ation du fichier',
			'common.msg.import.confirm' => 'Confirmer l\'importation',
			'common.msg.import.success' => 'Import茅 avec succ猫s',
			'common.msg.import.failure' => '脡chec de l\'importation',
			'intro.banner' => 'Tout ce dont vous avez besoin pour un internet sans restrictions',
			'intro.termsAndPolicyCaution' => ({required InlineSpanBuilder tap}) => TextSpan(children: [ const TextSpan(text: 'En continuant, vous acceptez les '), tap(_root.pages.about.termsAndConditions), ]), 
			'intro.info' => ({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [ const TextSpan(text: 'Fait avec 鉂わ笍 par Hiddify - '), tap_source('Open Source'), const TextSpan(text: ' ('), tap_license('Licence'), const TextSpan(text: ')'), ]), 
			'pages.home.title' => 'Accueil',
			'pages.home.quickSettings' => 'R茅glages rapides',
			'pages.proxies.title' => 'Proxys',
			'pages.proxies.sort' => 'Trier les proxys',
			'pages.proxies.testDelay' => 'Tester le d茅lai',
			'pages.proxies.empty' => 'Aucun proxy disponible',
			'pages.proxies.activeProxy' => 'Proxy actif',
			'pages.proxies.unknownIp' => 'IP inconnue',
			'pages.proxies.sortOptions.unsorted' => 'Par d茅faut',
			'pages.proxies.sortOptions.name' => 'Alphab茅tiquement',
			'pages.proxies.sortOptions.delay' => 'Par latence',
			'pages.proxies.ipInfo.address' => 'Adresse IP',
			'pages.proxies.ipInfo.country' => 'Pays',
			'pages.proxies.ipInfo.organization' => 'Organisation',
			'pages.proxies.delay.result' => ({required Object delay}) => 'Latence : ${delay} ms',
			'pages.proxies.delay.timeout' => 'D茅lai du test de latence expir茅',
			'pages.proxies.delay.testing' => 'Latence : test en cours...',
			'pages.profiles.title' => 'Profils',
			'pages.profiles.add' => 'Ajouter un profil',
			'pages.profiles.update' => 'Mettre 脿 jour le profil',
			'pages.profiles.viewAllProfiles' => 'Voir tous les profils',
			'pages.profiles.activeProfileName' => ({required Object name}) => 'Nom du profil actif : "${name}".',
			'pages.profiles.nonActiveProfileName' => ({required Object name}) => 'S茅lectionner "${name}" comme profil actif',
			'pages.profiles.freeSubNotFound' => 'Aucun abonnement gratuit trouv茅',
			'pages.profiles.freeSubNotFoundForRegion' => ({required Object region}) => 'Aucun abonnement gratuit trouv茅 pour la r茅gion "${region}"',
			'pages.profiles.failedToLoad' => '脡chec du chargement',
			'pages.profiles.updateSubscriptions' => 'Mettre 脿 jour les abonnements',
			'pages.profiles.share.urlToClipboard' => 'URL dans le presse-papiers',
			'pages.profiles.share.showUrlQr' => 'Afficher le QR code de l\'URL',
			'pages.profiles.share.jsonToClipboard' => 'JSON dans le presse-papiers',
			'pages.profiles.msg.save.success' => 'Profil enregistr茅 avec succ猫s',
			'pages.profiles.msg.invalidUrl' => 'URL invalide',
			'pages.profiles.msg.add.failure' => '脡chec de l\'ajout du profil',
			'pages.profiles.msg.update.success' => 'Profil mis 脿 jour avec succ猫s',
			'pages.profiles.msg.update.successNamed' => ({required Object name}) => '"${name}" a 茅t茅 mis 脿 jour avec succ猫s',
			'pages.profiles.msg.update.failure' => '脡chec de la mise 脿 jour du profil',
			'pages.profiles.msg.update.failureNamed' => ({required Object name}) => '脡chec de la mise 脿 jour de "${name}"',
			'pages.profiles.msg.delete.success' => 'Profil supprim茅 avec succ猫s',
			'pages.profileDetails.title' => 'Profil',
			'pages.profileDetails.lastUpdate' => 'Derni猫re mise 脿 jour',
			'pages.profileDetails.form.nameHint' => 'Nom du profil',
			'pages.profileDetails.form.emptyName' => 'Le nom est requis',
			'pages.profileDetails.form.invalidUrl' => 'URL invalide',
			'pages.profileDetails.form.urlHint' => 'URL compl猫te de la configuration',
			'pages.profileDetails.form.disableAutoUpdate' => 'D茅sactiver la mise 脿 jour automatique',
			'pages.profileDetails.form.autoUpdateInterval' => 'Intervalle de mise 脿 jour automatique',
			'pages.profileDetails.form.loading' => 'Ajout du profil...',
			'pages.logs.title' => 'Journaux',
			'pages.logs.shareCoreLogs' => 'Partager les journaux du noyau',
			'pages.logs.shareAppLogs' => 'Partager les journaux de l\'application',
			'pages.about.title' => '脌 propos',
			'pages.about.notAvailableMsg' => 'Vous utilisez d茅j脿 la derni猫re version',
			'pages.about.checkForUpdate' => 'V茅rifier les mises 脿 jour',
			'pages.about.openWorkingDir' => 'Ouvrir le r茅pertoire de travail',
			'pages.about.sourceCode' => 'Code source',
			'pages.about.telegramChannel' => 'Canal Telegram',
			'pages.about.termsAndConditions' => 'Conditions d\'utilisation',
			'pages.about.privacyPolicy' => 'Politique de confidentialit茅',
			'pages.settings.title' => 'Param猫tres',
			'pages.settings.resetTunnel' => 'R茅initialiser le profil VPN',
			'pages.settings.options.import.clipboard' => 'Importer les options depuis le presse-papiers',
			'pages.settings.options.import.file' => 'Importer les options depuis un fichier',
			'pages.settings.options.export.anonymousToClipboard' => 'Copier les options anonymes dans le presse-papiers',
			'pages.settings.options.export.anonymousToFile' => 'Exporter les options anonymes vers un fichier',
			'pages.settings.options.export.allToClipboard' => 'Copier toutes les options dans le presse-papiers',
			'pages.settings.options.export.allToFile' => 'Exporter toutes les options vers un fichier',
			'pages.settings.options.reset' => 'R茅initialiser les options',
			'pages.settings.general.title' => 'G茅n茅ral',
			'pages.settings.general.locale' => 'Langue',
			'pages.settings.general.themeMode' => 'Th猫me',
			'pages.settings.general.themeModes.system' => 'Th猫me du syst猫me par d茅faut',
			'pages.settings.general.themeModes.dark' => 'Mode sombre',
			'pages.settings.general.themeModes.light' => 'Mode clair',
			'pages.settings.general.themeModes.black' => 'Mode noir',
			'pages.settings.general.enableAnalytics' => 'Activer les statistiques',
			'pages.settings.general.enableAnalyticsMsg' => 'Autoriser la collecte de statistiques et de rapports d\'erreurs pour am茅liorer l\'application',
			'pages.settings.general.autoIpCheck' => 'V茅rifier automatiquement l\'IP de connexion',
			'pages.settings.general.dynamicNotification' => 'Afficher la vitesse dans la notification',
			'pages.settings.general.hapticFeedback' => 'Retour haptique',
			'pages.settings.general.actionAtClosing' => 'Action 脿 la fermeture',
			'pages.settings.general.autoStart' => 'Lancer au d茅marrage',
			'pages.settings.general.silentStart' => 'D茅marrer r茅duit',
			'pages.settings.general.ignoreBatteryOptimizations' => 'D茅sactiver l\'optimisation de la batterie',
			'pages.settings.general.ignoreBatteryOptimizationsMsg' => 'Supprimer les restrictions pour une performance VPN optimale',
			'pages.settings.general.memoryLimit' => 'Limite de m茅moire',
			'pages.settings.general.memoryLimitMsg' => 'Activer si vous rencontrez des erreurs de m茅moire insuffisante ou des plantages fr茅quents de l\'application',
			'pages.settings.general.debugMode' => 'Mode de d茅bogage',
			'pages.settings.general.debugModeMsg' => 'Red茅marrez l\'application pour appliquer cette modification',
			'pages.settings.general.logLevel' => 'Niveau de journalisation',
			'pages.settings.general.connectionTestUrl' => 'URL de test de connexion',
			'pages.settings.general.urlTestInterval' => 'Intervalle de test de l\'URL',
			'pages.settings.general.clashApiPort' => 'Port de l\'API Clash',
			'pages.settings.general.useXrayCoreWhenPossible' => 'Utiliser xray-core si possible',
			'pages.settings.general.useXrayCoreWhenPossibleMsg' => 'Utilisez xray-core lors de l\'analyse des liens d\'abonnement. Vous devez r茅importer le lien pour activer cette option',
			'pages.settings.routing.title' => 'Routage',
			'pages.settings.routing.perAppProxy.title' => 'Proxy par application',
			'pages.settings.routing.perAppProxy.hideSysApps' => 'Masquer les applications syst猫me',
			'pages.settings.routing.perAppProxy.options.import.clipboard' => 'Importer la s茅lection depuis le presse-papiers',
			'pages.settings.routing.perAppProxy.options.import.file' => 'Importer la s茅lection depuis un fichier',
			'pages.settings.routing.perAppProxy.options.import.msg' => 'L\'importation remplacera vos s茅lections actuelles. 脢tes-vous s没r de vouloir continuer ?',
			'pages.settings.routing.perAppProxy.options.export.clipboard' => 'Copier la s茅lection dans le presse-papiers',
			'pages.settings.routing.perAppProxy.options.export.file' => 'Exporter la s茅lection vers un fichier',
			'pages.settings.routing.perAppProxy.options.shareToAll' => 'Partager avec tous',
			'pages.settings.routing.perAppProxy.options.clearAllSelections' => 'Effacer toutes les s茅lections',
			'pages.settings.routing.perAppProxy.modes.all' => 'Toutes',
			'pages.settings.routing.perAppProxy.modes.proxy' => 'Proxy',
			'pages.settings.routing.perAppProxy.modes.bypass' => 'Contourner',
			'pages.settings.routing.perAppProxy.modes.allMsg' => 'Utiliser le proxy pour toutes les applications',
			'pages.settings.routing.perAppProxy.modes.proxyMsg' => 'Utiliser le proxy uniquement pour les applications s茅lectionn茅es',
			'pages.settings.routing.perAppProxy.modes.bypassMsg' => 'Ne pas utiliser le proxy pour les applications s茅lectionn茅es',
			'pages.settings.routing.perAppProxy.autoSelection.title' => 'S茅lection automatique',
			'pages.settings.routing.perAppProxy.autoSelection.performNow' => 'Ex茅cuter maintenant',
			'pages.settings.routing.perAppProxy.autoSelection.resetToDefault' => 'R茅initialiser par d茅faut',
			'pages.settings.routing.perAppProxy.autoSelection.autoUpdateInterval' => 'Intervalle de mise 脿 jour automatique',
			'pages.settings.routing.perAppProxy.autoSelection.toast.success' => 'S茅lection automatique des applications termin茅e avec succ猫s',
			'pages.settings.routing.perAppProxy.autoSelection.toast.failure' => '脡chec de la s茅lection automatique',
			'pages.settings.routing.perAppProxy.autoSelection.toast.regionNotFound' => ({required Object region}) => 'S茅lection automatique non trouv茅e pour la r茅gion "${region}"',
			'pages.settings.routing.perAppProxy.autoSelection.toast.alreadyInAuto' => 'Vos s茅lections sont d茅j脿 dans la liste automatique',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.title' => 'S茅lection automatique des applications',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.msg' => ({required Object region}) => 'La fonction de s茅lection automatique pour le proxy par application a 茅t茅 d茅sactiv茅e en raison du changement de r茅gion vers "${region}"',
			'pages.settings.routing.region' => 'R茅gion',
			'pages.settings.routing.regions.ir' => 'Iran (ir)',
			'pages.settings.routing.regions.cn' => 'Chine (cn)',
			'pages.settings.routing.regions.ru' => 'Russie (ru)',
			'pages.settings.routing.regions.af' => 'Afghanistan (af)',
			'pages.settings.routing.regions.id' => 'Indon茅sie (id)',
			'pages.settings.routing.regions.tr' => 'Turquie (tr)',
			'pages.settings.routing.regions.br' => 'Br茅sil (br)',
			'pages.settings.routing.regions.other' => 'Autre',
			'pages.settings.routing.balancerStrategy.title' => 'Strat茅gie de Balancer',
			'pages.settings.routing.balancerStrategy.roundRobin' => 'Round robin',
			'pages.settings.routing.balancerStrategy.consistentHash' => 'Consistent hash',
			'pages.settings.routing.balancerStrategy.stickySession' => 'Sticky session',
			'pages.settings.routing.blockAds' => 'Bloquer les publicit茅s',
			'pages.settings.routing.bypassLan' => 'Contourner le LAN',
			'pages.settings.routing.resolveDestination' => 'R茅soudre la destination',
			'pages.settings.routing.ipv6Route' => 'Route IPv6',
			'pages.settings.routing.ipv6Modes.disable' => 'D茅sactiver',
			'pages.settings.routing.ipv6Modes.enable' => 'Activer',
			'pages.settings.routing.ipv6Modes.prefer' => 'Pr茅f茅r茅',
			'pages.settings.routing.ipv6Modes.only' => 'Uniquement',
			'pages.settings.routing.routeRule.title' => 'R猫gles de routage',
			'pages.settings.routing.routeRule.options.import.clipboard' => 'Importer les r猫gles depuis le presse-papiers',
			'pages.settings.routing.routeRule.options.import.file' => 'Importer les r猫gles depuis un fichier',
			'pages.settings.routing.routeRule.options.export.clipboard' => 'Copier les r猫gles dans le presse-papiers',
			'pages.settings.routing.routeRule.options.export.file' => 'Enregistrer les r猫gles dans un fichier',
			'pages.settings.routing.routeRule.options.reset' => 'R茅initialiser les r猫gles',
			'pages.settings.routing.routeRule.deleteRule' => 'Supprimer la r猫gle',
			'pages.settings.routing.routeRule.createRule' => 'Cr茅er une nouvelle r猫gle',
			'pages.settings.routing.routeRule.rule.title' => 'R猫gle',
			'pages.settings.routing.routeRule.rule.ruleChanged' => 'R猫gle modifi茅e',
			'pages.settings.routing.routeRule.rule.ruleChangedMsg' => 'Voulez-vous enregistrer vos modifications ?',
			'pages.settings.routing.routeRule.rule.onlyTunMode' => 'Disponible uniquement en mode TUN',
			'pages.settings.routing.routeRule.rule.notAvailabeInThisPlatform' => 'Non disponible sur cette plateforme',
			'pages.settings.routing.routeRule.rule.canNotBeEmpty' => 'Ne peut pas 锚tre vide',
			'pages.settings.routing.routeRule.rule.validUrlEx' => 'https://example.com',
			'pages.settings.routing.routeRule.rule.validUrl' => '"URL" valide comme\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}',
			'pages.settings.routing.routeRule.rule.validProcessNameEx' => 'Chrome.exe ou google chrome ou chrome',
			'pages.settings.routing.routeRule.rule.validProcessName' => '"Nom de processus" valide comme\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}',
			'pages.settings.routing.routeRule.rule.validProcessPathEx' => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome',
			'pages.settings.routing.routeRule.rule.validProcessPath' => '"Chemin de processus" valide comme\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}',
			'pages.settings.routing.routeRule.rule.validPortRangeEx' => '80 ou 1-65000',
			'pages.settings.routing.routeRule.rule.validPortRange' => '"Port" ou "Plage de ports" valide comme\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}',
			'pages.settings.routing.routeRule.rule.validIpCidrEx' => '8.8.8.8 ou 10.0.0.0/24',
			'pages.settings.routing.routeRule.rule.validIpCidr' => 'IP CIDR valide comme\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}',
			'pages.settings.routing.routeRule.rule.validDomainEx' => 'Google.com ou dl.google.com',
			'pages.settings.routing.routeRule.rule.validDomain' => '"Domaine" valide comme\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}',
			'pages.settings.routing.routeRule.rule.validDomainSuffixEx' => '.com ou .ir',
			'pages.settings.routing.routeRule.rule.validDomainSuffix' => '"Suffixe de domaine" valide comme\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}',
			'pages.settings.routing.routeRule.rule.tileTitle.name' => 'Nom',
			'pages.settings.routing.routeRule.rule.tileTitle.outbound' => 'Sortie si correspondance',
			'pages.settings.routing.routeRule.rule.tileTitle.rule_set' => 'URL de l\'ensemble de r猫gles',
			'pages.settings.routing.routeRule.rule.tileTitle.package_name' => 'Noms de paquets',
			'pages.settings.routing.routeRule.rule.tileTitle.process_name' => 'Noms de processus',
			'pages.settings.routing.routeRule.rule.tileTitle.process_path' => 'Chemins de processus',
			'pages.settings.routing.routeRule.rule.tileTitle.network' => 'R茅seaux',
			'pages.settings.routing.routeRule.rule.tileTitle.port_range' => 'Ports de destination',
			'pages.settings.routing.routeRule.rule.tileTitle.source_port_range' => 'Ports source',
			'pages.settings.routing.routeRule.rule.tileTitle.protocol' => 'Protocole',
			'pages.settings.routing.routeRule.rule.tileTitle.ip_cidr' => 'IP CIDR de destination',
			'pages.settings.routing.routeRule.rule.tileTitle.source_ip_cidr' => 'IP CIDR source',
			'pages.settings.routing.routeRule.rule.tileTitle.domain' => 'Domaine',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_suffixe' => 'Suffixe de domaine',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_keyword' => 'Mot-cl茅 de domaine',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_regex' => 'Expression r茅guli猫re de domaine',
			'pages.settings.routing.routeRule.rule.outbound.proxy' => 'Proxy',
			'pages.settings.routing.routeRule.rule.outbound.direct' => 'Direct',
			'pages.settings.routing.routeRule.rule.outbound.direct_with_fragment' => 'Direct avec fragment',
			'pages.settings.routing.routeRule.rule.outbound.block' => 'Bloquer',
			'pages.settings.routing.routeRule.rule.network.all' => 'Tous',
			'pages.settings.routing.routeRule.rule.network.tcp' => 'TCP',
			'pages.settings.routing.routeRule.rule.network.udp' => 'UDP',
			'pages.settings.routing.routeRule.rule.protocol.' => 'Tous',
			'pages.settings.routing.routeRule.rule.protocol.tls' => 'TLS',
			'pages.settings.routing.routeRule.rule.protocol.http' => 'HTTP',
			'pages.settings.routing.routeRule.rule.protocol.quic' => 'QUIC',
			'pages.settings.routing.routeRule.rule.protocol.stun' => 'STUN',
			'pages.settings.routing.routeRule.rule.protocol.dns' => 'DNS',
			'pages.settings.routing.routeRule.rule.protocol.bittorrent' => 'BitTorrent',
			'pages.settings.routing.routeRule.genericList.addNew' => 'Ajouter une nouvelle valeur',
			'pages.settings.routing.routeRule.genericList.update' => 'Mettre 脿 jour la valeur',
			'pages.settings.routing.routeRule.genericList.clearList' => 'Vider la liste',
			'pages.settings.routing.routeRule.genericList.clearListMsg' => 'Tous les 茅l茅ments ont 茅t茅 supprim茅s',
			'pages.settings.routing.routeRule.androidApps.pageTitle' => 'Applications Android',
			'pages.settings.routing.routeRule.androidApps.showSystemApps' => 'Afficher les applications syst猫me',
			'pages.settings.routing.routeRule.androidApps.hideSystemApps' => 'Masquer les applications syst猫me',
			'pages.settings.routing.routeRule.androidApps.clearSelection' => 'Effacer la s茅lection',
			'pages.settings.routing.routeRule.androidApps.uninstalled' => 'D茅sinstall茅',
			'pages.settings.dns.title' => 'DNS',
			'pages.settings.dns.remoteDns' => 'DNS distant',
			'pages.settings.dns.remoteDnsDomainStrategy' => 'Strat茅gie de domaine DNS distant',
			'pages.settings.dns.directDns' => 'R茅solveur de serveur sortant (direct)',
			'pages.settings.dns.directDnsDomainStrategy' => 'Strat茅gie de domaine sortant',
			'pages.settings.dns.enableDnsRouting' => 'Activer le routage DNS',
			'pages.settings.dns.enableFakeDns' => 'Activer le faux DNS',
			'pages.settings.dns.domainStrategy.auto' => 'Auto',
			'pages.settings.dns.domainStrategy.preferIpv6' => 'Pr茅f茅rer IPv6',
			'pages.settings.dns.domainStrategy.preferIpv4' => 'Pr茅f茅rer IPv4',
			'pages.settings.dns.domainStrategy.ipv4Only' => 'IPv4 uniquement',
			'pages.settings.dns.domainStrategy.ipv6Only' => 'IPv6 uniquement',
			'pages.settings.inbound.title' => 'Entrant',
			'pages.settings.inbound.serviceMode' => 'Mode de service',
			'pages.settings.inbound.serviceModes.proxy' => 'Service proxy uniquement',
			'pages.settings.inbound.serviceModes.systemProxy' => 'D茅finir le proxy syst猫me',
			'pages.settings.inbound.serviceModes.tun' => 'VPN',
			'pages.settings.inbound.serviceModes.tunService' => 'Service VPN',
			'pages.settings.inbound.shortServiceModes.proxy' => 'Proxy',
			'pages.settings.inbound.shortServiceModes.systemProxy' => 'Proxy syst猫me',
			'pages.settings.inbound.shortServiceModes.tun' => 'VPN',
			'pages.settings.inbound.shortServiceModes.tunService' => 'Service VPN',
			'pages.settings.inbound.strictRoute' => 'Routage strict',
			'pages.settings.inbound.tunImplementation' => 'Impl茅mentation TUN',
			'pages.settings.inbound.tunImplementations.mixed' => 'Mixte',
			'pages.settings.inbound.tunImplementations.system' => 'Syst猫me',
			'pages.settings.inbound.tunImplementations.gvisor' => 'gVisor',
			'pages.settings.inbound.mixedPort' => 'Port mixte',
			'pages.settings.inbound.tproxyPort' => 'Port de proxy transparent',
			'pages.settings.inbound.directPort' => 'Port direct local',
			'pages.settings.inbound.redirectPort' => 'Port de redirection',
			'pages.settings.inbound.allowConnectionFromLan' => 'Partager le VPN sur le r茅seau local',
			'pages.settings.tlsTricks.title' => 'Astuces TLS',
			'pages.settings.tlsTricks.enable' => 'Activer le fragment',
			'pages.settings.tlsTricks.packets' => 'Paquets de fragmentation',
			'pages.settings.tlsTricks.packetsTlsHello' => 'TLS Hello',
			'pages.settings.tlsTricks.packets1_1' => '1-1',
			'pages.settings.tlsTricks.packets1_2' => '1-2',
			'pages.settings.tlsTricks.packets1_3' => '1-3',
			'pages.settings.tlsTricks.packets1_4' => '1-4',
			'pages.settings.tlsTricks.packets1_5' => '1-5',
			'pages.settings.tlsTricks.size' => 'Taille du fragment',
			'pages.settings.tlsTricks.sleep' => 'D茅lai du fragment',
			'pages.settings.tlsTricks.mixedSniCase.enable' => 'Activer la casse mixte pour SNI',
			'pages.settings.tlsTricks.padding.enable' => 'Activer le remplissage',
			'pages.settings.tlsTricks.padding.size' => 'Taille du remplissage',
			'pages.settings.warp.title' => 'WARP',
			'pages.settings.warp.enable' => 'Activer WARP',
			'pages.settings.warp.generateConfig' => 'G茅n茅rer la configuration WARP',
			'pages.settings.warp.configGenerated' => 'Configuration WARP g茅n茅r茅e',
			'pages.settings.warp.missingConfig' => 'Configuration WARP manquante',
			'pages.settings.warp.detourMode' => 'Mode de d茅tour',
			'pages.settings.warp.detourModes.proxyOverWarp' => 'D茅tourner les proxys via WARP',
			'pages.settings.warp.detourModes.warpOverProxy' => 'D茅tourner WARP via les proxys',
			'pages.settings.warp.detourModes.proxyOverWarpExplain' => 'D茅bloquer les proxys avec WARP',
			'pages.settings.warp.detourModes.warpOverProxyExplain' => 'S茅curit茅 suppl茅mentaire avec WARP',
			'pages.settings.warp.licenseKey' => 'Cl茅 de licence',
			'pages.settings.warp.cleanIp' => 'IP propre',
			'pages.settings.warp.port' => 'Port',
			'pages.settings.warp.noise.count' => 'Nombre de bruits',
			'pages.settings.warp.noise.mode' => 'Mode bruit',
			'pages.settings.warp.noise.size' => 'Taille du bruit',
			'pages.settings.warp.noise.delay' => 'D茅lai du bruit',
			'components.stats.connection' => 'Connexion',
			'components.stats.traffic' => 'Trafic',
			'components.stats.trafficLive' => 'Trafic en direct',
			'components.stats.trafficTotal' => 'Trafic total',
			'components.stats.uplink' => 'Envoi',
			'components.stats.downlink' => 'R茅ception',
			'components.stats.speed' => 'Vitesse',
			'components.stats.totalTransferred' => 'Total transf茅r茅',
			'components.subscriptionInfo.upload' => 'Envoi',
			'components.subscriptionInfo.download' => 'T茅l茅chargement',
			'components.subscriptionInfo.total' => 'Trafic total',
			'components.subscriptionInfo.expireDate' => 'Date d\'expiration',
			'components.subscriptionInfo.expired' => 'Expir茅',
			'components.subscriptionInfo.noTraffic' => 'Quota 茅puis茅',
			'components.subscriptionInfo.remainingTime' => 'Temps restant',
			'components.subscriptionInfo.remainingDuration' => ({required Object duration}) => '${duration} jours restants',
			'components.subscriptionInfo.remainingDurationNew' => ({required Object duration}) => '${duration} jours',
			'components.subscriptionInfo.remainingTrafficSemanticLabel' => ({required Object consumed, required Object total}) => '${consumed} sur ${total} de trafic consomm茅',
			'components.subscriptionInfo.remainingTraffic' => 'Trafic restant',
			'components.subscriptionInfo.remainingUsage' => 'Restant',
			'components.subscriptionInfo.profileSite' => 'Fournisseur',
			'components.subscriptionInfo.profileSupport' => 'Support',
			'dialogs.sortProfiles.title' => 'Trier par',
			'dialogs.sortProfiles.sort.name' => 'Alphab茅tiquement',
			'dialogs.sortProfiles.sort.lastUpdate' => 'Derni猫re mise 脿 jour',
			'dialogs.warpLicense.title' => 'Consentement Cloudflare WARP',
			'dialogs.warpLicense.description' => ({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [ const TextSpan(text: 'Cloudflare WARP est un fournisseur VPN WireGuard gratuit. En activant cette option, vous acceptez les '), tos('Conditions d\'utilisation'), const TextSpan(text: ' et la '), privacy('Politique de confidentialit茅'), const TextSpan(text: ' de Cloudflare WARP.'), ]), 
			'dialogs.newVersion.title' => 'Mise 脿 jour disponible',
			'dialogs.newVersion.msg' => 'Une nouvelle version de ${_root.common.appTitle} est disponible. Voulez-vous mettre 脿 jour maintenant ?',
			'dialogs.newVersion.currentVersion' => 'Version actuelle : ',
			'dialogs.newVersion.newVersion' => 'Nouvelle version : ',
			'dialogs.newVersion.updateNow' => 'Mettre 脿 jour',
			'dialogs.confirmation.settings.import.msg' => 'Cette action remplacera toutes les options de configuration par les valeurs fournies. 脢tes-vous s没r ?',
			'dialogs.confirmation.profile.delete.title' => 'Supprimer le profil',
			'dialogs.confirmation.profile.delete.msg' => '脢tes-vous s没r de vouloir supprimer ce profil d茅finitivement ?',
			'dialogs.confirmation.perAppProxy.shareOnGithub.title' => 'Am茅liorer la s茅lection automatique',
			'dialogs.confirmation.perAppProxy.shareOnGithub.msg' => 'En partageant les applications s茅lectionn茅es, vous aidez 脿 compl茅ter la liste de "s茅lection automatique"',
			'dialogs.confirmation.perAppProxy.import.msg' => 'Cette action remplacera toutes vos s茅lections actuelles de proxy par application. 脢tes-vous s没r de vouloir continuer ?',
			'dialogs.confirmation.routeRule.delete.title' => 'Supprimer la r猫gle',
			'dialogs.confirmation.routeRule.delete.msg' => ({required Object rulename}) => '脢tes-vous s没r de vouloir supprimer la r猫gle "${rulename}" ?',
			'dialogs.experimentalNotice.title' => 'Fonctionnalit茅s exp茅rimentales en cours d\'utilisation',
			'dialogs.experimentalNotice.msg' => 'Vous avez activ茅 des fonctionnalit茅s exp茅rimentales qui pourraient affecter la qualit茅 de la connexion et causer des erreurs inattendues. Vous pouvez toujours modifier ou r茅initialiser ces options depuis la page de configuration.',
			'dialogs.experimentalNotice.disable' => 'Ne plus afficher',
			'dialogs.noActiveProfile.title' => 'Choisissez un profil',
			'dialogs.noActiveProfile.msg' => 'Pour commencer, ajoutez un profil de connexion qui inclut les d茅tails de votre connexion VPN.\n\nVous n\'avez pas encore de serveur VPN ? Pas de probl猫me, suivez le tutoriel ci-dessous pour en configurer un rapidement et gratuitement.',
			'dialogs.noActiveProfile.helpBtn.label' => 'Montrez-moi comment',
			'dialogs.noActiveProfile.helpBtn.url' => 'https://github.com/shulaiyun/Sloth-VPN.git',
			'dialogs.unknownDomainsWarning.title' => 'Avertissement de lien externe',
			'dialogs.unknownDomainsWarning.youAreAboutToVisit' => 'Vous 锚tes sur le point de visiter :',
			'dialogs.unknownDomainsWarning.thisWebsiteIsNotInOurTrustedList' => 'Ce site web ne figure pas dans notre liste de confiance. Veuillez proc茅der avec prudence.',
			'dialogs.proxyInfo.fullTag' => 'Tag complet :',
			'dialogs.proxyInfo.type' => 'Type :',
			'dialogs.proxyInfo.testTime' => 'Heure du test :',
			'dialogs.proxyInfo.testDelay' => 'D茅lai du test :',
			'dialogs.proxyInfo.isSelected' => 'S茅lectionn茅 :',
			'dialogs.proxyInfo.isGroup' => 'Est un groupe',
			'dialogs.proxyInfo.isSecure' => 'Est s茅curis茅 :',
			'dialogs.proxyInfo.port' => 'Port :',
			'dialogs.proxyInfo.host' => 'H么te :',
			'dialogs.proxyInfo.ip' => 'IP :',
			'dialogs.proxyInfo.countryCode' => 'Code pays :',
			'dialogs.proxyInfo.region' => 'R茅gion :',
			'dialogs.proxyInfo.city' => 'Ville :',
			'dialogs.proxyInfo.asn' => 'ASN :',
			'dialogs.proxyInfo.organization' => 'Organisation :',
			'dialogs.proxyInfo.location' => 'Emplacement :',
			'dialogs.proxyInfo.postalCode' => 'Code postal :',
			'dialogs.windowClosing.askEachTime' => 'Demander 脿 chaque fois',
			'dialogs.windowClosing.alertMessage' => 'Masquer ou quitter l\'application ?',
			'dialogs.windowClosing.remember' => 'M茅moriser mon choix',
			'connection.tapToConnect' => 'Appuyez pour vous connecter',
			'connection.connect' => 'Connecter',
			'connection.connecting' => 'Connexion en cours...',
			'connection.connected' => 'Connect茅',
			'connection.disconnect' => 'D茅connecter',
			'connection.disconnecting' => 'D茅connexion en cours...',
			'connection.reconnect' => 'Reconnecter',
			'connection.reconnectMsg' => 'Reconnexion pour prendre en compte les changements...',
			'connection.secure' => 'S茅curis茅 par WARP',
			'errors.unexpected' => 'Erreur inattendue',
			'errors.connection.unexpected' => 'Erreur de connexion inattendue',
			'errors.connection.timeout' => 'D茅lai de connexion expir茅',
			'errors.connection.badResponse' => 'Mauvaise r茅ponse',
			'errors.connection.connectionError' => 'Erreur de connexion',
			'errors.connection.badCertificate' => 'Certificat invalide',
			'errors.profiles.unexpected' => 'Erreur inattendue',
			'errors.profiles.notFound' => 'Profil non trouv茅',
			'errors.profiles.invalidConfig' => 'Configurations invalides',
			'errors.profiles.invalidUrl' => 'URL invalide',
			'errors.profiles.canceledByUser' => 'Annul茅 par l\'utilisateur',
			'errors.connectivity.unexpected' => '脡chec inattendu',
			'errors.connectivity.missingVpnPermission' => 'Autorisation VPN manquante',
			'errors.connectivity.missingNotificationPermission' => 'Autorisation de notification manquante',
			'errors.connectivity.core' => 'Erreur du noyau',
			'errors.singbox.serviceNotRunning' => 'Le service n\'est pas en cours d\'ex茅cution',
			'errors.singbox.missingPrivilege' => 'Autorisation manquante',
			'errors.singbox.missingPrivilegeMsg' => 'Le mode VPN n茅cessite des droits d\'administrateur. Veuillez relancer l\'application en tant qu\'administrateur ou changer le mode de service.',
			'errors.singbox.invalidConfigOptions' => 'Options de configuration invalides',
			'errors.singbox.invalidConfig' => 'Configuration invalide',
			'errors.warp.missingLicense' => 'Licence WARP manquante',
			'errors.warp.missingLicenseMsg' => 'Le profil s茅lectionn茅 utilise la fonctionnalit茅 WARP. Pour utiliser cette fonctionnalit茅, vous devez accepter la licence WARP.',
			_ => null,
		};
	}
}

