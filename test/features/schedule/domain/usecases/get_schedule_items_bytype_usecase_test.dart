import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/entities/paginated_result.dart';
import 'package:multitec_app/features/schedule/domain/entities/pagination_params.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_schedule_items_bytype_usecase.dart';

class MockScheduleRepository extends Mock implements ScheduleRepository {}

void main() {
  late GetScheduleItemsByTypeUseCase usecase;
  late MockScheduleRepository mockRepository;

  setUp(() {
    mockRepository = MockScheduleRepository();
    usecase = GetScheduleItemsByTypeUseCase(mockRepository);
  });

  setUpAll(() {
    registerFallbackValue(ScheduleType.event);
    registerFallbackValue(const PaginationParams());
  });

  final tScheduleItem = ScheduleItem(
    id: '1',
    type: 'event',
    title: 'Event',
    description: 'Description',
    startsAt: DateTime(2025),
    published: true,
    attendeesCount: 0,
    createdAt: DateTime(2025),
    updatedAt: DateTime(2025),
  );

  final tPaginatedResult = PaginatedResult<ScheduleItem>(
    items: [tScheduleItem],
    nextCursor: 'cursor123',
    hasMore: true,
  );

  group('GetScheduleItemsByTypeUseCase', () {
    test('calls getScheduleItemsByType with correct parameters', () async {
      const type = ScheduleType.event;
      const cursor = 'cursor123';
      const limit = 20;

      when(
        () => mockRepository.getScheduleItemsByType(any(), any()),
      ).thenAnswer((_) async => Success(tPaginatedResult));

      await usecase(type: type, cursor: cursor, limit: limit);

      verify(
        () => mockRepository.getScheduleItemsByType(
          type,
          const PaginationParams(cursor: cursor, limit: limit),
        ),
      ).called(1);
    });

    test('returns paginated result when successful', () async {
      const type = ScheduleType.event;

      when(
        () => mockRepository.getScheduleItemsByType(any(), any()),
      ).thenAnswer((_) async => Success(tPaginatedResult));

      final result = await usecase(type: type);

      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess(), tPaginatedResult);
    });

    test('returns Failure when repository fails', () async {
      const type = ScheduleType.event;
      const failure = GenericFailure(
        debugMessage: 'Failed to get items by type',
      );

      when(
        () => mockRepository.getScheduleItemsByType(any(), any()),
      ).thenAnswer((_) async => const Error(failure));

      final result = await usecase(type: type);

      expect(result.isError(), true);
      expect(result.tryGetError(), failure);
    });
  });
}
