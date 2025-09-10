import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_domain_events.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';

class LeaveItemUseCase {
  LeaveItemUseCase(this._repository, this._eventBus);

  final ScheduleRepository _repository;
  final EventBus _eventBus;

  Future<Result<Unit, Failure>> call(String itemId) async {
    final result = await _repository.leaveScheduleItem(itemId);

    return result.when(
      (success) {
        _eventBus.emit(AttendeeCountChangedEvent(
          itemId: itemId,
          newCount: 0, // Will be updated by cubit
          delta: -1,
        ));
        return Success(success);
      },
      (failure) => Error(failure),
    );
  }
}
