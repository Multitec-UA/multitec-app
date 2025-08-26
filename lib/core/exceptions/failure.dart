import 'package:flutter/foundation.dart';

@immutable
sealed class Failure {
  const Failure({this.code, this.debugMessage});
  final String? code;
  final String? debugMessage;
}

/// Generic failures
final class GenericFailure extends Failure {
  const GenericFailure({super.code, super.debugMessage});
}

/// Unexpected failures
final class UnknownFailure extends Failure {
  const UnknownFailure({super.code, super.debugMessage});
}

/// Connection or response timeout
final class TimeoutFailure extends Failure {
  const TimeoutFailure({super.code, super.debugMessage});
}

/// Generic network errors (includes no connection)
final class NetworkFailure extends Failure {
  const NetworkFailure({super.code, super.debugMessage});
}

/// Permission failures
final class PermissionFailure extends Failure {
  const PermissionFailure({super.code, super.debugMessage});
}

/// Location failures
final class LocationFailure extends Failure {
  const LocationFailure({super.code, super.debugMessage});
}

/// Custom exceptions (App Exceptions)
final class AppFailure extends Failure {
  const AppFailure({required super.code, super.debugMessage});
}

/// Firebase – Casos más comunes
final class EmailAlreadyInUseFailure extends Failure {
  const EmailAlreadyInUseFailure({super.code, super.debugMessage});
}

final class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure({super.code, super.debugMessage});
}

final class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure({super.code, super.debugMessage});
}

final class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure({super.code, super.debugMessage});
}

final class WrongPasswordFailure extends Failure {
  const WrongPasswordFailure({super.code, super.debugMessage});
}
