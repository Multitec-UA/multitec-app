import 'dart:async';

import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/core/utils/safe_cubit.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/usecases/is_joined_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/toggle_join_schedule_item_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_detail_state.dart';

class ScheduleDetailCubit extends SafeCubit<ScheduleDetailState> {
  ScheduleDetailCubit({
    required ScheduleItem item,
    required IsJoinedUseCase isJoinedUseCase,
    required ToggleJoinScheduleItemUseCase toggleJoinUseCase,
    required EventBus eventBus,
  }) : _isJoinedUseCase = isJoinedUseCase,
       _toggleJoinUseCase = toggleJoinUseCase,
       _eventBus = eventBus,
       super(ScheduleDetailState(item: item)) {
    _checkJoinStatus(item.id);
    eventSuscription = _eventBus
        .listen<ScheduleItemAttendanceToggledEvent>()
        .listen(_handleAttendeeCountChanged);
  }

  final IsJoinedUseCase _isJoinedUseCase;
  final ToggleJoinScheduleItemUseCase _toggleJoinUseCase;
  final EventBus _eventBus;
  late StreamSubscription<void> eventSuscription;

  Future<void> _checkJoinStatus(String itemId) async {
    final result = await _isJoinedUseCase(itemId);

    result.when(
      (isJoined) => emit(
        state.copyWith(
          isJoined: isJoined,
          toggleJoinStatus: RequestStatus.success,
          failure: null,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          toggleJoinStatus: RequestStatus.failure,
          failure: failure,
        ),
      ),
    );
  }

  Future<void> toggleJoin() async {
    emit(state.copyWith(toggleJoinStatus: RequestStatus.loading));

    final result = await _toggleJoinUseCase(
      state.item,
      isJoined: state.isJoined,
    );

    result.when(
      (_) {
        emit(
          state.copyWith(
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
        );
      },
      (failure) => emit(
        state.copyWith(
          toggleJoinStatus: RequestStatus.failure,
          failure: failure,
        ),
      ),
    );
  }

  void _handleAttendeeCountChanged(ScheduleItemAttendanceToggledEvent event) {
    if (state.item.id == event.scheduleItem.id) {
      final delta = event.join ? 1 : -1;
      final updatedItem = state.item.copyWith(
        attendeesCount: state.item.attendeesCount + delta,
      );
      emit(state.copyWith(item: updatedItem, isJoined: event.join));
    }
  }

  @override
  Future<void> close() async {
    await eventSuscription.cancel();
    return super.close();
  }
}
