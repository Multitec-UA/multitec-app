import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';

class IsJoinedUseCase {
  IsJoinedUseCase(this._scheduleRepository, this._userRepository);

  final ScheduleRepository _scheduleRepository;
  final UserRepository _userRepository;

  Future<Result<bool, Failure>> call(String itemId) async {
    final userResult = _userRepository.getUser();

    return userResult.when(
      (user) {
        if (user == null) {
          return const Result.success(false);
        }
        return _scheduleRepository.isJoined(itemId, user);
      },
      Result.error,
    );
  }
}
