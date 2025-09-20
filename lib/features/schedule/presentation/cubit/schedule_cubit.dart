import 'dart:async';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/core/utils/safe_cubit.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_schedule_items_bytype_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_state.dart';

class ScheduleCubit extends SafeCubit<ScheduleState> {
  ScheduleCubit(
    this._type,
    this._getScheduleItems,
    this._eventBus,
  ) : super(const ScheduleState()) {
    _eventBus
        .listen<ScheduleItemAttendanceToggledEvent>()
        .listen(_handleAttendeeCountChanged);
  }

  final ScheduleType _type;
  final GetScheduleItemsByTypeUseCase _getScheduleItems;
  final EventBus _eventBus;
  String? _nextCursor;

  Future<void> loadScheduleItems({bool isRefreshing = false}) async {
    if (isRefreshing) {
      _nextCursor = null;
      emit(state.copyWith(status: StateStatus.initial));
    }

    if ((state.status.isLoaded && !state.hasMore) || state.status.isLoading) {
      return;
    }

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _getScheduleItems(
      type: _type,
      cursor: isRefreshing ? null : _nextCursor,
    );

    result.when(
      (paginatedResult) {
        _nextCursor = paginatedResult.nextCursor;
        return emit(
          state.copyWith(
            status: StateStatus.loaded,
            items: isRefreshing
                ? paginatedResult.items
                : [...state.items, ...paginatedResult.items],
            hasMore: paginatedResult.hasMore,
            failure: null,
          ),
        );
      },
      (failure) => emit(
        state.copyWith(
          status: StateStatus.error,
          failure: failure,
        ),
      ),
    );
  }

  void _handleAttendeeCountChanged(ScheduleItemAttendanceToggledEvent event) {
    final updatedItems = state.items.map((item) {
      if (item.id == event.scheduleItem.id) {
        final delta = event.join ? 1 : -1;
        return item.copyWith(
          attendeesCount: item.attendeesCount + delta,
        );
      }
      return item;
    }).toList();

    emit(state.copyWith(items: updatedItems));
  }
}
