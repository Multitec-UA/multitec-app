import 'dart:io';
import 'package:flutter/foundation.dart';

class ErrorReporter {
  factory ErrorReporter() => _instance;
  ErrorReporter._();
  static final ErrorReporter _instance = ErrorReporter._();

  void report(
    Object error, {
    StackTrace? stackTrace,
    String? hint,
    bool fatal = false,
  }) {
    if (kDebugMode) {
      debugPrint('[HINT] $hint\n$error\n$stackTrace');
    }

    if (_isRunningTest) return;

    //_reportToSentry(error, stackTrace, hint: hint);

    if (fatal) {
      //_reportToCrashlytics(error, stackTrace, hint: hint, fatal: fatal);
    }
  }

  // void _reportToSentry(Object error, StackTrace? stackTrace, {String? hint}) {
  //   Sentry.captureException(error, stackTrace: stackTrace, hint: hint);
  // }

  // void _reportToCrashlitics(Object error, StackTrace? stackTrace, {String? hint}) {
  //   FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true, reason: hint)
  // }

  bool get _isRunningTest {
    return Platform.environment.containsKey('FLUTTER_TEST');
  }
}
