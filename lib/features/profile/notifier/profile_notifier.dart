import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hiddify/core/haptic/haptic_service.dart';
import 'package:hiddify/core/http_client/http_client_provider.dart';
import 'package:hiddify/core/localization/translations.dart';
import 'package:hiddify/core/model/failures.dart';
import 'package:hiddify/core/notification/in_app_notification_controller.dart';
import 'package:hiddify/core/router/dialog/dialog_notifier.dart';
import 'package:hiddify/features/connection/notifier/connection_notifier.dart';
import 'package:hiddify/features/profile/add/model/free_profiles_model.dart';
import 'package:hiddify/features/profile/data/profile_data_providers.dart';
import 'package:hiddify/features/profile/data/profile_repository.dart';
import 'package:hiddify/features/profile/model/profile_entity.dart';
import 'package:hiddify/features/profile/model/profile_failure.dart';
import 'package:hiddify/features/profile/notifier/active_profile_notifier.dart';
import 'package:hiddify/features/settings/data/config_option_repository.dart';
import 'package:hiddify/utils/riverpod_utils.dart';
import 'package:hiddify/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_notifier.g.dart';

@riverpod
class AddProfileNotifier extends _$AddProfileNotifier with AppLogger {
  @override
  AsyncValue<Unit?> build() {
    ref.disposeDelay(const Duration(minutes: 1));
    ref.onDispose(() {
      loggy.debug("disposing");
      _cancelToken?.cancel();
    });
    listenSelf((previous, next) {
      final t = ref.read(translationsProvider).requireValue;
      final notification = ref.read(inAppNotificationControllerProvider);
      switch (next) {
        case AsyncData(value: final _?):
          notification.showSuccessToast(t.pages.profiles.msg.save.success);
        case AsyncError(:final error):
          if (error case ProfileInvalidUrlFailure()) {
            notification.showErrorToast(t.pages.profiles.msg.invalidUrl);
          } else if (error case ProfileCancelByUserFailure()) {
            return;
          } else {
            ref
                .read(dialogNotifierProvider.notifier)
                .showCustomAlertFromErr(t.presentError(error, action: t.pages.profiles.msg.add.failure));
          }
      }
    });
    ref.onDispose(() {
      if (!(_cancelToken?.isCancelled ?? true)) _cancelToken?.cancel();
    });
    return const AsyncData(null);
  }

  ProfileRepository get _profilesRepo => ref.read(profileRepositoryProvider).requireValue;
  CancelToken? _cancelToken;

  Future<void> addClipboard(String rawInput) async {
    if (state.isLoading) return;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final input = rawInput.trim();
      final parsedLink = LinkParser.parse(input) ?? _parseLooseRemoteLink(input);
      final TaskEither<ProfileFailure, Unit> task;
      if (parsedLink case final rs?) {
        loggy.debug("adding profile, url: [${rs.url}]");
        task = _profilesRepo.upsertRemote(
          rs.url,
          userOverride: rs.name.isNotEmpty ? UserOverride(name: rs.name) : null,
          cancelToken: _cancelToken = CancelToken(),
        );
      } else {
        loggy.debug("adding profile, content");
        task = _profilesRepo.addLocal(safeDecodeBase64(input));
      }
      return await task
          .match(
            (err) {
              loggy.warning("failed to add profile", err);
              throw err;
            },
            (_) {
              loggy.info("successfully added profile");
              return unit;
            },
          )
          .run();
    });
  }

  ProfileLink? _parseLooseRemoteLink(String raw) {
    final match = RegExp(r'(https?:\/\/[^\s"<>]+|www\.[^\s"<>]+)', caseSensitive: false).firstMatch(raw);
    if (match == null) return null;
    final rawCandidate = match.group(0)?.trim();
    if (rawCandidate == null || rawCandidate.isEmpty) return null;
    final cleaned = rawCandidate.replaceAll(RegExp(r'^[\(\[\{<]+|[\)\]\}>.,;:]+$'), '');
    final candidate = cleaned.startsWith('www.') ? 'https://$cleaned' : cleaned;
    final uri = Uri.tryParse(candidate);
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) return null;
    if (!(uri.scheme == 'http' || uri.scheme == 'https')) return null;
    return (url: uri.toString(), name: uri.queryParameters['name'] ?? '');
  }

  Future<void> addManual({required String url, required UserOverride userOverride}) async {
    if (state.isLoading) return;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final task = _profilesRepo.upsertRemote(url, userOverride: userOverride);
      return await task
          .match(
            (err) {
              loggy.warning("failed to add profile", err);
              throw err;
            },
            (r) {
              loggy.info("successfully added profile, mark as active? [true]");
              return r;
            },
          )
          .run();
    });
  }
}

@riverpod
class UpdateProfileNotifier extends _$UpdateProfileNotifier with AppLogger {
  @override
  AsyncValue<Unit?> build(String id) {
    ref.disposeDelay(const Duration(minutes: 1));
    listenSelf((previous, next) {
      final t = ref.read(translationsProvider).requireValue;
      final notification = ref.read(inAppNotificationControllerProvider);
      switch (next) {
        case AsyncData(value: final _?):
          notification.showSuccessToast(t.pages.profiles.msg.update.success);
        case AsyncError(:final error):
          ref
              .read(dialogNotifierProvider.notifier)
              .showCustomAlertFromErr(t.presentError(error, action: t.pages.profiles.msg.update.failure));
      }
    });
    return const AsyncData(null);
  }

  ProfileRepository get _profilesRepo => ref.read(profileRepositoryProvider).requireValue;

  Future<void> updateProfile(RemoteProfileEntity profile) async {
    if (state.isLoading) return;
    state = const AsyncLoading();
    await ref.read(hapticServiceProvider.notifier).lightImpact();
    state = await AsyncValue.guard(() async {
      return await _profilesRepo
          .upsertRemote(profile.url)
          .match(
            (err) {
              loggy.warning("failed to update profile", err);
              throw err;
            },
            (_) async {
              loggy.info('successfully updated profile');

              await ref.read(activeProfileProvider.future).then((active) async {
                if (active != null && active.id == profile.id) {
                  await ref.read(connectionNotifierProvider.notifier).reconnect(profile);
                }
              });
              return unit;
            },
          )
          .run();
    });
  }
}

@riverpod
class FreeSwitchNotifier extends _$FreeSwitchNotifier {
  @override
  bool build() {
    return false;
  }

  Future<void> onChange(bool value) async => state = value;
}

@riverpod
class AddProfilePageNotifier extends _$AddProfilePageNotifier {
  @override
  AddProfilePages build() => AddProfilePages.options;

  void goOptions() => state = AddProfilePages.options;
  void goManual() => state = AddProfilePages.manual;
}

enum AddProfilePages { options, manual }

@riverpod
class FreeProfilesNotifier extends _$FreeProfilesNotifier {
  static const _sources = [
    'https://raw.githubusercontent.com/shulaiyun/Sloth-VPN/main/test.configs/free_configs',
    'https://raw.githubusercontent.com/shulaiyun/Sloth-VPN/main/test.configs/free_configs.json',
    'https://cdn.jsdelivr.net/gh/shulaiyun/Sloth-VPN@main/test.configs/free_configs',
    'https://cdn.jsdelivr.net/gh/shulaiyun/Sloth-VPN@main/test.configs/free_configs.json',
  ];

  @override
  Future<List<FreeProfile>> build() async {
    final httpClient = ref.watch(httpClientProvider);
    for (final source in _sources) {
      try {
        final res = await httpClient.get(source);
        if (res.statusCode != 200) continue;
        final profiles = _parseProfilesPayload(res.data);
        if (profiles.isNotEmpty) return profiles;
      } catch (_) {
        continue;
      }
    }
    try {
      final bundled = await rootBundle.loadString('test.configs/free_configs');
      final localProfiles = _parseProfilesPayload(bundled);
      if (localProfiles.isNotEmpty) return localProfiles;
    } catch (_) {}
    return <FreeProfile>[];
  }

  List<FreeProfile> _parseProfilesPayload(dynamic payload) {
    final dynamic normalized = _decodeProfilePayload(payload);
    if (normalized is Map<String, dynamic>) {
      if (normalized['profiles'] is List || normalized.containsKey('profiles')) {
        return FreeProfilesModel.fromJson(normalized).profiles;
      }
      if (normalized['data'] case final data when data is List) {
        return data.whereType<Map>().map((e) => Map<String, dynamic>.from(e)).map(FreeProfile.fromJson).toList();
      }
    }
    if (normalized is List) {
      return normalized.whereType<Map>().map((e) => Map<String, dynamic>.from(e)).map(FreeProfile.fromJson).toList();
    }
    return <FreeProfile>[];
  }

  dynamic _decodeProfilePayload(dynamic payload) {
    if (payload is! String) return payload;
    final text = payload.replaceFirst(RegExp(r'^\uFEFF'), '').trim();
    if (text.isEmpty) return null;
    try {
      return jsonDecode(text);
    } catch (_) {}
    final decoded = safeDecodeBase64(text).trim();
    if (decoded.isNotEmpty && decoded != text) {
      try {
        return jsonDecode(decoded);
      } catch (_) {}
    }
    return null;
  }
}

@riverpod
Future<List<FreeProfile>> freeProfilesFilteredByRegion(Ref ref) async {
  final freeProfiles = await ref.watch(freeProfilesNotifierProvider.future);
  final region = ref.watch(ConfigOptions.region);
  return freeProfiles.where((e) => e.region.contains(region.name) || e.region.isEmpty).toList();
}

