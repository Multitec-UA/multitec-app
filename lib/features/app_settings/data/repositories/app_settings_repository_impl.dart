import 'package:flutter/material.dart';
import 'package:multitec_app/features/app_settings/data/datasources/app_settings_local_datasources.dart';
import 'package:multitec_app/features/app_settings/domain/repositories/app_settings_repository.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  AppSettingsRepositoryImpl(this._local);
  final AppSettingsLocalDataSource _local;

  @override
  Future<ThemeMode> getThemeMode() async {
    final raw = await _local.getThemeMode();
    //TODO: Revisar metodo
    switch (raw) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    return _local.saveThemeMode(mode.name);
  }

  @override
  Future<Locale?> getLocale() async {
    final rawLocale = await _local.getLocale();
    if (rawLocale == null || rawLocale.isEmpty) return null;

    final parts = rawLocale.split('_');
    return parts.length == 2 ? Locale(parts[0], parts[1]) : Locale(parts[0]);
  }

  @override
  Future<void> saveLocale(Locale? locale) {
    if (locale == null) return _local.saveLocale(null);

    final value = (locale.countryCode?.isNotEmpty ?? false)
        ? '${locale.languageCode}_${locale.countryCode}'
        : locale.languageCode;

    return _local.saveLocale(value);
  }
}
