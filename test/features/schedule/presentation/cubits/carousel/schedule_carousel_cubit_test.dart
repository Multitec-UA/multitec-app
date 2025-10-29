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
import 'package:multitec_app/features/schedule/domain/usecases/get_latest_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubits/carousel/schedule_carousel_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubits/carousel/schedule_carousel_state.dart';

class MockGetLatestScheduleItemsUseCase extends Mock
    implements GetLatestScheduleItemsUseCase {}

class MockEventBus extends Mock implements EventBus {}

void main() {
  group('ScheduleCarouselCubit', () {
    late GetLatestScheduleItemsUseCase getLatestScheduleItems;
    late EventBus eventBus;
    late StreamController<ScheduleItemAttendanceToggledEvent> streamController;

    final tScheduleItem1 = ScheduleItem(
      id: '1',
      type: 'event',
      title: 'Test Event 1',
      description: 'Description 1',
      startsAt: DateTime(2025, 1, 15),
      published: true,
      attendeesCount: 10,
      createdAt: DateTime(2025, 1, 1),
      updatedAt: DateTime(2025, 1, 1),
      location: 'Location 1',
      category: 'Category 1',
    );

    final tScheduleItem2 = ScheduleItem(
      id: '2',
      type: 'activity',
      title: 'Test Activity 2',
      description: 'Description 2',
      startsAt: DateTime(2025, 1, 20),
      published: true,
      attendeesCount: 5,
      createdAt: DateTime(2025, 1, 2),
      updatedAt: DateTime(2025, 1, 2),
      location: 'Location 2',
      category: 'Category 2',
    );

    final tScheduleItems = [tScheduleItem1, tScheduleItem2];

    const tFailure = GenericFailure(
      code: 'test_error',
      debugMessage: 'Test error message',
    );

    setUp(() {
      getLatestScheduleItems = MockGetLatestScheduleItemsUseCase();
      eventBus = MockEventBus();
      streamController = StreamController<ScheduleItemAttendanceToggledEvent>();

      when(
        () => eventBus.listen<ScheduleItemAttendanceToggledEvent>(),
      ).thenAnswer((_) => streamController.stream);
    });

    tearDown(() {
      streamController.close();
    });

    ScheduleCarouselCubit createCubit() =>
        ScheduleCarouselCubit(getLatestScheduleItems, eventBus);

    test('initial state is correct', () {
      final cubit = createCubit();

      expect(cubit.state, equals(const ScheduleCarouselState()));

      cubit.close();
    });

    test(
      'subscribes to ScheduleItemAttendanceToggledEvent on initialization',
      () {
        final cubit = createCubit();

        verify(
          () => eventBus.listen<ScheduleItemAttendanceToggledEvent>(),
        ).called(1);

        cubit.close();
      },
    );

    group('loadLatestScheduleItems', () {
      blocTest<ScheduleCarouselCubit, ScheduleCarouselState>(
        'emits [loading, success] when latest schedule items are loaded successfully',
        build: () {
          when(
            () => getLatestScheduleItems(),
          ).thenAnswer((_) async => Success(tScheduleItems));
          return createCubit();
        },
        act: (cubit) => cubit.loadLatestScheduleItems(),
        expect: () => [
          const ScheduleCarouselState(status: RequestStatus.loading),
          ScheduleCarouselState(
            status: RequestStatus.success,
            items: tScheduleItems,
            failure: null,
          ),
        ],
        verify: (_) {
          verify(() => getLatestScheduleItems()).called(1);
        },
      );

      blocTest<ScheduleCarouselCubit, ScheduleCarouselState>(
        'emits [loading, failure] when loading latest schedule items fails',
        build: () {
          when(
            () => getLatestScheduleItems(),
          ).thenAnswer((_) async => const Error(tFailure));
          return createCubit();
        },
        act: (cubit) => cubit.loadLatestScheduleItems(),
        expect: () => [
          const ScheduleCarouselState(status: RequestStatus.loading),
          const ScheduleCarouselState(
            status: RequestStatus.failure,
            failure: tFailure,
          ),
        ],
        verify: (_) {
          verify(() => getLatestScheduleItems()).called(1);
        },
      );

      blocTest<ScheduleCarouselCubit, ScheduleCarouselState>(
        'emits [loading, success] with empty list when no items are available',
        build: () {
          when(
            () => getLatestScheduleItems(),
          ).thenAnswer((_) async => const Success([]));
          return createCubit();
        },
        act: (cubit) => cubit.loadLatestScheduleItems(),
        expect: () => [
          const ScheduleCarouselState(status: RequestStatus.loading),
          const ScheduleCarouselState(
            status: RequestStatus.success,
            items: [],
            failure: null,
          ),
        ],
      );
    });

    group('ScheduleItemAttendanceToggledEvent handling', () {
      blocTest<ScheduleCarouselCubit, ScheduleCarouselState>(
        'increments attendeesCount when user joins an event',
        build: () {
          when(
            () => getLatestScheduleItems(),
          ).thenAnswer((_) async => Success(tScheduleItems));
          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadLatestScheduleItems();
          streamController.add(
            ScheduleItemAttendanceToggledEvent(
              scheduleItem: tScheduleItem1,
              join: true,
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          const ScheduleCarouselState(status: RequestStatus.loading),
          ScheduleCarouselState(
            status: RequestStatus.success,
            items: tScheduleItems,
            failure: null,
          ),
          ScheduleCarouselState(
            status: RequestStatus.success,
            items: [
              tScheduleItem1.copyWith(attendeesCount: 11),
              tScheduleItem2,
            ],
            failure: null,
          ),
        ],
      );

      blocTest<ScheduleCarouselCubit, ScheduleCarouselState>(
        'decrements attendeesCount when user leaves an event',
        build: () {
          when(
            () => getLatestScheduleItems(),
          ).thenAnswer((_) async => Success(tScheduleItems));
          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadLatestScheduleItems();
          streamController.add(
            ScheduleItemAttendanceToggledEvent(
              scheduleItem: tScheduleItem1,
              join: false,
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          const ScheduleCarouselState(status: RequestStatus.loading),
          ScheduleCarouselState(
            status: RequestStatus.success,
            items: tScheduleItems,
            failure: null,
          ),
          ScheduleCarouselState(
            status: RequestStatus.success,
            items: [tScheduleItem1.copyWith(attendeesCount: 9), tScheduleItem2],
            failure: null,
          ),
        ],
      );

      blocTest<ScheduleCarouselCubit, ScheduleCarouselState>(
        'does not emit new state when event is for non-existent item',
        build: () {
          when(
            () => getLatestScheduleItems(),
          ).thenAnswer((_) async => Success(tScheduleItems));
          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadLatestScheduleItems();

          final nonExistentItem = ScheduleItem(
            id: '999',
            type: 'event',
            title: 'Non-existent',
            description: 'Description',
            startsAt: DateTime(2025, 1, 15),
            published: true,
            attendeesCount: 0,
            createdAt: DateTime(2025, 1, 1),
            updatedAt: DateTime(2025, 1, 1),
          );

          streamController.add(
            ScheduleItemAttendanceToggledEvent(
              scheduleItem: nonExistentItem,
              join: true,
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          const ScheduleCarouselState(status: RequestStatus.loading),
          ScheduleCarouselState(
            status: RequestStatus.success,
            items: tScheduleItems,
            failure: null,
          ),
        ],
      );
    });

    group('close', () {
      test('closes without errors', () async {
        final cubit = createCubit();

        await expectLater(cubit.close(), completes);
      });
    });
  });
}
