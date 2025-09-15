import 'package:sembast/sembast.dart';

abstract class DatabaseService {
  Database get database;
  Future<void> close();
}
