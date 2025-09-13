import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/usecases/is_joined_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/toggle_join_schedule_item_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_detail_state.dart';

class ScheduleDetailCubit extends Cubit<ScheduleDetailState> {
  ScheduleDetailCubit({
    required ScheduleItem item,
    required IsJoinedUseCase isJoinedUseCase,
    required ToggleJoinScheduleItemUseCase toggleJoinUseCase,
    required EventBus eventBus,
  })  : _isJoinedUseCase = isJoinedUseCase,
        _toggleJoinUseCase = toggleJoinUseCase,
        _eventBus = eventBus,
        super(
          ScheduleDetailState(item: item),
        ) {
    _checkJoinStatus(item.id);
    _eventBus
        .listen<ScheduleItemAttendanceToggledEvent>()
        .listen(_handleAttendeeCountChanged);
  }

  final IsJoinedUseCase _isJoinedUseCase;
  final ToggleJoinScheduleItemUseCase _toggleJoinUseCase;
  final EventBus _eventBus;

  Future<void> _checkJoinStatus(String itemId) async {
    final result = await _isJoinedUseCase(itemId);

    result.when(
      (isJoined) => emit(
        state.copyWith(
          isJoined: isJoined,
          toggleJoinStatus: StateStatus.loaded,
          failure: null,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          toggleJoinStatus: StateStatus.error,
          failure: failure,
        ),
      ),
    );
  }

  Future<void> toggleJoin() async {
    emit(state.copyWith(toggleJoinStatus: StateStatus.loading));

    final result = await _toggleJoinUseCase(
      state.item,
      isJoined: state.isJoined,
    );

    result.when(
      (_) {
        emit(
          state.copyWith(
            toggleJoinStatus: StateStatus.loaded,
            failure: null,
          ),
        );
      },
      (failure) => emit(
        state.copyWith(
          toggleJoinStatus: StateStatus.error,
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
}
