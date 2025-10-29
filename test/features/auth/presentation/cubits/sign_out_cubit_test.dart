import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:multitec_app/features/auth/presentation/cubits/sign_out_cubit.dart';
import 'package:multitec_app/features/auth/presentation/cubits/sign_out_state.dart';

class MockSignOutUseCase extends Mock implements SignOutUseCase {}

void main() {
  group('SignOutCubit', () {
    late SignOutUseCase signOutUseCase;

    const tFailure = GenericFailure(
      code: 'test_error',
      debugMessage: 'Test error message',
    );

    setUp(() {
      signOutUseCase = MockSignOutUseCase();
    });

    SignOutCubit createCubit() => SignOutCubit(signOutUseCase);

    test('initial state is correct', () {
      final cubit = createCubit();

      expect(cubit.state, equals(const SignOutState()));

      cubit.close();
    });

    group('signOut', () {
      blocTest<SignOutCubit, SignOutState>(
        'emits [loading, success] when sign out is successful',
        build: () {
          when(
            () => signOutUseCase.call(),
          ).thenAnswer((_) async => const Success(unit));
          return createCubit();
        },
        act: (cubit) => cubit.signOut(),
        expect: () => [
          const SignOutState(status: RequestStatus.loading),
          const SignOutState(status: RequestStatus.success, failure: null),
        ],
        verify: (_) {
          verify(() => signOutUseCase.call()).called(1);
        },
      );

      blocTest<SignOutCubit, SignOutState>(
        'emits [loading, failure] when sign out fails',
        build: () {
          when(
            () => signOutUseCase.call(),
          ).thenAnswer((_) async => const Error(tFailure));
          return createCubit();
        },
        act: (cubit) => cubit.signOut(),
        expect: () => [
          const SignOutState(status: RequestStatus.loading),
          const SignOutState(status: RequestStatus.failure, failure: tFailure),
        ],
        verify: (_) {
          verify(() => signOutUseCase.call()).called(1);
        },
      );

      blocTest<SignOutCubit, SignOutState>(
        'does not call use case when already loading',
        seed: () => const SignOutState(status: RequestStatus.loading),
        build: () {
          when(
            () => signOutUseCase.call(),
          ).thenAnswer((_) async => const Success(unit));
          return createCubit();
        },
        act: (cubit) => cubit.signOut(),
        expect: () => const <SignOutState>[],
        verify: (_) {
          verifyNever(() => signOutUseCase.call());
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
