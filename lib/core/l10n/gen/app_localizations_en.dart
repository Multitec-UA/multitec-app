// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get genericError => 'Something went wrong.';

  @override
  String get errorNetworkGeneric =>
      'Connection error. Check your internet connection.';

  @override
  String get errorTimeoutGeneric => 'The request timed out. Please try again.';

  @override
  String get errorPermissionGeneric => 'Permission denied.';

  @override
  String get errorLocationGeneric => 'Location service is unavailable.';

  @override
  String get errorAuthenticationGeneric =>
      'There was an authentication problem.';

  @override
  String get errorEmailAlreadyInUse => 'Email is already in use.';

  @override
  String get errorInvalidCredentials => 'Invalid credentials.';

  @override
  String get errorWeakPassword => 'The password is too weak.';

  @override
  String get errorUserNotFound => 'User not found.';

  @override
  String get errorWrongPassword => 'Incorrect password.';

  @override
  String get errorNetworkBadCertificate =>
      'Secure connection failed (SSL certificate error).';

  @override
  String get errorHttp400BadRequest => 'Bad request.';

  @override
  String get errorHttp401Unauthorized => 'Unauthorized.';

  @override
  String get errorHttp403Forbidden => 'Forbidden.';

  @override
  String get errorHttp404NotFound => 'Resource not found.';

  @override
  String get errorHttp409Conflict => 'Conflict while processing the request.';

  @override
  String get errorHttp429TooManyRequests =>
      'Too many requests. Please try again later.';

  @override
  String get errorHttp5xxServer => 'Server error. Please try again later.';

  @override
  String get details => 'Details';

  @override
  String get date => 'Date';

  @override
  String get time => 'Time';

  @override
  String get location => 'Location';

  @override
  String get attendees => 'Attendees';

  @override
  String get joinEvent => 'Join Event';

  @override
  String get leaveEvent => 'Leave Event';
}
