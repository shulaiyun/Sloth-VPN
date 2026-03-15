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
class TranslationsId extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsId({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.id,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <id>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsId _root = this; // ignore: unused_field

	@override 
	TranslationsId $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsId(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonId common = TranslationsCommonId._(_root);
	@override late final TranslationsIntroId intro = TranslationsIntroId._(_root);
	@override late final TranslationsPagesId pages = TranslationsPagesId._(_root);
	@override late final TranslationsComponentsId components = TranslationsComponentsId._(_root);
	@override late final TranslationsDialogsId dialogs = TranslationsDialogsId._(_root);
	@override late final TranslationsConnectionId connection = TranslationsConnectionId._(_root);
	@override late final TranslationsErrorsId errors = TranslationsErrorsId._(_root);
}

// Path: common
class TranslationsCommonId extends TranslationsCommonEn {
	TranslationsCommonId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get appTitle => '树懒VPN';
	@override String get start => 'Mulai';
	@override String get version => 'Versi';
	@override String get ok => 'Oke';
	@override String get cancel => 'Batal';
	@override String get kContinue => 'Lanjutkan';
	@override String get showMore => 'Tampilkan lebih banyak';
	@override String get showLess => 'Tampilkan lebih sedikit';
	@override String get filter => 'Filter';
	@override String get all => 'Semua';
	@override String get pause => 'Jeda';
	@override String get resume => 'Lanjutkan';
	@override String get clear => 'Bersihkan';
	@override String get close => 'Tutup';
	@override String get auto => 'Otomatis';
	@override String get manually => 'Manual';
	@override String get name => 'Nama';
	@override String get url => 'URL';
	@override String get add => 'Tambah';
	@override String get clipboard => 'Papan klip';
	@override String get addToClipboard => 'Tambah ke papan klip';
	@override String get scanQr => 'Pindai QR';
	@override String get free => 'Gratis';
	@override String get warp => 'WARP';
	@override String get fragment => 'Fragmen';
	@override String get help => 'Bantuan';
	@override String get save => 'Simpan';
	@override String get update => 'Perbarui';
	@override String get share => 'Bagikan';
	@override String get edit => 'Edit';
	@override String get delete => 'Hapus';
	@override String get discard => 'Buang';
	@override String get import => 'Impor';
	@override String get export => 'Ekspor';
	@override String get later => 'Nanti';
	@override String get ignore => 'Abaikan';
	@override String get quit => 'Keluar';
	@override String get notSet => 'Belum diatur';
	@override String get hide => 'Sembunyikan';
	@override String get exit => 'Keluar';
	@override String get reset => 'Setel ulang';
	@override String get done => 'Selesai';
	@override String get search => 'Cari';
	@override String get decline => 'Tolak';
	@override String get agree => 'Setuju';
	@override String get empty => 'Kosong';
	@override String get unknown => 'Tidak dikenal';
	@override String get hidden => 'Tersembunyi';
	@override String get timeout => 'Waktu habis';
	@override String get sort => 'Urutkan';
	@override String get dashboard => 'Dasbor';
	@override late final TranslationsCommonIntervalId interval = TranslationsCommonIntervalId._(_root);
	@override late final TranslationsCommonMsgId msg = TranslationsCommonMsgId._(_root);
}

// Path: intro
class TranslationsIntroId extends TranslationsIntroEn {
	TranslationsIntroId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get banner => 'Semua yang Anda butuhkan untuk internet tanpa batasan';
	@override TextSpan termsAndPolicyCaution({required InlineSpanBuilder tap}) => TextSpan(children: [
		const TextSpan(text: 'Dengan melanjutkan, Anda menyetujui '),
		tap(_root.pages.about.termsAndConditions),
	]);
	@override TextSpan info({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [
		const TextSpan(text: 'Dibuat dengan 鉂わ笍 oleh Hiddify - '),
		tap_source('Sumber Terbuka'),
		const TextSpan(text: ' ('),
		tap_license('Lisensi'),
		const TextSpan(text: ')'),
	]);
}

// Path: pages
class TranslationsPagesId extends TranslationsPagesEn {
	TranslationsPagesId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesHomeId home = TranslationsPagesHomeId._(_root);
	@override late final TranslationsPagesProxiesId proxies = TranslationsPagesProxiesId._(_root);
	@override late final TranslationsPagesProfilesId profiles = TranslationsPagesProfilesId._(_root);
	@override late final TranslationsPagesProfileDetailsId profileDetails = TranslationsPagesProfileDetailsId._(_root);
	@override late final TranslationsPagesLogsId logs = TranslationsPagesLogsId._(_root);
	@override late final TranslationsPagesAboutId about = TranslationsPagesAboutId._(_root);
	@override late final TranslationsPagesSettingsId settings = TranslationsPagesSettingsId._(_root);
}

// Path: components
class TranslationsComponentsId extends TranslationsComponentsEn {
	TranslationsComponentsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsComponentsStatsId stats = TranslationsComponentsStatsId._(_root);
	@override late final TranslationsComponentsSubscriptionInfoId subscriptionInfo = TranslationsComponentsSubscriptionInfoId._(_root);
}

// Path: dialogs
class TranslationsDialogsId extends TranslationsDialogsEn {
	TranslationsDialogsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsSortProfilesId sortProfiles = TranslationsDialogsSortProfilesId._(_root);
	@override late final TranslationsDialogsWarpLicenseId warpLicense = TranslationsDialogsWarpLicenseId._(_root);
	@override late final TranslationsDialogsNewVersionId newVersion = TranslationsDialogsNewVersionId._(_root);
	@override late final TranslationsDialogsConfirmationId confirmation = TranslationsDialogsConfirmationId._(_root);
	@override late final TranslationsDialogsExperimentalNoticeId experimentalNotice = TranslationsDialogsExperimentalNoticeId._(_root);
	@override late final TranslationsDialogsNoActiveProfileId noActiveProfile = TranslationsDialogsNoActiveProfileId._(_root);
	@override late final TranslationsDialogsUnknownDomainsWarningId unknownDomainsWarning = TranslationsDialogsUnknownDomainsWarningId._(_root);
	@override late final TranslationsDialogsProxyInfoId proxyInfo = TranslationsDialogsProxyInfoId._(_root);
	@override late final TranslationsDialogsWindowClosingId windowClosing = TranslationsDialogsWindowClosingId._(_root);
}

// Path: connection
class TranslationsConnectionId extends TranslationsConnectionEn {
	TranslationsConnectionId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get tapToConnect => 'Ketuk untuk menyambungkan';
	@override String get connect => 'Sambungkan';
	@override String get connecting => 'Menyambungkan...';
	@override String get connected => 'Tersambung';
	@override String get disconnect => 'Putuskan';
	@override String get disconnecting => 'Memutuskan...';
	@override String get reconnect => 'Sambungkan kembali';
	@override String get reconnectMsg => 'Menyambungkan kembali untuk menerapkan perubahan...';
	@override String get secure => 'Diamankan oleh WARP';
}

// Path: errors
class TranslationsErrorsId extends TranslationsErrorsEn {
	TranslationsErrorsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Kesalahan tak terduga';
	@override late final TranslationsErrorsConnectionId connection = TranslationsErrorsConnectionId._(_root);
	@override late final TranslationsErrorsProfilesId profiles = TranslationsErrorsProfilesId._(_root);
	@override late final TranslationsErrorsConnectivityId connectivity = TranslationsErrorsConnectivityId._(_root);
	@override late final TranslationsErrorsSingboxId singbox = TranslationsErrorsSingboxId._(_root);
	@override late final TranslationsErrorsWarpId warp = TranslationsErrorsWarpId._(_root);
}

// Path: common.interval
class TranslationsCommonIntervalId extends TranslationsCommonIntervalEn {
	TranslationsCommonIntervalId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		zero: '',
		one: '${n} hari',
		other: '${n} hari',
	);
	@override String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		zero: '',
		one: '${n} jam',
		other: '${n} jam',
	);
}

// Path: common.msg
class TranslationsCommonMsgId extends TranslationsCommonMsgEn {
	TranslationsCommonMsgId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgPermissionId permission = TranslationsCommonMsgPermissionId._(_root);
	@override late final TranslationsCommonMsgExportId export = TranslationsCommonMsgExportId._(_root);
	@override late final TranslationsCommonMsgImportId import = TranslationsCommonMsgImportId._(_root);
}

// Path: pages.home
class TranslationsPagesHomeId extends TranslationsPagesHomeEn {
	TranslationsPagesHomeId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Beranda';
	@override String get quickSettings => 'Pengaturan cepat';
}

// Path: pages.proxies
class TranslationsPagesProxiesId extends TranslationsPagesProxiesEn {
	TranslationsPagesProxiesId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Proxy';
	@override String get sort => 'Urutkan proksi';
	@override String get testDelay => 'Uji latensi';
	@override String get empty => 'Tidak ada proksi yang tersedia';
	@override String get activeProxy => 'Proksi aktif';
	@override String get unknownIp => 'IP tidak dikenal';
	@override late final TranslationsPagesProxiesSortOptionsId sortOptions = TranslationsPagesProxiesSortOptionsId._(_root);
	@override late final TranslationsPagesProxiesIpInfoId ipInfo = TranslationsPagesProxiesIpInfoId._(_root);
	@override late final TranslationsPagesProxiesDelayId delay = TranslationsPagesProxiesDelayId._(_root);
}

// Path: pages.profiles
class TranslationsPagesProfilesId extends TranslationsPagesProfilesEn {
	TranslationsPagesProfilesId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override String get add => 'Tambah profil';
	@override String get update => 'Perbarui profil';
	@override String get viewAllProfiles => 'Lihat semua profil';
	@override String activeProfileName({required Object name}) => 'Nama profil aktif: "${name}".';
	@override String nonActiveProfileName({required Object name}) => 'Pilih "${name}" sebagai profil aktif';
	@override String get freeSubNotFound => 'Tidak ada langganan gratis yang ditemukan';
	@override String freeSubNotFoundForRegion({required Object region}) => 'Tidak ada langganan gratis yang ditemukan untuk wilayah "${region}"';
	@override String get failedToLoad => 'Gagal memuat';
	@override String get updateSubscriptions => 'Perbarui langganan';
	@override late final TranslationsPagesProfilesShareId share = TranslationsPagesProfilesShareId._(_root);
	@override late final TranslationsPagesProfilesMsgId msg = TranslationsPagesProfilesMsgId._(_root);
}

// Path: pages.profileDetails
class TranslationsPagesProfileDetailsId extends TranslationsPagesProfileDetailsEn {
	TranslationsPagesProfileDetailsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override String get lastUpdate => 'Terakhir diperbarui';
	@override late final TranslationsPagesProfileDetailsFormId form = TranslationsPagesProfileDetailsFormId._(_root);
}

// Path: pages.logs
class TranslationsPagesLogsId extends TranslationsPagesLogsEn {
	TranslationsPagesLogsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Log';
	@override String get shareCoreLogs => 'Bagikan log inti';
	@override String get shareAppLogs => 'Bagikan log aplikasi';
}

// Path: pages.about
class TranslationsPagesAboutId extends TranslationsPagesAboutEn {
	TranslationsPagesAboutId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tentang';
	@override String get notAvailableMsg => 'Anda sudah menggunakan versi terbaru';
	@override String get checkForUpdate => 'Periksa pembaruan';
	@override String get openWorkingDir => 'Buka direktori kerja';
	@override String get sourceCode => 'Kode sumber';
	@override String get telegramChannel => 'Saluran Telegram';
	@override String get termsAndConditions => 'Syarat dan Ketentuan';
	@override String get privacyPolicy => 'Kebijakan Privasi';
}

// Path: pages.settings
class TranslationsPagesSettingsId extends TranslationsPagesSettingsEn {
	TranslationsPagesSettingsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pengaturan';
	@override String get resetTunnel => 'Setel ulang profil VPN';
	@override late final TranslationsPagesSettingsOptionsId options = TranslationsPagesSettingsOptionsId._(_root);
	@override late final TranslationsPagesSettingsGeneralId general = TranslationsPagesSettingsGeneralId._(_root);
	@override late final TranslationsPagesSettingsRoutingId routing = TranslationsPagesSettingsRoutingId._(_root);
	@override late final TranslationsPagesSettingsDnsId dns = TranslationsPagesSettingsDnsId._(_root);
	@override late final TranslationsPagesSettingsInboundId inbound = TranslationsPagesSettingsInboundId._(_root);
	@override late final TranslationsPagesSettingsTlsTricksId tlsTricks = TranslationsPagesSettingsTlsTricksId._(_root);
	@override late final TranslationsPagesSettingsWarpId warp = TranslationsPagesSettingsWarpId._(_root);
}

// Path: components.stats
class TranslationsComponentsStatsId extends TranslationsComponentsStatsEn {
	TranslationsComponentsStatsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get connection => 'Koneksi';
	@override String get traffic => 'Lalu lintas';
	@override String get trafficLive => 'Lalu lintas langsung';
	@override String get trafficTotal => 'Total lalu lintas';
	@override String get uplink => 'Unggah';
	@override String get downlink => 'Unduh';
	@override String get speed => 'Kecepatan';
	@override String get totalTransferred => 'Total ditransfer';
}

// Path: components.subscriptionInfo
class TranslationsComponentsSubscriptionInfoId extends TranslationsComponentsSubscriptionInfoEn {
	TranslationsComponentsSubscriptionInfoId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get upload => 'Unggah';
	@override String get download => 'Unduh';
	@override String get total => 'Total lalu lintas';
	@override String get expireDate => 'Tanggal kedaluwarsa';
	@override String get expired => 'Kedaluwarsa';
	@override String get noTraffic => 'Kuota habis';
	@override String get remainingTime => 'Sisa waktu';
	@override String remainingDuration({required Object duration}) => 'tersisa ${duration} hari';
	@override String remainingDurationNew({required Object duration}) => '${duration} hari';
	@override String remainingTrafficSemanticLabel({required Object consumed, required Object total}) => '${consumed} dari ${total} lalu lintas terpakai';
	@override String get remainingTraffic => 'Sisa lalu lintas';
	@override String get remainingUsage => 'Sisa';
	@override String get profileSite => 'Penyedia';
	@override String get profileSupport => 'Dukungan';
}

// Path: dialogs.sortProfiles
class TranslationsDialogsSortProfilesId extends TranslationsDialogsSortProfilesEn {
	TranslationsDialogsSortProfilesId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Urut berdasarkan';
	@override late final TranslationsDialogsSortProfilesSortId sort = TranslationsDialogsSortProfilesSortId._(_root);
}

// Path: dialogs.warpLicense
class TranslationsDialogsWarpLicenseId extends TranslationsDialogsWarpLicenseEn {
	TranslationsDialogsWarpLicenseId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Persetujuan Cloudflare WARP';
	@override TextSpan description({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [
		const TextSpan(text: 'Cloudflare WARP adalah penyedia VPN WireGuard gratis. Dengan mengaktifkan opsi ini, Anda menyetujui '),
		tos('Ketentuan Layanan'),
		const TextSpan(text: ' dan '),
		privacy('Kebijakan Privasi'),
		const TextSpan(text: ' Cloudflare WARP.'),
	]);
}

// Path: dialogs.newVersion
class TranslationsDialogsNewVersionId extends TranslationsDialogsNewVersionEn {
	TranslationsDialogsNewVersionId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pembaruan tersedia';
	@override String get msg => 'Versi baru ${_root.common.appTitle} tersedia. Apakah Anda ingin memperbarui sekarang?';
	@override String get currentVersion => 'Versi saat ini: ';
	@override String get newVersion => 'Versi baru: ';
	@override String get updateNow => 'Perbarui sekarang';
}

// Path: dialogs.confirmation
class TranslationsDialogsConfirmationId extends TranslationsDialogsConfirmationEn {
	TranslationsDialogsConfirmationId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsId settings = TranslationsDialogsConfirmationSettingsId._(_root);
	@override late final TranslationsDialogsConfirmationProfileId profile = TranslationsDialogsConfirmationProfileId._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyId perAppProxy = TranslationsDialogsConfirmationPerAppProxyId._(_root);
	@override late final TranslationsDialogsConfirmationRouteRuleId routeRule = TranslationsDialogsConfirmationRouteRuleId._(_root);
}

// Path: dialogs.experimentalNotice
class TranslationsDialogsExperimentalNoticeId extends TranslationsDialogsExperimentalNoticeEn {
	TranslationsDialogsExperimentalNoticeId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fitur eksperimental sedang digunakan';
	@override String get msg => 'Anda telah mengaktifkan beberapa fitur eksperimental yang mungkin memengaruhi kualitas koneksi dan menyebabkan kesalahan tak terduga. Anda selalu dapat mengubah atau menyetel ulang opsi ini dari halaman konfigurasi.';
	@override String get disable => 'Jangan tampilkan lagi';
}

// Path: dialogs.noActiveProfile
class TranslationsDialogsNoActiveProfileId extends TranslationsDialogsNoActiveProfileEn {
	TranslationsDialogsNoActiveProfileId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pilih profil';
	@override String get msg => 'Mari kita mulai dengan menambahkan profil koneksi yang berisi detail koneksi VPN Anda.\n\nBelum punya server VPN? Jangan khawatir, ikuti tutorial di bawah ini untuk mengaturnya dengan cepat dan gratis.';
	@override late final TranslationsDialogsNoActiveProfileHelpBtnId helpBtn = TranslationsDialogsNoActiveProfileHelpBtnId._(_root);
}

// Path: dialogs.unknownDomainsWarning
class TranslationsDialogsUnknownDomainsWarningId extends TranslationsDialogsUnknownDomainsWarningEn {
	TranslationsDialogsUnknownDomainsWarningId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Peringatan tautan eksternal';
	@override String get youAreAboutToVisit => 'Anda akan mengunjungi:';
	@override String get thisWebsiteIsNotInOurTrustedList => 'Situs web ini tidak ada dalam daftar tepercaya kami. Harap lanjutkan dengan hati-hati.';
}

// Path: dialogs.proxyInfo
class TranslationsDialogsProxyInfoId extends TranslationsDialogsProxyInfoEn {
	TranslationsDialogsProxyInfoId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get fullTag => 'Tag lengkap:';
	@override String get type => 'Tipe:';
	@override String get testTime => 'Waktu uji:';
	@override String get testDelay => 'Jeda uji:';
	@override String get isSelected => 'Dipilih:';
	@override String get isGroup => 'Grup';
	@override String get isSecure => 'Aman:';
	@override String get port => 'Port:';
	@override String get host => 'Host:';
	@override String get ip => 'IP:';
	@override String get countryCode => 'Kode negara:';
	@override String get region => 'Wilayah:';
	@override String get city => 'Kota:';
	@override String get asn => 'ASN:';
	@override String get organization => 'Organisasi:';
	@override String get location => 'Lokasi:';
	@override String get postalCode => 'Kode pos:';
}

// Path: dialogs.windowClosing
class TranslationsDialogsWindowClosingId extends TranslationsDialogsWindowClosingEn {
	TranslationsDialogsWindowClosingId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get askEachTime => 'Tanyakan setiap kali';
	@override String get alertMessage => 'Sembunyikan atau keluar dari aplikasi?';
	@override String get remember => 'Ingat pilihan saya';
}

// Path: errors.connection
class TranslationsErrorsConnectionId extends TranslationsErrorsConnectionEn {
	TranslationsErrorsConnectionId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Kesalahan koneksi tak terduga';
	@override String get timeout => 'Waktu koneksi habis';
	@override String get badResponse => 'Respons buruk';
	@override String get connectionError => 'Kesalahan koneksi';
	@override String get badCertificate => 'Sertifikat rusak';
}

// Path: errors.profiles
class TranslationsErrorsProfilesId extends TranslationsErrorsProfilesEn {
	TranslationsErrorsProfilesId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Kesalahan tak terduga';
	@override String get notFound => 'Profil tidak ditemukan';
	@override String get invalidConfig => 'Konfigurasi tidak valid';
	@override String get invalidUrl => 'URL tidak valid';
	@override String get canceledByUser => 'Dibatalkan oleh pengguna';
}

// Path: errors.connectivity
class TranslationsErrorsConnectivityId extends TranslationsErrorsConnectivityEn {
	TranslationsErrorsConnectivityId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Kegagalan tak terduga';
	@override String get missingVpnPermission => 'Izin VPN hilang';
	@override String get missingNotificationPermission => 'Izin notifikasi hilang';
	@override String get core => 'Kesalahan inti';
}

// Path: errors.singbox
class TranslationsErrorsSingboxId extends TranslationsErrorsSingboxEn {
	TranslationsErrorsSingboxId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get serviceNotRunning => 'Layanan tidak berjalan';
	@override String get missingPrivilege => 'Izin hilang';
	@override String get missingPrivilegeMsg => 'Mode VPN memerlukan izin administrator. Harap mulai ulang aplikasi sebagai administrator atau ubah mode layanan.';
	@override String get invalidConfigOptions => 'Opsi konfigurasi tidak valid';
	@override String get invalidConfig => 'Konfigurasi tidak valid';
}

// Path: errors.warp
class TranslationsErrorsWarpId extends TranslationsErrorsWarpEn {
	TranslationsErrorsWarpId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get missingLicense => 'Lisensi WARP hilang';
	@override String get missingLicenseMsg => 'Profil yang dipilih menggunakan fitur WARP. Untuk menggunakan fitur ini, Anda harus menyetujui lisensi WARP.';
}

// Path: common.msg.permission
class TranslationsCommonMsgPermissionId extends TranslationsCommonMsgPermissionEn {
	TranslationsCommonMsgPermissionId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get denied => 'Izin ditolak';
}

// Path: common.msg.export
class TranslationsCommonMsgExportId extends TranslationsCommonMsgExportEn {
	TranslationsCommonMsgExportId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMsgExportClipboardId clipboard = TranslationsCommonMsgExportClipboardId._(_root);
	@override late final TranslationsCommonMsgExportFileId file = TranslationsCommonMsgExportFileId._(_root);
}

// Path: common.msg.import
class TranslationsCommonMsgImportId extends TranslationsCommonMsgImportEn {
	TranslationsCommonMsgImportId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get confirm => 'Konfirmasi impor';
	@override String get success => 'Berhasil diimpor';
	@override String get failure => 'Gagal mengimpor';
}

// Path: pages.proxies.sortOptions
class TranslationsPagesProxiesSortOptionsId extends TranslationsPagesProxiesSortOptionsEn {
	TranslationsPagesProxiesSortOptionsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get unsorted => 'Default';
	@override String get name => 'Berdasarkan abjad';
	@override String get delay => 'Berdasarkan latensi';
}

// Path: pages.proxies.ipInfo
class TranslationsPagesProxiesIpInfoId extends TranslationsPagesProxiesIpInfoEn {
	TranslationsPagesProxiesIpInfoId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get address => 'Alamat IP';
	@override String get country => 'Negara';
	@override String get organization => 'Organisasi';
}

// Path: pages.proxies.delay
class TranslationsPagesProxiesDelayId extends TranslationsPagesProxiesDelayEn {
	TranslationsPagesProxiesDelayId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String result({required Object delay}) => 'Latensi: ${delay}ms';
	@override String get timeout => 'Waktu tes latensi habis';
	@override String get testing => 'Latensi: sedang menguji...';
}

// Path: pages.profiles.share
class TranslationsPagesProfilesShareId extends TranslationsPagesProfilesShareEn {
	TranslationsPagesProfilesShareId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get urlToClipboard => 'URL ke papan klip';
	@override String get showUrlQr => 'Tampilkan QR URL';
	@override String get jsonToClipboard => 'JSON ke papan klip';
}

// Path: pages.profiles.msg
class TranslationsPagesProfilesMsgId extends TranslationsPagesProfilesMsgEn {
	TranslationsPagesProfilesMsgId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesProfilesMsgSaveId save = TranslationsPagesProfilesMsgSaveId._(_root);
	@override String get invalidUrl => 'URL tidak valid';
	@override late final TranslationsPagesProfilesMsgAddId add = TranslationsPagesProfilesMsgAddId._(_root);
	@override late final TranslationsPagesProfilesMsgUpdateId update = TranslationsPagesProfilesMsgUpdateId._(_root);
	@override late final TranslationsPagesProfilesMsgDeleteId delete = TranslationsPagesProfilesMsgDeleteId._(_root);
}

// Path: pages.profileDetails.form
class TranslationsPagesProfileDetailsFormId extends TranslationsPagesProfileDetailsFormEn {
	TranslationsPagesProfileDetailsFormId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get nameHint => 'Nama profil';
	@override String get emptyName => 'Nama wajib diisi';
	@override String get invalidUrl => 'URL tidak valid';
	@override String get urlHint => 'URL konfigurasi lengkap';
	@override String get disableAutoUpdate => 'Nonaktifkan pembaruan otomatis';
	@override String get autoUpdateInterval => 'Interval pembaruan otomatis';
	@override String get loading => 'Menambahkan profil...';
}

// Path: pages.settings.options
class TranslationsPagesSettingsOptionsId extends TranslationsPagesSettingsOptionsEn {
	TranslationsPagesSettingsOptionsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsOptionsImportId import = TranslationsPagesSettingsOptionsImportId._(_root);
	@override late final TranslationsPagesSettingsOptionsExportId export = TranslationsPagesSettingsOptionsExportId._(_root);
	@override String get reset => 'Setel ulang opsi';
}

// Path: pages.settings.general
class TranslationsPagesSettingsGeneralId extends TranslationsPagesSettingsGeneralEn {
	TranslationsPagesSettingsGeneralId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Umum';
	@override String get locale => 'Bahasa';
	@override String get themeMode => 'Tema';
	@override late final TranslationsPagesSettingsGeneralThemeModesId themeModes = TranslationsPagesSettingsGeneralThemeModesId._(_root);
	@override String get enableAnalytics => 'Aktifkan analitik';
	@override String get enableAnalyticsMsg => 'Berikan izin untuk mengumpulkan analitik dan mengirim laporan kerusakan untuk meningkatkan aplikasi';
	@override String get autoIpCheck => 'Periksa IP koneksi secara otomatis';
	@override String get dynamicNotification => 'Tampilkan kecepatan di notifikasi';
	@override String get hapticFeedback => 'Umpan balik haptik';
	@override String get actionAtClosing => 'Tindakan saat menutup';
	@override String get autoStart => 'Mulai saat masuk';
	@override String get silentStart => 'Mulai diminimalkan';
	@override String get ignoreBatteryOptimizations => 'Nonaktifkan optimasi baterai';
	@override String get ignoreBatteryOptimizationsMsg => 'Hapus batasan untuk kinerja VPN yang optimal';
	@override String get memoryLimit => 'Batas memori';
	@override String get memoryLimitMsg => 'Aktifkan jika Anda mengalami kesalahan kehabisan memori atau aplikasi sering macet';
	@override String get debugMode => 'Mode debug';
	@override String get debugModeMsg => 'Mulai ulang aplikasi untuk menerapkan perubahan ini';
	@override String get logLevel => 'Level log';
	@override String get connectionTestUrl => 'URL uji koneksi';
	@override String get urlTestInterval => 'Interval uji URL';
	@override String get clashApiPort => 'Port API Clash';
	@override String get useXrayCoreWhenPossible => 'Gunakan xray-core jika memungkinkan';
	@override String get useXrayCoreWhenPossibleMsg => 'Gunakan xray-core saat mengurai tautan langganan. Anda perlu mengimpor ulang tautan untuk mengaktifkan opsi ini.';
}

// Path: pages.settings.routing
class TranslationsPagesSettingsRoutingId extends TranslationsPagesSettingsRoutingEn {
	TranslationsPagesSettingsRoutingId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Perutean';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyId perAppProxy = TranslationsPagesSettingsRoutingPerAppProxyId._(_root);
	@override String get region => 'Wilayah';
	@override late final TranslationsPagesSettingsRoutingRegionsId regions = TranslationsPagesSettingsRoutingRegionsId._(_root);
	@override late final TranslationsPagesSettingsRoutingBalancerStrategyId balancerStrategy = TranslationsPagesSettingsRoutingBalancerStrategyId._(_root);
	@override String get blockAds => 'Blokir iklan';
	@override String get bypassLan => 'Lewati LAN';
	@override String get resolveDestination => 'Resolusi tujuan';
	@override String get ipv6Route => 'Rute IPv6';
	@override late final TranslationsPagesSettingsRoutingIpv6ModesId ipv6Modes = TranslationsPagesSettingsRoutingIpv6ModesId._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleId routeRule = TranslationsPagesSettingsRoutingRouteRuleId._(_root);
}

// Path: pages.settings.dns
class TranslationsPagesSettingsDnsId extends TranslationsPagesSettingsDnsEn {
	TranslationsPagesSettingsDnsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'DNS';
	@override String get remoteDns => 'DNS jarak jauh';
	@override String get remoteDnsDomainStrategy => 'Strategi domain DNS jarak jauh';
	@override String get directDns => 'Penyelesai server keluar (langsung)';
	@override String get directDnsDomainStrategy => 'Strategi domain keluar';
	@override String get enableDnsRouting => 'Aktifkan perutean DNS';
	@override String get enableFakeDns => 'Aktifkan DNS palsu';
	@override late final TranslationsPagesSettingsDnsDomainStrategyId domainStrategy = TranslationsPagesSettingsDnsDomainStrategyId._(_root);
}

// Path: pages.settings.inbound
class TranslationsPagesSettingsInboundId extends TranslationsPagesSettingsInboundEn {
	TranslationsPagesSettingsInboundId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Masuk';
	@override String get serviceMode => 'Mode layanan';
	@override late final TranslationsPagesSettingsInboundServiceModesId serviceModes = TranslationsPagesSettingsInboundServiceModesId._(_root);
	@override late final TranslationsPagesSettingsInboundShortServiceModesId shortServiceModes = TranslationsPagesSettingsInboundShortServiceModesId._(_root);
	@override String get strictRoute => 'Rute ketat';
	@override String get tunImplementation => 'Implementasi TUN';
	@override late final TranslationsPagesSettingsInboundTunImplementationsId tunImplementations = TranslationsPagesSettingsInboundTunImplementationsId._(_root);
	@override String get mixedPort => 'Port campuran';
	@override String get tproxyPort => 'Port proksi transparan';
	@override String get directPort => 'Port direct';
	@override String get redirectPort => 'Port pengalihan';
	@override String get allowConnectionFromLan => 'Bagikan VPN di jaringan lokal';
}

// Path: pages.settings.tlsTricks
class TranslationsPagesSettingsTlsTricksId extends TranslationsPagesSettingsTlsTricksEn {
	TranslationsPagesSettingsTlsTricksId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Trik TLS';
	@override String get enable => 'Aktifkan fragmen';
	@override String get packets => 'Paket Fragmentasi';
	@override String get packetsTlsHello => 'TLS Hello';
	@override String get packets1_1 => '1-1';
	@override String get packets1_2 => '1-2';
	@override String get packets1_3 => '1-3';
	@override String get packets1_4 => '1-4';
	@override String get packets1_5 => '1-5';
	@override String get size => 'Ukuran fragmen';
	@override String get sleep => 'Jeda fragmen';
	@override late final TranslationsPagesSettingsTlsTricksMixedSniCaseId mixedSniCase = TranslationsPagesSettingsTlsTricksMixedSniCaseId._(_root);
	@override late final TranslationsPagesSettingsTlsTricksPaddingId padding = TranslationsPagesSettingsTlsTricksPaddingId._(_root);
}

// Path: pages.settings.warp
class TranslationsPagesSettingsWarpId extends TranslationsPagesSettingsWarpEn {
	TranslationsPagesSettingsWarpId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'WARP';
	@override String get enable => 'Aktifkan WARP';
	@override String get generateConfig => 'Buat konfigurasi WARP';
	@override String get configGenerated => 'Konfigurasi WARP dibuat';
	@override String get missingConfig => 'Konfigurasi WARP hilang';
	@override String get detourMode => 'Mode Rute WARP';
	@override late final TranslationsPagesSettingsWarpDetourModesId detourModes = TranslationsPagesSettingsWarpDetourModesId._(_root);
	@override String get licenseKey => 'Kunci lisensi';
	@override String get cleanIp => 'IP bersih';
	@override String get port => 'Port';
	@override late final TranslationsPagesSettingsWarpNoiseId noise = TranslationsPagesSettingsWarpNoiseId._(_root);
}

// Path: dialogs.sortProfiles.sort
class TranslationsDialogsSortProfilesSortId extends TranslationsDialogsSortProfilesSortEn {
	TranslationsDialogsSortProfilesSortId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get name => 'Menurut abjad';
	@override String get lastUpdate => 'Terakhir diperbarui';
}

// Path: dialogs.confirmation.settings
class TranslationsDialogsConfirmationSettingsId extends TranslationsDialogsConfirmationSettingsEn {
	TranslationsDialogsConfirmationSettingsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationSettingsImportId import = TranslationsDialogsConfirmationSettingsImportId._(_root);
}

// Path: dialogs.confirmation.profile
class TranslationsDialogsConfirmationProfileId extends TranslationsDialogsConfirmationProfileEn {
	TranslationsDialogsConfirmationProfileId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationProfileDeleteId delete = TranslationsDialogsConfirmationProfileDeleteId._(_root);
}

// Path: dialogs.confirmation.perAppProxy
class TranslationsDialogsConfirmationPerAppProxyId extends TranslationsDialogsConfirmationPerAppProxyEn {
	TranslationsDialogsConfirmationPerAppProxyId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationPerAppProxyShareOnGithubId shareOnGithub = TranslationsDialogsConfirmationPerAppProxyShareOnGithubId._(_root);
	@override late final TranslationsDialogsConfirmationPerAppProxyImportId import = TranslationsDialogsConfirmationPerAppProxyImportId._(_root);
}

// Path: dialogs.confirmation.routeRule
class TranslationsDialogsConfirmationRouteRuleId extends TranslationsDialogsConfirmationRouteRuleEn {
	TranslationsDialogsConfirmationRouteRuleId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsConfirmationRouteRuleDeleteId delete = TranslationsDialogsConfirmationRouteRuleDeleteId._(_root);
}

// Path: dialogs.noActiveProfile.helpBtn
class TranslationsDialogsNoActiveProfileHelpBtnId extends TranslationsDialogsNoActiveProfileHelpBtnEn {
	TranslationsDialogsNoActiveProfileHelpBtnId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get label => 'Tunjukkan caranya';
	@override String get url => 'https://github.com/shulaiyun/Sloth-VPN.git';
}

// Path: common.msg.export.clipboard
class TranslationsCommonMsgExportClipboardId extends TranslationsCommonMsgExportClipboardEn {
	TranslationsCommonMsgExportClipboardId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get success => 'Berhasil ditambahkan ke papan klip';
	@override String get failure => 'Gagal menyalin ke papan klip';
	@override String get contentTooLarge => 'Konten terlalu besar. Gunakan ekspor file saja';
}

// Path: common.msg.export.file
class TranslationsCommonMsgExportFileId extends TranslationsCommonMsgExportFileEn {
	TranslationsCommonMsgExportFileId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get success => 'File JSON berhasil dibuat';
	@override String get failure => 'Gagal membuat file';
}

// Path: pages.profiles.msg.save
class TranslationsPagesProfilesMsgSaveId extends TranslationsPagesProfilesMsgSaveEn {
	TranslationsPagesProfilesMsgSaveId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get success => 'Profil berhasil disimpan';
}

// Path: pages.profiles.msg.add
class TranslationsPagesProfilesMsgAddId extends TranslationsPagesProfilesMsgAddEn {
	TranslationsPagesProfilesMsgAddId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get failure => 'Gagal menambahkan profil';
}

// Path: pages.profiles.msg.update
class TranslationsPagesProfilesMsgUpdateId extends TranslationsPagesProfilesMsgUpdateEn {
	TranslationsPagesProfilesMsgUpdateId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get success => 'Profil berhasil diperbarui';
	@override String successNamed({required Object name}) => '"${name}" berhasil diperbarui';
	@override String get failure => 'Gagal memperbarui profil';
	@override String failureNamed({required Object name}) => 'Gagal memperbarui "${name}"';
}

// Path: pages.profiles.msg.delete
class TranslationsPagesProfilesMsgDeleteId extends TranslationsPagesProfilesMsgDeleteEn {
	TranslationsPagesProfilesMsgDeleteId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get success => 'Profil berhasil dihapus';
}

// Path: pages.settings.options.import
class TranslationsPagesSettingsOptionsImportId extends TranslationsPagesSettingsOptionsImportEn {
	TranslationsPagesSettingsOptionsImportId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Impor opsi dari papan klip';
	@override String get file => 'Impor opsi dari file';
}

// Path: pages.settings.options.export
class TranslationsPagesSettingsOptionsExportId extends TranslationsPagesSettingsOptionsExportEn {
	TranslationsPagesSettingsOptionsExportId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get anonymousToClipboard => 'Salin opsi anonim ke papan klip';
	@override String get anonymousToFile => 'Ekspor opsi anonim ke file';
	@override String get allToClipboard => 'Salin semua opsi ke papan klip';
	@override String get allToFile => 'Ekspor semua opsi ke file';
}

// Path: pages.settings.general.themeModes
class TranslationsPagesSettingsGeneralThemeModesId extends TranslationsPagesSettingsGeneralThemeModesEn {
	TranslationsPagesSettingsGeneralThemeModesId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get system => 'Default sistem';
	@override String get dark => 'Mode gelap';
	@override String get light => 'Mode terang';
	@override String get black => 'Mode hitam';
}

// Path: pages.settings.routing.perAppProxy
class TranslationsPagesSettingsRoutingPerAppProxyId extends TranslationsPagesSettingsRoutingPerAppProxyEn {
	TranslationsPagesSettingsRoutingPerAppProxyId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Proxy per aplikasi';
	@override String get hideSysApps => 'Sembunyikan aplikasi sistem';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsId options = TranslationsPagesSettingsRoutingPerAppProxyOptionsId._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyModesId modes = TranslationsPagesSettingsRoutingPerAppProxyModesId._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionId autoSelection = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionId._(_root);
}

// Path: pages.settings.routing.regions
class TranslationsPagesSettingsRoutingRegionsId extends TranslationsPagesSettingsRoutingRegionsEn {
	TranslationsPagesSettingsRoutingRegionsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get ir => 'Iran (ir)';
	@override String get cn => 'Tiongkok (cn)';
	@override String get ru => 'Rusia (ru)';
	@override String get af => 'Afghanistan (af)';
	@override String get id => 'Indonesia (id)';
	@override String get tr => 'Turki (tr)';
	@override String get br => 'Brasil (br)';
	@override String get other => 'Lainnya';
}

// Path: pages.settings.routing.balancerStrategy
class TranslationsPagesSettingsRoutingBalancerStrategyId extends TranslationsPagesSettingsRoutingBalancerStrategyEn {
	TranslationsPagesSettingsRoutingBalancerStrategyId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Strategi Balancer';
	@override String get roundRobin => 'Round robin';
	@override String get consistentHash => 'Consistent hash';
	@override String get stickySession => 'Sticky session';
}

// Path: pages.settings.routing.ipv6Modes
class TranslationsPagesSettingsRoutingIpv6ModesId extends TranslationsPagesSettingsRoutingIpv6ModesEn {
	TranslationsPagesSettingsRoutingIpv6ModesId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get disable => 'Nonaktifkan';
	@override String get enable => 'Aktifkan';
	@override String get prefer => 'Prioritaskan';
	@override String get only => 'Hanya';
}

// Path: pages.settings.routing.routeRule
class TranslationsPagesSettingsRoutingRouteRuleId extends TranslationsPagesSettingsRoutingRouteRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aturan perutean';
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsId options = TranslationsPagesSettingsRoutingRouteRuleOptionsId._(_root);
	@override String get deleteRule => 'Hapus aturan';
	@override String get createRule => 'Buat aturan baru';
	@override late final TranslationsPagesSettingsRoutingRouteRuleRuleId rule = TranslationsPagesSettingsRoutingRouteRuleRuleId._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleGenericListId genericList = TranslationsPagesSettingsRoutingRouteRuleGenericListId._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleAndroidAppsId androidApps = TranslationsPagesSettingsRoutingRouteRuleAndroidAppsId._(_root);
}

// Path: pages.settings.dns.domainStrategy
class TranslationsPagesSettingsDnsDomainStrategyId extends TranslationsPagesSettingsDnsDomainStrategyEn {
	TranslationsPagesSettingsDnsDomainStrategyId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get auto => 'Otomatis';
	@override String get preferIpv6 => 'Pilih IPv6';
	@override String get preferIpv4 => 'Pilih IPv4';
	@override String get ipv4Only => 'Hanya IPv4';
	@override String get ipv6Only => 'Hanya IPv6';
}

// Path: pages.settings.inbound.serviceModes
class TranslationsPagesSettingsInboundServiceModesId extends TranslationsPagesSettingsInboundServiceModesEn {
	TranslationsPagesSettingsInboundServiceModesId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get proxy => 'Hanya layanan proksi';
	@override String get systemProxy => 'Atur proksi sistem';
	@override String get tun => 'VPN';
	@override String get tunService => 'Layanan VPN';
}

// Path: pages.settings.inbound.shortServiceModes
class TranslationsPagesSettingsInboundShortServiceModesId extends TranslationsPagesSettingsInboundShortServiceModesEn {
	TranslationsPagesSettingsInboundShortServiceModesId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get proxy => 'Proxy';
	@override String get systemProxy => 'Proxy sistem';
	@override String get tun => 'VPN';
	@override String get tunService => 'Layanan VPN';
}

// Path: pages.settings.inbound.tunImplementations
class TranslationsPagesSettingsInboundTunImplementationsId extends TranslationsPagesSettingsInboundTunImplementationsEn {
	TranslationsPagesSettingsInboundTunImplementationsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get mixed => 'Campuran';
	@override String get system => 'Sistem';
	@override String get gvisor => 'gVisor';
}

// Path: pages.settings.tlsTricks.mixedSniCase
class TranslationsPagesSettingsTlsTricksMixedSniCaseId extends TranslationsPagesSettingsTlsTricksMixedSniCaseEn {
	TranslationsPagesSettingsTlsTricksMixedSniCaseId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get enable => 'Aktifkan kasus SNI campuran';
}

// Path: pages.settings.tlsTricks.padding
class TranslationsPagesSettingsTlsTricksPaddingId extends TranslationsPagesSettingsTlsTricksPaddingEn {
	TranslationsPagesSettingsTlsTricksPaddingId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get enable => 'Aktifkan padding';
	@override String get size => 'Ukuran padding';
}

// Path: pages.settings.warp.detourModes
class TranslationsPagesSettingsWarpDetourModesId extends TranslationsPagesSettingsWarpDetourModesEn {
	TranslationsPagesSettingsWarpDetourModesId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get proxyOverWarp => 'Alihkan proksi melalui WARP';
	@override String get warpOverProxy => 'Alihkan WARP melalui proksi';
	@override String get proxyOverWarpExplain => 'Buka blokir proksi dengan WARP';
	@override String get warpOverProxyExplain => 'Keamanan ekstra dengan WARP';
}

// Path: pages.settings.warp.noise
class TranslationsPagesSettingsWarpNoiseId extends TranslationsPagesSettingsWarpNoiseEn {
	TranslationsPagesSettingsWarpNoiseId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get count => 'Jumlah kebisingan';
	@override String get mode => 'Mode kebisingan';
	@override String get size => 'Ukuran kebisingan';
	@override String get delay => 'Penundaan kebisingan';
}

// Path: dialogs.confirmation.settings.import
class TranslationsDialogsConfirmationSettingsImportId extends TranslationsDialogsConfirmationSettingsImportEn {
	TranslationsDialogsConfirmationSettingsImportId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get msg => 'Ini akan menimpa semua opsi konfigurasi dengan nilai yang diberikan. Anda yakin?';
}

// Path: dialogs.confirmation.profile.delete
class TranslationsDialogsConfirmationProfileDeleteId extends TranslationsDialogsConfirmationProfileDeleteEn {
	TranslationsDialogsConfirmationProfileDeleteId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hapus profil';
	@override String get msg => 'Anda yakin ingin menghapus profil ini secara permanen?';
}

// Path: dialogs.confirmation.perAppProxy.shareOnGithub
class TranslationsDialogsConfirmationPerAppProxyShareOnGithubId extends TranslationsDialogsConfirmationPerAppProxyShareOnGithubEn {
	TranslationsDialogsConfirmationPerAppProxyShareOnGithubId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Meningkatkan pilihan otomatis';
	@override String get msg => 'Dengan membagikan aplikasi yang dipilih, Anda membantu melengkapi daftar "pilihan otomatis"';
}

// Path: dialogs.confirmation.perAppProxy.import
class TranslationsDialogsConfirmationPerAppProxyImportId extends TranslationsDialogsConfirmationPerAppProxyImportEn {
	TranslationsDialogsConfirmationPerAppProxyImportId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get msg => 'Ini akan menggantikan semua pilihan proksi per aplikasi Anda saat ini. Anda yakin ingin melanjutkan?';
}

// Path: dialogs.confirmation.routeRule.delete
class TranslationsDialogsConfirmationRouteRuleDeleteId extends TranslationsDialogsConfirmationRouteRuleDeleteEn {
	TranslationsDialogsConfirmationRouteRuleDeleteId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hapus aturan';
	@override String msg({required Object rulename}) => 'Anda yakin ingin menghapus aturan "${rulename}"?';
}

// Path: pages.settings.routing.perAppProxy.options
class TranslationsPagesSettingsRoutingPerAppProxyOptionsId extends TranslationsPagesSettingsRoutingPerAppProxyOptionsEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsImportId import = TranslationsPagesSettingsRoutingPerAppProxyOptionsImportId._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyOptionsExportId export = TranslationsPagesSettingsRoutingPerAppProxyOptionsExportId._(_root);
	@override String get shareToAll => 'Bagikan ke semua';
	@override String get clearAllSelections => 'Hapus semua pilihan';
}

// Path: pages.settings.routing.perAppProxy.modes
class TranslationsPagesSettingsRoutingPerAppProxyModesId extends TranslationsPagesSettingsRoutingPerAppProxyModesEn {
	TranslationsPagesSettingsRoutingPerAppProxyModesId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get all => 'Semua';
	@override String get proxy => 'Proxy';
	@override String get bypass => 'Lewati';
	@override String get allMsg => 'Proxy semua aplikasi';
	@override String get proxyMsg => 'Proxy hanya aplikasi yang dipilih';
	@override String get bypassMsg => 'Jangan proxy aplikasi yang dipilih';
}

// Path: pages.settings.routing.perAppProxy.autoSelection
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionId extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pilihan otomatis';
	@override String get performNow => 'Lakukan sekarang';
	@override String get resetToDefault => 'Setel ulang ke default';
	@override String get autoUpdateInterval => 'Interval pembaruan otomatis';
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastId toast = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastId._(_root);
	@override late final TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogId dialog = TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogId._(_root);
}

// Path: pages.settings.routing.routeRule.options
class TranslationsPagesSettingsRoutingRouteRuleOptionsId extends TranslationsPagesSettingsRoutingRouteRuleOptionsEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsImportId import = TranslationsPagesSettingsRoutingRouteRuleOptionsImportId._(_root);
	@override late final TranslationsPagesSettingsRoutingRouteRuleOptionsExportId export = TranslationsPagesSettingsRoutingRouteRuleOptionsExportId._(_root);
	@override String get reset => 'Setel ulang aturan';
}

// Path: pages.settings.routing.routeRule.rule
class TranslationsPagesSettingsRoutingRouteRuleRuleId extends TranslationsPagesSettingsRoutingRouteRuleRuleEn {
	TranslationsPagesSettingsRoutingRouteRuleRuleId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aturan';
	@override String get ruleChanged => 'Aturan diubah';
	@override String get ruleChangedMsg => 'Apakah Anda ingin menyimpan editan Anda?';
	@override String get onlyTunMode => 'Hanya tersedia dalam mode TUN';
	@override String get notAvailabeInThisPlatform => 'Tidak tersedia di platform ini';
	@override String get canNotBeEmpty => 'Tidak boleh kosong';
	@override String get validUrlEx => 'https://example.com';
	@override String get validUrl => '"URL" yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}';
	@override String get validProcessNameEx => 'Chrome.exe atau google chrome atau chrome';
	@override String get validProcessName => '"Nama Proses" yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}';
	@override String get validProcessPathEx => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome';
	@override String get validProcessPath => '"Jalur Proses" yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}';
	@override String get validPortRangeEx => '80 atau 1-65000';
	@override String get validPortRange => '"Port" atau "Rentang Port" yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}';
	@override String get validIpCidrEx => '8.8.8.8 atau 10.0.0.0/24';
	@override String get validIpCidr => 'IP CIDR yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}';
	@override String get validDomainEx => 'Google.com atau dl.google.com';
	@override String get validDomain => '"Domain" yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}';
	@override String get validDomainSuffixEx => '.com atau .ir';
	@override String get validDomainSuffix => '"Sufiks Domain" yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}';
	@override Map<String, String> get tileTitle => {
		'name': 'Nama',
		'outbound': 'Keluar jika cocok',
		'rule_set': 'URL set aturan',
		'package_name': 'Nama paket',
		'process_name': 'Nama proses',
		'process_path': 'Jalur proses',
		'network': 'Jaringan',
		'port_range': 'Port tujuan',
		'source_port_range': 'Port sumber',
		'protocol': 'Protokol',
		'ip_cidr': 'IP CIDR tujuan',
		'source_ip_cidr': 'IP CIDR sumber',
		'domain': 'Domain',
		'domain_suffixe': 'Sufiks domain',
		'domain_keyword': 'Kata kunci domain',
		'domain_regex': 'Regex domain',
	};
	@override Map<String, String> get outbound => {
		'proxy': 'Proxy',
		'direct': 'Langsung',
		'direct_with_fragment': 'Langsung dengan fragmen',
		'block': 'Blokir',
	};
	@override Map<String, String> get network => {
		'all': 'Semua',
		'tcp': 'TCP',
		'udp': 'UDP',
	};
	@override Map<String, String> get protocol => {
		'': 'Semua',
		'tls': 'TLS',
		'http': 'HTTP',
		'quic': 'QUIC',
		'stun': 'STUN',
		'dns': 'DNS',
		'bittorrent': 'BitTorrent',
	};
}

// Path: pages.settings.routing.routeRule.genericList
class TranslationsPagesSettingsRoutingRouteRuleGenericListId extends TranslationsPagesSettingsRoutingRouteRuleGenericListEn {
	TranslationsPagesSettingsRoutingRouteRuleGenericListId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get addNew => 'Tambah nilai baru';
	@override String get update => 'Perbarui nilai';
	@override String get clearList => 'Bersihkan daftar';
	@override String get clearListMsg => 'Semua item dihapus';
}

// Path: pages.settings.routing.routeRule.androidApps
class TranslationsPagesSettingsRoutingRouteRuleAndroidAppsId extends TranslationsPagesSettingsRoutingRouteRuleAndroidAppsEn {
	TranslationsPagesSettingsRoutingRouteRuleAndroidAppsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => 'Aplikasi Android';
	@override String get showSystemApps => 'Tampilkan aplikasi sistem';
	@override String get hideSystemApps => 'Sembunyikan aplikasi sistem';
	@override String get clearSelection => 'Hapus pilihan';
	@override String get uninstalled => 'Dihapus';
}

// Path: pages.settings.routing.perAppProxy.options.import
class TranslationsPagesSettingsRoutingPerAppProxyOptionsImportId extends TranslationsPagesSettingsRoutingPerAppProxyOptionsImportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsImportId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Impor pilihan dari papan klip';
	@override String get file => 'Impor pilihan dari file';
	@override String get msg => 'Mengimpor akan menggantikan pilihan Anda saat ini. Anda yakin ingin melanjutkan?';
}

// Path: pages.settings.routing.perAppProxy.options.export
class TranslationsPagesSettingsRoutingPerAppProxyOptionsExportId extends TranslationsPagesSettingsRoutingPerAppProxyOptionsExportEn {
	TranslationsPagesSettingsRoutingPerAppProxyOptionsExportId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Salin pilihan ke papan klip';
	@override String get file => 'Ekspor pilihan ke file';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.toast
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastId extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionToastId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get success => 'Pilihan aplikasi otomatis berhasil diselesaikan';
	@override String get failure => 'Pilihan otomatis gagal';
	@override String regionNotFound({required Object region}) => 'Pilihan otomatis tidak ditemukan untuk wilayah "${region}"';
	@override String get alreadyInAuto => 'Pilihan Anda sudah ada dalam daftar otomatis';
}

// Path: pages.settings.routing.perAppProxy.autoSelection.dialog
class TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogId extends TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogEn {
	TranslationsPagesSettingsRoutingPerAppProxyAutoSelectionDialogId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pilihan aplikasi otomatis';
	@override String msg({required Object region}) => 'Fitur pilihan otomatis untuk proxy per aplikasi dinonaktifkan karena perubahan wilayah menjadi "${region}"';
}

// Path: pages.settings.routing.routeRule.options.import
class TranslationsPagesSettingsRoutingRouteRuleOptionsImportId extends TranslationsPagesSettingsRoutingRouteRuleOptionsImportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsImportId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Impor aturan dari papan klip';
	@override String get file => 'Impor aturan dari file';
}

// Path: pages.settings.routing.routeRule.options.export
class TranslationsPagesSettingsRoutingRouteRuleOptionsExportId extends TranslationsPagesSettingsRoutingRouteRuleOptionsExportEn {
	TranslationsPagesSettingsRoutingRouteRuleOptionsExportId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get clipboard => 'Salin aturan ke papan klip';
	@override String get file => 'Simpan aturan ke file';
}

/// The flat map containing all translations for locale <id>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsId {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.appTitle' => '树懒VPN',
			'common.start' => 'Mulai',
			'common.version' => 'Versi',
			'common.ok' => 'Oke',
			'common.cancel' => 'Batal',
			'common.kContinue' => 'Lanjutkan',
			'common.showMore' => 'Tampilkan lebih banyak',
			'common.showLess' => 'Tampilkan lebih sedikit',
			'common.filter' => 'Filter',
			'common.all' => 'Semua',
			'common.pause' => 'Jeda',
			'common.resume' => 'Lanjutkan',
			'common.clear' => 'Bersihkan',
			'common.close' => 'Tutup',
			'common.auto' => 'Otomatis',
			'common.manually' => 'Manual',
			'common.name' => 'Nama',
			'common.url' => 'URL',
			'common.add' => 'Tambah',
			'common.clipboard' => 'Papan klip',
			'common.addToClipboard' => 'Tambah ke papan klip',
			'common.scanQr' => 'Pindai QR',
			'common.free' => 'Gratis',
			'common.warp' => 'WARP',
			'common.fragment' => 'Fragmen',
			'common.help' => 'Bantuan',
			'common.save' => 'Simpan',
			'common.update' => 'Perbarui',
			'common.share' => 'Bagikan',
			'common.edit' => 'Edit',
			'common.delete' => 'Hapus',
			'common.discard' => 'Buang',
			'common.import' => 'Impor',
			'common.export' => 'Ekspor',
			'common.later' => 'Nanti',
			'common.ignore' => 'Abaikan',
			'common.quit' => 'Keluar',
			'common.notSet' => 'Belum diatur',
			'common.hide' => 'Sembunyikan',
			'common.exit' => 'Keluar',
			'common.reset' => 'Setel ulang',
			'common.done' => 'Selesai',
			'common.search' => 'Cari',
			'common.decline' => 'Tolak',
			'common.agree' => 'Setuju',
			'common.empty' => 'Kosong',
			'common.unknown' => 'Tidak dikenal',
			'common.hidden' => 'Tersembunyi',
			'common.timeout' => 'Waktu habis',
			'common.sort' => 'Urutkan',
			'common.dashboard' => 'Dasbor',
			'common.interval.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n, zero: '', one: '${n} hari', other: '${n} hari', ), 
			'common.interval.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n, zero: '', one: '${n} jam', other: '${n} jam', ), 
			'common.msg.permission.denied' => 'Izin ditolak',
			'common.msg.export.clipboard.success' => 'Berhasil ditambahkan ke papan klip',
			'common.msg.export.clipboard.failure' => 'Gagal menyalin ke papan klip',
			'common.msg.export.clipboard.contentTooLarge' => 'Konten terlalu besar. Gunakan ekspor file saja',
			'common.msg.export.file.success' => 'File JSON berhasil dibuat',
			'common.msg.export.file.failure' => 'Gagal membuat file',
			'common.msg.import.confirm' => 'Konfirmasi impor',
			'common.msg.import.success' => 'Berhasil diimpor',
			'common.msg.import.failure' => 'Gagal mengimpor',
			'intro.banner' => 'Semua yang Anda butuhkan untuk internet tanpa batasan',
			'intro.termsAndPolicyCaution' => ({required InlineSpanBuilder tap}) => TextSpan(children: [ const TextSpan(text: 'Dengan melanjutkan, Anda menyetujui '), tap(_root.pages.about.termsAndConditions), ]), 
			'intro.info' => ({required InlineSpanBuilder tap_source, required InlineSpanBuilder tap_license}) => TextSpan(children: [ const TextSpan(text: 'Dibuat dengan 鉂わ笍 oleh Hiddify - '), tap_source('Sumber Terbuka'), const TextSpan(text: ' ('), tap_license('Lisensi'), const TextSpan(text: ')'), ]), 
			'pages.home.title' => 'Beranda',
			'pages.home.quickSettings' => 'Pengaturan cepat',
			'pages.proxies.title' => 'Proxy',
			'pages.proxies.sort' => 'Urutkan proksi',
			'pages.proxies.testDelay' => 'Uji latensi',
			'pages.proxies.empty' => 'Tidak ada proksi yang tersedia',
			'pages.proxies.activeProxy' => 'Proksi aktif',
			'pages.proxies.unknownIp' => 'IP tidak dikenal',
			'pages.proxies.sortOptions.unsorted' => 'Default',
			'pages.proxies.sortOptions.name' => 'Berdasarkan abjad',
			'pages.proxies.sortOptions.delay' => 'Berdasarkan latensi',
			'pages.proxies.ipInfo.address' => 'Alamat IP',
			'pages.proxies.ipInfo.country' => 'Negara',
			'pages.proxies.ipInfo.organization' => 'Organisasi',
			'pages.proxies.delay.result' => ({required Object delay}) => 'Latensi: ${delay}ms',
			'pages.proxies.delay.timeout' => 'Waktu tes latensi habis',
			'pages.proxies.delay.testing' => 'Latensi: sedang menguji...',
			'pages.profiles.title' => 'Profil',
			'pages.profiles.add' => 'Tambah profil',
			'pages.profiles.update' => 'Perbarui profil',
			'pages.profiles.viewAllProfiles' => 'Lihat semua profil',
			'pages.profiles.activeProfileName' => ({required Object name}) => 'Nama profil aktif: "${name}".',
			'pages.profiles.nonActiveProfileName' => ({required Object name}) => 'Pilih "${name}" sebagai profil aktif',
			'pages.profiles.freeSubNotFound' => 'Tidak ada langganan gratis yang ditemukan',
			'pages.profiles.freeSubNotFoundForRegion' => ({required Object region}) => 'Tidak ada langganan gratis yang ditemukan untuk wilayah "${region}"',
			'pages.profiles.failedToLoad' => 'Gagal memuat',
			'pages.profiles.updateSubscriptions' => 'Perbarui langganan',
			'pages.profiles.share.urlToClipboard' => 'URL ke papan klip',
			'pages.profiles.share.showUrlQr' => 'Tampilkan QR URL',
			'pages.profiles.share.jsonToClipboard' => 'JSON ke papan klip',
			'pages.profiles.msg.save.success' => 'Profil berhasil disimpan',
			'pages.profiles.msg.invalidUrl' => 'URL tidak valid',
			'pages.profiles.msg.add.failure' => 'Gagal menambahkan profil',
			'pages.profiles.msg.update.success' => 'Profil berhasil diperbarui',
			'pages.profiles.msg.update.successNamed' => ({required Object name}) => '"${name}" berhasil diperbarui',
			'pages.profiles.msg.update.failure' => 'Gagal memperbarui profil',
			'pages.profiles.msg.update.failureNamed' => ({required Object name}) => 'Gagal memperbarui "${name}"',
			'pages.profiles.msg.delete.success' => 'Profil berhasil dihapus',
			'pages.profileDetails.title' => 'Profil',
			'pages.profileDetails.lastUpdate' => 'Terakhir diperbarui',
			'pages.profileDetails.form.nameHint' => 'Nama profil',
			'pages.profileDetails.form.emptyName' => 'Nama wajib diisi',
			'pages.profileDetails.form.invalidUrl' => 'URL tidak valid',
			'pages.profileDetails.form.urlHint' => 'URL konfigurasi lengkap',
			'pages.profileDetails.form.disableAutoUpdate' => 'Nonaktifkan pembaruan otomatis',
			'pages.profileDetails.form.autoUpdateInterval' => 'Interval pembaruan otomatis',
			'pages.profileDetails.form.loading' => 'Menambahkan profil...',
			'pages.logs.title' => 'Log',
			'pages.logs.shareCoreLogs' => 'Bagikan log inti',
			'pages.logs.shareAppLogs' => 'Bagikan log aplikasi',
			'pages.about.title' => 'Tentang',
			'pages.about.notAvailableMsg' => 'Anda sudah menggunakan versi terbaru',
			'pages.about.checkForUpdate' => 'Periksa pembaruan',
			'pages.about.openWorkingDir' => 'Buka direktori kerja',
			'pages.about.sourceCode' => 'Kode sumber',
			'pages.about.telegramChannel' => 'Saluran Telegram',
			'pages.about.termsAndConditions' => 'Syarat dan Ketentuan',
			'pages.about.privacyPolicy' => 'Kebijakan Privasi',
			'pages.settings.title' => 'Pengaturan',
			'pages.settings.resetTunnel' => 'Setel ulang profil VPN',
			'pages.settings.options.import.clipboard' => 'Impor opsi dari papan klip',
			'pages.settings.options.import.file' => 'Impor opsi dari file',
			'pages.settings.options.export.anonymousToClipboard' => 'Salin opsi anonim ke papan klip',
			'pages.settings.options.export.anonymousToFile' => 'Ekspor opsi anonim ke file',
			'pages.settings.options.export.allToClipboard' => 'Salin semua opsi ke papan klip',
			'pages.settings.options.export.allToFile' => 'Ekspor semua opsi ke file',
			'pages.settings.options.reset' => 'Setel ulang opsi',
			'pages.settings.general.title' => 'Umum',
			'pages.settings.general.locale' => 'Bahasa',
			'pages.settings.general.themeMode' => 'Tema',
			'pages.settings.general.themeModes.system' => 'Default sistem',
			'pages.settings.general.themeModes.dark' => 'Mode gelap',
			'pages.settings.general.themeModes.light' => 'Mode terang',
			'pages.settings.general.themeModes.black' => 'Mode hitam',
			'pages.settings.general.enableAnalytics' => 'Aktifkan analitik',
			'pages.settings.general.enableAnalyticsMsg' => 'Berikan izin untuk mengumpulkan analitik dan mengirim laporan kerusakan untuk meningkatkan aplikasi',
			'pages.settings.general.autoIpCheck' => 'Periksa IP koneksi secara otomatis',
			'pages.settings.general.dynamicNotification' => 'Tampilkan kecepatan di notifikasi',
			'pages.settings.general.hapticFeedback' => 'Umpan balik haptik',
			'pages.settings.general.actionAtClosing' => 'Tindakan saat menutup',
			'pages.settings.general.autoStart' => 'Mulai saat masuk',
			'pages.settings.general.silentStart' => 'Mulai diminimalkan',
			'pages.settings.general.ignoreBatteryOptimizations' => 'Nonaktifkan optimasi baterai',
			'pages.settings.general.ignoreBatteryOptimizationsMsg' => 'Hapus batasan untuk kinerja VPN yang optimal',
			'pages.settings.general.memoryLimit' => 'Batas memori',
			'pages.settings.general.memoryLimitMsg' => 'Aktifkan jika Anda mengalami kesalahan kehabisan memori atau aplikasi sering macet',
			'pages.settings.general.debugMode' => 'Mode debug',
			'pages.settings.general.debugModeMsg' => 'Mulai ulang aplikasi untuk menerapkan perubahan ini',
			'pages.settings.general.logLevel' => 'Level log',
			'pages.settings.general.connectionTestUrl' => 'URL uji koneksi',
			'pages.settings.general.urlTestInterval' => 'Interval uji URL',
			'pages.settings.general.clashApiPort' => 'Port API Clash',
			'pages.settings.general.useXrayCoreWhenPossible' => 'Gunakan xray-core jika memungkinkan',
			'pages.settings.general.useXrayCoreWhenPossibleMsg' => 'Gunakan xray-core saat mengurai tautan langganan. Anda perlu mengimpor ulang tautan untuk mengaktifkan opsi ini.',
			'pages.settings.routing.title' => 'Perutean',
			'pages.settings.routing.perAppProxy.title' => 'Proxy per aplikasi',
			'pages.settings.routing.perAppProxy.hideSysApps' => 'Sembunyikan aplikasi sistem',
			'pages.settings.routing.perAppProxy.options.import.clipboard' => 'Impor pilihan dari papan klip',
			'pages.settings.routing.perAppProxy.options.import.file' => 'Impor pilihan dari file',
			'pages.settings.routing.perAppProxy.options.import.msg' => 'Mengimpor akan menggantikan pilihan Anda saat ini. Anda yakin ingin melanjutkan?',
			'pages.settings.routing.perAppProxy.options.export.clipboard' => 'Salin pilihan ke papan klip',
			'pages.settings.routing.perAppProxy.options.export.file' => 'Ekspor pilihan ke file',
			'pages.settings.routing.perAppProxy.options.shareToAll' => 'Bagikan ke semua',
			'pages.settings.routing.perAppProxy.options.clearAllSelections' => 'Hapus semua pilihan',
			'pages.settings.routing.perAppProxy.modes.all' => 'Semua',
			'pages.settings.routing.perAppProxy.modes.proxy' => 'Proxy',
			'pages.settings.routing.perAppProxy.modes.bypass' => 'Lewati',
			'pages.settings.routing.perAppProxy.modes.allMsg' => 'Proxy semua aplikasi',
			'pages.settings.routing.perAppProxy.modes.proxyMsg' => 'Proxy hanya aplikasi yang dipilih',
			'pages.settings.routing.perAppProxy.modes.bypassMsg' => 'Jangan proxy aplikasi yang dipilih',
			'pages.settings.routing.perAppProxy.autoSelection.title' => 'Pilihan otomatis',
			'pages.settings.routing.perAppProxy.autoSelection.performNow' => 'Lakukan sekarang',
			'pages.settings.routing.perAppProxy.autoSelection.resetToDefault' => 'Setel ulang ke default',
			'pages.settings.routing.perAppProxy.autoSelection.autoUpdateInterval' => 'Interval pembaruan otomatis',
			'pages.settings.routing.perAppProxy.autoSelection.toast.success' => 'Pilihan aplikasi otomatis berhasil diselesaikan',
			'pages.settings.routing.perAppProxy.autoSelection.toast.failure' => 'Pilihan otomatis gagal',
			'pages.settings.routing.perAppProxy.autoSelection.toast.regionNotFound' => ({required Object region}) => 'Pilihan otomatis tidak ditemukan untuk wilayah "${region}"',
			'pages.settings.routing.perAppProxy.autoSelection.toast.alreadyInAuto' => 'Pilihan Anda sudah ada dalam daftar otomatis',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.title' => 'Pilihan aplikasi otomatis',
			'pages.settings.routing.perAppProxy.autoSelection.dialog.msg' => ({required Object region}) => 'Fitur pilihan otomatis untuk proxy per aplikasi dinonaktifkan karena perubahan wilayah menjadi "${region}"',
			'pages.settings.routing.region' => 'Wilayah',
			'pages.settings.routing.regions.ir' => 'Iran (ir)',
			'pages.settings.routing.regions.cn' => 'Tiongkok (cn)',
			'pages.settings.routing.regions.ru' => 'Rusia (ru)',
			'pages.settings.routing.regions.af' => 'Afghanistan (af)',
			'pages.settings.routing.regions.id' => 'Indonesia (id)',
			'pages.settings.routing.regions.tr' => 'Turki (tr)',
			'pages.settings.routing.regions.br' => 'Brasil (br)',
			'pages.settings.routing.regions.other' => 'Lainnya',
			'pages.settings.routing.balancerStrategy.title' => 'Strategi Balancer',
			'pages.settings.routing.balancerStrategy.roundRobin' => 'Round robin',
			'pages.settings.routing.balancerStrategy.consistentHash' => 'Consistent hash',
			'pages.settings.routing.balancerStrategy.stickySession' => 'Sticky session',
			'pages.settings.routing.blockAds' => 'Blokir iklan',
			'pages.settings.routing.bypassLan' => 'Lewati LAN',
			'pages.settings.routing.resolveDestination' => 'Resolusi tujuan',
			'pages.settings.routing.ipv6Route' => 'Rute IPv6',
			'pages.settings.routing.ipv6Modes.disable' => 'Nonaktifkan',
			'pages.settings.routing.ipv6Modes.enable' => 'Aktifkan',
			'pages.settings.routing.ipv6Modes.prefer' => 'Prioritaskan',
			'pages.settings.routing.ipv6Modes.only' => 'Hanya',
			'pages.settings.routing.routeRule.title' => 'Aturan perutean',
			'pages.settings.routing.routeRule.options.import.clipboard' => 'Impor aturan dari papan klip',
			'pages.settings.routing.routeRule.options.import.file' => 'Impor aturan dari file',
			'pages.settings.routing.routeRule.options.export.clipboard' => 'Salin aturan ke papan klip',
			'pages.settings.routing.routeRule.options.export.file' => 'Simpan aturan ke file',
			'pages.settings.routing.routeRule.options.reset' => 'Setel ulang aturan',
			'pages.settings.routing.routeRule.deleteRule' => 'Hapus aturan',
			'pages.settings.routing.routeRule.createRule' => 'Buat aturan baru',
			'pages.settings.routing.routeRule.rule.title' => 'Aturan',
			'pages.settings.routing.routeRule.rule.ruleChanged' => 'Aturan diubah',
			'pages.settings.routing.routeRule.rule.ruleChangedMsg' => 'Apakah Anda ingin menyimpan editan Anda?',
			'pages.settings.routing.routeRule.rule.onlyTunMode' => 'Hanya tersedia dalam mode TUN',
			'pages.settings.routing.routeRule.rule.notAvailabeInThisPlatform' => 'Tidak tersedia di platform ini',
			'pages.settings.routing.routeRule.rule.canNotBeEmpty' => 'Tidak boleh kosong',
			'pages.settings.routing.routeRule.rule.validUrlEx' => 'https://example.com',
			'pages.settings.routing.routeRule.rule.validUrl' => '"URL" yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validUrlEx}',
			'pages.settings.routing.routeRule.rule.validProcessNameEx' => 'Chrome.exe atau google chrome atau chrome',
			'pages.settings.routing.routeRule.rule.validProcessName' => '"Nama Proses" yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validProcessNameEx}',
			'pages.settings.routing.routeRule.rule.validProcessPathEx' => 'C:\Pro...\chrome.exe\n/App.../Google Chrome\n/usr/lib.../chrome',
			'pages.settings.routing.routeRule.rule.validProcessPath' => '"Jalur Proses" yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validProcessPathEx}',
			'pages.settings.routing.routeRule.rule.validPortRangeEx' => '80 atau 1-65000',
			'pages.settings.routing.routeRule.rule.validPortRange' => '"Port" atau "Rentang Port" yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validPortRangeEx}',
			'pages.settings.routing.routeRule.rule.validIpCidrEx' => '8.8.8.8 atau 10.0.0.0/24',
			'pages.settings.routing.routeRule.rule.validIpCidr' => 'IP CIDR yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validIpCidrEx}',
			'pages.settings.routing.routeRule.rule.validDomainEx' => 'Google.com atau dl.google.com',
			'pages.settings.routing.routeRule.rule.validDomain' => '"Domain" yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validDomainEx}',
			'pages.settings.routing.routeRule.rule.validDomainSuffixEx' => '.com atau .ir',
			'pages.settings.routing.routeRule.rule.validDomainSuffix' => '"Sufiks Domain" yang valid seperti\n${_root.pages.settings.routing.routeRule.rule.validDomainSuffixEx}',
			'pages.settings.routing.routeRule.rule.tileTitle.name' => 'Nama',
			'pages.settings.routing.routeRule.rule.tileTitle.outbound' => 'Keluar jika cocok',
			'pages.settings.routing.routeRule.rule.tileTitle.rule_set' => 'URL set aturan',
			'pages.settings.routing.routeRule.rule.tileTitle.package_name' => 'Nama paket',
			'pages.settings.routing.routeRule.rule.tileTitle.process_name' => 'Nama proses',
			'pages.settings.routing.routeRule.rule.tileTitle.process_path' => 'Jalur proses',
			'pages.settings.routing.routeRule.rule.tileTitle.network' => 'Jaringan',
			'pages.settings.routing.routeRule.rule.tileTitle.port_range' => 'Port tujuan',
			'pages.settings.routing.routeRule.rule.tileTitle.source_port_range' => 'Port sumber',
			'pages.settings.routing.routeRule.rule.tileTitle.protocol' => 'Protokol',
			'pages.settings.routing.routeRule.rule.tileTitle.ip_cidr' => 'IP CIDR tujuan',
			'pages.settings.routing.routeRule.rule.tileTitle.source_ip_cidr' => 'IP CIDR sumber',
			'pages.settings.routing.routeRule.rule.tileTitle.domain' => 'Domain',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_suffixe' => 'Sufiks domain',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_keyword' => 'Kata kunci domain',
			'pages.settings.routing.routeRule.rule.tileTitle.domain_regex' => 'Regex domain',
			'pages.settings.routing.routeRule.rule.outbound.proxy' => 'Proxy',
			'pages.settings.routing.routeRule.rule.outbound.direct' => 'Langsung',
			'pages.settings.routing.routeRule.rule.outbound.direct_with_fragment' => 'Langsung dengan fragmen',
			'pages.settings.routing.routeRule.rule.outbound.block' => 'Blokir',
			'pages.settings.routing.routeRule.rule.network.all' => 'Semua',
			'pages.settings.routing.routeRule.rule.network.tcp' => 'TCP',
			'pages.settings.routing.routeRule.rule.network.udp' => 'UDP',
			'pages.settings.routing.routeRule.rule.protocol.' => 'Semua',
			'pages.settings.routing.routeRule.rule.protocol.tls' => 'TLS',
			'pages.settings.routing.routeRule.rule.protocol.http' => 'HTTP',
			'pages.settings.routing.routeRule.rule.protocol.quic' => 'QUIC',
			'pages.settings.routing.routeRule.rule.protocol.stun' => 'STUN',
			'pages.settings.routing.routeRule.rule.protocol.dns' => 'DNS',
			'pages.settings.routing.routeRule.rule.protocol.bittorrent' => 'BitTorrent',
			'pages.settings.routing.routeRule.genericList.addNew' => 'Tambah nilai baru',
			'pages.settings.routing.routeRule.genericList.update' => 'Perbarui nilai',
			'pages.settings.routing.routeRule.genericList.clearList' => 'Bersihkan daftar',
			'pages.settings.routing.routeRule.genericList.clearListMsg' => 'Semua item dihapus',
			'pages.settings.routing.routeRule.androidApps.pageTitle' => 'Aplikasi Android',
			'pages.settings.routing.routeRule.androidApps.showSystemApps' => 'Tampilkan aplikasi sistem',
			'pages.settings.routing.routeRule.androidApps.hideSystemApps' => 'Sembunyikan aplikasi sistem',
			'pages.settings.routing.routeRule.androidApps.clearSelection' => 'Hapus pilihan',
			'pages.settings.routing.routeRule.androidApps.uninstalled' => 'Dihapus',
			'pages.settings.dns.title' => 'DNS',
			'pages.settings.dns.remoteDns' => 'DNS jarak jauh',
			'pages.settings.dns.remoteDnsDomainStrategy' => 'Strategi domain DNS jarak jauh',
			'pages.settings.dns.directDns' => 'Penyelesai server keluar (langsung)',
			'pages.settings.dns.directDnsDomainStrategy' => 'Strategi domain keluar',
			'pages.settings.dns.enableDnsRouting' => 'Aktifkan perutean DNS',
			'pages.settings.dns.enableFakeDns' => 'Aktifkan DNS palsu',
			'pages.settings.dns.domainStrategy.auto' => 'Otomatis',
			'pages.settings.dns.domainStrategy.preferIpv6' => 'Pilih IPv6',
			'pages.settings.dns.domainStrategy.preferIpv4' => 'Pilih IPv4',
			'pages.settings.dns.domainStrategy.ipv4Only' => 'Hanya IPv4',
			'pages.settings.dns.domainStrategy.ipv6Only' => 'Hanya IPv6',
			'pages.settings.inbound.title' => 'Masuk',
			'pages.settings.inbound.serviceMode' => 'Mode layanan',
			'pages.settings.inbound.serviceModes.proxy' => 'Hanya layanan proksi',
			'pages.settings.inbound.serviceModes.systemProxy' => 'Atur proksi sistem',
			'pages.settings.inbound.serviceModes.tun' => 'VPN',
			'pages.settings.inbound.serviceModes.tunService' => 'Layanan VPN',
			'pages.settings.inbound.shortServiceModes.proxy' => 'Proxy',
			'pages.settings.inbound.shortServiceModes.systemProxy' => 'Proxy sistem',
			'pages.settings.inbound.shortServiceModes.tun' => 'VPN',
			'pages.settings.inbound.shortServiceModes.tunService' => 'Layanan VPN',
			'pages.settings.inbound.strictRoute' => 'Rute ketat',
			'pages.settings.inbound.tunImplementation' => 'Implementasi TUN',
			'pages.settings.inbound.tunImplementations.mixed' => 'Campuran',
			'pages.settings.inbound.tunImplementations.system' => 'Sistem',
			'pages.settings.inbound.tunImplementations.gvisor' => 'gVisor',
			'pages.settings.inbound.mixedPort' => 'Port campuran',
			'pages.settings.inbound.tproxyPort' => 'Port proksi transparan',
			'pages.settings.inbound.directPort' => 'Port direct',
			'pages.settings.inbound.redirectPort' => 'Port pengalihan',
			'pages.settings.inbound.allowConnectionFromLan' => 'Bagikan VPN di jaringan lokal',
			'pages.settings.tlsTricks.title' => 'Trik TLS',
			'pages.settings.tlsTricks.enable' => 'Aktifkan fragmen',
			'pages.settings.tlsTricks.packets' => 'Paket Fragmentasi',
			'pages.settings.tlsTricks.packetsTlsHello' => 'TLS Hello',
			'pages.settings.tlsTricks.packets1_1' => '1-1',
			'pages.settings.tlsTricks.packets1_2' => '1-2',
			'pages.settings.tlsTricks.packets1_3' => '1-3',
			'pages.settings.tlsTricks.packets1_4' => '1-4',
			'pages.settings.tlsTricks.packets1_5' => '1-5',
			'pages.settings.tlsTricks.size' => 'Ukuran fragmen',
			'pages.settings.tlsTricks.sleep' => 'Jeda fragmen',
			'pages.settings.tlsTricks.mixedSniCase.enable' => 'Aktifkan kasus SNI campuran',
			'pages.settings.tlsTricks.padding.enable' => 'Aktifkan padding',
			'pages.settings.tlsTricks.padding.size' => 'Ukuran padding',
			'pages.settings.warp.title' => 'WARP',
			'pages.settings.warp.enable' => 'Aktifkan WARP',
			'pages.settings.warp.generateConfig' => 'Buat konfigurasi WARP',
			'pages.settings.warp.configGenerated' => 'Konfigurasi WARP dibuat',
			'pages.settings.warp.missingConfig' => 'Konfigurasi WARP hilang',
			'pages.settings.warp.detourMode' => 'Mode Rute WARP',
			'pages.settings.warp.detourModes.proxyOverWarp' => 'Alihkan proksi melalui WARP',
			'pages.settings.warp.detourModes.warpOverProxy' => 'Alihkan WARP melalui proksi',
			'pages.settings.warp.detourModes.proxyOverWarpExplain' => 'Buka blokir proksi dengan WARP',
			'pages.settings.warp.detourModes.warpOverProxyExplain' => 'Keamanan ekstra dengan WARP',
			'pages.settings.warp.licenseKey' => 'Kunci lisensi',
			'pages.settings.warp.cleanIp' => 'IP bersih',
			'pages.settings.warp.port' => 'Port',
			'pages.settings.warp.noise.count' => 'Jumlah kebisingan',
			'pages.settings.warp.noise.mode' => 'Mode kebisingan',
			'pages.settings.warp.noise.size' => 'Ukuran kebisingan',
			'pages.settings.warp.noise.delay' => 'Penundaan kebisingan',
			'components.stats.connection' => 'Koneksi',
			'components.stats.traffic' => 'Lalu lintas',
			'components.stats.trafficLive' => 'Lalu lintas langsung',
			'components.stats.trafficTotal' => 'Total lalu lintas',
			'components.stats.uplink' => 'Unggah',
			'components.stats.downlink' => 'Unduh',
			'components.stats.speed' => 'Kecepatan',
			'components.stats.totalTransferred' => 'Total ditransfer',
			'components.subscriptionInfo.upload' => 'Unggah',
			'components.subscriptionInfo.download' => 'Unduh',
			'components.subscriptionInfo.total' => 'Total lalu lintas',
			'components.subscriptionInfo.expireDate' => 'Tanggal kedaluwarsa',
			'components.subscriptionInfo.expired' => 'Kedaluwarsa',
			'components.subscriptionInfo.noTraffic' => 'Kuota habis',
			'components.subscriptionInfo.remainingTime' => 'Sisa waktu',
			'components.subscriptionInfo.remainingDuration' => ({required Object duration}) => 'tersisa ${duration} hari',
			'components.subscriptionInfo.remainingDurationNew' => ({required Object duration}) => '${duration} hari',
			'components.subscriptionInfo.remainingTrafficSemanticLabel' => ({required Object consumed, required Object total}) => '${consumed} dari ${total} lalu lintas terpakai',
			'components.subscriptionInfo.remainingTraffic' => 'Sisa lalu lintas',
			'components.subscriptionInfo.remainingUsage' => 'Sisa',
			'components.subscriptionInfo.profileSite' => 'Penyedia',
			'components.subscriptionInfo.profileSupport' => 'Dukungan',
			'dialogs.sortProfiles.title' => 'Urut berdasarkan',
			'dialogs.sortProfiles.sort.name' => 'Menurut abjad',
			'dialogs.sortProfiles.sort.lastUpdate' => 'Terakhir diperbarui',
			'dialogs.warpLicense.title' => 'Persetujuan Cloudflare WARP',
			'dialogs.warpLicense.description' => ({required InlineSpanBuilder tos, required InlineSpanBuilder privacy}) => TextSpan(children: [ const TextSpan(text: 'Cloudflare WARP adalah penyedia VPN WireGuard gratis. Dengan mengaktifkan opsi ini, Anda menyetujui '), tos('Ketentuan Layanan'), const TextSpan(text: ' dan '), privacy('Kebijakan Privasi'), const TextSpan(text: ' Cloudflare WARP.'), ]), 
			'dialogs.newVersion.title' => 'Pembaruan tersedia',
			'dialogs.newVersion.msg' => 'Versi baru ${_root.common.appTitle} tersedia. Apakah Anda ingin memperbarui sekarang?',
			'dialogs.newVersion.currentVersion' => 'Versi saat ini: ',
			'dialogs.newVersion.newVersion' => 'Versi baru: ',
			'dialogs.newVersion.updateNow' => 'Perbarui sekarang',
			'dialogs.confirmation.settings.import.msg' => 'Ini akan menimpa semua opsi konfigurasi dengan nilai yang diberikan. Anda yakin?',
			'dialogs.confirmation.profile.delete.title' => 'Hapus profil',
			'dialogs.confirmation.profile.delete.msg' => 'Anda yakin ingin menghapus profil ini secara permanen?',
			'dialogs.confirmation.perAppProxy.shareOnGithub.title' => 'Meningkatkan pilihan otomatis',
			'dialogs.confirmation.perAppProxy.shareOnGithub.msg' => 'Dengan membagikan aplikasi yang dipilih, Anda membantu melengkapi daftar "pilihan otomatis"',
			'dialogs.confirmation.perAppProxy.import.msg' => 'Ini akan menggantikan semua pilihan proksi per aplikasi Anda saat ini. Anda yakin ingin melanjutkan?',
			'dialogs.confirmation.routeRule.delete.title' => 'Hapus aturan',
			'dialogs.confirmation.routeRule.delete.msg' => ({required Object rulename}) => 'Anda yakin ingin menghapus aturan "${rulename}"?',
			'dialogs.experimentalNotice.title' => 'Fitur eksperimental sedang digunakan',
			'dialogs.experimentalNotice.msg' => 'Anda telah mengaktifkan beberapa fitur eksperimental yang mungkin memengaruhi kualitas koneksi dan menyebabkan kesalahan tak terduga. Anda selalu dapat mengubah atau menyetel ulang opsi ini dari halaman konfigurasi.',
			'dialogs.experimentalNotice.disable' => 'Jangan tampilkan lagi',
			'dialogs.noActiveProfile.title' => 'Pilih profil',
			'dialogs.noActiveProfile.msg' => 'Mari kita mulai dengan menambahkan profil koneksi yang berisi detail koneksi VPN Anda.\n\nBelum punya server VPN? Jangan khawatir, ikuti tutorial di bawah ini untuk mengaturnya dengan cepat dan gratis.',
			'dialogs.noActiveProfile.helpBtn.label' => 'Tunjukkan caranya',
			'dialogs.noActiveProfile.helpBtn.url' => 'https://github.com/shulaiyun/Sloth-VPN.git',
			'dialogs.unknownDomainsWarning.title' => 'Peringatan tautan eksternal',
			'dialogs.unknownDomainsWarning.youAreAboutToVisit' => 'Anda akan mengunjungi:',
			'dialogs.unknownDomainsWarning.thisWebsiteIsNotInOurTrustedList' => 'Situs web ini tidak ada dalam daftar tepercaya kami. Harap lanjutkan dengan hati-hati.',
			'dialogs.proxyInfo.fullTag' => 'Tag lengkap:',
			'dialogs.proxyInfo.type' => 'Tipe:',
			'dialogs.proxyInfo.testTime' => 'Waktu uji:',
			'dialogs.proxyInfo.testDelay' => 'Jeda uji:',
			'dialogs.proxyInfo.isSelected' => 'Dipilih:',
			'dialogs.proxyInfo.isGroup' => 'Grup',
			'dialogs.proxyInfo.isSecure' => 'Aman:',
			'dialogs.proxyInfo.port' => 'Port:',
			'dialogs.proxyInfo.host' => 'Host:',
			'dialogs.proxyInfo.ip' => 'IP:',
			'dialogs.proxyInfo.countryCode' => 'Kode negara:',
			'dialogs.proxyInfo.region' => 'Wilayah:',
			'dialogs.proxyInfo.city' => 'Kota:',
			'dialogs.proxyInfo.asn' => 'ASN:',
			'dialogs.proxyInfo.organization' => 'Organisasi:',
			'dialogs.proxyInfo.location' => 'Lokasi:',
			'dialogs.proxyInfo.postalCode' => 'Kode pos:',
			'dialogs.windowClosing.askEachTime' => 'Tanyakan setiap kali',
			'dialogs.windowClosing.alertMessage' => 'Sembunyikan atau keluar dari aplikasi?',
			'dialogs.windowClosing.remember' => 'Ingat pilihan saya',
			'connection.tapToConnect' => 'Ketuk untuk menyambungkan',
			'connection.connect' => 'Sambungkan',
			'connection.connecting' => 'Menyambungkan...',
			'connection.connected' => 'Tersambung',
			'connection.disconnect' => 'Putuskan',
			'connection.disconnecting' => 'Memutuskan...',
			'connection.reconnect' => 'Sambungkan kembali',
			'connection.reconnectMsg' => 'Menyambungkan kembali untuk menerapkan perubahan...',
			'connection.secure' => 'Diamankan oleh WARP',
			'errors.unexpected' => 'Kesalahan tak terduga',
			'errors.connection.unexpected' => 'Kesalahan koneksi tak terduga',
			'errors.connection.timeout' => 'Waktu koneksi habis',
			'errors.connection.badResponse' => 'Respons buruk',
			'errors.connection.connectionError' => 'Kesalahan koneksi',
			'errors.connection.badCertificate' => 'Sertifikat rusak',
			'errors.profiles.unexpected' => 'Kesalahan tak terduga',
			'errors.profiles.notFound' => 'Profil tidak ditemukan',
			'errors.profiles.invalidConfig' => 'Konfigurasi tidak valid',
			'errors.profiles.invalidUrl' => 'URL tidak valid',
			'errors.profiles.canceledByUser' => 'Dibatalkan oleh pengguna',
			'errors.connectivity.unexpected' => 'Kegagalan tak terduga',
			'errors.connectivity.missingVpnPermission' => 'Izin VPN hilang',
			'errors.connectivity.missingNotificationPermission' => 'Izin notifikasi hilang',
			'errors.connectivity.core' => 'Kesalahan inti',
			'errors.singbox.serviceNotRunning' => 'Layanan tidak berjalan',
			'errors.singbox.missingPrivilege' => 'Izin hilang',
			'errors.singbox.missingPrivilegeMsg' => 'Mode VPN memerlukan izin administrator. Harap mulai ulang aplikasi sebagai administrator atau ubah mode layanan.',
			'errors.singbox.invalidConfigOptions' => 'Opsi konfigurasi tidak valid',
			'errors.singbox.invalidConfig' => 'Konfigurasi tidak valid',
			'errors.warp.missingLicense' => 'Lisensi WARP hilang',
			'errors.warp.missingLicenseMsg' => 'Profil yang dipilih menggunakan fitur WARP. Untuk menggunakan fitur ini, Anda harus menyetujui lisensi WARP.',
			_ => null,
		};
	}
}

