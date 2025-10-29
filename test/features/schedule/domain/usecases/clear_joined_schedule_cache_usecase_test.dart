import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/schedule/domain/usecases/clear_joined_schedule_cache_usecase.dart';

class MockScheduleRepository extends Mock implements ScheduleRepository {}

void main() {
  late ClearJoinedScheduleCacheUseCase usecase;
  late MockScheduleRepository mockRepository;

  setUp(() {
    mockRepository = MockScheduleRepository();
    usecase = ClearJoinedScheduleCacheUseCase(mockRepository);
  });

  group('ClearJoinedScheduleCacheUseCase', () {
    test('returns Success when cache is cleared successfully', () async {
      when(
        () => mockRepository.clearJoinedScheduleLocal(),
      ).thenAnswer((_) async => const Success(unit));

      final result = await usecase();

      expect(result.isSuccess(), true);
      verify(() => mockRepository.clearJoinedScheduleLocal()).called(1);
    });

    test('returns Failure when clearing cache fails', () async {
      const failure = GenericFailure(debugMessage: 'Failed to clear cache');
      when(
        () => mockRepository.clearJoinedScheduleLocal(),
      ).thenAnswer((_) async => const Error(failure));

      final result = await usecase();

      expect(result.isError(), true);
      expect(result.tryGetError(), failure);
    });
  });
}
