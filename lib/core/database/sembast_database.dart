import 'package:multitec_app/core/database/local_database.dart';
import 'package:multitec_app/core/database/openers/sembast_opener.dart';
import 'package:sembast/sembast.dart';

class SembastDatabase implements LocalDatabase {
  SembastDatabase({
    required SembastOpener opener,
    String dbName = 'multitec_app.db',
  })  : _opener = opener,
        _dbName = dbName;

  final SembastOpener _opener;
  final String _dbName;

  Database? _db;
  Future<Database>? _opening;

  Future<Database> _open() async {
    if (_db != null) return _db!;
    if (_opening != null) return _opening!;

    _opening = _opener.open(_dbName);
    try {
      final db = await _opening!;
      _db = db;
      return db;
    } finally {
      _opening = null;
    }
  }

  Future<Database> get _database async => _db ?? await _open();

  @override
  Future<void> close() async {
    await _db?.close();
    _db = null;
  }

  StoreRef<String, Map<String, Object?>> _store(String storeName) =>
      stringMapStoreFactory.store(storeName);

  @override
  Future<void> save(
    String storeName,
    String key,
    Map<String, Object?> data,
  ) async {
    final db = await _database;
    await _store(storeName).record(key).put(db, data);
  }

  @override
  Future<void> saveAll(
    String storeName,
    Map<String, Map<String, Object?>> items,
  ) async {
    final db = await _database;
    final store = _store(storeName);
    await db.transaction((txn) async {
      for (final entry in items.entries) {
        await store.record(entry.key).put(txn, entry.value);
      }
    });
  }

  @override
  Future<Map<String, Object?>?> get(String storeName, String key) async {
    final db = await _database;
    return _store(storeName).record(key).get(db);
  }

  @override
  Future<List<Map<String, Object?>>> getAll(
    String storeName, {
    String? sortField,
    bool descending = false,
  }) async {
    final db = await _database;
    final finder = sortField == null
        ? null
        : Finder(sortOrders: [SortOrder(sortField, !descending)]);
    final records = await _store(storeName).find(db, finder: finder);
    return records.map((e) => e.value).toList();
  }

  @override
  Future<void> delete(String storeName, String key) async {
    final db = await _database;
    await _store(storeName).record(key).delete(db);
  }

  @override
  Future<void> clear(String storeName) async {
    final db = await _database;
    await _store(storeName).delete(db);
  }

  @override
  Future<int> count(String storeName) async {
    final db = await _database;
    return _store(storeName).count(db);
  }

  @override
  Future<bool> exists(String storeName, String key) async {
    final db = await _database;
    return _store(storeName).record(key).exists(db);
  }
}
