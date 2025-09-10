import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';

part 'schedule_detail_state.freezed.dart';

@freezed
sealed class ScheduleDetailState with _$ScheduleDetailState {
  const factory ScheduleDetailState({
    @Default(StateStatus.initial) StateStatus status,
    @Default(StateStatus.initial) StateStatus joinStatus,
    @Default(StateStatus.initial) StateStatus isJoinedStatus,
    ScheduleItem? item,
    @Default(false) bool isJoined,
    Failure? failure,
    Failure? joinFailure,
    Failure? isJoinedFailure,
  }) = _ScheduleDetailState;
}
