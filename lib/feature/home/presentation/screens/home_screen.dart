import 'package:flutter/material.dart';
import 'package:sq1_assignment/core/di/service_locator.dart';
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
            const Text('Home'),
            Text(locator<MultitecApi>().exampleMethod()),
          ],
        ),
      ),
    );
  }
}
