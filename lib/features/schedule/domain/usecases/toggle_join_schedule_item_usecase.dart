import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';

class ToggleJoinScheduleItemUseCase {
  ToggleJoinScheduleItemUseCase(
    this._scheduleRepository,
    this._userRepository,
  );

  final ScheduleRepository _scheduleRepository;
  final UserRepository _userRepository;

  Future<Result<bool, Failure>> call(
    String itemId, {
    required bool isJoined,
  }) async {
    final userResult = _userRepository.getUser();

    return userResult.when(
      (user) async {
        if (user == null) {
          return const Result.error(GenericFailure());
        }

        final result = isJoined
            ? await _scheduleRepository.leaveScheduleItem(itemId, user)
            : await _scheduleRepository.joinScheduleItem(itemId, user);

        return result.when(
          (success) => Result.success(!isJoined),
          Result.error,
        );
      },
      Result.error,
    );
  }
}
