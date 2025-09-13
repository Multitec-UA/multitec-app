import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';

part 'schedule_carousel_state.freezed.dart';

@freezed
sealed class ScheduleCarouselState with _$ScheduleCarouselState {
  const factory ScheduleCarouselState({
    @Default(StateStatus.initial) StateStatus status,
    @Default([]) List<ScheduleItem> items,
    Failure? failure,
  }) = _ScheduleCarouselState;
}
