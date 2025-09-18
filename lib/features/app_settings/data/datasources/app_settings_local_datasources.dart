import 'package:multitec_app/core/preferences/local_storage.dart';
import 'package:multitec_app/core/preferences/local_storage_keys.dart';

class AppSettingsLocalDataSource {
  AppSettingsLocalDataSource(this._storage);

  final LocalStorageService _storage;

  Future<void> saveThemeMode(String raw) =>
      _storage.saveData(LocalStorageKeys.themeMode, raw);

  Future<String?> getThemeMode() =>
      _storage.getData(LocalStorageKeys.themeMode);

  Future<void> saveLocale(String? locale) async {
    if (locale == null || locale.isEmpty) {
      await _storage.removeData(LocalStorageKeys.locale);
    } else {
      await _storage.saveData(LocalStorageKeys.locale, locale);
    }
  }

  Future<String?> getLocale() => _storage.getData(LocalStorageKeys.locale);
}
