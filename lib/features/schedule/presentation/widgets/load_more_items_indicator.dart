import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/theme.dart';

class LoadMoreItemsIndicator extends StatelessWidget {
  const LoadMoreItemsIndicator({
    required this.isLoading,
    required this.hasError,
    required this.onRetry,
    super.key,
  });

  final bool isLoading;
  final bool hasError;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Padding(
        padding: paddings.all.s16,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (hasError) {
      return Padding(
        padding: paddings.all.s16,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Error al cargar más elementos',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              spacings.y.s12,
              MTButton(
                type: MTButtonType.secondary,
                size: MTButtonSize.small,
                text: 'Reintentar',
                onPressed: onRetry,
              ),
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
