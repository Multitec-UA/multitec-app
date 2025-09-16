abstract class LocalDatabase {
  Future<void> save(String storeName, String key, Map<String, Object?> data);
  Future<void> saveAll(
    String storeName,
    Map<String, Map<String, Object?>> items,
  );
  Future<Map<String, Object?>?> get(String storeName, String key);
  Future<List<Map<String, Object?>>> getAll(String storeName);
  Future<void> delete(String storeName, String key);
  Future<void> clear(String storeName);
  Future<int> count(String storeName);
  Future<bool> exists(String storeName, String key);
  Future<void> close();
}
