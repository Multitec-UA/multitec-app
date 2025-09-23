import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/core/ui/theme/context_theme_extension.dart';

Future<void> showInfoDialog({
  required BuildContext context,
  required String content,
  String? title,
  VoidCallback? action,
  String? actionButtonText,
}) {
  return showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: context.colors.surface,
      elevation: 8,
      shadowColor: context.colors.gray20.withValues(alpha: 0.3),
      shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.br16),
      child: Padding(
        padding: paddings.all.s24,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) ...[
              Text(
                title,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.colors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              spacings.y.s16,
            ],
            Text(
              content,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
            spacings.y.s24,
            SizedBox(
              width: double.infinity,
              child: MTButton(
                size: MTButtonSize.small,
                text: actionButtonText ?? 'OK',
                onPressed: () {
                  context.pop();
                  action?.call();
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
