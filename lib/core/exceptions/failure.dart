import 'package:flutter/foundation.dart';

@immutable
sealed class Failure {
  const Failure({required this.message});
  final String message;
}

/// Generic errors
class GenericFailure extends Failure {
  const GenericFailure({String? message})
      : super(message: message ?? 'Se ha producido un error');
}

/// Unexpected errors
class UnknownFailure extends Failure {
  const UnknownFailure({String? message})
      : super(message: message ?? 'Se ha producido un error inesperado');
}

/// Connection or response timeout
class TimeoutFailure extends Failure {
  const TimeoutFailure({String? message})
      : super(message: message ?? 'Se ha superado el tiempo de espera');
}

/// Generic network errors (includes no connection)
class NetworkFailure extends Failure {
  const NetworkFailure({String? message})
      : super(message: message ?? 'Se ha producido un error de conexión');
}

/// Permission failures
class PermissionFailure extends Failure {
  const PermissionFailure({String? message})
      : super(message: message ?? 'Permiso denegado');
}

/// Location failures
class LocationFailure extends Failure {
  const LocationFailure({String? message})
      : super(message: message ?? 'Servicio de ubicación no disponible');
}

/// Custom exceptions (App Exceptions)
final class AppFailure extends Failure {
  const AppFailure({required super.message});
}

/// Firebase
class EmailAlreadyInUseFailure extends Failure {
  const EmailAlreadyInUseFailure({String? message})
      : super(message: message ?? 'El correo electrónico ya está en uso');
}

class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure({String? message})
      : super(message: message ?? 'Credenciales inválidas');
}

class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure({String? message})
      : super(message: message ?? 'La contraseña es demasiado débil');
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure({String? message})
      : super(message: message ?? 'Usuario no encontrado');
}

class WrongPasswordFailure extends Failure {
  const WrongPasswordFailure({String? message})
      : super(message: message ?? 'Contraseña incorrecta');
}
