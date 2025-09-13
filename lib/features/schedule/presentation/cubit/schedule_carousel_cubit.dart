import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_latest_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_carousel_state.dart';

class ScheduleCarouselCubit extends Cubit<ScheduleCarouselState> {
  ScheduleCarouselCubit(this._getLatestScheduleItems)
      : super(const ScheduleCarouselState());

  final GetLatestScheduleItemsUseCase _getLatestScheduleItems;

  Future<void> loadLatestItems() async {
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
}
