import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';

part 'joined_schedules_state.freezed.dart';

@freezed
sealed class JoinedSchedulesState with _$JoinedSchedulesState {
  const factory JoinedSchedulesState({
    @Default(<ScheduleItem>[]) List<ScheduleItem> items,
    @Default(RequestStatus.initial) RequestStatus status,
    @Default(true) bool hasMore,
    Failure? failure,
  }) = _JoinedSchedulesState;
}
