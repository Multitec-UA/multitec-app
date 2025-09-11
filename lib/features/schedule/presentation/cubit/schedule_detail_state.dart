import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';

part 'schedule_detail_state.freezed.dart';

@freezed
sealed class ScheduleDetailState with _$ScheduleDetailState {
  const factory ScheduleDetailState({
    required ScheduleItem item,
    @Default(StateStatus.initial) StateStatus toggleJoinStatus,
    @Default(false) bool isJoined,
    Failure? failure,
  }) = _ScheduleDetailState;
}
