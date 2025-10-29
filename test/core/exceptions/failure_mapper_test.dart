import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multitec_app/core/exceptions/app_exception.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/failure_mapper.dart';

void main() {
  group('FailureMapper', () {
    late FailureMapper mapper;

    setUp(() {
      mapper = const FailureMapper();
    });

    group('DioException mapping', () {
      test('maps cancel to GenericFailure', () {
        final exception = DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.cancel,
        );

        final result = mapper.map(exception);

        expect(result, isA<GenericFailure>());
        expect(result.code, 'request_cancelled');
      });

      test('maps timeout exceptions to TimeoutFailure', () {
        final timeoutTypes = [
          DioExceptionType.connectionTimeout,
          DioExceptionType.sendTimeout,
          DioExceptionType.receiveTimeout,
        ];

        for (final type in timeoutTypes) {
          final exception = DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: type,
          );

          final result = mapper.map(exception);

          expect(result, isA<TimeoutFailure>());
          expect(result.code, 'timeout');
        }
      });

      test('maps badCertificate to NetworkFailure', () {
        final exception = DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.badCertificate,
        );

        final result = mapper.map(exception);

        expect(result, isA<NetworkFailure>());
        expect(result.code, 'bad_certificate');
      });

      test('maps connectionError to NetworkFailure', () {
        final exception = DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.connectionError,
        );

        final result = mapper.map(exception);

        expect(result, isA<NetworkFailure>());
        expect(result.code, 'connection_error');
      });

      test('maps badResponse to GenericFailure with status code', () {
        final exception = DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: RequestOptions(path: '/test'),
            statusCode: 404,
          ),
        );

        final result = mapper.map(exception);

        expect(result, isA<GenericFailure>());
        expect(result.code, 'http_404');
      });
    });

    group('FirebaseAuthException mapping', () {
      test('maps email-already-in-use to EmailAlreadyInUseFailure', () {
        final exception = FirebaseAuthException(code: 'email-already-in-use');

        final result = mapper.map(exception);

        expect(result, isA<EmailAlreadyInUseFailure>());
        expect(result.code, 'email_already_in_use');
      });

      test('maps invalid credentials to InvalidCredentialsFailure', () {
        final codes = ['invalid-credential', 'invalid-email', 'user-disabled'];

        for (final code in codes) {
          final exception = FirebaseAuthException(code: code);
          final result = mapper.map(exception);

          expect(result, isA<InvalidCredentialsFailure>());
          expect(result.code, 'invalid_credentials');
        }
      });

      test('maps weak-password to WeakPasswordFailure', () {
        final exception = FirebaseAuthException(code: 'weak-password');

        final result = mapper.map(exception);

        expect(result, isA<WeakPasswordFailure>());
        expect(result.code, 'weak_password');
      });

      test('maps user-not-found to UserNotFoundFailure', () {
        final exception = FirebaseAuthException(code: 'user-not-found');

        final result = mapper.map(exception);

        expect(result, isA<UserNotFoundFailure>());
        expect(result.code, 'user_not_found');
      });

      test('maps wrong-password to WrongPasswordFailure', () {
        final exception = FirebaseAuthException(code: 'wrong-password');

        final result = mapper.map(exception);

        expect(result, isA<WrongPasswordFailure>());
        expect(result.code, 'wrong_password');
      });
    });

    group('Network exceptions mapping', () {
      test('maps SocketException to NetworkFailure', () {
        const exception = SocketException('Connection failed');

        final result = mapper.map(exception);

        expect(result, isA<NetworkFailure>());
        expect(result.code, 'network_error');
      });

      test('maps TimeoutException to TimeoutFailure', () {
        final exception = TimeoutException('Request timeout');

        final result = mapper.map(exception);

        expect(result, isA<TimeoutFailure>());
        expect(result.code, 'timeout');
      });
    });

    group('PlatformException mapping', () {
      test('maps permission denied to PermissionFailure', () {
        final exception = PlatformException(code: 'PERMISSION_DENIED');

        final result = mapper.map(exception);

        expect(result, isA<PermissionFailure>());
        expect(result.code, 'permission_denied');
      });

      test('maps location error to LocationFailure', () {
        final exception = PlatformException(code: 'LOCATION_UNAVAILABLE');

        final result = mapper.map(exception);

        expect(result, isA<LocationFailure>());
        expect(result.code, 'location_unavailable');
      });
    });

    group('App exceptions mapping', () {
      test('maps AuthDomainNotAllowedException to AppFailure', () {
        final exception = AuthDomainNotAllowedException();

        final result = mapper.map(exception);

        expect(result, isA<AppFailure>());
        expect(result.code, 'domain-not-allowed');
      });
    });

    group('Generic exceptions mapping', () {
      test('maps FormatException to GenericFailure', () {
        const exception = FormatException('Invalid format');

        final result = mapper.map(exception);

        expect(result, isA<GenericFailure>());
        expect(result.code, 'format_error');
      });

      test('maps unknown exception to UnknownFailure', () {
        final exception = Exception('Unknown error');

        final result = mapper.map(exception);

        expect(result, isA<UnknownFailure>());
        expect(result.code, 'unknown');
      });
    });
  });
}
