import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:multitec_app/core/database/database_service.dart';

class SembastService implements DatabaseService {
  SembastService._();

  static SembastService? _instance;
  static SembastService get instance => _instance ??= SembastService._();

  Database? _database;

  static Future<SembastService> create() async {
    final service = SembastService.instance;
    await service._initDatabase();
    return service;
  }

  Future<void> _initDatabase() async {
    if (_database != null) return;

    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'multitec_app.db');

    _database = await databaseFactoryIo.openDatabase(dbPath);
  }

  @override
  Database get database {
    if (_database == null) {
      throw StateError(
          'Database not initialized. Call SembastService.create() first.');
    }
    return _database!;
  }

  @override
  Future<void> close() async {
    await _database?.close();
    _database = null;
  }
}
