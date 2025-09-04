import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/user/models/user.dart';

abstract class AuthRepository {
  Future<Result<User, Failure>> signInWithGoogle();
  Future<Result<Unit, Failure>> signOut();
}
