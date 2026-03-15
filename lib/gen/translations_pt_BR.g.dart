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
class TranslationsPtBr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPtBr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ptBr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt-BR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsPtBr _root = this; // ignore: unused_field

	@override 
	TranslationsPtBr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPtBr(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonPtBr common = TranslationsCommonPtBr._(_root);
	@override late final TranslationsIntroPtBr intro = TranslationsIntroPtBr._(_root);
	@override late final TranslationsPagesPtBr pages = TranslationsPagesPtBr._(_root);
	@override late final TranslationsComponentsPtBr components = TranslationsComponentsPtBr._(_root);
	@override late final TranslationsDialogsPtBr dialogs = TranslationsDialogsPtBr._(_root);
	@override late final TranslationsConnectionPtBr connection = TranslationsConnectionPtBr._(_root);
	@override late final TranslationsErrorsPtBr errors = TranslationsErrorsPtBr._(_root);
}

// Path: common
class TranslationsCommonPtBr extends TranslationsCommonEn {
	TranslationsCommonPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get appTitle => '树懒VPN';
	@override String get start => 'Come莽ar';
	@override String get version => 'Vers茫o';
	@override String get ok => 'OK';
	@override String get cancel => 'Cancelar';
	@override String get kContinue => 'Continuar';
	@override String get showMore => 'Mostrar mais';
	@override String get showLess => 'Mostrar menos';
	@override String get filter => 'Filtrar';
	@override String get all => 'Todos';
	@override String get pause => 'Pausar';
	@override String get resume => 'Retomar';
	@override String get clear => 'Limpar';
	@override String get close => 'Fechar';
	@override String get auto => 'Autom谩tico';
	@override String get manually => 'Manualmente';
	@override String get name => 'Nome';
	@override String get url => 'URL';
	@override String get add => 'Adicionar';
	@override String get clipboard => '脕rea de transfer锚ncia';
	@override String get addToClipboard => 'Adicionar 脿 谩rea de transfer锚ncia';
	@override String get scanQr => 'Escanear QR';
	@override String get free => 'Gr谩tis';
	@override String get warp => 'WARP';
	@override String get fragment => 'Fragmento';
	@override String get help => 'Ajuda';
	@override String get save => 'Salvar';
	@override String get update => 'Atualizar';
	@override String get share => 'Compartilhar';
	@override String get edit => 'Editar';
	@override String get delete => 'Excluir';
	@override String get discard => 'Descartar';
	@override String get import => 'Importar';
	@override String get export => 'Exportar';
	@override String get later => 'Mais tarde';
	@override String get ignore => 'Ignorar';
	@override String get quit => 'Sair';
	@override String get notSet => 'N茫o definido';
	@override String get hide => 'Ocultar';
	@override String get exit => 'Sair';
	@override String get reset => 'Redefinir';
	@override String get done => 'Conclu铆do';
	@override String get search => 'Buscar';
	@override String get decline => 'Recusar';
	@override String get agree => 'Aceitar';
	@override String get empty => 'Vazio';
	@override String get unknown => 'Desconhecido';
	@override String get hidden => 'Oculto';
	@override String get timeout => 'Tempo esgotado';
	@override String get sort => 'Ordenar';
	@override String get dashboard => 'Painel';
	@override late final TranslationsCommonIntervalPtBr interval = TranslationsCommonIntervalPtBr._(_root);
	@override late final TranslationsCommonMsgPtBr msg = TranslationsCommonMsgPtBr._(_root);
}

// Path: intro
class TranslationsIntroPtBr extends TranslationsIntroEn {
	TranslationsIntroPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get banner => 'Tudo o que voc锚 precisa para uma internet sem restri莽玫es';
	@override TextSpan termsAndPolicyCaution({required InlineSpanBuilder tap}) => TextSpan(children: [
		const TextSpan(text: 'Ao continuar, voc锚 concorda com os '),
		tap(_root.pages.about.termsAndConditions),
	]);
	@override TextSpan info({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [
		const TextSpan(text: 'Feito com 鉂わ笍 por Hiddify - '),
		tap_source('C贸digo Aberto'),
		const TextSpan(text: ' ('),
		tap_license('Licen莽a'),
		const TextSpan(text: ')'),
	]);
}

// Path: pages
class TranslationsPagesPtBr extends TranslationsPagesEn {
	TranslationsPagesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesHomePtBr home = TranslationsPagesHomePtBr._(_root);
	@override late final TranslationsPagesProxiesPtBr proxies = TranslationsPagesProxiesPtBr._(_root);
	@override late final TranslationsPagesProfilesPtBr profiles = TranslationsPagesProfilesPtBr._(_root);
	@override late final TranslationsPagesProfileDetailsPtBr profileDetails = TranslationsPagesProfileDetailsPtBr._(_root);
	@override late final TranslationsPagesLogsPtBr logs = TranslationsPagesLogsPtBr._(_root);
	@override late final TranslationsPagesAboutPtBr about = TranslationsPagesAboutPtBr._(_root);
	@override late final TranslationsPagesSettingsPtBr settings = TranslationsPagesSettingsPtBr._(_root);
}

// Path: components
class TranslationsComponentsPtBr extends TranslationsComponentsEn {
	TranslationsComponentsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsComponentsStatsPtBr stats = TranslationsComponentsStatsPtBr._(_root);
	@override late final TranslationsComponentsSubscriptionInfoPtBr subscriptionInfo = TranslationsComponentsSubscriptionInfoPtBr._(_root);
}

// Path: dialogs
class TranslationsDialogsPtBr extends TranslationsDialogsEn {
	TranslationsDialogsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsSortProfilesPtBr sortProfiles = TranslationsDialogsSortProfilesPtBr._(_root);
	@override late final TranslationsDialogsWarpLicensePtBr warpLicense = TranslationsDialogsWarpLicensePtBr._(_root);
	@override late final TranslationsDialogsNewVersionPtBr newVersion = TranslationsDialogsNewVersionPtBr._(_root);
	@override late final TranslationsDialogsConfirmationPtBr confirmation = TranslationsDialogsConfirmationPtBr._(_root);
	@override late final TranslationsDialogsExperimentalNoticePtBr experimentalNotice = TranslationsDialogsExperimentalNoticePtBr._(_root);
	@override late final TranslationsDialogsNoActiveProfilePtBr noActiveProfile = TranslationsDialogsNoActiveProfilePtBr._(_root);
	@override late final TranslationsDialogsUnknownDomainsWarningPtBr unknownDomainsWarning = TranslationsDialogsUnknownDomainsWarningPtBr._(_root);
	@override late final TranslationsDialogsProxyInfoPtBr proxyInfo = TranslationsDialogsProxyInfoPtBr._(_root);
	@override late final TranslationsDialogsWindowClosingPtBr windowClosing = TranslationsDialogsWindowClosingPtBr._(_root);
}

// Path: connection
class TranslationsConnectionPtBr extends TranslationsConnectionEn {
	TranslationsConnectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get tapToConnect => 'Toque para conectar';
	@override String get connect => 'Conectar';
	@override String get connecting => 'Conectando...';
	@override String get connected => 'Conectado';
	@override String get disconnect => 'Desconectar';
	@override String get disconnecting => 'Desconectando...';
	@override String get reconnect => 'Reconectar';
	@override String get reconnectMsg => 'Reconectando para aplicar as altera莽玫es...';
	@override String get secure => 'Protegido por WARP';
}

// Path: errors
class TranslationsErrorsPtBr extends TranslationsErrorsEn {
	TranslationsErrorsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Erro inesperado';
	@override late final TranslationsErrorsConnectionPtBr connection = TranslationsErrorsConnectionPtBr._(_root);
	@override late final TranslationsErrorsProfilesPtBr profiles = TranslationsErrorsProfilesPtBr._(_root);
	@override late final TranslationsErrorsConnectivityPtBr connectivity = TranslationsErrorsConnectivityPtBr._(_root);
	@override late final TranslationsErrorsSingboxPtBr singbox = TranslationsErrorsSingboxPtBr._(_root);
	@override late final TranslationsErrorsWarpPtBr warp = TranslationsErrorsWarpPtBr._(_root);
}

// Path: common.interval
class TranslationsCommonIntervalPtBr extends TranslationsCommonIntervalEn {
	TranslationsCommonIntervalPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		zero: '',
		one: '${n} dia',
		other: '${n} dias',
	);
	@override String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n,
		zero: '',
		one: '${n} hora',
		other: '${n} horas',
	);
}

// Path: common.msg
class TranslationsCommonMsgPtBr extends TranslationsCommonMsgEn {
	TranslationsCommonMsgPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgPermissionPtBr permission = TranslationsCommonMsgPermissionPtBr._(_root);
	@override late final TranslationsCommonMsgExportPtBr export = TranslationsCommonMsgExportPtBr._(_root);
	@override late final TranslationsCommonMsgImportPtBr import = TranslationsCommonMsgImportPtBr._(_root);
}

// Path: pages.home
class TranslationsPagesHomePtBr extends TranslationsPagesHomeEn {
	TranslationsPagesHomePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'In铆cio';
	@override String get quickSettings => 'Configura莽玫es r谩pidas';
}

// Path: pages.proxies
class TranslationsPagesProxiesPtBr extends TranslationsPagesProxiesEn {
	TranslationsPagesProxiesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Proxies';
	@override String get sort => 'Ordenar proxies';
	@override String get testDelay => 'Testar lat锚ncia';
	@override String get empty => 'Nenhum proxy dispon铆vel';
	@override String get activeProxy => 'Proxy ativo';
	@override String get unknownIp => 'IP desconhecido';
	@override late final TranslationsPagesProxiesSortOptionsPtBr sortOptions = TranslationsPagesProxiesSortOptionsPtBr._(_root);
	@override late final TranslationsPagesProxiesIpInfoPtBr ipInfo = TranslationsPagesProxiesIpInfoPtBr._(_root);
	@override late final TranslationsPagesProxiesDelayPtBr delay = TranslationsPagesProxiesDelayPtBr._(_root);
}

// Path: pages.profiles
class TranslationsPagesProfilesPtBr extends TranslationsPagesProfilesEn {
	TranslationsPagesProfilesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Perfis';
	@override String get add => 'Adicionar perfil';
	@override String get update => 'Atualizar perfil';
	@override String get viewAllProfiles => 'Ver todos os perfis';
	@override String activeProfileName({required Object name}) => 'Nome do perfil ativo: "${name}".';
	@override String nonActiveProfileName({required Object name}) => 'Selecionar "${name}" como perfil ativo';
	@override String get freeSubNotFound => 'Nenhuma assinatura gratuita encontrada';
	@override String freeSubNotFoundForRegion({required Object region}) => 'Nenhuma assinatura gratuita encontrada para a regi茫o "${region}"';
	@override String get failedToLoad => 'Falha ao carregar';
	@override String get updateSubscriptions => 'Atualizar assinaturas';
	@override late final TranslationsPagesProfilesSharePtBr share = TranslationsPagesProfilesSharePtBr._(_root);
	@override late final TranslationsPagesProfilesMsgPtBr msg = TranslationsPagesProfilesMsgPtBr._(_root);
}

// Path: pages.profileDetails
class TranslationsPagesProfileDetailsPtBr extends TranslationsPagesProfileDetailsEn {
	TranslationsPagesProfileDetailsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Perfil';
	@override String get lastUpdate => '脷ltima atualiza莽茫o';
	@override late final TranslationsPagesProfileDetailsFormPtBr form = TranslationsPagesProfileDetailsFormPtBr._(_root);
}

// Path: pages.logs
class TranslationsPagesLogsPtBr extends TranslationsPagesLogsEn {
	TranslationsPagesLogsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Registros';
	@override String get shareCoreLogs => 'Compartilhar registros do n煤cleo';
	@override String get shareAppLogs => 'Compartilhar registros do aplicativo';
}

// Path: pages.about
class TranslationsPagesAboutPtBr extends TranslationsPagesAboutEn {
	TranslationsPagesAboutPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sobre';
	@override String get notAvailableMsg => 'Voc锚 j谩 est谩 usando a vers茫o mais recente';
	@override String get checkForUpdate => 'Verificar atualiza莽玫es';
	@override String get openWorkingDir => 'Abrir diret贸rio de trabalho';
	@override String get sourceCode => 'C贸digo-fonte';
	@override String get telegramChannel => 'Canal do Telegram';
	@override String get termsAndConditions => 'Termos e Condi莽玫es';
	@override String get privacyPolicy => 'Pol铆tica de Privacidade';
}

// Path: pages.settings
class TranslationsPagesSettingsPtBr extends TranslationsPagesSettingsEn {
	TranslationsPagesSettingsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Configura莽玫es';
	@override String get resetTunnel => 'Redefinir perfil de VPN';
	@override late final TranslationsPagesSettingsOptionsPtBr options = TranslationsPagesSettingsOptionsPtBr._(_root);
	@override late final TranslationsPagesSettingsGeneralPtBr general = TranslationsPagesSettingsGeneralPtBr._(_root);
	@override late final TranslationsPagesSettingsRoutingPtBr routing = TranslationsPagesSettingsRoutingPtBr._(_root);
	@override late final TranslationsPagesSettingsDnsPtBr dns = TranslationsPagesSettingsDnsPtBr._(_root);
	@override late final TranslationsPagesSettingsInboundPtBr inbound = TranslationsPagesSettingsInboundPtBr._(_root);
	@override late final TranslationsPagesSettingsTlsTricksPtBr tlsTricks = TranslationsPagesSettingsTlsTricksPtBr._(_root);
	@override late final TranslationsPagesSettingsWarpPtBr warp = TranslationsPagesSettingsWarpPtBr._(_root);
}

// Path: components.stats
class TranslationsComponentsStatsPtBr extends TranslationsComponentsStatsEn {
	TranslationsComponentsStatsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get connection => 'Conex茫o';
	@override String get traffic => 'Tr谩fego';
	@override String get trafficLive => 'Tr谩fego ao vivo';
	@override String get trafficTotal => 'Tr谩fego total';
	@override String get uplink => 'Envio';
	@override String get downlink => 'Recebimento';
	@override String get speed => 'Velocidade';
	@override String get totalTransferred => 'Total transferido';
}

// Path: components.subscriptionInfo
class TranslationsComponentsSubscriptionInfoPtBr extends TranslationsComponentsSubscriptionInfoEn {
	TranslationsComponentsSubscriptionInfoPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get upload => 'Upload';
	@override String get download => 'Download';
	@override String get total => 'Tr谩fego total';
	@override String get expireDate => 'Data de validade';
	@override String get expired => 'Expirado';
	@override String get noTraffic => 'Cota esgotada';
	@override String get remainingTime => 'Tempo restante';
	@override String remainingDuration({required Object duration}) => '${duration} dias restantes';
	@override String remainingDurationNew({required Object duration}) => '${duration} dias';
	@override String remainingTrafficSemanticLabel({required Object consumed, required Object total}) => '${consumed} de ${total} de tr谩fego consumido';
	@override String get remainingTraffic => 'Tr谩fego restante';
	@override String get remainingUsage => 'Restante';
	@override String get profileSite => 'Provedor';
	@override String get profileSupport => 'Suporte';
}

// Path: dialogs.sortProfiles
class TranslationsDialogsSortProfilesPtBr extends TranslationsDialogsSortProfilesEn {
	TranslationsDialogsSortProfilesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ordenar por';
	@override late final TranslationsDialogsSortProfilesSortPtBr sort = TranslationsDialogsSortProfilesSortPtBr._(_root);
}

// Path: dialogs.warpLicense
class TranslationsDialogsWarpLicensePtBr extends TranslationsDialogsWarpLicenseEn {
	TranslationsDialogsWarpLicensePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Consentimento do Cloudflare WARP';
	@override TextSpan description({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [
		const TextSpan(text: 'O Cloudflare WARP 茅 um provedor de VPN WireGuard gratuito. Ao ativar esta op莽茫o, voc锚 concorda com os '),
		tos('Termos de Servi莽o'),
		const TextSpan(text: ' e a '),
		privacy('Pol铆tica de Privacidade'),
		const TextSpan(text: ' do Cloudflare WARP.'),
	]);
}

// Path: dialogs.newVersion
class TranslationsDialogsNewVersionPtBr extends TranslationsDialogsNewVersionEn {
	TranslationsDialogsNewVersionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Atualiza莽茫o dispon铆vel';
	@override String get msg => 'Uma nova vers茫o do ${_root.common.appTitle} est谩 dispon铆vel. Deseja atualizar agora?';
	@override String get currentVersion => 'Vers茫o atual: ';
	@override String get newVersion => 'Nova vers茫o: ';
	@override String get updateNow => 'Atualizar agora';
}

// Path: dialogs.confirmation
class TranslationsDialogsConfirmationPtBr extends TranslationsDialogsConfirmationEn {
	TranslationsDialogsConfirmationPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsPtBr settings = TranslationsDialogsConfirmationSettingsPtBr._(_root);
	@override late final TranslationsDialogsConfirmationProfilePtBr profile = TranslationsDialogsConfirmationProfilePtBr._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyPtBr perAppProxy = TranslationsDialogsConfirmationPerAppProxyPtBr._(_root);
	@override late final TranslationsDialogsConfirmationRouteRulePtBr routeRule = TranslationsDialogsConfirmationRouteRulePtBr._(_root);
}

// Path: dialogs.experimentalNotice
class TranslationsDialogsExperimentalNoticePtBr extends TranslationsDialogsExperimentalNoticeEn {
	TranslationsDialogsExperimentalNoticePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recursos experimentais em uso';
	@override String get msg => 'Voc锚 ativou alguns recursos experimentais que podem afetar a qualidade da conex茫o e causar erros inesperados. Voc锚 sempre pode alterar ou redefinir essas op莽玫es na p谩gina de configura莽玫es.';
	@override String get disable => 'N茫o mostrar novamente';
}

// Path: dialogs.noActiveProfile
class TranslationsDialogsNoActiveProfilePtBr extends TranslationsDialogsNoActiveProfileEn {
	TranslationsDialogsNoActiveProfilePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Escolha um perfil';
	@override String get msg => 'Para come莽ar, adicione um perfil de conex茫o que inclua os detalhes da sua conex茫o VPN.\n\nAinda n茫o tem um servidor VPN? N茫o se preocupe, siga o tutorial abaixo para configurar um rapidamente e de gra莽a.';
	@override late final TranslationsDialogsNoActiveProfileHelpBtnPtBr helpBtn = TranslationsDialogsNoActiveProfileHelpBtnPtBr._(_root);
}

// Path: dialogs.unknownDomainsWarning
class TranslationsDialogsUnknownDomainsWarningPtBr extends TranslationsDialogsUnknownDomainsWarningEn {
	TranslationsDialogsUnknownDomainsWarningPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aviso de link externo';
	@override String get youAreAboutToVisit => 'Voc锚 est谩 prestes a visitar:';
	@override String get thisWebsiteIsNotInOurTrustedList => 'Este site n茫o est谩 na nossa lista de confian莽a. Prossiga com cautela.';
}

// Path: dialogs.proxyInfo
class TranslationsDialogsProxyInfoPtBr extends TranslationsDialogsProxyInfoEn {
	TranslationsDialogsProxyInfoPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get fullTag => 'Tag completa:';
	@override String get type => 'Tipo:';
	@override String get testTime => 'Hora do teste:';
	@override String get testDelay => 'Lat锚ncia do teste:';
	@override String get isSelected => 'Selecionado:';
	@override String get isGroup => '脡 um grupo';
	@override String get isSecure => '脡 seguro:';
	@override String get port => 'Porta:';
	@override String get host => 'Host:';
	@override String get ip => 'IP:';
	@override String get countryCode => 'C贸digo do pa铆s:';
	@override String get region => 'Regi茫o:';
	@override String get city => 'Cidade:';
	@override String get asn => 'ASN:';
	@override String get organization => 'Organiza莽茫o:';
	@override String get location => 'Localiza莽茫o:';
	@override String get postalCode => 'C贸digo postal:';
}

// Path: dialogs.windowClosing
class TranslationsDialogsWindowClosingPtBr extends TranslationsDialogsWindowClosingEn {
	TranslationsDialogsWindowClosingPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get askEachTime => 'Perguntar sempre';
	@override String get alertMessage => 'Ocultar ou sair do aplicativo?';
	@override String get remember => 'Lembrar minha escolha';
}

// Path: errors.connection
class TranslationsErrorsConnectionPtBr extends TranslationsErrorsConnectionEn {
	TranslationsErrorsConnectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Erro de conex茫o inesperado';
	@override String get timeout => 'Tempo limite de conex茫o esgotado';
	@override String get badResponse => 'Resposta inv谩lida';
	@override String get connectionError => 'Erro de conex茫o';
	@override String get badCertificate => 'Certificado inv谩lido';
}

// Path: errors.profiles
class TranslationsErrorsProfilesPtBr extends TranslationsErrorsProfilesEn {
	TranslationsErrorsProfilesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Erro inesperado';
	@override String get notFound => 'Perfil n茫o encontrado';
	@override String get invalidConfig => 'Configura莽玫es inv谩lidas';
	@override String get invalidUrl => 'URL inv谩lida';
	@override String get canceledByUser => 'Cancelado pelo usu谩rio';
}

// Path: errors.connectivity
class TranslationsErrorsConnectivityPtBr extends TranslationsErrorsConnectivityEn {
	TranslationsErrorsConnectivityPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Falha inesperada';
	@override String get missingVpnPermission => 'Permiss茫o de VPN ausente';
	@override String get missingNotificationPermission => 'Permiss茫o de notifica莽茫o ausente';
	@override String get core => 'Erro no n煤cleo';
}

// Path: errors.singbox
class TranslationsErrorsSingboxPtBr extends TranslationsErrorsSingboxEn {
	TranslationsErrorsSingboxPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get serviceNotRunning => 'O servi莽o n茫o est谩 em execu莽茫o';
	@override String get missingPrivilege => 'Permiss茫o ausente';
	@override String get missingPrivilegeMsg => 'O modo VPN requer privil茅gios de administrador. Reinicie o aplicativo como administrador ou altere o modo de servi莽o.';
	@override String get invalidConfigOptions => 'Op莽玫es de configura莽茫o inv谩lidas';
	@override String get invalidConfig => 'Configura莽茫o inv谩lida';
}

// Path: errors.warp
class TranslationsErrorsWarpPtBr extends TranslationsErrorsWarpEn {
	TranslationsErrorsWarpPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get missingLicense => 'Licen莽a do WARP ausente';
	@override String get missingLicenseMsg => 'O perfil selecionado usa o recurso WARP. Para usar este recurso, voc锚 deve concordar com a licen莽a do WARP.';
}

// Path: common.msg.permission
class TranslationsCommonMsgPermissionPtBr extends TranslationsCommonMsgPermissionEn {
	TranslationsCommonMsgPermissionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get denied => 'Permiss茫o negada';
}

// Path: common.msg.export
class TranslationsCommonMsgExportPtBr extends TranslationsCommonMsgExportEn {
	TranslationsCommonMsgExportPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgExportClipboardPtBr clipboard = TranslationsCommonMsgExportClipboardPtBr._(_root);
	@override late final TranslationsCommonMsgExportFilePtBr file = TranslationsCommonMsgExportFilePtBr._(_root);
}

// Path: common.msg.import
class TranslationsCommonMsgImportPtBr extends TranslationsCommonMsgImportEn {
	TranslationsCommonMsgImportPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Confirmar importa莽茫o';
	@override String get success => 'Importado com sucesso';
	@override String get failure => 'Falha ao importar';
}

// Path: pages.proxies.sortOptions
class TranslationsPagesProxiesSortOptionsPtBr extends TranslationsPagesProxiesSortOptionsEn {
	TranslationsPagesProxiesSortOptionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get unsorted => 'Padr茫o';
	@override String get name => 'Alfabeticamente';
	@override String get delay => 'Por lat锚ncia';
}

// Path: pages.proxies.ipInfo
class TranslationsPagesProxiesIpInfoPtBr extends TranslationsPagesProxiesIpInfoEn {
	TranslationsPagesProxiesIpInfoPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get address => 'Endere莽o de IP';
	@override String get country => 'Pa铆s';
	@override String get organization => 'Organiza莽茫o';
}

// Path: pages.proxies.delay
class TranslationsPagesProxiesDelayPtBr extends TranslationsPagesProxiesDelayEn {
	TranslationsPagesProxiesDelayPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String result({required Object delay}) => 'Lat锚ncia: ${delay}ms';
	@override String get timeout => 'Tempo limite do teste de lat锚ncia esgotado';
	@override String get testing => 'Lat锚ncia: testando...';
}

// Path: pages.profiles.share
class TranslationsPagesProfilesSharePtBr extends TranslationsPagesProfilesShareEn {
	TranslationsPagesProfilesSharePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get urlToClipboard => 'URL para a 谩rea de transfer锚ncia';
	@override String get showUrlQr => 'Mostrar QR code da URL';
	@override String get jsonToClipboard => 'JSON para a 谩rea de transfer锚ncia';
}

// Path: pages.profiles.msg
class TranslationsPagesProfilesMsgPtBr extends TranslationsPagesProfilesMsgEn {
	TranslationsPagesProfilesMsgPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesProfilesMsgSavePtBr save = TranslationsPagesProfilesMsgSavePtBr._(_root);
	@override String get invalidUrl => 'URL inv谩lida';
	@override late final TranslationsPagesProfilesMsgAddPtBr add = TranslationsPagesProfilesMsgAddPtBr._(_root);
	@override late final TranslationsPagesProfilesMsgUpdatePtBr update = TranslationsPagesProfilesMsgUpdatePtBr._(_root);
	@override late final TranslationsPagesProfilesMsgDeletePtBr delete = TranslationsPagesProfilesMsgDeletePtBr._(_root);
}

// Path: pages.profileDetails.form
class TranslationsPagesProfileDetailsFormPtBr extends TranslationsPagesProfileDetailsFormEn {
	TranslationsPagesProfileDetailsFormPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get nameHint => 'Nome do perfil';
	@override String get emptyName => 'O nome 茅 obrigat贸rio';
	@override String get invalidUrl => 'URL inv谩lida';
	@override String get urlHint => 'URL de configura莽茫o completa';
	@override String get disableAutoUpdate => 'Desativar atualiza莽茫o autom谩tica';
	@override String get autoUpdateInterval => 'Intervalo de atualiza莽茫o autom谩tica';
	@override String get loading => 'Adicionando perfil...';
}

// Path: pages.settings.options
class TranslationsPagesSettingsOptionsPtBr extends TranslationsPagesSettingsOptionsEn {
	TranslationsPagesSettingsOptionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsOptionsImportPtBr import = TranslationsPagesSettingsOptionsImportPtBr._(_root);
	@override late final TranslationsPagesSettingsOptionsExportPtBr export = TranslationsPagesSettingsOptionsExportPtBr._(_root);
	@override String get reset => 'Redefinir op莽玫es';
}

// Path: pages.settings.general
class TranslationsPagesSettingsGeneralPtBr extends TranslationsPagesSettingsGeneralEn {
	TranslationsPagesSettingsGeneralPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geral';
	@override String get locale => 'Idioma';
	@override String get themeMode => 'Tema';
	@override late final TranslationsPagesSettingsGeneralThemeModesPtBr themeModes = TranslationsPagesSettingsGeneralThemeModesPtBr._(_root);
	@override String get enableAnalytics => 'Ativar an谩lise de dados';
	@override String get enableAnalyticsMsg => 'Permitir a coleta de dados de an谩lise e relat贸rios de falhas para melhorar o aplicativo';
	@override String get autoIpCheck => 'Verificar IP da conex茫o automaticamente';
	@override String get dynamicNotification => 'Exibir velocidade na notifica莽茫o';
	@override String get hapticFeedback => 'Feedback t谩til';
	@override String get actionAtClosing => 'A莽茫o ao fechar';
	@override String get autoStart => 'Iniciar com o sistema';
	@override String get silentStart => 'Iniciar minimizado';
	@override String get ignoreBatteryOptimizations => 'Desativar otimiza莽茫o de bateria';
	@override String get ignoreBatteryOptimizationsMsg => 'Remover restri莽玫es para um desempenho ideal da VPN';
	@override String get memoryLimit => 'Limite de mem贸ria';
	@override String get memoryLimitMsg => 'Ative se estiver enfrentando erros de falta de mem贸ria ou travamentos frequentes do aplicativo';
	@override String get debugMode => 'Modo de depura莽茫o';
	@override String get debugModeMsg => 'Reinicie o aplicativo para aplicar esta altera莽茫o';
	@override String get logLevel => 'N铆vel de registro';
	@override String get connectionTestUrl => 'URL de teste de conex茫o';
	@override String get urlTestInterval => 'Intervalo de teste de URL';
	@override String get clashApiPort => 'Porta da API do Clash';
	@override String get useXrayCoreWhenPossible => 'Usar xray-core quando poss铆vel';
	@override String get useXrayCoreWhenPossibleMsg => 'Use o xray-core ao analisar links de assinatura. Voc锚 precisa reimportar o link para ativar esta op莽茫o';
}

// Path: pages.settings.routing
class TranslationsPagesSettingsRoutingPtBr extends TranslationsPagesSettingsRoutingEn {
	TranslationsPagesSettingsRoutingPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Roteamento';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyPtBr perAppProxy = TranslationsPagesSettingsRoutingPerAppProxyPtBr._(_root);
	@override String get region => 'Regi茫o';
	@override late final TranslationsPagesSettingsRoutingRegionsPtBr regions = TranslationsPagesSettingsRoutingRegionsPtBr._(_root);
	@override late final TranslationsPagesSettingsRoutingBalancerStrategyPtBr balancerStrategy = TranslationsPagesSettingsRoutingBalancerStrategyPtBr._(_root);
	@override String get blockAds => 'Bloquear an煤ncios';
	@override String get bypassLan => 'Ignorar LAN';
	@override String get resolveDestination => 'Resolver destino';
	@override String get ipv6Route => 'Rota IPv6';
	@override late final TranslationsPagesSettingsRoutingIpv6ModesPtBr ipv6Modes = TranslationsPagesSettingsRoutingIpv6ModesPtBr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRulePtBr routeRule = TranslationsPagesSettingsRoutingRouteRulePtBr._(_root);
}

// Path: pages.settings.dns
class TranslationsPagesSettingsDnsPtBr extends TranslationsPagesSettingsDnsEn {
	TranslationsPagesSettingsDnsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'DNS';
	@override String get remoteDns => 'DNS remoto';
	@override String get remoteDnsDomainStrategy => 'Estrat茅gia de dom铆nio de DNS remoto';
	@override String get directDns => 'Resolvedor de servidor de sa铆da (direto)';
	@override String get directDnsDomainStrategy => 'Estrat茅gia de dom铆nio de sa铆da';
	@override String get enableDnsRouting => 'Ativar roteamento de DNS';
	@override String get enableFakeDns => 'Ativar DNS falso';
	@override late final TranslationsPagesSettingsDnsDomainStrategyPtBr domainStrategy = TranslationsPagesSettingsDnsDomainStrategyPtBr._(_root);
}

// Path: pages.settings.inbound
class TranslationsPagesSettingsInboundPtBr extends TranslationsPagesSettingsInboundEn {
	TranslationsPagesSettingsInboundPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Entrada';
	@override String get serviceMode => 'Modo de servi莽o';
	@override late final TranslationsPagesSettingsInboundServiceModesPtBr serviceModes = TranslationsPagesSettingsInboundServiceModesPtBr._(_root);
	@override late final TranslationsPagesSettingsInboundShortServiceModesPtBr shortServiceModes = TranslationsPagesSettingsInboundShortServiceModesPtBr._(_root);
	@override String get strictRoute => 'Roteamento estrito';
	@override String get tunImplementation => 'Implementa莽茫o de TUN';
	@override late final TranslationsPagesSettingsInboundTunImplementationsPtBr tunImplementations = TranslationsPagesSettingsInboundTunImplementationsPtBr._(_root);
	@override String get mixedPort => 'Porta mista';
	@override String get tproxyPort => 'Porta de proxy transparente';
	@override String get directPort => 'Porta de directo';
	@override String get redirectPort => 'Porta de redirecionamento';
	@override String get allowConnectionFromLan => 'Compartilhar VPN na rede local';
}

// Path: pages.settings.tlsTricks
class TranslationsPagesSettingsTlsTricksPtBr extends TranslationsPagesSettingsTlsTricksEn {
	TranslationsPagesSettingsTlsTricksPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Truques de TLS';
	@override String get enable => 'Ativar fragmento';
	@override String get packets => 'Pacotes de Fragmenta莽茫o';
	@override String get packetsTlsHello => 'TLS Hello';
	@override String get packets1_1 => '1-1';
	@override String get packets1_2 => '1-2';
	@override String get packets1_3 => '1-3';
	@override String get packets1_4 => '1-4';
	@override String get packets1_5 => '1-5';
	@override String get size => 'Tamanho do fragmento';
	@override String get sleep => 'Atraso do fragmento';
	@override late final TranslationsPagesSettingsTlsTricksMixedSniCasePtBr mixedSniCase = TranslationsPagesSettingsTlsTricksMixedSniCasePtBr._(_root);
	@override late final TranslationsPagesSettingsTlsTricksPaddingPtBr padding = TranslationsPagesSettingsTlsTricksPaddingPtBr._(_root);
}

// Path: pages.settings.warp
class TranslationsPagesSettingsWarpPtBr extends TranslationsPagesSettingsWarpEn {
	TranslationsPagesSettingsWarpPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'WARP';
	@override String get enable => 'Ativar WARP';
	@override String get generateConfig => 'Gerar configura莽茫o WARP';
	@override String get configGenerated => 'Configura莽茫o WARP gerada';
	@override String get missingConfig => 'Configura莽茫o WARP ausente';
	@override String get detourMode => 'Modo de Roteamento WARP';
	@override late final TranslationsPagesSettingsWarpDetourModesPtBr detourModes = TranslationsPagesSettingsWarpDetourModesPtBr._(_root);
	@override String get licenseKey => 'Chave de licen莽a';
	@override String get cleanIp => 'IP limpo';
	@override String get port => 'Porta';
	@override late final TranslationsPagesSettingsWarpNoisePtBr noise = TranslationsPagesSettingsWarpNoisePtBr._(_root);
}

// Path: dialogs.sortProfiles.sort
class TranslationsDialogsSortProfilesSortPtBr extends TranslationsDialogsSortProfilesSortEn {
	TranslationsDialogsSortProfilesSortPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get name => 'Alfabeticamente';
	@override String get lastUpdate => '脷ltima atualiza莽茫o';
}

// Path: dialogs.confirmation.settings
class TranslationsDialogsConfirmationSettingsPtBr extends TranslationsDialogsConfirmationSettingsEn {
	TranslationsDialogsConfirmationSettingsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsImportPtBr import = TranslationsDialogsConfirmationSettingsImportPtBr._(_root);
}

// Path: dialogs.confirmation.profile
class TranslationsDialogsConfirmationProfilePtBr extends TranslationsDialogsConfirmationProfileEn {
	TranslationsDialogsConfirmationProfilePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationProfileDeletePtBr delete = TranslationsDialogsConfirmationProfileDeletePtBr._(_root);
}

// Path: dialogs.confirmation.perAppProxy
class TranslationsDialogsConfirmationPerAppProxyPtBr extends TranslationsDialogsConfirmationPerAppProxyEn {
	TranslationsDialogsConfirmationPerAppProxyPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationPerAppProxyShareOnGithubPtBr shareOnGithub = TranslationsDialogsConfirmationPerAppProxyShareOnGithubPtBr._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyImportPtBr import = TranslationsDialogsConfirmationPerAppProxyImportPtBr._(_root);
}

// Path: dialogs.confirmation.routeRule
class TranslationsDialogsConfirmationRouteRulePtBr extends TranslationsDialogsConfirmationRouteRuleEn {
	TranslationsDialogsConfirmationRouteRulePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationRouteRuleDeletePtBr delete = TranslationsDialogsConfirmationRouteRuleDeletePtBr._(_root);
}

// Path: dialogs.noActiveProfile.helpBtn
class TranslationsDialogsNoActiveProfileHelpBtnPtBr extends TranslationsDialogsNoActiveProfileHelpBtnEn {
	TranslationsDialogsNoActiveProfileHelpBtnPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Mostre-me como';
	@override String get url => 'https://github.com/shulaiyun/Sloth-VPN.git';
}

// Path: common.msg.export.clipboard
class TranslationsCommonMsgExportClipboardPtBr extends TranslationsCommonMsgExportClipboardEn {
	TranslationsCommonMsgExportClipboardPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Adicionado 脿 谩rea de transfer锚ncia com sucesso';
	@override String get failure => 'Falha ao copiar para a 谩rea de transfer锚ncia';
	@override String get contentTooLarge => 'Conte煤do muito grande. Use a exporta莽茫o para arquivo';
}

// Path: common.msg.export.file
class TranslationsCommonMsgExportFilePtBr extends TranslationsCommonMsgExportFileEn {
	TranslationsCommonMsgExportFilePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Arquivo JSON criado com sucesso';
	@override String get failure => 'Falha ao criar o arquivo';
}

// Path: pages.profiles.msg.save
class TranslationsPagesProfilesMsgSavePtBr extends TranslationsPagesProfilesMsgSaveEn {
	TranslationsPagesProfilesMsgSavePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Perfil salvo com sucesso';
}

// Path: pages.profiles.msg.add
class TranslationsPagesProfilesMsgAddPtBr extends TranslationsPagesProfilesMsgAddEn {
	TranslationsPagesProfilesMsgAddPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get failure => 'Falha ao adicionar perfil';
}

// Path: pages.profiles.msg.update
class TranslationsPagesProfilesMsgUpdatePtBr extends TranslationsPagesProfilesMsgUpdateEn {
	TranslationsPagesProfilesMsgUpdatePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Perfil atualizado com sucesso';
	@override String successNamed({required Object name}) => '"${name}" atualizado com sucesso';
	@override String get failure => 'Falha ao atualizar perfil';
	@override String failureNamed({required Object name}) => 'Falha ao atualizar "${name}"';
}

// Path: pages.profiles.msg.delete
class TranslationsPagesProfilesMsgDeletePtBr extends TranslationsPagesProfilesMsgDeleteEn {
	TranslationsPagesProfilesMsgDeletePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Perfil exclu铆do com sucesso';
}

// Path: pages.settings.options.import
class TranslationsPagesSettingsOptionsImportPtBr extends TranslationsPagesSettingsOptionsImportEn {
	TranslationsPagesSettingsOptionsImportPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Importar op莽玫es da 谩rea de transfer锚ncia';
	@override String get file => 'Importar op莽玫es de um arquivo';
}

// Path: pages.settings.options.export
class TranslationsPagesSettingsOptionsExportPtBr extends TranslationsPagesSettingsOptionsExportEn {
	TranslationsPagesSettingsOptionsExportPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get anonymousToClipboard => 'Copiar op莽玫es an么nimas para a 谩rea de transfer锚ncia';
	@override String get anonymousToFile => 'Exportar op莽玫es an么nimas para um arquivo';
	@override String get allToClipboard => 'Copiar todas as op莽玫es para a 谩rea de transfer锚ncia';
	@override String get allToFile => 'Exportar todas as op莽玫es para um arquivo';
}

// Path: pages.settings.general.themeModes
class TranslationsPagesSettingsGeneralThemeModesPtBr extends TranslationsPagesSettingsGeneralThemeModesEn {
	TranslationsPagesSettingsGeneralThemeModesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get system => 'Padr茫o do sistema';
	@override String get dark => 'Modo escuro';
	@override String get light => 'Modo claro';
	@override String get black => 'Modo preto';
}

// Path: pages.settings.routing.perAppProxy
class TranslationsPagesSettingsRoutingPerAppProxyPtBr extends TranslationsPagesSettingsRoutingPerAppProxyEn {
	TranslationsPagesSettingsRoutingPerAppProxyPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Proxy por aplicativo';
	@override String get hideSysApps => 'Ocultar aplicativos do sistema';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsPtBr options = TranslationsPagesSettingsRoutingPerAppProxyOptionsPtBr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyModesPtBr modes = TranslationsPagesSettingsRoutingPerAppProxyModesPtBr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionPtBr autoSelection = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionPtBr._(_root);
}

// Path: pages.settings.routing.regions
class TranslationsPagesSettingsRoutingRegionsPtBr extends TranslationsPagesSettingsRoutingRegionsEn {
	TranslationsPagesSettingsRoutingRegionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get ir => 'Ir茫 (ir)';
	@override String get cn => 'China (cn)';
	@override String get ru => 'R煤ssia (ru)';
	@override String get af => 'Afeganist茫o (af)';
	@override String get id => 'Indon茅sia (id)';
	@override String get tr => 'Turquia (tr)';
	@override String get br => 'Brasil (br)';
	@override String get other => 'Outro';
}

// Path: pages.settings.routing.balancerStrategy
class TranslationsPagesSettingsRoutingBalancerStrategyPtBr extends TranslationsPagesSettingsRoutingBalancerStrategyEn {
	TranslationsPagesSettingsRoutingBalancerStrategyPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Estrat茅gia de Balancer';
	@override String get roundRobin => 'Round robin';
	@override String get consistentHash => 'Consistent hash';
	@override String get stickySession => 'Sticky session';
}

// Path: pages.settings.routing.ipv6Modes
class TranslationsPagesSettingsRoutingIpv6ModesPtBr extends TranslationsPagesSettingsRoutingIpv6ModesEn {
	TranslationsPagesSettingsRoutingIpv6ModesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get disable => 'Desativar';
	@override String get enable => 'Ativar';
	@override String get prefer => 'Preferencial';
	@override String get only => 'Exclusivo';
}

// Path: pages.settings.routing.routeRule
class TranslationsPagesSettingsRoutingRouteRulePtBr extends TranslationsPagesSettingsRoutingRouteRuleEn {
	TranslationsPagesSettingsRoutingRouteRulePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Regras de Roteamento';
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsPtBr options = TranslationsPagesSettingsRoutingRouteRuleOptionsPtBr._(_root);
	@override String get deleteRule => 'Excluir regra';
	@override String get createRule => 'Criar nova regra';
	@override late final TranslationsPagesSettingsRoutingRouteRuleRulePtBr rule = TranslationsPagesSettingsRoutingRouteRuleRulePtBr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleGenericListPtBr genericList = TranslationsPagesSettingsRoutingRouteRuleGenericListPtBr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleAndroidAppsPtBr androidApps = TranslationsPagesSettingsRoutingRouteRuleAndroidAppsPtBr._(_root);
}

// Path: pages.settings.dns.domainStrategy
class TranslationsPagesSettingsDnsDomainStrategyPtBr extends TranslationsPagesSettingsDnsDomainStrategyEn {
	TranslationsPagesSettingsDnsDomainStrategyPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Autom谩tico';
	@override String get preferIpv6 => 'Preferir IPv6';
	@override String get preferIpv4 => 'Preferir IPv4';
	@override String get ipv4Only => 'Apenas IPv4';
	@override String get ipv6Only => 'Apenas IPv6';
}

// Path: pages.settings.inbound.serviceModes
class TranslationsPagesSettingsInboundServiceModesPtBr extends TranslationsPagesSettingsInboundServiceModesEn {
	TranslationsPagesSettingsInboundServiceModesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get proxy => 'Apenas servi莽o de proxy';
	@override String get systemProxy => 'Definir proxy do sistema';
	@override String get tun => 'VPN';
	@override String get tunService => 'Servi莽o VPN';
}

// Path: pages.settings.inbound.shortServiceModes
class TranslationsPagesSettingsInboundShortServiceModesPtBr extends TranslationsPagesSettingsInboundShortServiceModesEn {
	TranslationsPagesSettingsInboundShortServiceModesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get proxy => 'Proxy';
	@override String get systemProxy => 'Proxy do sistema';
	@override String get tun => 'VPN';
	@override String get tunService => 'Servi莽o VPN';
}

// Path: pages.settings.inbound.tunImplementations
class TranslationsPagesSettingsInboundTunImplementationsPtBr extends TranslationsPagesSettingsInboundTunImplementationsEn {
	TranslationsPagesSettingsInboundTunImplementationsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get mixed => 'Misto';
	@override String get system => 'Sistema';
	@override String get gvisor => 'gVisor';
}

// Path: pages.settings.tlsTricks.mixedSniCase
class TranslationsPagesSettingsTlsTricksMixedSniCasePtBr extends TranslationsPagesSettingsTlsTricksMixedSniCaseEn {
	TranslationsPagesSettingsTlsTricksMixedSniCasePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get enable => 'Ativar mai煤sculas/min煤sculas mistas no SNI';
}

// Path: pages.settings.tlsTricks.padding
class TranslationsPagesSettingsTlsTricksPaddingPtBr extends TranslationsPagesSettingsTlsTricksPaddingEn {
	TranslationsPagesSettingsTlsTricksPaddingPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get enable => 'Ativar preenchimento';
	@override String get size => 'Tamanho do preenchimento';
}

// Path: pages.settings.warp.detourModes
class TranslationsPagesSettingsWarpDetourModesPtBr extends TranslationsPagesSettingsWarpDetourModesEn {
	TranslationsPagesSettingsWarpDetourModesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get proxyOverWarp => 'Desviar proxies atrav茅s do WARP';
	@override String get warpOverProxy => 'Desviar WARP atrav茅s de proxies';
	@override String get proxyOverWarpExplain => 'Desbloquear proxies com WARP';
	@override String get warpOverProxyExplain => 'Seguran莽a extra com WARP';
}

// Path: pages.settings.warp.noise
class TranslationsPagesSettingsWarpNoisePtBr extends TranslationsPagesSettingsWarpNoiseEn {
	TranslationsPagesSettingsWarpNoisePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get count => 'Contagem de ru铆do';
	@override String get mode => 'Modo de ru铆do';
	@override String get size => 'Tamanho do ru铆do';
	@override String get delay => 'Atraso do ru铆do';
}

// Path: dialogs.confirmation.settings.import
class TranslationsDialogsConfirmationSettingsImportPtBr extends TranslationsDialogsConfirmationSettingsImportEn {
	TranslationsDialogsConfirmationSettingsImportPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get msg => 'Isso substituir谩 todas as op莽玫es de configura莽茫o pelos valores fornecidos. Voc锚 tem certeza?';
}

// Path: dialogs.confirmation.profile.delete
class TranslationsDialogsConfirmationProfileDeletePtBr extends TranslationsDialogsConfirmationProfileDeleteEn {
	TranslationsDialogsConfirmationProfileDeletePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Excluir perfil';
	@override String get msg => 'Tem certeza de que deseja excluir este perfil permanentemente?';
}

// Path: dialogs.confirmation.perAppProxy.shareOnGithub
class TranslationsDialogsConfirmationPerAppProxyShareOnGithubPtBr extends TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn {
	TranslationsDialogsConfirmationPerAppProxyShareOnGithubPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Melhorando a sele莽茫o autom谩tica';
	@override String get msg => 'Ao compartilhar os aplicativos selecionados, voc锚 ajuda a completar a lista de "sele莽茫o autom谩tica"';
}

// Path: dialogs.confirmation.perAppProxy.import
class TranslationsDialogsConfirmationPerAppProxyImportPtBr extends TranslationsDialogsConfirmationPerAppProxyImportEn {
	TranslationsDialogsConfirmationPerAppProxyImportPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get msg => 'Isso substituir谩 todas as suas sele莽玫es atuais de proxy por aplicativo. Tem certeza de que deseja continuar?';
}

// Path: dialogs.confirmation.routeRule.delete
class TranslationsDialogsConfirmationRouteRuleDeletePtBr extends TranslationsDialogsConfirmationRouteRuleDeleteEn {
	TranslationsDialogsConfirmationRouteRuleDeletePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Excluir regra';
	@override String msg({required Object rulename}) => 'Tem certeza de que deseja excluir a regra "${rulename}"?';
}

// Path: pages.settings.routing.perAppProxy.options
class TranslationsPagesSettingsRoutingPerAppProxyOptionsPtBr extends TranslationsPagesSettingsRoutingPerAppProxyOptionsEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsImportPtBr import = TranslationsPagesSettingsRoutingPerAppProxyOptionsImportPtBr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsExportPtBr export = TranslationsPagesSettingsRoutingPerAppProxyOptionsExportPtBr._(_root);
	@override String get shareToAll => 'Compartilhar com todos';
	@override String get clearAllSelections => 'Limpar todas as sele莽玫es';
}

// Path: pages.settings.routing.perAppProxy.modes
class TranslationsPagesSettingsRoutingPerAppProxyModesPtBr extends TranslationsPagesSettingsRoutingPerAppProxyModesEn {
	TranslationsPagesSettingsRoutingPerAppProxyModesPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get all => 'Todos';
	@override String get proxy => 'Proxy';
	@override String get bypass => 'Ignorar';
	@override String get allMsg => 'Usar proxy para todos os aplicativos';
	@override String get proxyMsg => 'Usar proxy apenas para aplicativos selecionados';
	@override String get bypassMsg => 'N茫o usar proxy para aplicativos selecionados';
}

// Path: pages.settings.routing.perAppProxy.autoSelection
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionPtBr extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sele莽茫o autom谩tica';
	@override String get performNow => 'Executar agora';
	@override String get resetToDefault => 'Redefinir para o padr茫o';
	@override String get autoUpdateInterval => 'Intervalo de atualiza莽茫o autom谩tica';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastPtBr toast = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastPtBr._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogPtBr dialog = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogPtBr._(_root);
}

// Path: pages.settings.routing.routeRule.options
class TranslationsPagesSettingsRoutingRouteRuleOptionsPtBr extends TranslationsPagesSettingsRoutingRouteRuleOptionsEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsImportPtBr import = TranslationsPagesSettingsRoutingRouteRuleOptionsImportPtBr._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsExportPtBr export = TranslationsPagesSettingsRoutingRouteRuleOptionsExportPtBr._(_root);
	@override String get reset => 'Redefinir regras';
}

// Path: pages.settings.routing.routeRule.rule
class TranslationsPagesSettingsRoutingRouteRuleRulePtBr extends TranslationsPagesSettingsRoutingRouteRuleRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleRulePtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Regra';
	@override String get ruleChanged => 'Regra alterada';
	@override String get ruleChangedMsg => 'Deseja salvar suas edi莽玫es?';
	@override String get onlyTunMode => 'Dispon铆vel apenas no modo TUN';
	@override String get notAvailabeInThisPlatform => 'N茫o dispon铆vel nesta plataforma';
	@override String get canNotBeEmpty => 'N茫o pode estar vazio';
	@override String get validUrlEx => 'https://example.com';
	@override String get validUrl => '"URL" v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}';
	@override String get validProcessNameEx => 'Chrome.exe ou google chrome ou chrome';
	@override String get validProcessName => '"Nome do Processo" v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}';
	@override String get validProcessPathEx => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome';
	@override String get validProcessPath => '"Caminho do Processo" v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}';
	@override String get validPortRangeEx => '80 ou 1-65000';
	@override String get validPortRange => '"Porta" ou "Intervalo de Portas" v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}';
	@override String get validIpCidrEx => '8.8.8.8 ou 10.0.0.0/24';
	@override String get validIpCidr => 'IP CIDR v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}';
	@override String get validDomainEx => 'Google.com ou dl.google.com';
	@override String get validDomain => '"Dom铆nio" v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}';
	@override String get validDomainSuffixEx => '.com ou .ir';
	@override String get validDomainSuffix => '"Sufixo de Dom铆nio" v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}';
	@override Map<String, String> get tileTitle => {
		'name': 'Nome',
		'outbound': 'Sa铆da se corresponder',
		'rule_set': 'URL do conjunto de regras',
		'package_name': 'Nomes dos pacotes',
		'process_name': 'Nomes dos processos',
		'process_path': 'Caminhos dos processos',
		'network': 'Redes',
		'port_range': 'Portas de destino',
		'source_port_range': 'Portas de origem',
		'protocol': 'Protocolo',
		'ip_cidr': 'IP CIDR de destino',
		'source_ip_cidr': 'IP CIDR de origem',
		'domain': 'Dom铆nio',
		'domain_suffixe': 'Sufixo de dom铆nio',
		'domain_keyword': 'Palavra-chave de dom铆nio',
		'domain_regex': 'Express茫o regular de dom铆nio',
	};
	@override Map<String, String> get outbound => {
		'proxy': 'Proxy',
		'direct': 'Direto',
		'direct_with_fragment': 'Direto com fragmento',
		'block': 'Bloquear',
	};
	@override Map<String, String> get network => {
		'all': 'Todos',
		'tcp': 'TCP',
		'udp': 'UDP',
	};
	@override Map<String, String> get protocol => {
		'': 'Todos',
		'tls': 'TLS',
		'http': 'HTTP',
		'quic': 'QUIC',
		'stun': 'STUN',
		'dns': 'DNS',
		'bittorrent': 'BitTorrent',
	};
}

// Path: pages.settings.routing.routeRule.genericList
class TranslationsPagesSettingsRoutingRouteRuleGenericListPtBr extends TranslationsPagesSettingsRoutingRouteRuleGenericListEn {
	TranslationsPagesSettingsRoutingRouteRuleGenericListPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get addNew => 'Adicionar novo valor';
	@override String get update => 'Atualizar valor';
	@override String get clearList => 'Limpar lista';
	@override String get clearListMsg => 'Todos os itens foram exclu铆dos';
}

// Path: pages.settings.routing.routeRule.androidApps
class TranslationsPagesSettingsRoutingRouteRuleAndroidAppsPtBr extends TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn {
	TranslationsPagesSettingsRoutingRouteRuleAndroidAppsPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => 'Aplicativos Android';
	@override String get showSystemApps => 'Mostrar aplicativos do sistema';
	@override String get hideSystemApps => 'Ocultar aplicativos do sistema';
	@override String get clearSelection => 'Limpar sele莽茫o';
	@override String get uninstalled => 'Desinstalado';
}

// Path: pages.settings.routing.perAppProxy.options.import
class TranslationsPagesSettingsRoutingPerAppProxyOptionsImportPtBr extends TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsImportPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Importar sele莽茫o da 谩rea de transfer锚ncia';
	@override String get file => 'Importar sele莽茫o de um arquivo';
	@override String get msg => 'A importa莽茫o substituir谩 suas sele莽玫es atuais. Tem certeza de que deseja continuar?';
}

// Path: pages.settings.routing.perAppProxy.options.export
class TranslationsPagesSettingsRoutingPerAppProxyOptionsExportPtBr extends TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsExportPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Copiar sele莽茫o para a 谩rea de transfer锚ncia';
	@override String get file => 'Exportar sele莽茫o para um arquivo';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.toast
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastPtBr extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Sele莽茫o autom谩tica de aplicativos conclu铆da com sucesso';
	@override String get failure => 'Falha na sele莽茫o autom谩tica';
	@override String regionNotFound({required Object region}) => 'Sele莽茫o autom谩tica n茫o encontrada para a regi茫o "${region}"';
	@override String get alreadyInAuto => 'Suas sele莽玫es j谩 est茫o na lista autom谩tica';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.dialog
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogPtBr extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sele莽茫o autom谩tica de aplicativos';
	@override String msg({required Object region}) => 'A fun莽茫o de sele莽茫o autom谩tica para o proxy por aplicativo foi desativada devido 脿 mudan莽a de regi茫o para "${region}"';
}

// Path: pages.settings.routing.routeRule.options.import
class TranslationsPagesSettingsRoutingRouteRuleOptionsImportPtBr extends TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsImportPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Importar regras da 谩rea de transfer锚ncia';
	@override String get file => 'Importar regras de um arquivo';
}

// Path: pages.settings.routing.routeRule.options.export
class TranslationsPagesSettingsRoutingRouteRuleOptionsExportPtBr extends TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsExportPtBr._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Copiar regras para a 谩rea de transfer锚ncia';
	@override String get file => 'Salvar regras em um arquivo';
}

/// The flat map containing all translations for locale <pt-BR>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPtBr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appTitle' => '树懒VPN',
			'common.start' => 'Come莽ar',
			'common.version' => 'Vers茫o',
			'common.ok' => 'OK',
			'common.cancel' => 'Cancelar',
			'common.kContinue' => 'Continuar',
			'common.showMore' => 'Mostrar mais',
			'common.showLess' => 'Mostrar menos',
			'common.filter' => 'Filtrar',
			'common.all' => 'Todos',
			'common.pause' => 'Pausar',
			'common.resume' => 'Retomar',
			'common.clear' => 'Limpar',
			'common.close' => 'Fechar',
			'common.auto' => 'Autom谩tico',
			'common.manually' => 'Manualmente',
			'common.name' => 'Nome',
			'common.url' => 'URL',
			'common.add' => 'Adicionar',
			'common.clipboard' => '脕rea de transfer锚ncia',
			'common.addToClipboard' => 'Adicionar 脿 谩rea de transfer锚ncia',
			'common.scanQr' => 'Escanear QR',
			'common.free' => 'Gr谩tis',
			'common.warp' => 'WARP',
			'common.fragment' => 'Fragmento',
			'common.help' => 'Ajuda',
			'common.save' => 'Salvar',
			'common.update' => 'Atualizar',
			'common.share' => 'Compartilhar',
			'common.edit' => 'Editar',
			'common.delete' => 'Excluir',
			'common.discard' => 'Descartar',
			'common.import' => 'Importar',
			'common.export' => 'Exportar',
			'common.later' => 'Mais tarde',
			'common.ignore' => 'Ignorar',
			'common.quit' => 'Sair',
			'common.notSet' => 'N茫o definido',
			'common.hide' => 'Ocultar',
			'common.exit' => 'Sair',
			'common.reset' => 'Redefinir',
			'common.done' => 'Conclu铆do',
			'common.search' => 'Buscar',
			'common.decline' => 'Recusar',
			'common.agree' => 'Aceitar',
			'common.empty' => 'Vazio',
			'common.unknown' => 'Desconhecido',
			'common.hidden' => 'Oculto',
			'common.timeout' => 'Tempo esgotado',
			'common.sort' => 'Ordenar',
			'common.dashboard' => 'Painel',
			'common.interval.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n, zero: '', one: '${n} dia', other: '${n} dias', ), 
			'common.interval.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(n, zero: '', one: '${n} hora', other: '${n} horas', ), 
			'common.msg.permission.denied' => 'Permiss茫o negada',
			'common.msg.export.clipboard.success' => 'Adicionado 脿 谩rea de transfer锚ncia com sucesso',
			'common.msg.export.clipboard.failure' => 'Falha ao copiar para a 谩rea de transfer锚ncia',
			'common.msg.export.clipboard.contentTooLarge' => 'Conte煤do muito grande. Use a exporta莽茫o para arquivo',
			'common.msg.export.file.success' => 'Arquivo JSON criado com sucesso',
			'common.msg.export.file.failure' => 'Falha ao criar o arquivo',
			'common.msg.import.confirm' => 'Confirmar importa莽茫o',
			'common.msg.import.success' => 'Importado com sucesso',
			'common.msg.import.failure' => 'Falha ao importar',
			'intro.banner' => 'Tudo o que voc锚 precisa para uma internet sem restri莽玫es',
			'intro.termsAndPolicyCaution' => ({required InlineSpanBuilder tap}) => TextSpan(children: [ const TextSpan(text: 'Ao continuar, voc锚 concorda com os '), tap(_root.pages.about.termsAndConditions), ]), 
			'intro.info' => ({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [ const TextSpan(text: 'Feito com 鉂わ笍 por Hiddify - '), tap_source('C贸digo Aberto'), const TextSpan(text: ' ('), tap_license('Licen莽a'), const TextSpan(text: ')'), ]), 
			'pages.home.title' => 'In铆cio',
			'pages.home.quickSettings' => 'Configura莽玫es r谩pidas',
			'pages.proxies.title' => 'Proxies',
			'pages.proxies.sort' => 'Ordenar proxies',
			'pages.proxies.testDelay' => 'Testar lat锚ncia',
			'pages.proxies.empty' => 'Nenhum proxy dispon铆vel',
			'pages.proxies.activeProxy' => 'Proxy ativo',
			'pages.proxies.unknownIp' => 'IP desconhecido',
			'pages.proxies.sortOptions.unsorted' => 'Padr茫o',
			'pages.proxies.sortOptions.name' => 'Alfabeticamente',
			'pages.proxies.sortOptions.delay' => 'Por lat锚ncia',
			'pages.proxies.ipInfo.address' => 'Endere莽o de IP',
			'pages.proxies.ipInfo.country' => 'Pa铆s',
			'pages.proxies.ipInfo.organization' => 'Organiza莽茫o',
			'pages.proxies.delay.result' => ({required Object delay}) => 'Lat锚ncia: ${delay}ms',
			'pages.proxies.delay.timeout' => 'Tempo limite do teste de lat锚ncia esgotado',
			'pages.proxies.delay.testing' => 'Lat锚ncia: testando...',
			'pages.profiles.title' => 'Perfis',
			'pages.profiles.add' => 'Adicionar perfil',
			'pages.profiles.update' => 'Atualizar perfil',
			'pages.profiles.viewAllProfiles' => 'Ver todos os perfis',
			'pages.profiles.activeProfileName' => ({required Object name}) => 'Nome do perfil ativo: "${name}".',
			'pages.profiles.nonActiveProfileName' => ({required Object name}) => 'Selecionar "${name}" como perfil ativo',
			'pages.profiles.freeSubNotFound' => 'Nenhuma assinatura gratuita encontrada',
			'pages.profiles.freeSubNotFoundForRegion' => ({required Object region}) => 'Nenhuma assinatura gratuita encontrada para a regi茫o "${region}"',
			'pages.profiles.failedToLoad' => 'Falha ao carregar',
			'pages.profiles.updateSubscriptions' => 'Atualizar assinaturas',
			'pages.profiles.share.urlToClipboard' => 'URL para a 谩rea de transfer锚ncia',
			'pages.profiles.share.showUrlQr' => 'Mostrar QR code da URL',
			'pages.profiles.share.jsonToClipboard' => 'JSON para a 谩rea de transfer锚ncia',
			'pages.profiles.msg.save.success' => 'Perfil salvo com sucesso',
			'pages.profiles.msg.invalidUrl' => 'URL inv谩lida',
			'pages.profiles.msg.add.failure' => 'Falha ao adicionar perfil',
			'pages.profiles.msg.update.success' => 'Perfil atualizado com sucesso',
			'pages.profiles.msg.update.successNamed' => ({required Object name}) => '"${name}" atualizado com sucesso',
			'pages.profiles.msg.update.failure' => 'Falha ao atualizar perfil',
			'pages.profiles.msg.update.failureNamed' => ({required Object name}) => 'Falha ao atualizar "${name}"',
			'pages.profiles.msg.delete.success' => 'Perfil exclu铆do com sucesso',
			'pages.profileDetails.title' => 'Perfil',
			'pages.profileDetails.lastUpdate' => '脷ltima atualiza莽茫o',
			'pages.profileDetails.form.nameHint' => 'Nome do perfil',
			'pages.profileDetails.form.emptyName' => 'O nome 茅 obrigat贸rio',
			'pages.profileDetails.form.invalidUrl' => 'URL inv谩lida',
			'pages.profileDetails.form.urlHint' => 'URL de configura莽茫o completa',
			'pages.profileDetails.form.disableAutoUpdate' => 'Desativar atualiza莽茫o autom谩tica',
			'pages.profileDetails.form.autoUpdateInterval' => 'Intervalo de atualiza莽茫o autom谩tica',
			'pages.profileDetails.form.loading' => 'Adicionando perfil...',
			'pages.logs.title' => 'Registros',
			'pages.logs.shareCoreLogs' => 'Compartilhar registros do n煤cleo',
			'pages.logs.shareAppLogs' => 'Compartilhar registros do aplicativo',
			'pages.about.title' => 'Sobre',
			'pages.about.notAvailableMsg' => 'Voc锚 j谩 est谩 usando a vers茫o mais recente',
			'pages.about.checkForUpdate' => 'Verificar atualiza莽玫es',
			'pages.about.openWorkingDir' => 'Abrir diret贸rio de trabalho',
			'pages.about.sourceCode' => 'C贸digo-fonte',
			'pages.about.telegramChannel' => 'Canal do Telegram',
			'pages.about.termsAndConditions' => 'Termos e Condi莽玫es',
			'pages.about.privacyPolicy' => 'Pol铆tica de Privacidade',
			'pages.settings.title' => 'Configura莽玫es',
			'pages.settings.resetTunnel' => 'Redefinir perfil de VPN',
			'pages.settings.options.import.clipboard' => 'Importar op莽玫es da 谩rea de transfer锚ncia',
			'pages.settings.options.import.file' => 'Importar op莽玫es de um arquivo',
			'pages.settings.options.export.anonymousToClipboard' => 'Copiar op莽玫es an么nimas para a 谩rea de transfer锚ncia',
			'pages.settings.options.export.anonymousToFile' => 'Exportar op莽玫es an么nimas para um arquivo',
			'pages.settings.options.export.allToClipboard' => 'Copiar todas as op莽玫es para a 谩rea de transfer锚ncia',
			'pages.settings.options.export.allToFile' => 'Exportar todas as op莽玫es para um arquivo',
			'pages.settings.options.reset' => 'Redefinir op莽玫es',
			'pages.settings.general.title' => 'Geral',
			'pages.settings.general.locale' => 'Idioma',
			'pages.settings.general.themeMode' => 'Tema',
			'pages.settings.general.themeModes.system' => 'Padr茫o do sistema',
			'pages.settings.general.themeModes.dark' => 'Modo escuro',
			'pages.settings.general.themeModes.light' => 'Modo claro',
			'pages.settings.general.themeModes.black' => 'Modo preto',
			'pages.settings.general.enableAnalytics' => 'Ativar an谩lise de dados',
			'pages.settings.general.enableAnalyticsMsg' => 'Permitir a coleta de dados de an谩lise e relat贸rios de falhas para melhorar o aplicativo',
			'pages.settings.general.autoIpCheck' => 'Verificar IP da conex茫o automaticamente',
			'pages.settings.general.dynamicNotification' => 'Exibir velocidade na notifica莽茫o',
			'pages.settings.general.hapticFeedback' => 'Feedback t谩til',
			'pages.settings.general.actionAtClosing' => 'A莽茫o ao fechar',
			'pages.settings.general.autoStart' => 'Iniciar com o sistema',
			'pages.settings.general.silentStart' => 'Iniciar minimizado',
			'pages.settings.general.ignoreBatteryOptimizations' => 'Desativar otimiza莽茫o de bateria',
			'pages.settings.general.ignoreBatteryOptimizationsMsg' => 'Remover restri莽玫es para um desempenho ideal da VPN',
			'pages.settings.general.memoryLimit' => 'Limite de mem贸ria',
			'pages.settings.general.memoryLimitMsg' => 'Ative se estiver enfrentando erros de falta de mem贸ria ou travamentos frequentes do aplicativo',
			'pages.settings.general.debugMode' => 'Modo de depura莽茫o',
			'pages.settings.general.debugModeMsg' => 'Reinicie o aplicativo para aplicar esta altera莽茫o',
			'pages.settings.general.logLevel' => 'N铆vel de registro',
			'pages.settings.general.connectionTestUrl' => 'URL de teste de conex茫o',
			'pages.settings.general.urlTestInterval' => 'Intervalo de teste de URL',
			'pages.settings.general.clashApiPort' => 'Porta da API do Clash',
			'pages.settings.general.useXrayCoreWhenPossible' => 'Usar xray-core quando poss铆vel',
			'pages.settings.general.useXrayCoreWhenPossibleMsg' => 'Use o xray-core ao analisar links de assinatura. Voc锚 precisa reimportar o link para ativar esta op莽茫o',
			'pages.settings.routing.title' => 'Roteamento',
			'pages.settings.routing.perAppProxy.title' => 'Proxy por aplicativo',
			'pages.settings.routing.perAppProxy.hideSysApps' => 'Ocultar aplicativos do sistema',
			'pages.settings.routing.perAppProxy.options.import.clipboard' => 'Importar sele莽茫o da 谩rea de transfer锚ncia',
			'pages.settings.routing.perAppProxy.options.import.file' => 'Importar sele莽茫o de um arquivo',
			'pages.settings.routing.perAppProxy.options.import.msg' => 'A importa莽茫o substituir谩 suas sele莽玫es atuais. Tem certeza de que deseja continuar?',
			'pages.settings.routing.perAppProxy.options.export.clipboard' => 'Copiar sele莽茫o para a 谩rea de transfer锚ncia',
			'pages.settings.routing.perAppProxy.options.export.file' => 'Exportar sele莽茫o para um arquivo',
			'pages.settings.routing.perAppProxy.options.shareToAll' => 'Compartilhar com todos',
			'pages.settings.routing.perAppProxy.options.clearAllSelections' => 'Limpar todas as sele莽玫es',
			'pages.settings.routing.perAppProxy.modes.all' => 'Todos',
			'pages.settings.routing.perAppProxy.modes.proxy' => 'Proxy',
			'pages.settings.routing.perAppProxy.modes.bypass' => 'Ignorar',
			'pages.settings.routing.perAppProxy.modes.allMsg' => 'Usar proxy para todos os aplicativos',
			'pages.settings.routing.perAppProxy.modes.proxyMsg' => 'Usar proxy apenas para aplicativos selecionados',
			'pages.settings.routing.perAppProxy.modes.bypassMsg' => 'N茫o usar proxy para aplicativos selecionados',
			'pages.settings.routing.perAppProxy.autoSelection.title' => 'Sele莽茫o autom谩tica',
			'pages.settings.routing.perAppProxy.autoSelection.performNow' => 'Executar agora',
			'pages.settings.routing.perAppProxy.autoSelection.resetToDefault' => 'Redefinir para o padr茫o',
			'pages.settings.routing.perAppProxy.autoSelection.autoUpdateInterval' => 'Intervalo de atualiza莽茫o autom谩tica',
			'pages.settings.routing.perAppProxy.autoSelection.toast.success' => 'Sele莽茫o autom谩tica de aplicativos conclu铆da com sucesso',
			'pages.settings.routing.perAppProxy.autoSelection.toast.failure' => 'Falha na sele莽茫o autom谩tica',
			'pages.settings.routing.perAppProxy.autoSelection.toast.regionNotFound' => ({required Object region}) => 'Sele莽茫o autom谩tica n茫o encontrada para a regi茫o "${region}"',
			'pages.settings.routing.perAppProxy.autoSelection.toast.alreadyInAuto' => 'Suas sele莽玫es j谩 est茫o na lista autom谩tica',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.title' => 'Sele莽茫o autom谩tica de aplicativos',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.msg' => ({required Object region}) => 'A fun莽茫o de sele莽茫o autom谩tica para o proxy por aplicativo foi desativada devido 脿 mudan莽a de regi茫o para "${region}"',
			'pages.settings.routing.region' => 'Regi茫o',
			'pages.settings.routing.regions.ir' => 'Ir茫 (ir)',
			'pages.settings.routing.regions.cn' => 'China (cn)',
			'pages.settings.routing.regions.ru' => 'R煤ssia (ru)',
			'pages.settings.routing.regions.af' => 'Afeganist茫o (af)',
			'pages.settings.routing.regions.id' => 'Indon茅sia (id)',
			'pages.settings.routing.regions.tr' => 'Turquia (tr)',
			'pages.settings.routing.regions.br' => 'Brasil (br)',
			'pages.settings.routing.regions.other' => 'Outro',
			'pages.settings.routing.balancerStrategy.title' => 'Estrat茅gia de Balancer',
			'pages.settings.routing.balancerStrategy.roundRobin' => 'Round robin',
			'pages.settings.routing.balancerStrategy.consistentHash' => 'Consistent hash',
			'pages.settings.routing.balancerStrategy.stickySession' => 'Sticky session',
			'pages.settings.routing.blockAds' => 'Bloquear an煤ncios',
			'pages.settings.routing.bypassLan' => 'Ignorar LAN',
			'pages.settings.routing.resolveDestination' => 'Resolver destino',
			'pages.settings.routing.ipv6Route' => 'Rota IPv6',
			'pages.settings.routing.ipv6Modes.disable' => 'Desativar',
			'pages.settings.routing.ipv6Modes.enable' => 'Ativar',
			'pages.settings.routing.ipv6Modes.prefer' => 'Preferencial',
			'pages.settings.routing.ipv6Modes.only' => 'Exclusivo',
			'pages.settings.routing.routeRule.title' => 'Regras de Roteamento',
			'pages.settings.routing.routeRule.options.import.clipboard' => 'Importar regras da 谩rea de transfer锚ncia',
			'pages.settings.routing.routeRule.options.import.file' => 'Importar regras de um arquivo',
			'pages.settings.routing.routeRule.options.export.clipboard' => 'Copiar regras para a 谩rea de transfer锚ncia',
			'pages.settings.routing.routeRule.options.export.file' => 'Salvar regras em um arquivo',
			'pages.settings.routing.routeRule.options.reset' => 'Redefinir regras',
			'pages.settings.routing.routeRule.deleteRule' => 'Excluir regra',
			'pages.settings.routing.routeRule.createRule' => 'Criar nova regra',
			'pages.settings.routing.routeRule.rule.title' => 'Regra',
			'pages.settings.routing.routeRule.rule.ruleChanged' => 'Regra alterada',
			'pages.settings.routing.routeRule.rule.ruleChangedMsg' => 'Deseja salvar suas edi莽玫es?',
			'pages.settings.routing.routeRule.rule.onlyTunMode' => 'Dispon铆vel apenas no modo TUN',
			'pages.settings.routing.routeRule.rule.notAvailabeInThisPlatform' => 'N茫o dispon铆vel nesta plataforma',
			'pages.settings.routing.routeRule.rule.canNotBeEmpty' => 'N茫o pode estar vazio',
			'pages.settings.routing.routeRule.rule.validUrlEx' => 'https://example.com',
			'pages.settings.routing.routeRule.rule.validUrl' => '"URL" v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}',
			'pages.settings.routing.routeRule.rule.validProcessNameEx' => 'Chrome.exe ou google chrome ou chrome',
			'pages.settings.routing.routeRule.rule.validProcessName' => '"Nome do Processo" v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}',
			'pages.settings.routing.routeRule.rule.validProcessPathEx' => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome',
			'pages.settings.routing.routeRule.rule.validProcessPath' => '"Caminho do Processo" v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}',
			'pages.settings.routing.routeRule.rule.validPortRangeEx' => '80 ou 1-65000',
			'pages.settings.routing.routeRule.rule.validPortRange' => '"Porta" ou "Intervalo de Portas" v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}',
			'pages.settings.routing.routeRule.rule.validIpCidrEx' => '8.8.8.8 ou 10.0.0.0/24',
			'pages.settings.routing.routeRule.rule.validIpCidr' => 'IP CIDR v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}',
			'pages.settings.routing.routeRule.rule.validDomainEx' => 'Google.com ou dl.google.com',
			'pages.settings.routing.routeRule.rule.validDomain' => '"Dom铆nio" v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}',
			'pages.settings.routing.routeRule.rule.validDomainSuffixEx' => '.com ou .ir',
			'pages.settings.routing.routeRule.rule.validDomainSuffix' => '"Sufixo de Dom铆nio" v谩lido como\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}',
			'pages.settings.routing.routeRule.rule.tileTitle.name' => 'Nome',
			'pages.settings.routing.routeRule.rule.tileTitle.outbound' => 'Sa铆da se corresponder',
			'pages.settings.routing.routeRule.rule.tileTitle.rule_set' => 'URL do conjunto de regras',
			'pages.settings.routing.routeRule.rule.tileTitle.package_name' => 'Nomes dos pacotes',
			'pages.settings.routing.routeRule.rule.tileTitle.process_name' => 'Nomes dos processos',
			'pages.settings.routing.routeRule.rule.tileTitle.process_path' => 'Caminhos dos processos',
			'pages.settings.routing.routeRule.rule.tileTitle.network' => 'Redes',
			'pages.settings.routing.routeRule.rule.tileTitle.port_range' => 'Portas de destino',
			'pages.settings.routing.routeRule.rule.tileTitle.source_port_range' => 'Portas de origem',
			'pages.settings.routing.routeRule.rule.tileTitle.protocol' => 'Protocolo',
			'pages.settings.routing.routeRule.rule.tileTitle.ip_cidr' => 'IP CIDR de destino',
			'pages.settings.routing.routeRule.rule.tileTitle.source_ip_cidr' => 'IP CIDR de origem',
			'pages.settings.routing.routeRule.rule.tileTitle.domain' => 'Dom铆nio',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_suffixe' => 'Sufixo de dom铆nio',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_keyword' => 'Palavra-chave de dom铆nio',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_regex' => 'Express茫o regular de dom铆nio',
			'pages.settings.routing.routeRule.rule.outbound.proxy' => 'Proxy',
			'pages.settings.routing.routeRule.rule.outbound.direct' => 'Direto',
			'pages.settings.routing.routeRule.rule.outbound.direct_with_fragment' => 'Direto com fragmento',
			'pages.settings.routing.routeRule.rule.outbound.block' => 'Bloquear',
			'pages.settings.routing.routeRule.rule.network.all' => 'Todos',
			'pages.settings.routing.routeRule.rule.network.tcp' => 'TCP',
			'pages.settings.routing.routeRule.rule.network.udp' => 'UDP',
			'pages.settings.routing.routeRule.rule.protocol.' => 'Todos',
			'pages.settings.routing.routeRule.rule.protocol.tls' => 'TLS',
			'pages.settings.routing.routeRule.rule.protocol.http' => 'HTTP',
			'pages.settings.routing.routeRule.rule.protocol.quic' => 'QUIC',
			'pages.settings.routing.routeRule.rule.protocol.stun' => 'STUN',
			'pages.settings.routing.routeRule.rule.protocol.dns' => 'DNS',
			'pages.settings.routing.routeRule.rule.protocol.bittorrent' => 'BitTorrent',
			'pages.settings.routing.routeRule.genericList.addNew' => 'Adicionar novo valor',
			'pages.settings.routing.routeRule.genericList.update' => 'Atualizar valor',
			'pages.settings.routing.routeRule.genericList.clearList' => 'Limpar lista',
			'pages.settings.routing.routeRule.genericList.clearListMsg' => 'Todos os itens foram exclu铆dos',
			'pages.settings.routing.routeRule.androidApps.pageTitle' => 'Aplicativos Android',
			'pages.settings.routing.routeRule.androidApps.showSystemApps' => 'Mostrar aplicativos do sistema',
			'pages.settings.routing.routeRule.androidApps.hideSystemApps' => 'Ocultar aplicativos do sistema',
			'pages.settings.routing.routeRule.androidApps.clearSelection' => 'Limpar sele莽茫o',
			'pages.settings.routing.routeRule.androidApps.uninstalled' => 'Desinstalado',
			'pages.settings.dns.title' => 'DNS',
			'pages.settings.dns.remoteDns' => 'DNS remoto',
			'pages.settings.dns.remoteDnsDomainStrategy' => 'Estrat茅gia de dom铆nio de DNS remoto',
			'pages.settings.dns.directDns' => 'Resolvedor de servidor de sa铆da (direto)',
			'pages.settings.dns.directDnsDomainStrategy' => 'Estrat茅gia de dom铆nio de sa铆da',
			'pages.settings.dns.enableDnsRouting' => 'Ativar roteamento de DNS',
			'pages.settings.dns.enableFakeDns' => 'Ativar DNS falso',
			'pages.settings.dns.domainStrategy.auto' => 'Autom谩tico',
			'pages.settings.dns.domainStrategy.preferIpv6' => 'Preferir IPv6',
			'pages.settings.dns.domainStrategy.preferIpv4' => 'Preferir IPv4',
			'pages.settings.dns.domainStrategy.ipv4Only' => 'Apenas IPv4',
			'pages.settings.dns.domainStrategy.ipv6Only' => 'Apenas IPv6',
			'pages.settings.inbound.title' => 'Entrada',
			'pages.settings.inbound.serviceMode' => 'Modo de servi莽o',
			'pages.settings.inbound.serviceModes.proxy' => 'Apenas servi莽o de proxy',
			'pages.settings.inbound.serviceModes.systemProxy' => 'Definir proxy do sistema',
			'pages.settings.inbound.serviceModes.tun' => 'VPN',
			'pages.settings.inbound.serviceModes.tunService' => 'Servi莽o VPN',
			'pages.settings.inbound.shortServiceModes.proxy' => 'Proxy',
			'pages.settings.inbound.shortServiceModes.systemProxy' => 'Proxy do sistema',
			'pages.settings.inbound.shortServiceModes.tun' => 'VPN',
			'pages.settings.inbound.shortServiceModes.tunService' => 'Servi莽o VPN',
			'pages.settings.inbound.strictRoute' => 'Roteamento estrito',
			'pages.settings.inbound.tunImplementation' => 'Implementa莽茫o de TUN',
			'pages.settings.inbound.tunImplementations.mixed' => 'Misto',
			'pages.settings.inbound.tunImplementations.system' => 'Sistema',
			'pages.settings.inbound.tunImplementations.gvisor' => 'gVisor',
			'pages.settings.inbound.mixedPort' => 'Porta mista',
			'pages.settings.inbound.tproxyPort' => 'Porta de proxy transparente',
			'pages.settings.inbound.directPort' => 'Porta de directo',
			'pages.settings.inbound.redirectPort' => 'Porta de redirecionamento',
			'pages.settings.inbound.allowConnectionFromLan' => 'Compartilhar VPN na rede local',
			'pages.settings.tlsTricks.title' => 'Truques de TLS',
			'pages.settings.tlsTricks.enable' => 'Ativar fragmento',
			'pages.settings.tlsTricks.packets' => 'Pacotes de Fragmenta莽茫o',
			'pages.settings.tlsTricks.packetsTlsHello' => 'TLS Hello',
			'pages.settings.tlsTricks.packets1_1' => '1-1',
			'pages.settings.tlsTricks.packets1_2' => '1-2',
			'pages.settings.tlsTricks.packets1_3' => '1-3',
			'pages.settings.tlsTricks.packets1_4' => '1-4',
			'pages.settings.tlsTricks.packets1_5' => '1-5',
			'pages.settings.tlsTricks.size' => 'Tamanho do fragmento',
			'pages.settings.tlsTricks.sleep' => 'Atraso do fragmento',
			'pages.settings.tlsTricks.mixedSniCase.enable' => 'Ativar mai煤sculas/min煤sculas mistas no SNI',
			'pages.settings.tlsTricks.padding.enable' => 'Ativar preenchimento',
			'pages.settings.tlsTricks.padding.size' => 'Tamanho do preenchimento',
			'pages.settings.warp.title' => 'WARP',
			'pages.settings.warp.enable' => 'Ativar WARP',
			'pages.settings.warp.generateConfig' => 'Gerar configura莽茫o WARP',
			'pages.settings.warp.configGenerated' => 'Configura莽茫o WARP gerada',
			'pages.settings.warp.missingConfig' => 'Configura莽茫o WARP ausente',
			'pages.settings.warp.detourMode' => 'Modo de Roteamento WARP',
			'pages.settings.warp.detourModes.proxyOverWarp' => 'Desviar proxies atrav茅s do WARP',
			'pages.settings.warp.detourModes.warpOverProxy' => 'Desviar WARP atrav茅s de proxies',
			'pages.settings.warp.detourModes.proxyOverWarpExplain' => 'Desbloquear proxies com WARP',
			'pages.settings.warp.detourModes.warpOverProxyExplain' => 'Seguran莽a extra com WARP',
			'pages.settings.warp.licenseKey' => 'Chave de licen莽a',
			'pages.settings.warp.cleanIp' => 'IP limpo',
			'pages.settings.warp.port' => 'Porta',
			'pages.settings.warp.noise.count' => 'Contagem de ru铆do',
			'pages.settings.warp.noise.mode' => 'Modo de ru铆do',
			'pages.settings.warp.noise.size' => 'Tamanho do ru铆do',
			'pages.settings.warp.noise.delay' => 'Atraso do ru铆do',
			'components.stats.connection' => 'Conex茫o',
			'components.stats.traffic' => 'Tr谩fego',
			'components.stats.trafficLive' => 'Tr谩fego ao vivo',
			'components.stats.trafficTotal' => 'Tr谩fego total',
			'components.stats.uplink' => 'Envio',
			'components.stats.downlink' => 'Recebimento',
			'components.stats.speed' => 'Velocidade',
			'components.stats.totalTransferred' => 'Total transferido',
			'components.subscriptionInfo.upload' => 'Upload',
			'components.subscriptionInfo.download' => 'Download',
			'components.subscriptionInfo.total' => 'Tr谩fego total',
			'components.subscriptionInfo.expireDate' => 'Data de validade',
			'components.subscriptionInfo.expired' => 'Expirado',
			'components.subscriptionInfo.noTraffic' => 'Cota esgotada',
			'components.subscriptionInfo.remainingTime' => 'Tempo restante',
			'components.subscriptionInfo.remainingDuration' => ({required Object duration}) => '${duration} dias restantes',
			'components.subscriptionInfo.remainingDurationNew' => ({required Object duration}) => '${duration} dias',
			'components.subscriptionInfo.remainingTrafficSemanticLabel' => ({required Object consumed, required Object total}) => '${consumed} de ${total} de tr谩fego consumido',
			'components.subscriptionInfo.remainingTraffic' => 'Tr谩fego restante',
			'components.subscriptionInfo.remainingUsage' => 'Restante',
			'components.subscriptionInfo.profileSite' => 'Provedor',
			'components.subscriptionInfo.profileSupport' => 'Suporte',
			'dialogs.sortProfiles.title' => 'Ordenar por',
			'dialogs.sortProfiles.sort.name' => 'Alfabeticamente',
			'dialogs.sortProfiles.sort.lastUpdate' => '脷ltima atualiza莽茫o',
			'dialogs.warpLicense.title' => 'Consentimento do Cloudflare WARP',
			'dialogs.warpLicense.description' => ({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [ const TextSpan(text: 'O Cloudflare WARP 茅 um provedor de VPN WireGuard gratuito. Ao ativar esta op莽茫o, voc锚 concorda com os '), tos('Termos de Servi莽o'), const TextSpan(text: ' e a '), privacy('Pol铆tica de Privacidade'), const TextSpan(text: ' do Cloudflare WARP.'), ]), 
			'dialogs.newVersion.title' => 'Atualiza莽茫o dispon铆vel',
			'dialogs.newVersion.msg' => 'Uma nova vers茫o do ${_root.common.appTitle} est谩 dispon铆vel. Deseja atualizar agora?',
			'dialogs.newVersion.currentVersion' => 'Vers茫o atual: ',
			'dialogs.newVersion.newVersion' => 'Nova vers茫o: ',
			'dialogs.newVersion.updateNow' => 'Atualizar agora',
			'dialogs.confirmation.settings.import.msg' => 'Isso substituir谩 todas as op莽玫es de configura莽茫o pelos valores fornecidos. Voc锚 tem certeza?',
			'dialogs.confirmation.profile.delete.title' => 'Excluir perfil',
			'dialogs.confirmation.profile.delete.msg' => 'Tem certeza de que deseja excluir este perfil permanentemente?',
			'dialogs.confirmation.perAppProxy.shareOnGithub.title' => 'Melhorando a sele莽茫o autom谩tica',
			'dialogs.confirmation.perAppProxy.shareOnGithub.msg' => 'Ao compartilhar os aplicativos selecionados, voc锚 ajuda a completar a lista de "sele莽茫o autom谩tica"',
			'dialogs.confirmation.perAppProxy.import.msg' => 'Isso substituir谩 todas as suas sele莽玫es atuais de proxy por aplicativo. Tem certeza de que deseja continuar?',
			'dialogs.confirmation.routeRule.delete.title' => 'Excluir regra',
			'dialogs.confirmation.routeRule.delete.msg' => ({required Object rulename}) => 'Tem certeza de que deseja excluir a regra "${rulename}"?',
			'dialogs.experimentalNotice.title' => 'Recursos experimentais em uso',
			'dialogs.experimentalNotice.msg' => 'Voc锚 ativou alguns recursos experimentais que podem afetar a qualidade da conex茫o e causar erros inesperados. Voc锚 sempre pode alterar ou redefinir essas op莽玫es na p谩gina de configura莽玫es.',
			'dialogs.experimentalNotice.disable' => 'N茫o mostrar novamente',
			'dialogs.noActiveProfile.title' => 'Escolha um perfil',
			'dialogs.noActiveProfile.msg' => 'Para come莽ar, adicione um perfil de conex茫o que inclua os detalhes da sua conex茫o VPN.\n\nAinda n茫o tem um servidor VPN? N茫o se preocupe, siga o tutorial abaixo para configurar um rapidamente e de gra莽a.',
			'dialogs.noActiveProfile.helpBtn.label' => 'Mostre-me como',
			'dialogs.noActiveProfile.helpBtn.url' => 'https://github.com/shulaiyun/Sloth-VPN.git',
			'dialogs.unknownDomainsWarning.title' => 'Aviso de link externo',
			'dialogs.unknownDomainsWarning.youAreAboutToVisit' => 'Voc锚 est谩 prestes a visitar:',
			'dialogs.unknownDomainsWarning.thisWebsiteIsNotInOurTrustedList' => 'Este site n茫o est谩 na nossa lista de confian莽a. Prossiga com cautela.',
			'dialogs.proxyInfo.fullTag' => 'Tag completa:',
			'dialogs.proxyInfo.type' => 'Tipo:',
			'dialogs.proxyInfo.testTime' => 'Hora do teste:',
			'dialogs.proxyInfo.testDelay' => 'Lat锚ncia do teste:',
			'dialogs.proxyInfo.isSelected' => 'Selecionado:',
			'dialogs.proxyInfo.isGroup' => '脡 um grupo',
			'dialogs.proxyInfo.isSecure' => '脡 seguro:',
			'dialogs.proxyInfo.port' => 'Porta:',
			'dialogs.proxyInfo.host' => 'Host:',
			'dialogs.proxyInfo.ip' => 'IP:',
			'dialogs.proxyInfo.countryCode' => 'C贸digo do pa铆s:',
			'dialogs.proxyInfo.region' => 'Regi茫o:',
			'dialogs.proxyInfo.city' => 'Cidade:',
			'dialogs.proxyInfo.asn' => 'ASN:',
			'dialogs.proxyInfo.organization' => 'Organiza莽茫o:',
			'dialogs.proxyInfo.location' => 'Localiza莽茫o:',
			'dialogs.proxyInfo.postalCode' => 'C贸digo postal:',
			'dialogs.windowClosing.askEachTime' => 'Perguntar sempre',
			'dialogs.windowClosing.alertMessage' => 'Ocultar ou sair do aplicativo?',
			'dialogs.windowClosing.remember' => 'Lembrar minha escolha',
			'connection.tapToConnect' => 'Toque para conectar',
			'connection.connect' => 'Conectar',
			'connection.connecting' => 'Conectando...',
			'connection.connected' => 'Conectado',
			'connection.disconnect' => 'Desconectar',
			'connection.disconnecting' => 'Desconectando...',
			'connection.reconnect' => 'Reconectar',
			'connection.reconnectMsg' => 'Reconectando para aplicar as altera莽玫es...',
			'connection.secure' => 'Protegido por WARP',
			'errors.unexpected' => 'Erro inesperado',
			'errors.connection.unexpected' => 'Erro de conex茫o inesperado',
			'errors.connection.timeout' => 'Tempo limite de conex茫o esgotado',
			'errors.connection.badResponse' => 'Resposta inv谩lida',
			'errors.connection.connectionError' => 'Erro de conex茫o',
			'errors.connection.badCertificate' => 'Certificado inv谩lido',
			'errors.profiles.unexpected' => 'Erro inesperado',
			'errors.profiles.notFound' => 'Perfil n茫o encontrado',
			'errors.profiles.invalidConfig' => 'Configura莽玫es inv谩lidas',
			'errors.profiles.invalidUrl' => 'URL inv谩lida',
			'errors.profiles.canceledByUser' => 'Cancelado pelo usu谩rio',
			'errors.connectivity.unexpected' => 'Falha inesperada',
			'errors.connectivity.missingVpnPermission' => 'Permiss茫o de VPN ausente',
			'errors.connectivity.missingNotificationPermission' => 'Permiss茫o de notifica莽茫o ausente',
			'errors.connectivity.core' => 'Erro no n煤cleo',
			'errors.singbox.serviceNotRunning' => 'O servi莽o n茫o est谩 em execu莽茫o',
			'errors.singbox.missingPrivilege' => 'Permiss茫o ausente',
			'errors.singbox.missingPrivilegeMsg' => 'O modo VPN requer privil茅gios de administrador. Reinicie o aplicativo como administrador ou altere o modo de servi莽o.',
			'errors.singbox.invalidConfigOptions' => 'Op莽玫es de configura莽茫o inv谩lidas',
			'errors.singbox.invalidConfig' => 'Configura莽茫o inv谩lida',
			'errors.warp.missingLicense' => 'Licen莽a do WARP ausente',
			'errors.warp.missingLicenseMsg' => 'O perfil selecionado usa o recurso WARP. Para usar este recurso, voc锚 deve concordar com a licen莽a do WARP.',
			_ => null,
		};
	}
}

