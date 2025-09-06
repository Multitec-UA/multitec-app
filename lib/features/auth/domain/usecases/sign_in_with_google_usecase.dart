import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogleUseCase {
  SignInWithGoogleUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<Result<Unit, Failure>> call() async =>
      _authRepository.signInWithGoogle();
}
