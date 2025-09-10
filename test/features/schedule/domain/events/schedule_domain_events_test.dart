import 'package:flutter_test/flutter_test.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_domain_events.dart';

void main() {
  group('ScheduleDomainEvents', () {
    test('AttendeeCountChangedEvent creates correctly', () {
      const event = AttendeeCountChangedEvent(
        itemId: 'test_id',
        newCount: 5,
        delta: 1,
      );

      expect(event.itemId, 'test_id');
      expect(event.newCount, 5);
      expect(event.delta, 1);
    });

    test('UserJoinedScheduleItemEvent creates correctly', () {
      const event = UserJoinedScheduleItemEvent(
        itemId: 'test_id',
        userId: 'user_123',
      );

      expect(event.itemId, 'test_id');
      expect(event.userId, 'user_123');
    });

    test('UserLeftScheduleItemEvent creates correctly', () {
      const event = UserLeftScheduleItemEvent(
        itemId: 'test_id',
        userId: 'user_123',
      );

      expect(event.itemId, 'test_id');
      expect(event.userId, 'user_123');
    });
  });
}
