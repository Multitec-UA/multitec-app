import 'package:flutter_test/flutter_test.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';

void main() {
  group('Schedule Navigation Optimization', () {
    test('ScheduleItem can be created and passed correctly', () {
      final item = ScheduleItem(
        id: 'test_id',
        type: ScheduleType.event.value,
        title: 'Test Event',
        description: 'Test Description',
        startsAt: DateTime.now(),
        endsAt: DateTime.now().add(const Duration(hours: 2)),
        location: 'Test Location',
        category: 'Test Category',
        published: true,
        attendeesCount: 5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(item.id, 'test_id');
      expect(item.title, 'Test Event');
      expect(item.type, ScheduleType.event);
      expect(item.attendeesCount, 5);
    });

    test('ScheduleType enum works correctly', () {
      expect(ScheduleType.event.value, 'event');
      expect(ScheduleType.activity.value, 'activity');
    });
  });
}
