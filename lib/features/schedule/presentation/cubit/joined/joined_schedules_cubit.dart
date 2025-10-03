import 'dart:async';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/core/utils/safe_cubit.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_joined_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/joined_schedules_state.dart';

//TODO: Este TODO esta aqui pero porque tiene que estar en algun sitio: Ordenar los archivos de schedules por sub-features
class JoinedSchedulesCubit extends SafeCubit<JoinedSchedulesState> {
  JoinedSchedulesCubit(this._getJoinedScheduleItems, this._eventBus)
    : super(const JoinedSchedulesState()) {
    eventSuscription = _eventBus
        .listen<ScheduleItemAttendanceToggledEvent>()
        .listen(_handleAttendeeCountChanged);
  }

  final GetJoinedScheduleItemsUseCase _getJoinedScheduleItems;
  final EventBus _eventBus;
  late StreamSubscription<void> eventSuscription;
  String? _nextCursor;

  Future<void> loadJoinedSchedules({bool isRefreshing = false}) async {
    if (isRefreshing) {
      _nextCursor = null;
      emit(state.copyWith(status: RequestStatus.initial));
    }

    if ((state.status.isSuccess && !state.hasMore) || state.status.isLoading) {
      return;
    }

    emit(state.copyWith(status: RequestStatus.loading));

    final result = await _getJoinedScheduleItems(
      cursor: isRefreshing ? null : _nextCursor,
    );

    result.when(
      (paginatedResult) {
        _nextCursor = paginatedResult.nextCursor;
        return emit(
          state.copyWith(
            status: RequestStatus.success,
            items: isRefreshing
                ? paginatedResult.items
                : [...state.items, ...paginatedResult.items],
            hasMore: paginatedResult.hasMore,
            failure: null,
          ),
        );
      },
      (failure) =>
          emit(state.copyWith(status: RequestStatus.failure, failure: failure)),
    );
  }

  void _handleAttendeeCountChanged(ScheduleItemAttendanceToggledEvent event) {
    if (!event.join) {
      final updatedItems = state.items
          .where((item) => item.id != event.scheduleItem.id)
          .toList();
      emit(state.copyWith(items: updatedItems));
    } else {
      final existingItemIndex = state.items.indexWhere(
        (item) => item.id == event.scheduleItem.id,
      );

      if (existingItemIndex != -1) {
        final updatedItems = state.items.map((item) {
          if (item.id == event.scheduleItem.id) {
            return item.copyWith(attendeesCount: item.attendeesCount + 1);
          }
          return item;
        }).toList();
        emit(state.copyWith(items: updatedItems));
      } else {
        final newItem = event.scheduleItem.copyWith(
          attendeesCount: event.scheduleItem.attendeesCount + 1,
        );
        final updatedItems = [newItem, ...state.items];
        emit(state.copyWith(items: updatedItems));
      }
    }
  }

  @override
  Future<void> close() async {
    await eventSuscription.cancel();
    return super.close();
  }
}
