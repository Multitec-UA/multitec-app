import 'package:sembast/sembast.dart';
import 'package:multitec_app/core/database/database_service.dart';

abstract class BaseLocalDataSource<T> {
  BaseLocalDataSource(this._databaseService, this.storeName);

  final DatabaseService _databaseService;
  final String storeName;

  StoreRef<String, Map<String, Object?>> get _store =>
      stringMapStoreFactory.store(storeName);

  Database get _database => _databaseService.database;

  Future<void> save(String key, Map<String, Object?> data) async {
    await _store.record(key).put(_database, data);
  }

  Future<Map<String, Object?>?> get(String key) async {
    return await _store.record(key).get(_database);
  }

  Future<List<Map<String, Object?>>> getAll() async {
    final records = await _store.find(_database);
    return records.map((record) => record.value).toList();
  }

  Future<void> delete(String key) async {
    await _store.record(key).delete(_database);
  }

  Future<void> clear() async {
    await _store.delete(_database);
  }

  Future<List<Map<String, Object?>>> query(Finder finder) async {
    final records = await _store.find(_database, finder: finder);
    return records.map((record) => record.value).toList();
  }

  Future<int> count([Finder? finder]) async {
    return await _store.count(_database);
  }

  Future<bool> exists(String key) async {
    return await _store.record(key).exists(_database);
  }
}
