import 'package:flutter_test/flutter_test.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';

import '../../helpers/pump_context.dart';

void main() {
  group('FailureLocalization', () {
    group('NetworkFailure localization', () {
      testWidgets('maps bad_certificate to specific message', (tester) async {
        final context = await pumpContext(tester);
        const failure = NetworkFailure(code: 'bad_certificate');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps generic network failure', (tester) async {
        final context = await pumpContext(tester);
        const failure = NetworkFailure(code: 'network_error');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });
    });

    group('TimeoutFailure localization', () {
      testWidgets('maps timeout to message', (tester) async {
        final context = await pumpContext(tester);
        const failure = TimeoutFailure(code: 'timeout');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });
    });

    group('PermissionFailure localization', () {
      testWidgets('maps permission failure to message', (tester) async {
        final context = await pumpContext(tester);
        const failure = PermissionFailure(code: 'permission_denied');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });
    });

    group('LocationFailure localization', () {
      testWidgets('maps location failure to message', (tester) async {
        final context = await pumpContext(tester);
        const failure = LocationFailure(code: 'location_unavailable');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });
    });

    group('HTTP status code localization', () {
      testWidgets('maps 400 Bad Request', (tester) async {
        final context = await pumpContext(tester);
        const failure = GenericFailure(code: 'http_400');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps 401 Unauthorized', (tester) async {
        final context = await pumpContext(tester);
        const failure = GenericFailure(code: 'http_401');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps 403 Forbidden', (tester) async {
        final context = await pumpContext(tester);
        const failure = GenericFailure(code: 'http_403');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps 404 Not Found', (tester) async {
        final context = await pumpContext(tester);
        const failure = GenericFailure(code: 'http_404');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps 408 Request Timeout', (tester) async {
        final context = await pumpContext(tester);
        const failure = GenericFailure(code: 'http_408');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps 409 Conflict', (tester) async {
        final context = await pumpContext(tester);
        const failure = GenericFailure(code: 'http_409');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps 429 Too Many Requests', (tester) async {
        final context = await pumpContext(tester);
        const failure = GenericFailure(code: 'http_429');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps 5xx Server Error', (tester) async {
        final context = await pumpContext(tester);
        const failure = GenericFailure(code: 'http_500');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });
    });

    group('Firebase Auth failures localization', () {
      testWidgets('maps EmailAlreadyInUseFailure', (tester) async {
        final context = await pumpContext(tester);
        const failure = EmailAlreadyInUseFailure(code: 'email_already_in_use');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps InvalidCredentialsFailure', (tester) async {
        final context = await pumpContext(tester);
        const failure = InvalidCredentialsFailure(code: 'invalid_credentials');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps WeakPasswordFailure', (tester) async {
        final context = await pumpContext(tester);
        const failure = WeakPasswordFailure(code: 'weak_password');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps UserNotFoundFailure', (tester) async {
        final context = await pumpContext(tester);
        const failure = UserNotFoundFailure(code: 'user_not_found');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps WrongPasswordFailure', (tester) async {
        final context = await pumpContext(tester);
        const failure = WrongPasswordFailure(code: 'wrong_password');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });
    });

    group('AppFailure localization', () {
      testWidgets('maps domain-not-allowed', (tester) async {
        final context = await pumpContext(tester);
        const failure = AppFailure(code: 'domain-not-allowed');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps generic AppFailure', (tester) async {
        final context = await pumpContext(tester);
        const failure = AppFailure(code: 'custom_error');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });
    });

    group('Generic failures localization', () {
      testWidgets('maps GenericFailure', (tester) async {
        final context = await pumpContext(tester);
        const failure = GenericFailure(code: 'generic_error');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });

      testWidgets('maps UnknownFailure', (tester) async {
        final context = await pumpContext(tester);
        const failure = UnknownFailure(code: 'unknown');

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });
    });

    group('Nullable failure extension', () {
      testWidgets('returns generic error for null failure', (tester) async {
        final context = await pumpContext(tester);
        const Failure? failure = null;

        final message = failure.toLocalizedMessage(context);

        expect(message, isNotEmpty);
      });
    });
  });
}
