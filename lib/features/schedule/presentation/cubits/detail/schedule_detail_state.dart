import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';

part 'schedule_detail_state.freezed.dart';

@freezed
sealed class ScheduleDetailState with _$ScheduleDetailState {
  const factory ScheduleDetailState({
    required ScheduleItem item,
    @Default(RequestStatus.initial) RequestStatus toggleJoinStatus,
    @Default(false) bool isJoined,
    Failure? failure,
  }) = _ScheduleDetailState;
}
