import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/usecases/is_joined_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/toggle_join_item_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_detail_state.dart';

class ScheduleDetailCubit extends Cubit<ScheduleDetailState> {
  ScheduleDetailCubit({
    required ScheduleItem item,
    required IsJoinedUseCase isJoinedUseCase,
    required ToggleJoinScheduleItemUseCase toggleJoinUseCase,
  })  : _isJoinedUseCase = isJoinedUseCase,
        _toggleJoinUseCase = toggleJoinUseCase,
        super(
          ScheduleDetailState(item: item),
        ) {
    _checkJoinStatus(item.id);
  }

  final IsJoinedUseCase _isJoinedUseCase;
  final ToggleJoinScheduleItemUseCase _toggleJoinUseCase;

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
    final itemId = state.item.id;

    emit(state.copyWith(toggleJoinStatus: StateStatus.loading));

    final result = await _toggleJoinUseCase(itemId, isJoined: state.isJoined);

    result.when(
      (_) {
        final delta = state.isJoined ? -1 : 1;
        final updatedItem = state.item.copyWith(
          attendeesCount: state.item.attendeesCount + delta,
        );
        emit(
          state.copyWith(
            toggleJoinStatus: StateStatus.loaded,
            isJoined: !state.isJoined,
            failure: null,
            item: updatedItem,
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
}
