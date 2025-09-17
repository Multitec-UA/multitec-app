import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_latest_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_carousel_state.dart';

class ScheduleCarouselCubit extends Cubit<ScheduleCarouselState> {
  ScheduleCarouselCubit(this._getLatestScheduleItems, this._eventBus)
      : super(const ScheduleCarouselState()) {
    eventSuscription = _eventBus
        .listen<ScheduleItemAttendanceToggledEvent>()
        .listen(_handleAttendeeCountChanged);
  }

  final GetLatestScheduleItemsUseCase _getLatestScheduleItems;
  final EventBus _eventBus;
  late StreamSubscription<void> eventSuscription;

  Future<void> loadLatestScheduleItems() async {
    emit(state.copyWith(status: StateStatus.loading));

    final result = await _getLatestScheduleItems();

    result.when(
      (items) => emit(
        state.copyWith(
          status: StateStatus.loaded,
          items: items,
          failure: null,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: StateStatus.error,
          failure: failure,
        ),
      ),
    );
  }

  void _handleAttendeeCountChanged(
    ScheduleItemAttendanceToggledEvent event,
  ) {
    final updatedItems = state.items.map((item) {
      if (item.id == event.scheduleItem.id) {
        final delta = event.join ? 1 : -1;
        return item.copyWith(attendeesCount: item.attendeesCount + delta);
      }
      return item;
    }).toList();

    emit(state.copyWith(items: updatedItems));
  }

  @override
  Future<void> close() async {
    await eventSuscription.cancel();
    return super.close();
  }
}
