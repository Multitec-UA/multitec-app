import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/entities/paginated_result.dart';
import 'package:multitec_app/features/schedule/domain/entities/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_joined_schedule_items_usecase.dart';
import 'package:multitec_app/features/user/domain/entities/user.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';

class MockScheduleRepository extends Mock implements ScheduleRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('GetJoinedScheduleItemsUseCase', () {
    late ScheduleRepository scheduleRepository;
    late UserRepository userRepository;
    late GetJoinedScheduleItemsUseCase useCase;

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

    final tPaginatedResult = PaginatedResult(
      items: [tScheduleItem],
      hasMore: true,
      nextCursor: 'cursor_123',
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
      useCase = GetJoinedScheduleItemsUseCase(
        scheduleRepository,
        userRepository,
      );
    });

    setUpAll(() {
      registerFallbackValue(const PaginationParams());
    });

    test('returns joined items when user is authenticated', () async {
      when(() => userRepository.getUser()).thenReturn(const Success(tUser));
      when(
        () => scheduleRepository.getJoinedScheduleItems(any(), any()),
      ).thenAnswer((_) async => Success(tPaginatedResult));

      final result = await useCase();

      expect(result.isSuccess(), true);
      result.when(
        (paginatedResult) => expect(paginatedResult.items, [tScheduleItem]),
        (failure) => fail('Should not fail'),
      );
      verify(
        () => scheduleRepository.getJoinedScheduleItems(tUser.id, any()),
      ).called(1);
    });

    test('returns GenericFailure when user is null', () async {
      when(() => userRepository.getUser()).thenReturn(const Success(null));

      final result = await useCase();

      expect(result.isError(), true);
      result.when(
        (paginatedResult) => fail('Should not succeed'),
        (failure) => expect(failure, isA<GenericFailure>()),
      );
      verifyNever(
        () => scheduleRepository.getJoinedScheduleItems(any(), any()),
      );
    });

    test('returns failure when getting user fails', () async {
      when(() => userRepository.getUser()).thenReturn(const Error(tFailure));

      final result = await useCase();

      expect(result.isError(), true);
      result.when(
        (paginatedResult) => fail('Should not succeed'),
        (failure) => expect(failure, tFailure),
      );
      verifyNever(
        () => scheduleRepository.getJoinedScheduleItems(any(), any()),
      );
    });

    test('returns failure when getting joined items fails', () async {
      when(() => userRepository.getUser()).thenReturn(const Success(tUser));
      when(
        () => scheduleRepository.getJoinedScheduleItems(any(), any()),
      ).thenAnswer((_) async => const Error(tFailure));

      final result = await useCase();

      expect(result.isError(), true);
      result.when(
        (paginatedResult) => fail('Should not succeed'),
        (failure) => expect(failure, tFailure),
      );
    });
  });
}
