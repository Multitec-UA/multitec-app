import 'package:multitec_app/core/preferences/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements LocalStorageService {
  SharedPreferencesService({required this.preferences});
  final SharedPreferences preferences;

  @override
  Future<void> saveData(String key, String data) async {
    await preferences.setString(key, data);
  }

  @override
  Future<String?> getData(String key) async {
    return preferences.getString(key);
  }

  @override
  Future<void> removeData(String key) async {
    await preferences.remove(key);
  }
}
