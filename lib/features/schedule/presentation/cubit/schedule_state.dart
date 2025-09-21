import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';

part 'schedule_state.freezed.dart';

@freezed
sealed class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    @Default(<ScheduleItem>[]) List<ScheduleItem> items,
    @Default(RequestStatus.initial) RequestStatus status,
    @Default(true) bool hasMore,
    Failure? failure,
  }) = _ScheduleState;
}
