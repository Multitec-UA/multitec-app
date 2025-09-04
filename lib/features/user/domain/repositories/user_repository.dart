import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/user/models/user.dart';

abstract class UserRepository {
  Future<Result<User, Failure>> getUser();
  Future<Result<Unit, Failure>> updateUser(User user);
  Future<Result<String, Failure>> getToken();
  Future<Result<Unit, Failure>> saveToken(String token);
  Future<Result<Unit, Failure>> removeToken();
}
