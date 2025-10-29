import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:multitec_app/features/schedule/domain/usecases/is_joined_usecase.dart';
import 'package:multitec_app/features/user/domain/entities/user.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';

class MockScheduleRepository extends Mock implements ScheduleRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('IsJoinedUseCase', () {
    late ScheduleRepository scheduleRepository;
    late UserRepository userRepository;
    late IsJoinedUseCase useCase;

    const tItemId = 'item_123';
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
      useCase = IsJoinedUseCase(scheduleRepository, userRepository);
    });

    setUpAll(() {
      registerFallbackValue(tUser);
    });

    test('returns true when user is joined to the item', () async {
      when(() => userRepository.getUser()).thenReturn(const Success(tUser));
      when(
        () => scheduleRepository.isJoined(any(), any()),
      ).thenAnswer((_) async => const Success(true));

      final result = await useCase(tItemId);

      expect(result.isSuccess(), true);
      result.when(
        (isJoined) => expect(isJoined, true),
        (failure) => fail('Should not fail'),
      );
      verify(() => scheduleRepository.isJoined(tItemId, tUser)).called(1);
    });

    test('returns false when user is not joined to the item', () async {
      when(() => userRepository.getUser()).thenReturn(const Success(tUser));
      when(
        () => scheduleRepository.isJoined(any(), any()),
      ).thenAnswer((_) async => const Success(false));

      final result = await useCase(tItemId);

      expect(result.isSuccess(), true);
      result.when(
        (isJoined) => expect(isJoined, false),
        (failure) => fail('Should not fail'),
      );
    });

    test('returns false when user is null', () async {
      when(() => userRepository.getUser()).thenReturn(const Success(null));

      final result = await useCase(tItemId);

      expect(result.isSuccess(), true);
      result.when(
        (isJoined) => expect(isJoined, false),
        (failure) => fail('Should not fail'),
      );
      verifyNever(() => scheduleRepository.isJoined(any(), any()));
    });

    test('returns failure when getting user fails', () async {
      when(() => userRepository.getUser()).thenReturn(const Error(tFailure));

      final result = await useCase(tItemId);

      expect(result.isError(), true);
      result.when(
        (isJoined) => fail('Should not succeed'),
        (failure) => expect(failure, tFailure),
      );
      verifyNever(() => scheduleRepository.isJoined(any(), any()));
    });

    test('returns failure when checking isJoined fails', () async {
      when(() => userRepository.getUser()).thenReturn(const Success(tUser));
      when(
        () => scheduleRepository.isJoined(any(), any()),
      ).thenAnswer((_) async => const Error(tFailure));

      final result = await useCase(tItemId);

      expect(result.isError(), true);
      result.when(
        (isJoined) => fail('Should not succeed'),
        (failure) => expect(failure, tFailure),
      );
    });
  });
}
