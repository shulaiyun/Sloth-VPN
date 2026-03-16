import 'dart:convert';
import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hiddify/core/db/db.dart';
import 'package:hiddify/core/http_client/dio_http_client.dart';
import 'package:hiddify/features/profile/data/profile_data_mapper.dart';
import 'package:hiddify/features/profile/model/profile_entity.dart';
import 'package:hiddify/features/profile/model/profile_failure.dart';
import 'package:hiddify/features/settings/data/config_option_repository.dart';
import 'package:hiddify/singbox/model/singbox_proxy_type.dart';
import 'package:hiddify/utils/custom_loggers.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta/meta.dart';

/// parse profile subscription url and headers for data
///
/// ***name parser hierarchy:***
/// - UserOverride.name
/// - `profile-title` header
/// - `content-disposition` header
/// - url fragment (example: `https://example.com/config#user`) -> name=`user`
/// - url filename extension (example: `https://example.com/config.json`) -> name=`config`
/// - if none of these methods return a non-blank string, switch(profileType)
/// - remote:  fallback to `Remote Profile`
/// - local: fallback to protocol, extracted from content by protocol()

class ProfileParser with InfraLogger {
  static const infiniteTrafficThreshold = 920_233_720_368;
  static const infiniteTimeThreshold = 92_233_720_368;
  static const _subscriptionSchemes = {
    'ss',
    'ssr',
    'ssconf',
    'vmess',
    'vless',
    'trojan',
    'tuic',
    'hy2',
    'hysteria2',
    'hy',
    'hysteria',
    'ssh',
    'wg',
    'awg',
    'shadowtls',
    'mieru',
    'warp',
    'naive',
    'http',
    'https',
    'socks',
    'socks5',
    'anytls',
  };
  static const _proxyOutboundTypes = {
    'vless',
    'vmess',
    'trojan',
    'shadowsocks',
    'ss',
    'hysteria',
    'hysteria2',
    'hy',
    'hy2',
    'tuic',
    'wireguard',
    'wg',
    'ssh',
    'shadowtls',
    'naive',
    'anytls',
    'mieru',
    'warp',
    'socks',
    'socks5',
    'http',
    'https',
  };
  static const allowedOverrideConfigs = [
    'connection-test-url',
    'direct-dns-address',
    'remote-dns-address',
    'warp',
    'warp2',
    'tls-tricks',
  ];
  static const allowedProfileHeaders = [
    'profile-title',
    'content-disposition',
    'subscription-userinfo',
    'profile-update-interval',
    'support-url',
    'profile-web-page-url',
    'enable-warp',
    'enable-fragment',
  ];
  static const _ruleListLikeKeys = {
    'domains',
    'domain',
    'domain_suffix',
    'domain_keyword',
    'domain_regex',
    'ip',
    'ip_cidr',
    'source_ip_cidr',
    'port',
    'port_range',
    'source_port_range',
    'protocol',
    'network',
    'rule_set',
    'ruleset',
    'process_name',
    'process_path',
    'package_name',
  };

  final Ref _ref;
  final DioHttpClient _httpClient;

  ProfileParser({required Ref ref, required DioHttpClient httpClient}) : _ref = ref, _httpClient = httpClient;
  TaskEither<ProfileFailure, ProfileEntriesCompanion> addLocal({
    required String id,
    required String content,
    required String tempFilePath,
    required UserOverride? userOverride,
  }) {
    return TaskEither.tryCatch(() async {
          await expandRemoteLinesInParallel(
            tempFilePath: tempFilePath,
            httpClient: _httpClient,
            cancelToken: CancelToken(),
            ref: _ref,
          );
        }, (error, stackTrace) => const ProfileFailure.unexpected())
        .flatMap((_) => TaskEither.fromEither(populateHeaders(content: content)))
        .flatMap(
          (populatedHeaders) => TaskEither.fromEither(
            parse(
              tempFilePath: tempFilePath,
              profile: ProfileEntity.local(
                id: id,
                active: true,
                name: '',
                lastUpdate: DateTime.now(),
                userOverride: userOverride,
                populatedHeaders: populatedHeaders,
              ),
            ).flatMap((profEntity) => Either.tryCatch(() => profEntity.toInsertEntry(), ProfileFailure.unexpected)),
          ),
        );
  }

  TaskEither<ProfileFailure, ProfileEntriesCompanion> addRemote({
    required String id,
    required String url,
    required String tempFilePath,
    required UserOverride? userOverride,
    CancelToken? cancelToken,
  }) => _downloadProfile(url, tempFilePath, cancelToken).flatMap(
    (remoteHeaders) =>
        TaskEither.fromEither(
          populateHeaders(content: File(tempFilePath).readAsStringSync(), remoteHeaders: remoteHeaders),
        ).flatMap(
          (populatedHeaders) => TaskEither.fromEither(
            parse(
              tempFilePath: tempFilePath,
              profile: ProfileEntity.remote(
                id: id,
                active: true,
                name: '',
                url: url,
                lastUpdate: DateTime.now(),
                userOverride: userOverride,
                populatedHeaders: populatedHeaders,
              ),
            ).flatMap((profEntity) => Either.tryCatch(() => profEntity.toInsertEntry(), ProfileFailure.unexpected)),
          ),
        ),
  );

  TaskEither<ProfileFailure, ProfileEntriesCompanion> updateRemote({
    required RemoteProfileEntity rp,
    required String tempFilePath,
    CancelToken? cancelToken,
  }) => _downloadProfile(rp.url, tempFilePath, cancelToken).flatMap(
    (remoteHeaders) =>
        TaskEither.fromEither(
          populateHeaders(content: File(tempFilePath).readAsStringSync(), remoteHeaders: remoteHeaders),
        ).flatMap(
          (populatedHeaders) => TaskEither.fromEither(
            parse(
              tempFilePath: tempFilePath,
              profile: rp.copyWith(populatedHeaders: populatedHeaders),
            ).flatMap((profEntity) => Either.tryCatch(() => profEntity.toUpdateEntry(), ProfileFailure.unexpected)),
          ),
        ),
  );

  Either<ProfileFailure, ProfileEntriesCompanion> offlineUpdate({
    required ProfileEntity profile,
    required String tempFilePath,
  }) => profile
      .map(
        remote: (rp) => parse(profile: rp, tempFilePath: tempFilePath),
        local: (lp) => parse(tempFilePath: tempFilePath, profile: lp),
      )
      .flatMap((profEntity) => Either.tryCatch(() => profEntity.toUpdateEntry(), ProfileFailure.unexpected));

  TaskEither<ProfileFailure, Map<String, dynamic>> _downloadProfile(
    String url,
    String tempFilePath,
    CancelToken? cancelToken,
  ) => TaskEither.tryCatch(() async {
    final preferredUserAgent = _ref.read(ConfigOptions.useXrayCoreWhenPossible)
        ? _httpClient.userAgent.replaceAll("SlothVPN", "SlothVPNX")
        : null;

    ({Map<String, dynamic> headers, String content, String? userAgent, int score, int proxyNodes})? best;
    Object? lastError;
    final resolvedCancelToken = cancelToken ?? CancelToken();
    final candidates = _buildUserAgentCandidates(preferredUserAgent);

    for (var i = 0; i < candidates.length; i++) {
      final ua = candidates[i];
      final candidatePath = i == 0 ? tempFilePath : '$tempFilePath.alt_$i';
      try {
        final rs = await _httpClient
            .download(url.trim(), candidatePath, cancelToken: resolvedCancelToken, userAgent: ua)
            .catchError((err) {
              if (CancelToken.isCancel(err as DioException)) {
                throw const ProfileFailure.cancelByUser('HTTP request for getting profile content canceled by user.');
              }
              throw err;
            });

        await expandRemoteLinesInParallel(
          tempFilePath: candidatePath,
          httpClient: _httpClient,
          cancelToken: resolvedCancelToken,
          ref: _ref,
        );

        final content = File(candidatePath).readAsStringSync();
        final score = _scoreSubscriptionText(content);
        final proxyNodes = _estimateProxyNodes(content);
        final candidate = (
          headers: rs.headers.map.map((key, value) => MapEntry(key, value.length == 1 ? value.first : value)),
          content: content,
          userAgent: ua,
          score: score,
          proxyNodes: proxyNodes,
        );
        if (_isBetterCandidate(candidate, best)) {
          best = candidate;
        }
        final chosenUa = ua ?? _httpClient.userAgent;
        loggy.info(
          "subscription candidate fetched: ua=[$chosenUa], score=[$score], proxyNodes=[$proxyNodes], url=[$url]",
        );
        final effectiveBest = best ?? candidate;

        // Avoid unnecessary extra requests (and provider-side rate limits) when
        // we already have a high quality payload.
        if (effectiveBest.proxyNodes >= 8 || (effectiveBest.proxyNodes >= 5 && effectiveBest.score >= 100)) {
          break;
        }
      } catch (error) {
        if (error is ProfileCancelByUserFailure) rethrow;
        lastError = error;
      } finally {
        if (i != 0) {
          final candidateFile = File(candidatePath);
          if (candidateFile.existsSync()) candidateFile.deleteSync();
        }
      }
    }

    if (best == null) {
      throw ProfileFailure.unexpected(lastError ?? 'failed to download profile content');
    }
    final selected = best;
    final chosenUa = selected.userAgent ?? _httpClient.userAgent;
    loggy.info(
      "subscription candidate selected: ua=[$chosenUa], score=[${selected.score}], proxyNodes=[${selected.proxyNodes}], url=[$url]",
    );
    File(tempFilePath).writeAsStringSync(selected.content);
    return selected.headers;
  }, (err, st) => err is ProfileFailure ? err : ProfileFailure.unexpected(err, st));

  List<String?> _buildUserAgentCandidates(String? preferredUserAgent) {
    final raw = <String?>[
      preferredUserAgent,
      null, // default user-agent
      'Hiddify/2.0',
      'sing-box 1.10.0',
      'v2rayNG/1.10.0',
      'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36',
    ];
    final seen = <String?>{};
    return raw.where((ua) => seen.add(ua)).toList();
  }

  static bool _isBetterCandidate(
    ({Map<String, dynamic> headers, String content, String? userAgent, int score, int proxyNodes}) candidate,
    ({Map<String, dynamic> headers, String content, String? userAgent, int score, int proxyNodes})? current,
  ) {
    if (current == null) return true;
    if (candidate.proxyNodes != current.proxyNodes) {
      return candidate.proxyNodes > current.proxyNodes;
    }
    if (candidate.score != current.score) {
      return candidate.score > current.score;
    }
    return candidate.content.length > current.content.length;
  }
  Future<void> expandRemoteLinesInParallel({
    required String tempFilePath,
    required DioHttpClient httpClient,
    required CancelToken cancelToken,
    required Ref ref,
    int parallelism = 4,
  }) async {
    final content = _normalizeWholeContent(await File(tempFilePath).readAsString());
    final lines = content.split('\n');

    final results = List<String?>.filled(lines.length, null);

    int index = 0;

    Future<void> worker() async {
      while (true) {
        if (cancelToken.isCancelled) return;

        final currentIndex = index++;
        if (currentIndex >= lines.length) return;

        final line = lines[currentIndex];
        final trimmedLine = line.trim();

        // Non-URL
        if (!_shouldExpandRemoteLine(trimmedLine)) {
          results[currentIndex] = trimmedLine;
          continue;
        }

        try {
          final tmpPath = '$tempFilePath.$currentIndex';

          await httpClient.download(
            trimmedLine,
            tmpPath,
            cancelToken: cancelToken,
            userAgent: ref.read(ConfigOptions.useXrayCoreWhenPossible)
                ? httpClient.userAgent.replaceAll('SlothVPN', 'SlothVPNX')
                : null,
          );

          final downloaded = await File(tmpPath).readAsString();
          results[currentIndex] = _normalizeRemoteLine(fallbackLine: trimmedLine, downloadedLine: downloaded);
          final tmpFile = File(tmpPath);
          if (await tmpFile.exists()) await tmpFile.delete();
        } catch (err) {
          if (err is DioException && CancelToken.isCancel(err)) {
            return;
          }
          results[currentIndex] = trimmedLine;
        }
      }
    }

    // Start workers
    await Future.wait(List.generate(parallelism, (_) => worker()));

    for (var i = 0; i < results.length; i++) {
      results[i] ??= lines[i].trim();
    }
    final newContent = results.join("\n");
    final normalized = _normalizeConfigForCore(newContent);
    await File(tempFilePath).writeAsString(normalized);
  }

  static bool _shouldExpandRemoteLine(String line) {
    if (!(line.startsWith('http://') || line.startsWith('https://'))) return false;
    if (line.contains(RegExp(r'\s'))) return false;
    return Uri.tryParse(line)?.hasAuthority ?? false;
  }

  static String _normalizeRemoteLine({required String fallbackLine, required String downloadedLine}) {
    final trimmed = downloadedLine.replaceFirst(RegExp(r'^\uFEFF'), '').trim();
    if (trimmed.isEmpty) return fallbackLine;
    if (_isHtmlDocument(trimmed)) return fallbackLine;

    if (_looksLikeSubscriptionContent(trimmed) ||
        _looksLikeYamlSubscription(trimmed) ||
        _looksLikeJsonConfig(trimmed)) {
      return _normalizeConfigForCore(trimmed);
    }

    final decoded = safeDecodeBase64(trimmed);
    final normalizedDecoded = decoded.trim();
    if (normalizedDecoded.isNotEmpty &&
        normalizedDecoded != trimmed &&
        (_looksLikeSubscriptionContent(normalizedDecoded) ||
            _looksLikeYamlSubscription(normalizedDecoded) ||
            _looksLikeJsonConfig(normalizedDecoded))) {
      return _normalizeConfigForCore(normalizedDecoded);
    }

    // Keep non-HTML textual payloads as a best-effort fallback. This avoids
    // dropping provider-specific subscription formats that are not URI-based.
    if (trimmed.length > 80 || trimmed.contains('\n')) return _normalizeConfigForCore(trimmed);
    return fallbackLine;
  }

  static bool _looksLikeSubscriptionContent(String content) {
    if (content.contains('[Interface]')) return true;
    final lower = content.toLowerCase();
    if (lower.contains('"outbounds"') || lower.contains('"inbounds"')) return true;
    if (lower.contains('proxy-providers:') || lower.contains('proxy-groups:') || lower.contains('proxies:')) {
      return true;
    }
    final lines = content.split('\n');
    var checked = 0;
    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty || trimmed.startsWith('#') || trimmed.startsWith('//')) continue;
      final uri = Uri.tryParse(trimmed);
      if (uri != null && _subscriptionSchemes.contains(uri.scheme.toLowerCase())) return true;
      checked++;
      if (checked >= 25) break;
    }
    return false;
  }

  static bool _looksLikeYamlSubscription(String content) {
    final lower = content.toLowerCase();
    if (lower.contains('proxies:') && lower.contains('proxy-groups:')) return true;
    if (lower.contains('proxy-providers:')) return true;
    if (lower.contains('rules:') && (lower.contains('domain-suffix') || lower.contains('geoip'))) return true;
    return false;
  }

  static bool _looksLikeJsonConfig(String content) {
    final trimmed = content.trimLeft();
    if (!(trimmed.startsWith('{') || trimmed.startsWith('['))) return false;
    final lower = trimmed.toLowerCase();
    if (lower.contains('"outbounds"') ||
        lower.contains('"inbounds"') ||
        lower.contains('"dns"') ||
        lower.contains('"proxies"') ||
        lower.contains('"proxy-groups"') ||
        lower.contains('"rules"')) {
      return true;
    }
    return false;
  }

  static bool _isHtmlDocument(String content) {
    final lower = content.trimLeft().toLowerCase();
    return lower.startsWith('<!doctype html') || lower.startsWith('<html');
  }

  static String _normalizeWholeContent(String content) {
    final trimmed = content.replaceFirst(RegExp(r'^\uFEFF'), '').trim();
    if (trimmed.isEmpty) return content;
    if (_looksLikeSubscriptionContent(trimmed) ||
        _looksLikeYamlSubscription(trimmed) ||
        _looksLikeJsonConfig(trimmed)) {
      return _normalizeConfigForCore(trimmed);
    }
    final decoded = safeDecodeBase64(trimmed).trim();
    if (decoded.isEmpty || decoded == trimmed) return trimmed;
    if (_looksLikeSubscriptionContent(decoded) ||
        _looksLikeYamlSubscription(decoded) ||
        _looksLikeJsonConfig(decoded)) {
      return _normalizeConfigForCore(decoded);
    }
    return trimmed;
  }

  static int _scoreSubscriptionText(String content) {
    final normalized = _normalizeWholeContent(content);
    if (normalized.isEmpty) return 0;
    if (_isHtmlDocument(normalized)) return -1000;
    var score = 0;
    if (_looksLikeSubscriptionContent(normalized)) score += 40;
    if (_looksLikeYamlSubscription(normalized)) score += 20;
    if (_looksLikeJsonConfig(normalized)) score += 20;
    final lines = normalized.split('\n');
    var schemeLines = 0;
    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty || trimmed.startsWith('#') || trimmed.startsWith('//')) continue;
      final uri = Uri.tryParse(trimmed);
      if (uri != null && _subscriptionSchemes.contains(uri.scheme.toLowerCase())) schemeLines++;
    }
    score += schemeLines * 2;
    score += _estimateProxyNodes(normalized) * 12;
    score += lines.length > 200 ? 10 : lines.length ~/ 20;
    return score;
  }

  static int _estimateProxyNodes(String content) {
    final normalized = _normalizeWholeContent(content);
    if (normalized.isEmpty || _isHtmlDocument(normalized)) return 0;

    final trimmed = normalized.trimLeft();
    if (trimmed.startsWith('{') || trimmed.startsWith('[')) {
      try {
        final parsed = jsonDecode(normalized);
        return _countProxyNodesFromJson(parsed);
      } catch (_) {}
    }

    final lineCount = _countProxyNodesFromLines(normalized);
    if (lineCount > 0) return lineCount;

    final decoded = safeDecodeBase64(normalized).trim();
    if (decoded.isNotEmpty && decoded != normalized) {
      return _countProxyNodesFromLines(decoded);
    }
    return 0;
  }

  static int _countProxyNodesFromJson(dynamic value) {
    if (value is List) {
      return value.fold<int>(0, (sum, item) => sum + _countProxyNodesFromJson(item));
    }
    if (value is! Map) return 0;
    final map = value.cast<String, dynamic>();
    var count = 0;
    final type = map['type']?.toString().toLowerCase();
    if (type != null && _proxyOutboundTypes.contains(type)) {
      count++;
    }
    final outbounds = map['outbounds'];
    if (outbounds is List) {
      count += _countProxyNodesFromJson(outbounds);
    }
    return count;
  }

  static int _countProxyNodesFromLines(String content) {
    final lines = content.split('\n');
    var count = 0;
    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty || trimmed.startsWith('#') || trimmed.startsWith('//')) continue;
      final uri = Uri.tryParse(trimmed);
      if (uri == null) continue;
      if (_proxyOutboundTypes.contains(uri.scheme.toLowerCase())) {
        count++;
      }
    }
    return count;
  }

  static String _normalizeConfigForCore(String content) {
    final trimmed = content.trimLeft();
    if (!(trimmed.startsWith('{') || trimmed.startsWith('['))) return content;
    try {
      final parsed = jsonDecode(content);
      final normalized = _normalizeJsonForCore(parsed);
      return const JsonEncoder.withIndent('  ').convert(normalized);
    } catch (_) {
      return content;
    }
  }

  static dynamic _normalizeJsonForCore(dynamic value, {String? key}) {
    if (value is List) {
      return value.map((item) => _normalizeJsonForCore(item, key: key)).toList();
    }
    if (value is! Map) return value;

    final normalized = <String, dynamic>{};
    for (final entry in value.entries) {
      final entryKey = '${entry.key}'.trim();
      var entryValue = _normalizeJsonForCore(entry.value, key: entryKey);

      if (_ruleListLikeKeys.contains(entryKey)) {
        final normalizedList = _toStringList(entryValue);
        if (normalizedList != null) entryValue = normalizedList;
      }

      if (entryKey == 'rules' && entryValue is Map) {
        entryValue = [entryValue];
      }

      normalized[entryKey] = entryValue;
    }

    if (!normalized.containsKey('domains')) {
      final domainValue = normalized['domain'];
      final domains = _toStringList(domainValue);
      if (domains != null && domains.isNotEmpty) {
        normalized['domains'] = domains;
      }
    }
    return normalized;
  }

  static List<String>? _toStringList(dynamic value) {
    if (value == null) return null;
    if (value is String) {
      final normalized = value.replaceAll('\r', ',').replaceAll('\n', ',').replaceAll(';', ',').replaceAll('|', ',');
      final items = normalized.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
      return items.isEmpty ? null : items;
    }
    if (value is List) {
      final items = value.map((e) => '$e'.trim()).where((e) => e.isNotEmpty).toList();
      return items.isEmpty ? null : items;
    }
    return null;
  }

  static Either<ProfileFailure, Map<String, dynamic>> populateHeaders({
    required String content,
    Map<String, dynamic>? remoteHeaders,
  }) => Either.tryCatch(() {
    final contentHeaders = _parseHeadersFromContent(content);
    return _mergeAndValidateHeaders(contentHeaders, remoteHeaders ?? {});
  }, ProfileFailure.unexpected);

  static Map<String, dynamic> _mergeAndValidateHeaders(
    Map<String, dynamic> contentHeaders,
    Map<String, dynamic> remoteHeaders,
  ) {
    for (final entry in contentHeaders.entries) {
      if (!remoteHeaders.keys.contains(entry.key)) {
        remoteHeaders[entry.key] = entry.value;
      }
    }
    final headers = <String, dynamic>{};
    for (final entry in remoteHeaders.entries) {
      if (allowedProfileHeaders.contains(entry.key) && entry.value != null && entry.value.toString().isNotEmpty) {
        headers[entry.key] = entry.value;
      }
    }
    return headers;
  }

  static Map<String, dynamic> _parseHeadersFromContent(String content) {
    final headers = <String, dynamic>{};
    final content_ = safeDecodeBase64(content);
    final lines = content_.split("\n");
    final linesToProcess = lines.length < 10 ? lines.length : 10;
    for (int i = 0; i < linesToProcess; i++) {
      final line = lines[i];
      if (line.startsWith("#") || line.startsWith("//")) {
        final index = line.indexOf(':');
        if (index == -1) continue;
        final key = line.substring(0, index).replaceFirst(RegExp("^#|//"), "").trim().toLowerCase();
        final value = line.substring(index + 1).trim();
        headers[key] = value;
      }
    }
    return headers;
  }

  static SubscriptionInfo? _parseSubscriptionInfo(String subInfoStr) {
    final map = <String, int?>{};
    for (final part in subInfoStr.split(';')) {
      final idx = part.indexOf('=');
      if (idx <= 0 || idx >= part.length - 1) continue;
      final key = part.substring(0, idx).trim();
      final value = part.substring(idx + 1).trim();
      map[key] = num.tryParse(value)?.toInt();
    }
    if (map case {"upload": final upload?, "download": final download?, "total": final total, "expire": var expire}) {
      final total1 = (total == null || total == 0) ? infiniteTrafficThreshold + 1 : total;
      expire = (expire == null || expire == 0) ? infiniteTimeThreshold : expire;
      return SubscriptionInfo(
        upload: upload,
        download: download,
        total: total1,
        expire: DateTime.fromMillisecondsSinceEpoch(expire * 1000),
      );
    }
    return null;
  }

  @visibleForTesting
  static Either<ProfileFailure, ProfileEntity> parse({required String tempFilePath, required ProfileEntity profile}) =>
      Either.tryCatch(() {
        final headers = Map<String, dynamic>.from(profile.populatedHeaders ?? {});
        var name = '';
        if (profile.userOverride?.name case final String oName when oName.isNotEmpty) {
          name = oName;
        }

        if (headers['profile-title'] case final String titleHeader when name.isEmpty) {
          if (titleHeader.startsWith("base64:")) {
            name = utf8.decode(base64.decode(titleHeader.replaceFirst("base64:", "")));
          } else {
            name = titleHeader.trim();
          }
        }
        if (headers['content-disposition'] case final String contentDispositionHeader when name.isEmpty) {
          final regExp = RegExp('filename="([^"]*)"');
          final match = regExp.firstMatch(contentDispositionHeader);
          if (match != null && match.groupCount >= 1) {
            name = match.group(1) ?? '';
          }
        }
        if (profile case RemoteProfileEntity(:final url)) {
          if (Uri.parse(url).fragment case final fragment when name.isEmpty) {
            name = fragment;
          }
          if (url.split("/").lastOrNull case final part? when name.isEmpty) {
            final pattern = RegExp(r"\.(json|yaml|yml|txt)[\s\S]*");
            name = part.replaceFirst(pattern, "");
          }
        }
        if (name.isBlank) {
          switch (profile) {
            case RemoteProfileEntity():
              name = "Remote Profile";

            case LocalProfileEntity():
              name = protocol(File(tempFilePath).readAsStringSync());
          }
        }

        if (headers['enable-warp'].toString() == 'true' || profile.userOverride?.enableWarp == true) {
          final value = {'enable': true, 'mode': 'warp_over_proxy'};
          headers['warp'] = value;
          headers['warp2'] = value;
        }

        if (headers['enable-fragment'].toString() == 'true' || profile.userOverride?.enableFragment == true) {
          headers['tls-tricks'] = {'enable-fragment': true};
        }

        final isAutoUpdateDisable = profile.userOverride?.isAutoUpdateDisable ?? false;
        ProfileOptions? options;
        if (profile.userOverride?.updateInterval case final int updateInterval
            when updateInterval > 0 && !isAutoUpdateDisable) {
          options = ProfileOptions(updateInterval: Duration(hours: updateInterval));
        }
        if (headers['profile-update-interval'] case final String updateIntervalStr
            when options == null && !isAutoUpdateDisable) {
          final updateInterval = Duration(hours: int.parse(updateIntervalStr));
          options = ProfileOptions(updateInterval: updateInterval);
        }

        SubscriptionInfo? subInfo;
        if (headers['subscription-userinfo'] case final String subInfoStr) {
          subInfo = _parseSubscriptionInfo(subInfoStr);
        }

        if (subInfo != null) {
          if (headers['profile-web-page-url'] case final String profileWebPageUrl when isUrl(profileWebPageUrl)) {
            subInfo = subInfo.copyWith(webPageUrl: profileWebPageUrl);
          }
          if (headers['support-url'] case final String profileSupportUrl when isUrl(profileSupportUrl)) {
            subInfo = subInfo.copyWith(supportUrl: profileSupportUrl);
          }
        }

        headers.removeWhere(
          (key, value) => !allowedOverrideConfigs.contains(key) || value == null || value.toString().isEmpty,
        );

        final profileOverrideStr = jsonEncode({for (final key in headers.keys) key: headers[key]});

        return profile.map(
          remote: (rp) => rp.copyWith(
            name: name,
            lastUpdate: DateTime.now(),
            options: options,
            subInfo: subInfo,
            profileOverride: profileOverrideStr,
          ),
          local: (lp) => lp.copyWith(name: name, lastUpdate: DateTime.now(), profileOverride: profileOverrideStr),
        );
      }, ProfileFailure.unexpected);

  static String protocol(String content) {
    if (content.contains("[Interface]")) {
      return ProxyType.wireguard.label;
    }
    final lines = content.split('\n');
    String? name;
    for (final line in lines) {
      final uri = Uri.tryParse(line.trim());
      if (uri == null) continue;
      final fragment = uri.hasFragment ? Uri.decodeComponent(uri.fragment.split(" -> ")[0]) : null;
      name ??= switch (uri.scheme) {
        'ss' => fragment ?? ProxyType.shadowsocks.label,
        'ssconf' => fragment ?? ProxyType.shadowsocks.label,
        'vmess' => ProxyType.vmess.label,
        'vless' => fragment ?? ProxyType.vless.label,
        'trojan' => fragment ?? ProxyType.trojan.label,
        'tuic' => fragment ?? ProxyType.tuic.label,
        'hy2' || 'hysteria2' => fragment ?? ProxyType.hysteria2.label,
        'hy' || 'hysteria' => fragment ?? ProxyType.hysteria.label,
        'ssh' => fragment ?? ProxyType.ssh.label,
        'wg' => fragment ?? ProxyType.wireguard.label,
        'awg' => fragment ?? ProxyType.awg.label,
        'shadowtls' => fragment ?? ProxyType.shadowtls.label,
        'mieru' => fragment ?? ProxyType.mieru.label,
        'warp' => fragment ?? ProxyType.warp.label,
        _ => null,
      };
    }
    return name ?? ProxyType.unknown.label;
  }

  static Map<String, dynamic> applyProfileOverride(Map<String, dynamic> main, String? profileOverride) {
    if (profileOverride == null) return main;
    if (profileOverride.contains("{")) {
      final profileOverrideMap = jsonDecode(profileOverride) as Map<String, dynamic>;
      return _mergeJson(main, profileOverrideMap);
    } else {
      return main;
    }
  }

  static Map<String, dynamic> _mergeJson(Map<String, dynamic> main, Map<String, dynamic> override) {
    override.forEach((key, value) {
      if (main.containsKey(key)) {
        if (main[key] is Map<String, dynamic> && value is Map<String, dynamic>) {
          main[key] = _mergeJson(main[key] as Map<String, dynamic>, value);
        } else {
          main[key] = value;
        }
      } else {
        main[key] = value;
      }
    });
    return main;
  }
}
