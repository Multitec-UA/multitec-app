sealed class ScheduleDomainEvent {
  const ScheduleDomainEvent();
}

class AttendeeCountChangedEvent extends ScheduleDomainEvent {
  const AttendeeCountChangedEvent({
    required this.itemId,
    required this.newCount,
    required this.delta,
  });
  
  final String itemId;
  final int newCount;
  final int delta;
}

class UserJoinedScheduleItemEvent extends ScheduleDomainEvent {
  const UserJoinedScheduleItemEvent({
    required this.itemId,
    required this.userId,
  });
  
  final String itemId;
  final String userId;
}

class UserLeftScheduleItemEvent extends ScheduleDomainEvent {
  const UserLeftScheduleItemEvent({
    required this.itemId,
    required this.userId,
  });
  
  final String itemId;
  final String userId;
}
