import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/usecases/is_joined_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/join_item_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/leave_item_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_detail_state.dart';

class ScheduleDetailCubit extends Cubit<ScheduleDetailState> {
  ScheduleDetailCubit({
    required ScheduleItem item,
    required IsJoinedUseCase isJoinedUseCase,
    required JoinItemUseCase joinItemUseCase,
    required LeaveItemUseCase leaveItemUseCase,
  })  : _isJoinedUseCase = isJoinedUseCase,
        _joinItemUseCase = joinItemUseCase,
        _leaveItemUseCase = leaveItemUseCase,
        super(
          ScheduleDetailState(
            status: StateStatus.loaded,
            item: item,
          ),
        ) {
    _checkJoinStatus(item.id);
  }

  final IsJoinedUseCase _isJoinedUseCase;
  final JoinItemUseCase _joinItemUseCase;
  final LeaveItemUseCase _leaveItemUseCase;

  Future<void> _checkJoinStatus(String itemId) async {
    emit(state.copyWith(isJoinedStatus: StateStatus.loading));

    final result = await _isJoinedUseCase(itemId);

    result.when(
      (isJoined) => emit(
        state.copyWith(
          isJoinedStatus: StateStatus.loaded,
          isJoined: isJoined,
          isJoinedFailure: null,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          isJoinedStatus: StateStatus.error,
          isJoinedFailure: failure,
        ),
      ),
    );
  }

  Future<void> joinItem() async {
    final itemId = state.item?.id;
    if (itemId == null) return;

    emit(state.copyWith(joinStatus: StateStatus.loading));

    final result = await _joinItemUseCase(itemId);

    result.when(
      (_) {
        final updatedItem = state.item!.copyWith(
          attendeesCount: state.item!.attendeesCount + 1,
        );
        emit(
          state.copyWith(
            joinStatus: StateStatus.loaded,
            isJoined: true,
            joinFailure: null,
            item: updatedItem,
          ),
        );
      },
      (failure) => emit(
        state.copyWith(
          joinStatus: StateStatus.error,
          joinFailure: failure,
        ),
      ),
    );
  }

  Future<void> leaveItem() async {
    final itemId = state.item?.id;
    if (itemId == null) return;

    emit(state.copyWith(joinStatus: StateStatus.loading));

    final result = await _leaveItemUseCase(itemId);

    result.when(
      (_) {
        final updatedItem = state.item!.copyWith(
          attendeesCount: state.item!.attendeesCount - 1,
        );
        emit(
          state.copyWith(
            joinStatus: StateStatus.loaded,
            isJoined: false,
            joinFailure: null,
            item: updatedItem,
          ),
        );
      },
      (failure) => emit(
        state.copyWith(
          joinStatus: StateStatus.error,
          joinFailure: failure,
        ),
      ),
    );
  }
}
