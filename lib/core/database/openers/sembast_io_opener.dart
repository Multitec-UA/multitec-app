import 'package:multitec_app/core/database/openers/sembast_opener.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class SembastIoOpener implements SembastOpener {
  @override
  Future<Database> open(String dbName) async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = join(dir.path, dbName);
    return databaseFactoryIo.openDatabase(dbPath);
  }
}
