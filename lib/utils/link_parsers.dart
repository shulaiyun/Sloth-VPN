import 'dart:convert';

import 'package:hiddify/utils/validators.dart';

typedef ProfileLink = ({String url, String name});

// TODO: test and improve
abstract class LinkParser {
  static String generateSubShareLink(String url, [String? name]) {
    final uri = Uri.tryParse(url);
    if (uri == null) return '';
    final modifiedUri = Uri(
      scheme: uri.scheme,
      host: uri.host,
      path: uri.path,
      query: uri.query,
      fragment: name ?? uri.fragment,
    );
    // return 'hiddify://import/$modifiedUri';
    return '$modifiedUri';
  }

  // protocols schemas
  static const protocols = ['slothvpn', 'hiddify', 'v2ray', 'v2rayn', 'v2rayng', 'clash', 'clashmeta', 'sing-box'];

  static ProfileLink? parse(String link) {
    return simple(link) ?? deep(link);
  }

  static ProfileLink? simple(String link) {
    if (!isUrl(link)) return null;
    final uri = Uri.parse(link.trim());
    return (url: uri.toString(), name: uri.queryParameters['name'] ?? '');
  }

  static ProfileLink? deep(String link) {
    final uri = Uri.tryParse(link.trim());
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) return null;
    final queryParams = uri.queryParameters;
    switch (uri.scheme) {
      case 'slothvpn':
        if (queryParams.containsKey('url')) {
          return (url: queryParams['url']!, name: queryParams['name'] ?? '');
        }
        if (uri.host == 'import' && uri.pathSegments.isNotEmpty) {
          final raw = Uri.decodeComponent(uri.pathSegments.join('/'));
          return (url: raw, name: queryParams['name'] ?? uri.fragment);
        }
        return null;
      case 'hiddify':
        if (queryParams.containsKey('url')) {
          return (url: queryParams['url']!, name: queryParams['name'] ?? '');
        } else {
          return (url: uri.path.substring(1) + (uri.hasQuery ? "?${uri.query}" : ""), name: uri.fragment);
        }
      case 'v2ray' || 'v2rayn' || 'v2rayng' || 'clash' || 'clashmeta' || 'sing-box':
        return queryParams.containsKey('url') ? (url: queryParams['url']!, name: queryParams['name'] ?? '') : null;
      default:
        return null;
    }
  }
}

String safeDecodeBase64(String str) {
  final input = str.trim();
  if (input.isEmpty) return str;
  final compact = input.replaceAll(RegExp(r'\s'), '');
  if (compact.length < 8) return str;
  final normalized = compact.replaceAll('-', '+').replaceAll('_', '/');
  final padding = (4 - normalized.length % 4) % 4;
  final candidate = normalized.padRight(normalized.length + padding, '=');
  try {
    final decoded = utf8.decode(base64Decode(candidate));
    if (_isMostlyText(decoded)) {
      return decoded;
    }
    return str;
  } catch (e) {
    return str;
  }
}

bool _isMostlyText(String value) {
  if (value.isEmpty) return false;
  var printable = 0;
  for (final codeUnit in value.codeUnits) {
    final isPrintableAscii = codeUnit == 9 || codeUnit == 10 || codeUnit == 13 || (codeUnit >= 32 && codeUnit <= 126);
    final isExtended = codeUnit > 126 && codeUnit <= 0xFFFD;
    if (isPrintableAscii || isExtended) {
      printable++;
    }
  }
  return printable / value.length >= 0.92;
}
