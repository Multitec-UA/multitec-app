import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/schedule/domain/usecases/toggle_join_schedule_item_usecase.dart';
import 'package:multitec_app/features/user/domain/entities/user.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';

class MockScheduleRepository extends Mock implements ScheduleRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockEventBus extends Mock implements EventBus {}

void main() {
  group('ToggleJoinScheduleItemUseCase', () {
    late ScheduleRepository scheduleRepository;
    late UserRepository userRepository;
    late EventBus eventBus;
    late ToggleJoinScheduleItemUseCase useCase;

    final tScheduleItem = ScheduleItem(
      id: 'item_1',
      type: 'event',
      title: 'Test Event',
      description: 'Description',
      startsAt: DateTime(2025),
      published: true,
      attendeesCount: 10,
      createdAt: DateTime(2025),
      updatedAt: DateTime(2025),
    );

    const tUser = User(
      id: 'user_1',
      name: 'Test User',
      email: 'test@example.com',
    );
    const tFailure = GenericFailure(
      code: 'test_error',
      debugMessage: 'Test error message',
    );

    setUp(() {
      scheduleRepository = MockScheduleRepository();
      userRepository = MockUserRepository();
      eventBus = MockEventBus();
      useCase = ToggleJoinScheduleItemUseCase(
        scheduleRepository,
        userRepository,
        eventBus,
      );
    });

    setUpAll(() {
      registerFallbackValue(tScheduleItem);
      registerFallbackValue(tUser);
      registerFallbackValue(
        ScheduleItemAttendanceToggledEvent(
          scheduleItem: tScheduleItem,
          join: true,
        ),
      );
    });

    group('when user is not joined (joining)', () {
      test('joins successfully and emits event', () async {
        when(() => userRepository.getUser()).thenReturn(const Success(tUser));
        when(
          () => scheduleRepository.joinScheduleItem(
            any<ScheduleItem>(),
            any<User>(),
          ),
        ).thenAnswer((_) async => const Success(unit));
        when(
          () => eventBus.emit<ScheduleItemAttendanceToggledEvent>(any()),
        ).thenReturn(null);

        final result = await useCase(tScheduleItem, isJoined: false);

        expect(result.isSuccess(), true);
        result.when(
          (newJoinStatus) => expect(newJoinStatus, true),
          (failure) => fail('Should not fail'),
        );
        verify(
          () => scheduleRepository.joinScheduleItem(tScheduleItem, tUser),
        ).called(1);
        verify(
          () => eventBus.emit<ScheduleItemAttendanceToggledEvent>(any()),
        ).called(1);
      });

      test('returns failure when join fails', () async {
        when(() => userRepository.getUser()).thenReturn(const Success(tUser));
        when(
          () => scheduleRepository.joinScheduleItem(
            any<ScheduleItem>(),
            any<User>(),
          ),
        ).thenAnswer((_) async => const Error(tFailure));

        final result = await useCase(tScheduleItem, isJoined: false);

        expect(result.isError(), true);
        result.when(
          (newJoinStatus) => fail('Should not succeed'),
          (failure) => expect(failure, tFailure),
        );
        verifyNever(
          () => eventBus.emit<ScheduleItemAttendanceToggledEvent>(any()),
        );
      });
    });

    group('when user is joined (leaving)', () {
      test('leaves successfully and emits event', () async {
        when(() => userRepository.getUser()).thenReturn(const Success(tUser));
        when(
          () => scheduleRepository.leaveScheduleItem(
            any<ScheduleItem>(),
            any<User>(),
          ),
        ).thenAnswer((_) async => const Success(unit));
        when(
          () => eventBus.emit<ScheduleItemAttendanceToggledEvent>(any()),
        ).thenReturn(null);

        final result = await useCase(tScheduleItem, isJoined: true);

        expect(result.isSuccess(), true);
        result.when(
          (newJoinStatus) => expect(newJoinStatus, false),
          (failure) => fail('Should not fail'),
        );
        verify(
          () => scheduleRepository.leaveScheduleItem(tScheduleItem, tUser),
        ).called(1);
        verify(
          () => eventBus.emit<ScheduleItemAttendanceToggledEvent>(any()),
        ).called(1);
      });

      test('returns failure when leave fails', () async {
        when(() => userRepository.getUser()).thenReturn(const Success(tUser));
        when(
          () => scheduleRepository.leaveScheduleItem(
            any<ScheduleItem>(),
            any<User>(),
          ),
        ).thenAnswer((_) async => const Error(tFailure));

        final result = await useCase(tScheduleItem, isJoined: true);

        expect(result.isError(), true);
        result.when(
          (newJoinStatus) => fail('Should not succeed'),
          (failure) => expect(failure, tFailure),
        );
        verifyNever(
          () => eventBus.emit<ScheduleItemAttendanceToggledEvent>(any()),
        );
      });
    });

    test('returns GenericFailure when user is null', () async {
      when(() => userRepository.getUser()).thenReturn(const Success(null));

      final result = await useCase(tScheduleItem, isJoined: false);

      expect(result.isError(), true);
      result.when(
        (newJoinStatus) => fail('Should not succeed'),
        (failure) => expect(failure, isA<GenericFailure>()),
      );
      verifyNever(
        () => scheduleRepository.joinScheduleItem(
          any<ScheduleItem>(),
          any<User>(),
        ),
      );
      verifyNever(
        () => scheduleRepository.leaveScheduleItem(
          any<ScheduleItem>(),
          any<User>(),
        ),
      );
      verifyNever(
        () => eventBus.emit<ScheduleItemAttendanceToggledEvent>(any()),
      );
    });

    test('returns failure when getting user fails', () async {
      when(() => userRepository.getUser()).thenReturn(const Error(tFailure));

      final result = await useCase(tScheduleItem, isJoined: false);

      expect(result.isError(), true);
      result.when(
        (newJoinStatus) => fail('Should not succeed'),
        (failure) => expect(failure, tFailure),
      );
      verifyNever(
        () => scheduleRepository.joinScheduleItem(
          any<ScheduleItem>(),
          any<User>(),
        ),
      );
      verifyNever(
        () => scheduleRepository.leaveScheduleItem(
          any<ScheduleItem>(),
          any<User>(),
        ),
      );
      verifyNever(
        () => eventBus.emit<ScheduleItemAttendanceToggledEvent>(any()),
      );
    });
  });
}
