import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/features/schedule/domain/entities/paginated_result.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_joined_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubits/joined/joined_schedules_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubits/joined/joined_schedules_state.dart';

class MockGetJoinedScheduleItemsUseCase extends Mock
    implements GetJoinedScheduleItemsUseCase {}

class MockEventBus extends Mock implements EventBus {}

void main() {
  group('JoinedSchedulesCubit', () {
    late GetJoinedScheduleItemsUseCase getJoinedScheduleItems;
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
      createdAt: DateTime(2025),
      updatedAt: DateTime(2025),
      location: 'Location 1',
      category: 'Category 1',
    );

    final tScheduleItem2 = ScheduleItem(
      id: '2',
      type: 'event',
      title: 'Test Event 2',
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

    final tPaginatedResult = PaginatedResult(
      items: tScheduleItems,
      hasMore: true,
      nextCursor: 'cursor_123',
    );

    const tFailure = GenericFailure(
      code: 'test_error',
      debugMessage: 'Test error message',
    );

    setUp(() {
      getJoinedScheduleItems = MockGetJoinedScheduleItemsUseCase();
      eventBus = MockEventBus();
      streamController = StreamController<ScheduleItemAttendanceToggledEvent>();

      when(
        () => eventBus.listen<ScheduleItemAttendanceToggledEvent>(),
      ).thenAnswer((_) => streamController.stream);
    });

    tearDown(() {
      streamController.close();
    });

    JoinedSchedulesCubit createCubit() =>
        JoinedSchedulesCubit(getJoinedScheduleItems, eventBus);

    test('initial state is correct', () {
      final cubit = createCubit();

      expect(cubit.state, equals(const JoinedSchedulesState()));

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

    group('loadJoinedSchedules', () {
      blocTest<JoinedSchedulesCubit, JoinedSchedulesState>(
        'emits [loading, success] when joined schedules are loaded successfully',
        build: () {
          when(
            () => getJoinedScheduleItems(),
          ).thenAnswer((_) async => Success(tPaginatedResult));
          return createCubit();
        },
        act: (cubit) => cubit.loadJoinedSchedules(),
        expect: () => [
          const JoinedSchedulesState(status: RequestStatus.loading),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: true,
          ),
        ],
        verify: (_) {
          verify(() => getJoinedScheduleItems()).called(1);
        },
      );

      blocTest<JoinedSchedulesCubit, JoinedSchedulesState>(
        'emits [loading, failure] when loading joined schedules fails',
        build: () {
          when(
            () => getJoinedScheduleItems(),
          ).thenAnswer((_) async => const Error(tFailure));
          return createCubit();
        },
        act: (cubit) => cubit.loadJoinedSchedules(),
        expect: () => [
          const JoinedSchedulesState(status: RequestStatus.loading),
          const JoinedSchedulesState(
            status: RequestStatus.failure,
            failure: tFailure,
          ),
        ],
        verify: (_) {
          verify(() => getJoinedScheduleItems()).called(1);
        },
      );

      blocTest<JoinedSchedulesCubit, JoinedSchedulesState>(
        'emits [loading, success] with empty list when no items are available',
        build: () {
          const emptyResult = PaginatedResult<ScheduleItem>(
            items: [],
            hasMore: false,
          );
          when(
            () => getJoinedScheduleItems(),
          ).thenAnswer((_) async => const Success(emptyResult));
          return createCubit();
        },
        act: (cubit) => cubit.loadJoinedSchedules(),
        expect: () => [
          const JoinedSchedulesState(status: RequestStatus.loading),
          const JoinedSchedulesState(
            status: RequestStatus.success,
            hasMore: false,
          ),
        ],
      );

      blocTest<JoinedSchedulesCubit, JoinedSchedulesState>(
        'appends new items when loading more pages',
        build: () {
          final firstPage = PaginatedResult(
            items: [tScheduleItem1],
            hasMore: true,
            nextCursor: 'cursor_1',
          );
          final secondPage = PaginatedResult(
            items: [tScheduleItem2],
            hasMore: false,
          );

          when(
            () => getJoinedScheduleItems(),
          ).thenAnswer((_) async => Success(firstPage));

          when(
            () => getJoinedScheduleItems(cursor: 'cursor_1'),
          ).thenAnswer((_) async => Success(secondPage));

          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadJoinedSchedules();
          await cubit.loadJoinedSchedules();
        },
        expect: () => [
          const JoinedSchedulesState(status: RequestStatus.loading),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: [tScheduleItem1],
            hasMore: true,
          ),
          JoinedSchedulesState(
            status: RequestStatus.loading,
            items: [tScheduleItem1],
          ),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: [tScheduleItem1, tScheduleItem2],
            hasMore: false,
          ),
        ],
      );

      blocTest<JoinedSchedulesCubit, JoinedSchedulesState>(
        'replaces items when refreshing',
        build: () {
          final firstLoad = PaginatedResult(
            items: [tScheduleItem1],
            hasMore: true,
            nextCursor: 'cursor_1',
          );
          final refreshLoad = PaginatedResult(
            items: tScheduleItems,
            hasMore: true,
            nextCursor: 'cursor_2',
          );

          var callCount = 0;
          when(() => getJoinedScheduleItems()).thenAnswer((_) async {
            callCount++;
            return callCount == 1 ? Success(firstLoad) : Success(refreshLoad);
          });

          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadJoinedSchedules();
          await cubit.loadJoinedSchedules(isRefreshing: true);
        },
        expect: () => [
          const JoinedSchedulesState(status: RequestStatus.loading),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: [tScheduleItem1],
            hasMore: true,
          ),
          JoinedSchedulesState(items: [tScheduleItem1]),
          JoinedSchedulesState(
            status: RequestStatus.loading,
            items: [tScheduleItem1],
          ),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: true,
          ),
        ],
      );

      blocTest<JoinedSchedulesCubit, JoinedSchedulesState>(
        'does not load when already loading',
        build: () {
          when(() => getJoinedScheduleItems()).thenAnswer(
            (_) => Future.delayed(
              const Duration(milliseconds: 100),
              () => Success(tPaginatedResult),
            ),
          );
          return createCubit();
        },
        act: (cubit) async {
          unawaited(cubit.loadJoinedSchedules());
          await Future<void>.delayed(const Duration(milliseconds: 10));
          unawaited(cubit.loadJoinedSchedules());
        },
        wait: const Duration(milliseconds: 150),
        expect: () => [
          const JoinedSchedulesState(status: RequestStatus.loading),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: true,
          ),
        ],
        verify: (_) {
          verify(() => getJoinedScheduleItems()).called(1);
        },
      );

      blocTest<JoinedSchedulesCubit, JoinedSchedulesState>(
        'does not load when hasMore is false',
        build: () {
          final result = PaginatedResult(items: tScheduleItems, hasMore: false);
          when(
            () => getJoinedScheduleItems(),
          ).thenAnswer((_) async => Success(result));
          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadJoinedSchedules();
          await cubit.loadJoinedSchedules();
        },
        expect: () => [
          const JoinedSchedulesState(status: RequestStatus.loading),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: false,
          ),
        ],
        verify: (_) {
          verify(() => getJoinedScheduleItems()).called(1);
        },
      );
    });

    group('ScheduleItemAttendanceToggledEvent handling', () {
      final tScheduleItem3 = ScheduleItem(
        id: '3',
        type: 'event',
        title: 'New Event',
        description: 'Description',
        startsAt: DateTime(2025, 1, 25),
        published: true,
        attendeesCount: 0,
        createdAt: DateTime(2025, 1, 3),
        updatedAt: DateTime(2025, 1, 3),
      );

      blocTest<JoinedSchedulesCubit, JoinedSchedulesState>(
        'removes item when user leaves',
        build: () {
          when(
            () => getJoinedScheduleItems(),
          ).thenAnswer((_) async => Success(tPaginatedResult));
          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadJoinedSchedules();
          streamController.add(
            ScheduleItemAttendanceToggledEvent(
              scheduleItem: tScheduleItem1,
              join: false,
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          const JoinedSchedulesState(status: RequestStatus.loading),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: true,
          ),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: [tScheduleItem2],
          ),
        ],
      );

      blocTest<JoinedSchedulesCubit, JoinedSchedulesState>(
        'increments attendeesCount when user joins existing item',
        build: () {
          when(
            () => getJoinedScheduleItems(),
          ).thenAnswer((_) async => Success(tPaginatedResult));
          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadJoinedSchedules();
          streamController.add(
            ScheduleItemAttendanceToggledEvent(
              scheduleItem: tScheduleItem1,
              join: true,
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          const JoinedSchedulesState(status: RequestStatus.loading),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: true,
          ),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: [
              tScheduleItem1.copyWith(attendeesCount: 11),
              tScheduleItem2,
            ],
          ),
        ],
      );

      blocTest<JoinedSchedulesCubit, JoinedSchedulesState>(
        'adds new item at the beginning when user joins non-existing item',
        build: () {
          when(
            () => getJoinedScheduleItems(),
          ).thenAnswer((_) async => Success(tPaginatedResult));
          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadJoinedSchedules();
          streamController.add(
            ScheduleItemAttendanceToggledEvent(
              scheduleItem: tScheduleItem3,
              join: true,
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          const JoinedSchedulesState(status: RequestStatus.loading),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: true,
          ),
          JoinedSchedulesState(
            status: RequestStatus.success,
            items: [
              tScheduleItem3.copyWith(attendeesCount: 1),
              tScheduleItem1,
              tScheduleItem2,
            ],
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
