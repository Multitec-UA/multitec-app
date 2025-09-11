import 'package:flutter_test/flutter_test.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';

void main() {
  group('ScheduleDomainEvents', () {
    test('ScheduleItemAttendanceToggledEvent creates correctly', () {
      const event = ScheduleItemAttendanceToggledEvent(
        itemId: 'test_id',
        delta: 1,
      );

      expect(event.itemId, 'test_id');
      expect(event.delta, 1);
    });
  });
}
