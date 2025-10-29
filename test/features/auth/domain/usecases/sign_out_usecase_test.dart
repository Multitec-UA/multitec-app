import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:multitec_app/features/schedule/domain/repositories/schedule_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockScheduleRepository extends Mock implements ScheduleRepository {}

void main() {
  group('SignOutUseCase', () {
    late AuthRepository authRepository;
    late ScheduleRepository scheduleRepository;
    late SignOutUseCase useCase;

    const tFailure = GenericFailure(
      code: 'test_error',
      debugMessage: 'Test error message',
    );

    setUp(() {
      authRepository = MockAuthRepository();
      scheduleRepository = MockScheduleRepository();
      useCase = SignOutUseCase(authRepository, scheduleRepository);
    });

    test('clears schedule cache and signs out successfully', () async {
      when(
        () => scheduleRepository.clearJoinedScheduleLocal(),
      ).thenAnswer((_) async => const Success(unit));
      when(
        () => authRepository.signOut(),
      ).thenAnswer((_) async => const Success(unit));

      final result = await useCase();

      expect(result.isSuccess(), true);
      verify(() => scheduleRepository.clearJoinedScheduleLocal()).called(1);
      verify(() => authRepository.signOut()).called(1);
    });

    test('clears cache even if it fails, then signs out', () async {
      when(
        () => scheduleRepository.clearJoinedScheduleLocal(),
      ).thenAnswer((_) async => const Error(tFailure));
      when(
        () => authRepository.signOut(),
      ).thenAnswer((_) async => const Success(unit));

      final result = await useCase();

      expect(result.isSuccess(), true);
      verify(() => scheduleRepository.clearJoinedScheduleLocal()).called(1);
      verify(() => authRepository.signOut()).called(1);
    });

    test('returns failure when sign out fails', () async {
      when(
        () => scheduleRepository.clearJoinedScheduleLocal(),
      ).thenAnswer((_) async => const Success(unit));
      when(
        () => authRepository.signOut(),
      ).thenAnswer((_) async => const Error(tFailure));

      final result = await useCase();

      expect(result.isError(), true);
      result.when(
        (success) => fail('Should not succeed'),
        (failure) => expect(failure, tFailure),
      );
    });
  });
}
