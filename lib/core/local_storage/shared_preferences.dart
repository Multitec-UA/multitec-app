import 'package:multitec_app/core/local_storage/local_storage.dart';
import 'package:multitec_app/core/local_storage/local_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
