import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';

sealed class ScheduleEvent {
  const ScheduleEvent();
}
class ScheduleItemAttendanceToggledEvent extends ScheduleEvent {
  const ScheduleItemAttendanceToggledEvent({
    required this.scheduleItem,
    required this.join,
  });

  final ScheduleItem scheduleItem;
  final bool join;
}
