import 'package:multitec_app/core/preferences/local_storage.dart';
import 'package:multitec_app/core/preferences/local_storage_keys.dart';

class AppSettingsLocalDataSource {
  AppSettingsLocalDataSource(this._storage);

  final LocalStorageService _storage;

  Future<void> saveThemeMode(String raw) =>
      _storage.saveData(LocalStorageKeys.themeMode, raw);

  Future<String?> getThemeMode() =>
      _storage.getData(LocalStorageKeys.themeMode);

  Future<void> saveLocale(String? raw) async {
    if (raw == null || raw.isEmpty) {
      await _storage.removeData(LocalStorageKeys.language);
    } else {
      await _storage.saveData(LocalStorageKeys.language, raw);
    }
  }

  Future<String?> getLocale() => _storage.getData(LocalStorageKeys.language);
}
