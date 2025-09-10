sealed class ScheduleEvent {
  const ScheduleEvent();
}

class AttendeeCountChangedEvent extends ScheduleEvent {
  const AttendeeCountChangedEvent({
    required this.itemId,
    required this.newCount,
    required this.delta,
  });

  final String itemId;
  final int newCount;
  final int delta;
}

class UserJoinedScheduleItemEvent extends ScheduleEvent {
  const UserJoinedScheduleItemEvent({
    required this.itemId,
    required this.userId,
  });

  final String itemId;
  final String userId;
}

class UserLeftScheduleItemEvent extends ScheduleEvent {
  const UserLeftScheduleItemEvent({
    required this.itemId,
    required this.userId,
  });

  final String itemId;
  final String userId;
}
