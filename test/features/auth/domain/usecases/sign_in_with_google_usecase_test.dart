import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SignInWithGoogleUseCase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = SignInWithGoogleUseCase(mockAuthRepository);
  });

  group('SignInWithGoogleUseCase', () {
    test('returns Success when sign in succeeds', () async {
      when(
        () => mockAuthRepository.signInWithGoogle(),
      ).thenAnswer((_) async => const Success(unit));

      final result = await usecase();

      expect(result.isSuccess(), true);
      verify(() => mockAuthRepository.signInWithGoogle()).called(1);
    });

    test('returns Failure when sign in fails', () async {
      const failure = GenericFailure(debugMessage: 'Sign in failed');
      when(
        () => mockAuthRepository.signInWithGoogle(),
      ).thenAnswer((_) async => const Error(failure));

      final result = await usecase();

      expect(result.isError(), true);
      expect(result.tryGetError(), failure);
    });
  });
}
