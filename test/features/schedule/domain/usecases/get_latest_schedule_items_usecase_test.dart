import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_latest_schedule_items_usecase.dart';

class MockScheduleRepository extends Mock implements ScheduleRepository {}

void main() {
  late GetLatestScheduleItemsUseCase usecase;
  late MockScheduleRepository mockRepository;

  setUp(() {
    mockRepository = MockScheduleRepository();
    usecase = GetLatestScheduleItemsUseCase(mockRepository);
  });

  final tScheduleItems = <ScheduleItem>[
    ScheduleItem(
      id: '1',
      type: 'event',
      title: 'Event 1',
      description: 'Description 1',
      startsAt: DateTime(2025),
      published: true,
      attendeesCount: 0,
      createdAt: DateTime(2025),
      updatedAt: DateTime(2025),
    ),
  ];

  group('GetLatestScheduleItemsUseCase', () {
    test('calls getLatestScheduleItems with limit of 7', () async {
      when(
        () => mockRepository.getLatestScheduleItems(limit: any(named: 'limit')),
      ).thenAnswer((_) async => Success(tScheduleItems));

      await usecase();

      verify(() => mockRepository.getLatestScheduleItems(limit: 7)).called(1);
    });

    test('returns list of schedule items when successful', () async {
      when(
        () => mockRepository.getLatestScheduleItems(limit: any(named: 'limit')),
      ).thenAnswer((_) async => Success(tScheduleItems));

      final result = await usecase();

      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess(), tScheduleItems);
    });

    test('returns Failure when repository fails', () async {
      const failure = GenericFailure(
        debugMessage: 'Failed to get latest items',
      );
      when(
        () => mockRepository.getLatestScheduleItems(limit: any(named: 'limit')),
      ).thenAnswer((_) async => const Error(failure));

      final result = await usecase();

      expect(result.isError(), true);
      expect(result.tryGetError(), failure);
    });
  });
}
