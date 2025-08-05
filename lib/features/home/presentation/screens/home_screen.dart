import 'package:flutter/material.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/network/multitec_api/multitec_api.dart';
import 'package:multitec_app/core/ui/components/snack_bar.dart';
import 'package:multitec_app/core/ui/extensions/context_extension.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: paddings.all.s16,
          child: Column(
            children: [
              Text(context.l10n.home),
              spacings.y.s16,
              Text(locator<MultitecApi>().exampleMethod()),
              spacings.y.s16,
              ElevatedButton(
                onPressed: () {
                  context.showSnackBar(
                    AppSnackBar.success(
                      content: Text(context.l10n.home),
                    ),
                  );
                },
                child: Text(context.l10n.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
