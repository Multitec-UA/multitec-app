import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:multitec_app/core/exceptions/app_exception.dart';
import 'package:multitec_app/core/exceptions/failure.dart';

class FailureMapper {
  const FailureMapper();

  Failure map(Object error) {
    if (error is DioException) return _fromDioException(error);

    if (error is FirebaseAuthException) return _fromFirebaseAuth(error);

    if (error is FirebaseException) {
      return const GenericFailure(code: 'firebase_error');
    }

    if (error is SocketException ||
        error is HttpException ||
        error is WebSocketException ||
        error is HandshakeException ||
        error is CertificateException) {
      return const NetworkFailure(code: 'network_error');
    }

    if (error is TimeoutException) {
      return const TimeoutFailure(code: 'timeout');
    }

    if (error is FormatException || error is TypeError || error is StateError) {
      return const GenericFailure(code: 'format_error');
    }

    if (error is PlatformException) {
      final code = error.code.toLowerCase();
      if (code.contains('denied') || code.contains('permission')) {
        return const PermissionFailure(code: 'permission_denied');
      }
      if (code.contains('location') || code.contains('gps')) {
        return const LocationFailure(code: 'location_unavailable');
      }
    }

    if (error is FileSystemException) {
      return const GenericFailure(code: 'filesystem_error');
    }

    if (error is AppException) {
      return AppFailure(code: error.code, debugMessage: error.message);
    }

    return const UnknownFailure(code: 'unknown');
  }

  Failure _fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
        return const GenericFailure(code: 'request_cancelled');

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutFailure(code: 'timeout');

      case DioExceptionType.badCertificate:
        return const NetworkFailure(code: 'bad_certificate');

      case DioExceptionType.connectionError:
        return const NetworkFailure(code: 'connection_error');

      case DioExceptionType.badResponse:
        final status = e.response?.statusCode ?? 0;
        return GenericFailure(
          code: 'http_$status',
          debugMessage: 'HTTP error with status $status',
        );

      case DioExceptionType.unknown:
        final underlying = e.error;
        if (underlying is SocketException) {
          return const NetworkFailure(code: 'socket');
        }
        if (underlying is HandshakeException ||
            underlying is CertificateException) {
          return const NetworkFailure(code: 'handshake_failed');
        }
        if (underlying is FormatException) {
          return const GenericFailure(code: 'invalid_format');
        }
        return const GenericFailure(code: 'unknown_network');
    }
  }

  Failure _fromFirebaseAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return const EmailAlreadyInUseFailure(code: 'email_already_in_use');
      case 'invalid-credential':
      case 'invalid-email':
      case 'missing-password':
      case 'user-disabled':
      case 'operation-not-allowed':
        return const InvalidCredentialsFailure(code: 'invalid_credentials');
      case 'weak-password':
        return const WeakPasswordFailure(code: 'weak_password');
      case 'user-not-found':
        return const UserNotFoundFailure(code: 'user_not_found');
      case 'wrong-password':
        return const WrongPasswordFailure(code: 'wrong_password');
      default:
        return GenericFailure(
          code: 'firebase_auth_error_${e.code}',
          debugMessage: e.message,
        );
    }
  }
}
