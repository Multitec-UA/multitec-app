abstract class LocalStorageService {
  Future<void> setLanguage(String language);
  Future<String?> getLanguage();
  Future<void> removeLanguage();
}
