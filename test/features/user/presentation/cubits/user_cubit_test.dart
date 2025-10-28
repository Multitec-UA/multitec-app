import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/features/auth/domain/enums/autentication_status.dart';
import 'package:multitec_app/features/auth/domain/services/auth_service.dart';
import 'package:multitec_app/features/user/domain/entities/user.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_cubit.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_state.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthService extends Mock implements AuthService {}

void main() {
  group('UserCubit', () {
    late UserRepository userRepository;
    late AuthService authService;
    late ValueNotifier<AuthenticationStatus> statusNotifier;

    const tUser = User(
      id: '1',
      name: 'Test User',
      email: 'test@example.com',
      photoUrl: 'https://example.com/photo.jpg',
    );

    const tFailure = GenericFailure(
      code: 'test_error',
      debugMessage: 'Test error message',
    );

    setUp(() {
      userRepository = MockUserRepository();
      authService = MockAuthService();
      statusNotifier = ValueNotifier(AuthenticationStatus.unauthenticated);

      when(() => authService.statusListenable).thenReturn(statusNotifier);
      when(() => authService.status).thenReturn(statusNotifier.value);
    });

    tearDown(() {
      statusNotifier.dispose();
    });

    UserCubit createCubit() => UserCubit(userRepository, authService);

    test('initial state is correct', () {
      final cubit = createCubit();

      expect(cubit.state, equals(const UserState()));

      cubit.close();
    });

    group('constructor - auth status initialization', () {
      test('calls getUser when auth status is authenticated', () async {
        // Arrange
        statusNotifier.value = AuthenticationStatus.authenticated;
        when(
          () => authService.status,
        ).thenReturn(AuthenticationStatus.authenticated);
        when(() => userRepository.getUser()).thenReturn(const Success(tUser));

        // Act
        final cubit = createCubit();
        await Future<void>.delayed(Duration.zero);

        // Assert
        expect(cubit.state.status, RequestStatus.success);
        expect(cubit.state.user, tUser);
        verify(() => userRepository.getUser()).called(1);

        cubit.close();
      });

      test('emits initial state when auth status is unauthenticated', () async {
        // Arrange
        statusNotifier.value = AuthenticationStatus.unauthenticated;
        when(
          () => authService.status,
        ).thenReturn(AuthenticationStatus.unauthenticated);

        // Act
        final cubit = createCubit();
        await Future<void>.delayed(Duration.zero);

        // Assert
        expect(cubit.state, const UserState());
        verifyNever(() => userRepository.getUser());

        cubit.close();
      });

      test('emits initial state when auth status is unknown', () async {
        // Arrange
        statusNotifier.value = AuthenticationStatus.unknown;
        when(() => authService.status).thenReturn(AuthenticationStatus.unknown);

        // Act
        final cubit = createCubit();
        await Future<void>.delayed(Duration.zero);

        // Assert
        expect(cubit.state, const UserState());
        verifyNever(() => userRepository.getUser());

        cubit.close();
      });
    });

    group('getUser', () {
      blocTest<UserCubit, UserState>(
        'emits [loading, success] when user is loaded successfully',
        build: () {
          when(() => userRepository.getUser()).thenReturn(const Success(tUser));
          return createCubit();
        },
        act: (cubit) => cubit.getUser(),
        expect: () => [
          const UserState(status: RequestStatus.loading),
          const UserState(
            status: RequestStatus.success,
            user: tUser,
            failure: null,
          ),
        ],
        verify: (_) {
          verify(() => userRepository.getUser()).called(1);
        },
      );

      blocTest<UserCubit, UserState>(
        'emits [loading, success] with null user when repository returns null',
        build: () {
          when(() => userRepository.getUser()).thenReturn(const Success(null));
          return createCubit();
        },
        act: (cubit) => cubit.getUser(),
        expect: () => [
          const UserState(status: RequestStatus.loading),
          const UserState(
            status: RequestStatus.success,
            user: null,
            failure: null,
          ),
        ],
      );

      blocTest<UserCubit, UserState>(
        'emits [loading, failure] when loading user fails',
        build: () {
          when(
            () => userRepository.getUser(),
          ).thenReturn(const Error(tFailure));
          return createCubit();
        },
        act: (cubit) => cubit.getUser(),
        expect: () => [
          const UserState(status: RequestStatus.loading),
          const UserState(status: RequestStatus.failure, failure: tFailure),
        ],
        verify: (_) {
          verify(() => userRepository.getUser()).called(1);
        },
      );

      blocTest<UserCubit, UserState>(
        'does not call repository when already loading',
        build: () {
          when(() => userRepository.getUser()).thenReturn(const Success(tUser));
          return createCubit();
        },
        seed: () => const UserState(status: RequestStatus.loading),
        act: (cubit) => cubit.getUser(),
        expect: () => [],
        verify: (_) {
          verifyNever(() => userRepository.getUser());
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
