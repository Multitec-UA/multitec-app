import 'package:multiple_result/multiple_result.dart';
import 'package:multitec_app/core/exceptions/error_mapper.dart';
import 'package:multitec_app/core/exceptions/error_reporter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';

Future<Result<T, Failure>> guard<T>(
  Future<T> Function() operation, {
  String? hint,
}) async {
  try {
    final value = await operation();
    return Success(value);
  } catch (e, st) {
    ErrorReporter().report(e, stackTrace: st, hint: hint);

    final failure = const ErrorMapper().map(e);

    return Error(failure);
  }
}

/// Versión síncrona (útil en cache/parsing local)
Result<T, Failure> guardSync<T>(
  T Function() operation, {
  String? hint,
}) {
  try {
    final value = operation();
    return Success(value);
  } catch (e, st) {
    ErrorReporter().report(e, stackTrace: st, hint: hint);

    final failure = const ErrorMapper().map(e);

    return Error(failure);
  }
}
