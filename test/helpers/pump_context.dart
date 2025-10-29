import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'pump_app.dart';

Future<BuildContext> pumpContext(WidgetTester tester) async {
  late BuildContext context;

  await tester.pumpApp(
    Builder(
      builder: (ctx) {
        context = ctx;
        return const SizedBox();
      },
    ),
  );

  return context;
}
