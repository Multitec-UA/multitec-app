import 'package:flutter_test/flutter_test.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/guard.dart';

void main() {
  group('Guard', () {
    group('guardAsync', () {
      test('returns Success when operation succeeds', () async {
        final result = await guardAsync(() async => 'success');

        expect(result.isSuccess(), true);
        expect(result.tryGetSuccess(), 'success');
      });

      test('returns Error when operation throws exception', () async {
        final result = await guardAsync(
          () async => throw Exception('test error'),
        );

        expect(result.isError(), true);
        expect(result.tryGetError(), isA<Failure>());
      });

      test('maps specific exceptions correctly', () async {
        final result = await guardAsync(
          () async => throw const FormatException('invalid'),
        );

        expect(result.isError(), true);
        expect(result.tryGetError(), isA<GenericFailure>());
        expect(result.tryGetError()?.code, 'format_error');
      });
    });

    group('guardSync', () {
      test('returns Success when operation succeeds', () {
        final result = guardSync(() => 'success');

        expect(result.isSuccess(), true);
        expect(result.tryGetSuccess(), 'success');
      });

      test('returns Error when operation throws exception', () {
        final result = guardSync(() => throw Exception('test error'));

        expect(result.isError(), true);
        expect(result.tryGetError(), isA<Failure>());
      });

      test('maps specific exceptions correctly', () {
        final result = guardSync(() => throw const FormatException('invalid'));

        expect(result.isError(), true);
        expect(result.tryGetError(), isA<GenericFailure>());
        expect(result.tryGetError()?.code, 'format_error');
      });
    });
  });
}
