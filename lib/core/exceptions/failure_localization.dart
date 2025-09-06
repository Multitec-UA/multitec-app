import 'package:flutter/widgets.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/l10n/l10n.dart';

extension FailureLocalizationX on Failure {
  String toLocalizedMessage(BuildContext context) {
    final l10n = context.l10n;
    return switch (this) {
      NetworkFailure(code: 'bad_certificate') =>
        l10n.errorNetworkBadCertificate,
      NetworkFailure _ => l10n.errorNetworkGeneric,
      TimeoutFailure _ => l10n.errorTimeoutGeneric,
      PermissionFailure _ => l10n.errorPermissionGeneric,
      LocationFailure _ => l10n.errorLocationGeneric,
      GenericFailure(code: 'firebase_auth_error_') =>
        l10n.errorAuthenticationGeneric,
      GenericFailure(code: final String httpCode)
          when httpCode.startsWith('http_') =>
        _httpCodeMessage(l10n, httpCode),
      GenericFailure _ => l10n.genericError,
      UnknownFailure _ => l10n.genericError,
      AppFailure _ => l10n.genericError,
      EmailAlreadyInUseFailure _ => l10n.errorEmailAlreadyInUse,
      InvalidCredentialsFailure _ => l10n.errorInvalidCredentials,
      WeakPasswordFailure _ => l10n.errorWeakPassword,
      UserNotFoundFailure _ => l10n.errorUserNotFound,
      WrongPasswordFailure _ => l10n.errorWrongPassword,
    };
  }
}

extension NullableFailureLocalizationX on Failure? {
  String toLocalizedMessage(BuildContext context) {
    if (this == null) return context.l10n.genericError;
    return this!.toLocalizedMessage(context);
  }
}

String _httpCodeMessage(AppLocalizations l10n, String httpCode) {
  final statusStr = httpCode.replaceFirst('http_', '');
  final status = int.tryParse(statusStr) ?? -1;

  return switch (status) {
    400 => l10n.errorHttp400BadRequest,
    401 => l10n.errorHttp401Unauthorized,
    403 => l10n.errorHttp403Forbidden,
    404 => l10n.errorHttp404NotFound,
    408 => l10n.errorTimeoutGeneric,
    409 => l10n.errorHttp409Conflict,
    429 => l10n.errorHttp429TooManyRequests,
    _ when status >= 500 && status < 600 => l10n.errorHttp5xxServer,
    _ => l10n.errorNetworkGeneric,
  };
}
