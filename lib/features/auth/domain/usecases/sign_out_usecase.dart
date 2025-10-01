import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';

class SignOutUseCase {
  SignOutUseCase(this._authRepository, this._scheduleRepository);

  final AuthRepository _authRepository;
  final ScheduleRepository _scheduleRepository;

  Future<Result<Unit, Failure>> call() async {
    await _scheduleRepository.clearJoinedScheduleLocal();
    return _authRepository.signOut();
  }
}
