import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';

part 'schedule_state.freezed.dart';

@freezed
sealed class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    @Default(<ScheduleItem>[]) List<ScheduleItem> items,
    @Default(StateStatus.initial) StateStatus listStatus,
    Failure? listFailure,
  }) = _ScheduleState;
}
