import 'package:flutter/material.dart';
import 'package:multitec_app/features/settings/data/datasources/settings_local_datasource.dart';
import 'package:multitec_app/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._local);
  final SettingsLocalDataSource _local;

  @override
  Future<ThemeMode> getThemeMode() async {
    final rawThemeMode = await _local.getThemeMode();
    switch (rawThemeMode) {
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
