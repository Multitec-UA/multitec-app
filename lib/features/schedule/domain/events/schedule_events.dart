sealed class ScheduleEvent {
  const ScheduleEvent();
}
class ScheduleItemAttendanceToggledEvent extends ScheduleEvent {
  const ScheduleItemAttendanceToggledEvent({
    required this.itemId,
    required this.delta,
  });

  final String itemId;
  final int delta;
}
