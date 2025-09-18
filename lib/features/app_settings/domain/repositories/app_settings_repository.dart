import 'package:flutter/material.dart';

abstract class AppSettingsRepository {
  Future<ThemeMode> getThemeMode();
  Future<void> saveThemeMode(ThemeMode mode);

  Future<Locale?> getLocale();
  Future<void> saveLocale(Locale? locale);
}
