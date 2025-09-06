import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';

abstract class AuthRepository {
  Future<Result<Unit, Failure>> signInWithGoogle();
  Future<Result<Unit, Failure>> signOut();
}
