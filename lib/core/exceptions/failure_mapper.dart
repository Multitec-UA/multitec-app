import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:multitec_app/core/exceptions/app_exception.dart';
import 'package:multitec_app/core/exceptions/failure.dart';

class FailureMapper {
  const FailureMapper();

  Failure map(Object error) {
    if (error is DioException) return _fromDioException(error);

    // if (error is FirebaseAuthException) return _fromFirebaseAuth(error);

    // if (error is FirebaseException) {
    //   return GenericFailure(message: error.message ?? 'Error de Firebase');
    // }

    if (error is SocketException ||
        error is HttpException ||
        error is WebSocketException ||
        error is HandshakeException ||
        error is CertificateException) {
      return const NetworkFailure();
    }

    if (error is TimeoutException) return const TimeoutFailure();

    if (error is FormatException || error is TypeError || error is StateError) {
      return const GenericFailure();
    }

    if (error is PlatformException) {
      final code = error.code.toLowerCase();
      if (code.contains('denied') || code.contains('permission')) {
        return const PermissionFailure();
      }
      if (code.contains('location') || code.contains('gps')) {
        return const LocationFailure();
      }
    }

    if (error is FileSystemException) {
      return const GenericFailure(
        message: 'No se ha podido acceder a los archivos',
      );
    }

    if (error is AppException) return AppFailure(message: error.message);

    return const UnknownFailure();
  }

  Failure _fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
        return const GenericFailure(message: 'Operación cancelada');

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutFailure();

      case DioExceptionType.badCertificate:
        return const NetworkFailure(message: 'Error de conexión segura');

      case DioExceptionType.connectionError:
        return const NetworkFailure();

      case DioExceptionType.badResponse:
        final status = e.response?.statusCode ?? 0;
        switch (status) {
          case 400:
          case 401:
          case 403:
            return const GenericFailure(message: 'No autorizado');
          case 404:
            return const GenericFailure(message: 'Recurso no encontrado');
          case 408:
            return const TimeoutFailure();
          case 409:
            return const GenericFailure(
              message: 'Conflicto al procesar la solicitud',
            );
          case 429:
            return const GenericFailure(
              message: 'Límite de peticiones alcanzado',
            );
        }
        if (status >= 500 && status < 600) {
          return const GenericFailure(message: 'Error del servidor');
        }
        return const GenericFailure(message: 'Error de red');

      case DioExceptionType.unknown:
        final underlying = e.error;
        if (underlying is SocketException) {
          return const NetworkFailure();
        }
        if (underlying is HandshakeException ||
            underlying is CertificateException) {
          return const NetworkFailure(message: 'Error de conexión segura');
        }
        if (underlying is FormatException) {
          return const GenericFailure(message: 'Error al procesar datos');
        }
        return const GenericFailure(message: 'Error de red');
    }
  }

  // Failure _fromFirebaseAuth(FirebaseAuthException e) {
  //   switch (e.code) {
  //     case 'email-already-in-use':
  //       return const EmailAlreadyInUseFailure();
  //     case 'invalid-credential':
  //     case 'invalid-email':
  //     case 'missing-password':
  //     case 'user-disabled':
  //     case 'operation-not-allowed':
  //       return const InvalidCredentialsFailure();
  //     case 'weak-password':
  //       return const WeakPasswordFailure();
  //     case 'user-not-found':
  //       return const UserNotFoundFailure();
  //     case 'wrong-password':
  //       return const WrongPasswordFailure();
  //     default:
  //       return GenericFailure(message: e.message ?? 'Error de autentificación');
  //   }
  // }
}
