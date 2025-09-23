import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        title: const Text('Página no encontrada'),
        backgroundColor: context.colors.background,
      ),
      body: Padding(
        padding: paddings.all.s24,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 80,
                color: context.colors.error,
              ),
              spacings.y.s24,
              Text(
                '404',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: context.colors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              spacings.y.s8,
              Text(
                'No se encontró la página',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: context.colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              spacings.y.s16,
              Text(
                'La página que buscas no existe o ha sido movida.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: context.colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              spacings.y.s32,
              MTButton(
                text: 'Ir al inicio',
                onPressed: () => context.goNamed(AppRoute.home.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
