import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

class ScheduleListErrorPlaceholder extends StatelessWidget {
  const ScheduleListErrorPlaceholder({
    required this.message,
    required this.onRetry,
    super.key,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: paddings.all.s24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: colors.error),
            spacings.y.s16,
            Text(
              'Error al cargar',
              style: textTheme.headlineSmall?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            spacings.y.s8,
            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(color: colors.textSecondary),
            ),
            spacings.y.s24,
            MTButton(
              variant: MTButtonVariant.secondary,
              text: 'Reintentar',
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
