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
import 'package:multitec_app/features/schedule/domain/entities/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/events/schedule_events.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_schedule_items_bytype_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/list/schedule_list_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/list/schedule_list_state.dart';

class MockGetScheduleItemsByTypeUseCase extends Mock
    implements GetScheduleItemsByTypeUseCase {}

class MockEventBus extends Mock implements EventBus {}

void main() {
  group('ScheduleListCubit', () {
    late GetScheduleItemsByTypeUseCase getScheduleItems;
    late EventBus eventBus;
    late StreamController<ScheduleItemAttendanceToggledEvent> streamController;

    const tType = ScheduleType.event;

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
      getScheduleItems = MockGetScheduleItemsByTypeUseCase();
      eventBus = MockEventBus();
      streamController = StreamController<ScheduleItemAttendanceToggledEvent>();

      when(
        () => eventBus.listen<ScheduleItemAttendanceToggledEvent>(),
      ).thenAnswer((_) => streamController.stream);
    });

    tearDown(() {
      streamController.close();
    });

    ScheduleListCubit createCubit() =>
        ScheduleListCubit(tType, getScheduleItems, eventBus);

    test('initial state is correct', () {
      final cubit = createCubit();

      expect(cubit.state, equals(const ScheduleListState()));

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

    group('loadScheduleItems', () {
      blocTest<ScheduleListCubit, ScheduleListState>(
        'emits [loading, success] when schedule items are loaded successfully',
        build: () {
          when(
            () => getScheduleItems(type: tType, cursor: null),
          ).thenAnswer((_) async => Success(tPaginatedResult));
          return createCubit();
        },
        act: (cubit) => cubit.loadScheduleItems(),
        expect: () => [
          const ScheduleListState(status: RequestStatus.loading),
          ScheduleListState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: true,
            failure: null,
          ),
        ],
        verify: (_) {
          verify(() => getScheduleItems(type: tType, cursor: null)).called(1);
        },
      );

      blocTest<ScheduleListCubit, ScheduleListState>(
        'emits [loading, failure] when loading schedule items fails',
        build: () {
          when(
            () => getScheduleItems(type: tType, cursor: null),
          ).thenAnswer((_) async => const Error(tFailure));
          return createCubit();
        },
        act: (cubit) => cubit.loadScheduleItems(),
        expect: () => [
          const ScheduleListState(status: RequestStatus.loading),
          const ScheduleListState(
            status: RequestStatus.failure,
            failure: tFailure,
          ),
        ],
        verify: (_) {
          verify(() => getScheduleItems(type: tType, cursor: null)).called(1);
        },
      );

      blocTest<ScheduleListCubit, ScheduleListState>(
        'emits [loading, success] with empty list when no items are available',
        build: () {
          final emptyResult = PaginatedResult<ScheduleItem>(
            items: const [],
            hasMore: false,
          );
          when(
            () => getScheduleItems(type: tType, cursor: null),
          ).thenAnswer((_) async => Success(emptyResult));
          return createCubit();
        },
        act: (cubit) => cubit.loadScheduleItems(),
        expect: () => [
          const ScheduleListState(status: RequestStatus.loading),
          const ScheduleListState(
            status: RequestStatus.success,
            items: [],
            hasMore: false,
            failure: null,
          ),
        ],
      );

      blocTest<ScheduleListCubit, ScheduleListState>(
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
            () => getScheduleItems(type: tType, cursor: null),
          ).thenAnswer((_) async => Success(firstPage));

          when(
            () => getScheduleItems(type: tType, cursor: 'cursor_1'),
          ).thenAnswer((_) async => Success(secondPage));

          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadScheduleItems();
          await cubit.loadScheduleItems();
        },
        expect: () => [
          const ScheduleListState(status: RequestStatus.loading),
          ScheduleListState(
            status: RequestStatus.success,
            items: [tScheduleItem1],
            hasMore: true,
            failure: null,
          ),
          ScheduleListState(
            status: RequestStatus.loading,
            items: [tScheduleItem1],
            hasMore: true,
          ),
          ScheduleListState(
            status: RequestStatus.success,
            items: [tScheduleItem1, tScheduleItem2],
            hasMore: false,
            failure: null,
          ),
        ],
      );

      blocTest<ScheduleListCubit, ScheduleListState>(
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
          when(() => getScheduleItems(type: tType, cursor: null)).thenAnswer((
            _,
          ) async {
            callCount++;
            return callCount == 1 ? Success(firstLoad) : Success(refreshLoad);
          });

          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadScheduleItems();
          await cubit.loadScheduleItems(isRefreshing: true);
        },
        expect: () => [
          const ScheduleListState(status: RequestStatus.loading),
          ScheduleListState(
            status: RequestStatus.success,
            items: [tScheduleItem1],
            hasMore: true,
            failure: null,
          ),
          ScheduleListState(
            status: RequestStatus.initial,
            items: [tScheduleItem1],
            hasMore: true,
          ),
          ScheduleListState(
            status: RequestStatus.loading,
            items: [tScheduleItem1],
            hasMore: true,
          ),
          ScheduleListState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: true,
            failure: null,
          ),
        ],
      );

      blocTest<ScheduleListCubit, ScheduleListState>(
        'does not load when already loading',
        build: () {
          when(() => getScheduleItems(type: tType, cursor: null)).thenAnswer(
            (_) => Future.delayed(
              const Duration(milliseconds: 100),
              () => Success(tPaginatedResult),
            ),
          );
          return createCubit();
        },
        act: (cubit) async {
          cubit.loadScheduleItems();
          await Future<void>.delayed(const Duration(milliseconds: 10));
          cubit.loadScheduleItems();
        },
        wait: const Duration(milliseconds: 150),
        expect: () => [
          const ScheduleListState(status: RequestStatus.loading),
          ScheduleListState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: true,
            failure: null,
          ),
        ],
        verify: (_) {
          verify(() => getScheduleItems(type: tType, cursor: null)).called(1);
        },
      );

      blocTest<ScheduleListCubit, ScheduleListState>(
        'does not load when hasMore is false',
        build: () {
          final result = PaginatedResult(items: tScheduleItems, hasMore: false);
          when(
            () => getScheduleItems(type: tType, cursor: null),
          ).thenAnswer((_) async => Success(result));
          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadScheduleItems();
          await cubit.loadScheduleItems();
        },
        expect: () => [
          const ScheduleListState(status: RequestStatus.loading),
          ScheduleListState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: false,
            failure: null,
          ),
        ],
        verify: (_) {
          verify(() => getScheduleItems(type: tType, cursor: null)).called(1);
        },
      );
    });

    group('ScheduleItemAttendanceToggledEvent handling', () {
      blocTest<ScheduleListCubit, ScheduleListState>(
        'increments attendeesCount when user joins an event',
        build: () {
          when(
            () => getScheduleItems(type: tType, cursor: null),
          ).thenAnswer((_) async => Success(tPaginatedResult));
          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadScheduleItems();
          streamController.add(
            ScheduleItemAttendanceToggledEvent(
              scheduleItem: tScheduleItem1,
              join: true,
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          const ScheduleListState(status: RequestStatus.loading),
          ScheduleListState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: true,
            failure: null,
          ),
          ScheduleListState(
            status: RequestStatus.success,
            items: [
              tScheduleItem1.copyWith(attendeesCount: 11),
              tScheduleItem2,
            ],
            hasMore: true,
            failure: null,
          ),
        ],
      );

      blocTest<ScheduleListCubit, ScheduleListState>(
        'decrements attendeesCount when user leaves an event',
        build: () {
          when(
            () => getScheduleItems(type: tType, cursor: null),
          ).thenAnswer((_) async => Success(tPaginatedResult));
          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadScheduleItems();
          streamController.add(
            ScheduleItemAttendanceToggledEvent(
              scheduleItem: tScheduleItem1,
              join: false,
            ),
          );
          await Future<void>.delayed(Duration.zero);
        },
        expect: () => [
          const ScheduleListState(status: RequestStatus.loading),
          ScheduleListState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: true,
            failure: null,
          ),
          ScheduleListState(
            status: RequestStatus.success,
            items: [tScheduleItem1.copyWith(attendeesCount: 9), tScheduleItem2],
            hasMore: true,
            failure: null,
          ),
        ],
      );

      blocTest<ScheduleListCubit, ScheduleListState>(
        'does not emit new state when event is for non-existent item',
        build: () {
          when(
            () => getScheduleItems(type: tType, cursor: null),
          ).thenAnswer((_) async => Success(tPaginatedResult));
          return createCubit();
        },
        act: (cubit) async {
          await cubit.loadScheduleItems();

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
          const ScheduleListState(status: RequestStatus.loading),
          ScheduleListState(
            status: RequestStatus.success,
            items: tScheduleItems,
            hasMore: true,
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
