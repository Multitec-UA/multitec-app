import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';

class ToggleJoinScheduleItemUseCase {
  ToggleJoinScheduleItemUseCase(
    this._scheduleRepository,
    this._userRepository,
    this._eventBus,
  );

  final ScheduleRepository _scheduleRepository;
  final UserRepository _userRepository;
  final EventBus _eventBus;

  Future<Result<bool, Failure>> call(
    ScheduleItem scheduleItem, {
    required bool isJoined,
  }) async {
    final userResult = _userRepository.getUser();

    return userResult.when(
      (user) async {
        if (user == null) return const Result.error(GenericFailure());

        final result = isJoined
            ? await _scheduleRepository.leaveScheduleItem(scheduleItem, user)
            : await _scheduleRepository.joinScheduleItem(scheduleItem, user);

        return result.when(
          (success) {
            _eventBus.emit(
              ScheduleItemAttendanceToggledEvent(
                scheduleItem: scheduleItem,
                join: !isJoined,
              ),
            );
            return Result.success(!isJoined);
          },
          Result.error,
        );
      },
      Result.error,
    );
  }
}
