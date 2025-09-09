import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit(
    this._type,
    this._getScheduleItems,
  ) : super(const ScheduleState());

  final ScheduleType _type;
  final GetScheduleItemsUseCase _getScheduleItems;

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

}
