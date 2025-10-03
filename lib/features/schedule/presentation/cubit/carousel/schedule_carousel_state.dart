import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';

part 'schedule_carousel_state.freezed.dart';

@freezed
sealed class ScheduleCarouselState with _$ScheduleCarouselState {
  const factory ScheduleCarouselState({
    @Default(RequestStatus.initial) RequestStatus status,
    @Default([]) List<ScheduleItem> items,
    Failure? failure,
  }) = _ScheduleCarouselState;
}
