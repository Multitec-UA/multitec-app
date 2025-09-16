import 'package:multitec_app/core/database/openers/sembast_opener.dart';
import 'package:sembast_web/sembast_web.dart';

class SembastWebOpener implements SembastOpener {
  @override
  Future<Database> open(String dbName) async {
    return databaseFactoryWeb.openDatabase(dbName);
  }
}
