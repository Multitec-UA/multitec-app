import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/network/network_service.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/components/snack_bar.dart';
import 'package:multitec_app/core/ui/extensions/context_extension.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MultitecAppBar(),
      body: Center(
        child: Padding(
          padding: paddings.all.s16,
          child: Column(
            children: [
              Text(context.l10n.home),
              spacings.y.s16,
              Text(
                (locator.get<NetworkServiceClient>(
                  instanceName: 'MultitecApiClient',
                ) as MultitecApiClient)
                    .exampleMethod(),
              ),
              const Divider(height: 50),
              ElevatedButton(
                onPressed: () {
                  context.showSnackBar(
                    AppSnackBar.success(
                      content: const Text('Texto de ejemplo'),
                    ),
                  );
                },
                child: const Text('Show success snackbar'),
              ),
              spacings.y.s16,
              ElevatedButton(
                onPressed: () {
                  context.showSnackBar(
                    AppSnackBar.error(
                      content: const Text('Texto de ejemplo'),
                    ),
                  );
                },
                child: const Text('Show error snackbar'),
              ),
              spacings.y.s16,
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(AppRoute.example.name);
                },
                child: const Text('Ir a Feature Example'),
              ),
              const Divider(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    color: context.colors.primaryBase,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: context.colors.gray10,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: context.colors.gray20,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: context.colors.gray30,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: context.colors.gray40,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: context.colors.gray50,
                  ),
                ],
              ),
              spacings.y.s16,
              Text(
                'Estilo de texto de prueba',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
