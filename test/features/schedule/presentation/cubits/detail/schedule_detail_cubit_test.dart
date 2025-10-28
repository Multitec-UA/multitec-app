import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/usecases/is_joined_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/toggle_join_schedule_item_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/detail/schedule_detail_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/detail/schedule_detail_state.dart';

class MockIsJoinedUseCase extends Mock implements IsJoinedUseCase {}

class MockToggleJoinScheduleItemUseCase extends Mock
    implements ToggleJoinScheduleItemUseCase {}

class MockEventBus extends Mock implements EventBus {}

void main() {
  group('ScheduleDetailCubit', () {
    late IsJoinedUseCase isJoinedUseCase;
    late ToggleJoinScheduleItemUseCase toggleJoinUseCase;
    late EventBus eventBus;
    late StreamController<ScheduleItemAttendanceToggledEvent> streamController;

    final tScheduleItem = ScheduleItem(
      id: '1',
      type: 'event',
      title: 'Test Event',
      description: 'Description',
      startsAt: DateTime(2025, 1, 15),
      published: true,
      attendeesCount: 10,
      createdAt: DateTime(2025, 1, 1),
      updatedAt: DateTime(2025, 1, 1),
      location: 'Location',
      category: 'Category',
    );

    const tFailure = GenericFailure(
      code: 'test_error',
      debugMessage: 'Test error message',
    );

    setUp(() {
      isJoinedUseCase = MockIsJoinedUseCase();
      toggleJoinUseCase = MockToggleJoinScheduleItemUseCase();
      eventBus = MockEventBus();
      streamController = StreamController<ScheduleItemAttendanceToggledEvent>();

      when(
        () => eventBus.listen<ScheduleItemAttendanceToggledEvent>(),
      ).thenAnswer((_) => streamController.stream);
    });

    tearDown(() {
      streamController.close();
    });

    ScheduleDetailCubit createCubit() => ScheduleDetailCubit(
      item: tScheduleItem,
      isJoinedUseCase: isJoinedUseCase,
      toggleJoinUseCase: toggleJoinUseCase,
      eventBus: eventBus,
    );

    test('initial state contains the provided item', () {
      when(
        () => isJoinedUseCase(tScheduleItem.id),
      ).thenAnswer((_) async => const Success(false));

      final cubit = createCubit();

      expect(cubit.state.item, equals(tScheduleItem));
      expect(cubit.state.isJoined, equals(false));
      expect(cubit.state.toggleJoinStatus, equals(RequestStatus.initial));

      cubit.close();
    });

    test(
      'subscribes to ScheduleItemAttendanceToggledEvent on initialization',
      () {
        when(
          () => isJoinedUseCase(tScheduleItem.id),
        ).thenAnswer((_) async => const Success(false));

        final cubit = createCubit();

        verify(
          () => eventBus.listen<ScheduleItemAttendanceToggledEvent>(),
        ).called(1);

        cubit.close();
      },
    );

    group('constructor - check join status', () {
      blocTest<ScheduleDetailCubit, ScheduleDetailState>(
        'emits [success] with isJoined true when user has joined',
        build: () {
          when(
            () => isJoinedUseCase(tScheduleItem.id),
          ).thenAnswer((_) async => const Success(true));
          return createCubit();
        },
        expect: () => [
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: true,
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
        ],
        verify: (_) {
          verify(() => isJoinedUseCase(tScheduleItem.id)).called(1);
        },
      );

      blocTest<ScheduleDetailCubit, ScheduleDetailState>(
        'emits [success] with isJoined false when user has not joined',
        build: () {
          when(
            () => isJoinedUseCase(tScheduleItem.id),
          ).thenAnswer((_) async => const Success(false));
          return createCubit();
        },
        expect: () => [
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: false,
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
        ],
        verify: (_) {
          verify(() => isJoinedUseCase(tScheduleItem.id)).called(1);
        },
      );

      blocTest<ScheduleDetailCubit, ScheduleDetailState>(
        'emits [failure] when checking join status fails',
        build: () {
          when(
            () => isJoinedUseCase(tScheduleItem.id),
          ).thenAnswer((_) async => const Error(tFailure));
          return createCubit();
        },
        expect: () => [
          ScheduleDetailState(
            item: tScheduleItem,
            toggleJoinStatus: RequestStatus.failure,
            failure: tFailure,
          ),
        ],
      );
    });

    group('toggleJoin', () {
      blocTest<ScheduleDetailCubit, ScheduleDetailState>(
        'emits [loading, success] when joining successfully',
        build: () {
          when(
            () => isJoinedUseCase(tScheduleItem.id),
          ).thenAnswer((_) async => const Success(false));
          when(
            () => toggleJoinUseCase(tScheduleItem, isJoined: false),
          ).thenAnswer((_) async => const Success(true));
          return createCubit();
        },
        act: (cubit) async {
          await Future<void>.delayed(Duration.zero);
          await cubit.toggleJoin();
        },
        expect: () => [
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: false,
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: false,
            toggleJoinStatus: RequestStatus.loading,
          ),
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: false,
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
        ],
        verify: (_) {
          verify(
            () => toggleJoinUseCase(tScheduleItem, isJoined: false),
          ).called(1);
        },
      );

      blocTest<ScheduleDetailCubit, ScheduleDetailState>(
        'emits [loading, success] when leaving successfully',
        build: () {
          when(
            () => isJoinedUseCase(tScheduleItem.id),
          ).thenAnswer((_) async => const Success(true));
          when(
            () => toggleJoinUseCase(tScheduleItem, isJoined: true),
          ).thenAnswer((_) async => const Success(false));
          return createCubit();
        },
        act: (cubit) async {
          await Future<void>.delayed(Duration.zero);
          await cubit.toggleJoin();
        },
        expect: () => [
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: true,
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: true,
            toggleJoinStatus: RequestStatus.loading,
          ),
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: true,
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
        ],
        verify: (_) {
          verify(
            () => toggleJoinUseCase(tScheduleItem, isJoined: true),
          ).called(1);
        },
      );

      blocTest<ScheduleDetailCubit, ScheduleDetailState>(
        'emits [loading, failure] when toggle fails',
        build: () {
          when(
            () => isJoinedUseCase(tScheduleItem.id),
          ).thenAnswer((_) async => const Success(false));
          when(
            () => toggleJoinUseCase(tScheduleItem, isJoined: false),
          ).thenAnswer((_) async => const Error(tFailure));
          return createCubit();
        },
        act: (cubit) async {
          await Future<void>.delayed(Duration.zero);
          await cubit.toggleJoin();
        },
        expect: () => [
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: false,
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: false,
            toggleJoinStatus: RequestStatus.loading,
          ),
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: false,
            toggleJoinStatus: RequestStatus.failure,
            failure: tFailure,
          ),
        ],
      );
    });

    group('ScheduleItemAttendanceToggledEvent handling', () {
      blocTest<ScheduleDetailCubit, ScheduleDetailState>(
        'updates attendeesCount and isJoined when user joins',
        build: () {
          when(
            () => isJoinedUseCase(tScheduleItem.id),
          ).thenAnswer((_) async => const Success(false));
          return createCubit();
        },
        act: (cubit) async {
          await Future<void>.delayed(Duration.zero);
          streamController.add(
            ScheduleItemAttendanceToggledEvent(
              scheduleItem: tScheduleItem,
              join: true,
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: false,
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
          ScheduleDetailState(
            item: tScheduleItem.copyWith(attendeesCount: 11),
            isJoined: true,
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
        ],
      );

      blocTest<ScheduleDetailCubit, ScheduleDetailState>(
        'updates attendeesCount and isJoined when user leaves',
        build: () {
          when(
            () => isJoinedUseCase(tScheduleItem.id),
          ).thenAnswer((_) async => const Success(true));
          return createCubit();
        },
        act: (cubit) async {
          await Future<void>.delayed(Duration.zero);
          streamController.add(
            ScheduleItemAttendanceToggledEvent(
              scheduleItem: tScheduleItem,
              join: false,
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: true,
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
          ScheduleDetailState(
            item: tScheduleItem.copyWith(attendeesCount: 9),
            isJoined: false,
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
        ],
      );

      blocTest<ScheduleDetailCubit, ScheduleDetailState>(
        'does not emit when event is for different item',
        build: () {
          when(
            () => isJoinedUseCase(tScheduleItem.id),
          ).thenAnswer((_) async => const Success(false));
          return createCubit();
        },
        act: (cubit) async {
          await Future<void>.delayed(Duration.zero);

          final differentItem = ScheduleItem(
            id: '999',
            type: 'event',
            title: 'Different Event',
            description: 'Description',
            startsAt: DateTime(2025, 1, 15),
            published: true,
            attendeesCount: 5,
            createdAt: DateTime(2025, 1, 1),
            updatedAt: DateTime(2025, 1, 1),
          );

          streamController.add(
            ScheduleItemAttendanceToggledEvent(
              scheduleItem: differentItem,
              join: true,
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          ScheduleDetailState(
            item: tScheduleItem,
            isJoined: false,
            toggleJoinStatus: RequestStatus.success,
            failure: null,
          ),
        ],
      );
    });

    group('close', () {
      test('closes without errors', () async {
        when(
          () => isJoinedUseCase(tScheduleItem.id),
        ).thenAnswer((_) async => const Success(false));

        final cubit = createCubit();

        await expectLater(cubit.close(), completes);
      });
    });
  });
}
