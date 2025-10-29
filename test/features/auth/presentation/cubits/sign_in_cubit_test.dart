import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:multitec_app/features/auth/presentation/cubits/sign_in_cubit.dart';
import 'package:multitec_app/features/auth/presentation/cubits/sign_in_state.dart';

class MockSignInWithGoogleUseCase extends Mock
    implements SignInWithGoogleUseCase {}

void main() {
  group('SignInCubit', () {
    late SignInWithGoogleUseCase signInWithGoogle;

    const tFailure = GenericFailure(
      code: 'test_error',
      debugMessage: 'Test error message',
    );

    setUp(() {
      signInWithGoogle = MockSignInWithGoogleUseCase();
    });

    SignInCubit createCubit() => SignInCubit(signInWithGoogle);

    test('initial state is correct', () {
      final cubit = createCubit();

      expect(cubit.state, equals(const SignInState()));

      cubit.close();
    });

    group('signInWithGoogle', () {
      blocTest<SignInCubit, SignInState>(
        'emits [loading, success] when sign in is successful',
        build: () {
          when(
            () => signInWithGoogle.call(),
          ).thenAnswer((_) async => const Success(unit));
          return createCubit();
        },
        act: (cubit) => cubit.signInWithGoogle(),
        expect: () => [
          const SignInState(status: RequestStatus.loading),
          const SignInState(status: RequestStatus.success, failure: null),
        ],
        verify: (_) {
          verify(() => signInWithGoogle.call()).called(1);
        },
      );

      blocTest<SignInCubit, SignInState>(
        'emits [loading, failure] when sign in fails',
        build: () {
          when(
            () => signInWithGoogle.call(),
          ).thenAnswer((_) async => const Error(tFailure));
          return createCubit();
        },
        act: (cubit) => cubit.signInWithGoogle(),
        expect: () => [
          const SignInState(status: RequestStatus.loading),
          const SignInState(status: RequestStatus.failure, failure: tFailure),
        ],
        verify: (_) {
          verify(() => signInWithGoogle.call()).called(1);
        },
      );

      blocTest<SignInCubit, SignInState>(
        'does not call use case when already loading',
        build: () {
          when(
            () => signInWithGoogle.call(),
          ).thenAnswer((_) async => const Success(unit));
          return createCubit();
        },
        seed: () => const SignInState(status: RequestStatus.loading),
        act: (cubit) => cubit.signInWithGoogle(),
        expect: () => const <SignInState>[],
        verify: (_) {
          verifyNever(() => signInWithGoogle.call());
        },
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
