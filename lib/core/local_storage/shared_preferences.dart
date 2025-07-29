import 'package:shared_preferences/shared_preferences.dart';
import 'package:sq1_assignment/core/local_storage/local_storage.dart';
import 'package:sq1_assignment/core/local_storage/local_storage_keys.dart';

class SharedPreferencesService implements LocalStorageService {
  SharedPreferencesService({required this.preferences});
  final SharedPreferences preferences;

  @override
  Future<void> setLanguage(String language) async {
    await preferences.setString(LocalStorageKeys.language, language);
  }

  @override
  Future<String?> getLanguage() async {
    return preferences.getString(LocalStorageKeys.language);
  }

  @override
  Future<void> removeLanguage() async {
    await preferences.remove(LocalStorageKeys.language);
  }
}
