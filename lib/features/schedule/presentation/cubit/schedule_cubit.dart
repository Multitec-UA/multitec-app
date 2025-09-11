import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/models/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
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
  final GetScheduleItemsUseCase _getScheduleItems;
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

    final params = PaginationParams(
      cursor: isRefreshing ? null : _nextCursor,
    );
    final result = await _getScheduleItems(_type, params);

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
      if (item.id == event.itemId) {
        return item.copyWith(
          attendeesCount: item.attendeesCount + event.delta,
        );
      }
      return item;
    }).toList();

    emit(state.copyWith(items: updatedItems));
  }
}
