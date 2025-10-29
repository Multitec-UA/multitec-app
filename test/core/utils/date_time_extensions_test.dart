import 'package:flutter_test/flutter_test.dart';
import 'package:multitec_app/core/utils/date_time_extensions.dart';

import '../../helpers/pump_context.dart';

void main() {
  group('DateTimeExtensions', () {
    group('toLocalizedFullDate', () {
      testWidgets('formats date with day, month and year', (tester) async {
        final context = await pumpContext(tester);
        final date = DateTime(2024, 3, 15);

        final result = date.toLocalizedFullDate(context);

        expect(result, contains('15'));
        expect(result, contains('2024'));
      });
    });

    group('toShortDate', () {
      testWidgets('formats date in dd/MM/yyyy format', (tester) async {
        final context = await pumpContext(tester);
        final date = DateTime(2024, 3, 15);

        final result = date.toShortDate(context);

        expect(result, '15/03/2024');
      });
    });

    group('toTime', () {
      testWidgets('formats time in HH:mm format', (tester) async {
        final context = await pumpContext(tester);
        final date = DateTime(2024, 3, 15, 14, 30);

        final result = date.toTime(context);

        expect(result, '14:30');
      });

      testWidgets('handles midnight correctly', (tester) async {
        final context = await pumpContext(tester);
        final date = DateTime(2024, 3, 15, 0, 0);

        final result = date.toTime(context);

        expect(result, '00:00');
      });

      testWidgets('handles single digit minutes', (tester) async {
        final context = await pumpContext(tester);
        final date = DateTime(2024, 3, 15, 9, 5);

        final result = date.toTime(context);

        expect(result, '09:05');
      });
    });
  });
}
