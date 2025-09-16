abstract class LocalStorageService {
  Future<void> saveData(String key, String data);
  Future<String?> getData(String key);
  Future<void> removeData(String key);
}
