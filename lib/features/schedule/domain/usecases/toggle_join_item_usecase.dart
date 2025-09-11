import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';

class ToggleJoinScheduleItemUseCase {
  ToggleJoinScheduleItemUseCase(this._repository, this._eventBus);

  final ScheduleRepository _repository;
  final EventBus _eventBus;

  Future<Result<Unit, Failure>> call(
    String itemId, {
    required bool isJoined,
  }) async {
    final result = isJoined
        ? await _repository.leaveScheduleItem(itemId)
        : await _repository.joinScheduleItem(itemId);

    return result.when(
      (success) {
        _eventBus.emit(
          ScheduleItemAttendanceToggledEvent(
            itemId: itemId,
            delta: isJoined ? -1 : 1,
          ),
        );
        return Success(success);
      },
      Error.new,
    );
  }
}
