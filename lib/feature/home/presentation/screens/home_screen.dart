import 'package:flutter/material.dart';
import 'package:sq1_assignment/core/di/service_locator.dart';
import 'package:sq1_assignment/core/l10n/l10n.dart';
import 'package:sq1_assignment/core/network/multitec_api/multitec_api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(context.l10n.home),
            Text(locator<MultitecApi>().exampleMethod()),
          ],
        ),
      ),
    );
  }
}
