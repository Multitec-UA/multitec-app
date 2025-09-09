enum ScheduleType {
  event('event'),
  activity('activity');

  const ScheduleType(this.value);
  final String value;

  static ScheduleType fromString(String value) {
    return switch (value) {
      'event' => ScheduleType.event,
      'activity' => ScheduleType.activity,
      _ => throw ArgumentError('Invalid ScheduleType: $value'),
    };
  }
}
