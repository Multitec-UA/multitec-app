import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_domain_events.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit(
    this._type,
    this._getScheduleItems,
    this._eventBus,
  ) : super(const ScheduleState()) {
    _eventSubscription = _eventBus
        .listen<AttendeeCountChangedEvent>()
        .listen(_handleAttendeeCountChanged);
  }

  final ScheduleType _type;
  final GetScheduleItemsUseCase _getScheduleItems;
  final EventBus _eventBus;
  late final StreamSubscription<AttendeeCountChangedEvent> _eventSubscription;

  Future<void> loadScheduleItems() async {
    emit(state.copyWith(listStatus: StateStatus.loading));

    final result = await _getScheduleItems(_type);

    result.when(
      (items) => emit(
        state.copyWith(
          listStatus: StateStatus.loaded,
          items: items,
          listFailure: null,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          listStatus: StateStatus.error,
          listFailure: failure,
        ),
      ),
    );
  }

  void _handleAttendeeCountChanged(AttendeeCountChangedEvent event) {
    final updatedItems = state.items.map((item) {
      if (item.id == event.itemId) {
        return item.copyWith(
          attendeesCount: item.attendeesCount + event.delta,
        );
      }
      return item;
    }).toList();

    emit(state.copyWith(items: updatedItems));
  }

  @override
  Future<void> close() {
    _eventSubscription.cancel();
    return super.close();
  }
}
