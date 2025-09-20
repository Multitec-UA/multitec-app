import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

Future<void> showInfoDialog({
  required BuildContext context,
  required String content,
  VoidCallback? action,
  String? actionButtonText,
  String? title,
}) {
  return showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: title != null ? Text(title) : null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Builder(
            builder: (context) {
              final theme = Theme.of(context);
              return Text(
                content,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: context.colors.textPrimary,
                ),
              );
            },
          ),
          spacings.y.s16,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius.br12,
              ),
              backgroundColor: context.colors.primaryBase,
            ),
            onPressed: () {
              context.pop();
              action?.call();
            },
            child: Builder(
              builder: (context) {
                return Text(
                  actionButtonText ?? 'OK',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: context.colors.background,
                      ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
