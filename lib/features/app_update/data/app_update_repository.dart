import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hiddify/core/http_client/dio_http_client.dart';
import 'package:hiddify/core/model/constants.dart';
import 'package:hiddify/core/model/environment.dart';
import 'package:hiddify/core/utils/exception_handler.dart';
import 'package:hiddify/features/app_update/data/github_release_parser.dart';
import 'package:hiddify/features/app_update/model/app_update_failure.dart';
import 'package:hiddify/features/app_update/model/remote_version_entity.dart';
import 'package:hiddify/utils/utils.dart';

class GatewayUpdatePolicy {
  const GatewayUpdatePolicy({
    required this.enabled,
    required this.latestVersion,
    required this.latestBuild,
    required this.minSupportedBuild,
    required this.force,
    required this.downloadUrl,
    required this.title,
    required this.message,
  });

  final bool enabled;
  final String? latestVersion;
  final int? latestBuild;
  final int? minSupportedBuild;
  final bool force;
  final String? downloadUrl;
  final String? title;
  final String? message;

  static GatewayUpdatePolicy? fromPayload(Map<String, dynamic> payload) {
    final success = payload["success"] == true;
    final data = payload["data"];
    if (!success || data is! Map) return null;
    final map = data.map((key, value) => MapEntry(key.toString(), value));

    int? asPositiveInt(dynamic value) {
      final parsed = int.tryParse(value?.toString() ?? "");
      if (parsed == null || parsed <= 0) return null;
      return parsed;
    }

    String? asText(dynamic value) {
      final text = value?.toString().trim() ?? "";
      return text.isEmpty ? null : text;
    }

    return GatewayUpdatePolicy(
      enabled: map["enabled"] == true,
      latestVersion: asText(map["latest_version"]),
      latestBuild: asPositiveInt(map["latest_build"]),
      minSupportedBuild: asPositiveInt(map["min_supported_build"]),
      force: map["force"] == true,
      downloadUrl: asText(map["download_url"]),
      title: asText(map["title"]),
      message: asText(map["message"]),
    );
  }
}

abstract interface class AppUpdateRepository {
  TaskEither<AppUpdateFailure, RemoteVersionEntity> getLatestVersion({
    bool includePreReleases = false,
    Release release = Release.general,
  });

  Future<GatewayUpdatePolicy?> getGatewayUpdatePolicy({
    required String platform,
    required String version,
    required String buildNumber,
  });
}

class AppUpdateRepositoryImpl with ExceptionHandler, InfraLogger implements AppUpdateRepository {
  AppUpdateRepositoryImpl({required this.httpClient});

  static const _githubApiUserAgent = 'SlothVPN-Update/1.0';
  static const _githubWebUserAgent =
      'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36';

  final DioHttpClient httpClient;

  @override
  Future<GatewayUpdatePolicy?> getGatewayUpdatePolicy({
    required String platform,
    required String version,
    required String buildNumber,
  }) async {
    final uri = Uri.parse(
      "${Constants.gatewayBaseUrl}/api/app/v1/app/update-policy",
    ).replace(queryParameters: {"platform": platform, "version": version, "build_number": buildNumber});

    try {
      final response = await httpClient.get<Map<String, dynamic>>(uri.toString(), userAgent: _githubApiUserAgent);
      if (response.statusCode != 200 || response.data == null) {
        loggy.warning("gateway update-policy returned non-200: ${response.statusCode}");
        return null;
      }
      return GatewayUpdatePolicy.fromPayload(response.data!);
    } on DioException catch (error, stackTrace) {
      loggy.warning("gateway update-policy request failed", error, stackTrace);
      return null;
    } catch (error, stackTrace) {
      loggy.warning("unexpected gateway update-policy error", error, stackTrace);
      return null;
    }
  }

  @override
  TaskEither<AppUpdateFailure, RemoteVersionEntity> getLatestVersion({
    bool includePreReleases = false,
    Release release = Release.general,
  }) {
    return exceptionHandler(() async {
      if (!release.allowCustomUpdateChecker) {
        throw Exception("custom update checkers are not supported");
      }
      final latest = await _fetchLatestFromGithubApi(includePreReleases) ?? await _fetchLatestFromGithubRedirect();
      if (latest == null) {
        loggy.warning("failed to fetch latest version info from github");
        return left(const AppUpdateFailure.unexpected("no releases found"));
      }
      return right(latest);
    }, AppUpdateFailure.unexpected);
  }

  Future<RemoteVersionEntity?> _fetchLatestFromGithubApi(bool includePreReleases) async {
    try {
      final response = await httpClient.get<List>(Constants.githubReleasesApiUrl, userAgent: _githubApiUserAgent);
      if (response.statusCode != 200 || response.data == null) {
        loggy.warning("github releases api returned non-200: ${response.statusCode}");
        return null;
      }

      final releases = response.data!
          .whereType<Map>()
          .map((e) => GithubReleaseParser.parse(Map<String, dynamic>.from(e)))
          .toList();
      if (releases.isEmpty) return null;
      if (includePreReleases) return releases.first;

      for (final item in releases) {
        if (!item.preRelease) return item;
      }
      return releases.first;
    } on DioException catch (error, stackTrace) {
      loggy.warning("github releases api request failed", error, stackTrace);
      return null;
    } catch (error, stackTrace) {
      loggy.warning("unexpected github releases api error", error, stackTrace);
      return null;
    }
  }

  Future<RemoteVersionEntity?> _fetchLatestFromGithubRedirect() async {
    try {
      final response = await httpClient.get<String>(Constants.githubLatestReleaseUrl, userAgent: _githubWebUserAgent);
      final fullTag = _extractReleaseTag(response.realUri, response.data?.toString() ?? "");
      if (fullTag == null || fullTag.isEmpty) return null;

      final releaseUrl = "https://github.com/shulaiyun/Sloth-VPN/releases/tag/$fullTag";
      return GithubReleaseParser.parse({
        "tag_name": fullTag,
        "prerelease": fullTag.contains("-"),
        "published_at": DateTime.now().toUtc().toIso8601String(),
        "html_url": releaseUrl,
      });
    } on DioException catch (error, stackTrace) {
      loggy.warning("github latest release redirect request failed", error, stackTrace);
      return null;
    } catch (error, stackTrace) {
      loggy.warning("unexpected github latest release redirect error", error, stackTrace);
      return null;
    }
  }

  String? _extractReleaseTag(Uri? uri, String body) {
    if (uri != null) {
      final segments = uri.pathSegments.map(Uri.decodeComponent).toList();
      final tagIndex = segments.lastIndexOf("tag");
      if (tagIndex >= 0 && tagIndex + 1 < segments.length) {
        return segments[tagIndex + 1];
      }
    }
    final match = RegExp("/releases/tag/([^\"'\\s<]+)").firstMatch(body);
    if (match != null) {
      return Uri.decodeComponent(match.group(1)!);
    }
    return null;
  }
}
