import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/user/domain/models/user.dart';
import 'package:multitec_app/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  GetCurrentUserUseCase(this._repo);
  final AuthRepository _repo;

  //Future<Result<User?, Failure>> call() => _repo.getCurrentUser();
}
