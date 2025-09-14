import 'package:flutter_test/flutter_test.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';

void main() {
  group('ScheduleDomainEvents', () {
    test('ScheduleItemAttendanceToggledEvent creates correctly', () {
      final scheduleItem = ScheduleItem(
        id: 'test_id',
        type: 'event',
        title: 'Test Event',
        description: 'Test Description',
        startsAt: DateTime(2024),
        published: true,
        attendeesCount: 5,
        createdAt: DateTime(2024),
        updatedAt: DateTime(2024),
        location: 'Test Location',
      );

      final event = ScheduleItemAttendanceToggledEvent(
        scheduleItem: scheduleItem,
        join: true,
      );

      expect(event.scheduleItem.id, 'test_id');
      expect(event.join, true);
    });
  });
}
