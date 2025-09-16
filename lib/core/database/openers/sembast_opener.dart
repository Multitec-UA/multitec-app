// ignore_for_file: one_member_abstracts
import 'package:sembast/sembast.dart';

abstract class SembastOpener {
  Future<Database> open(String dbName);
}
