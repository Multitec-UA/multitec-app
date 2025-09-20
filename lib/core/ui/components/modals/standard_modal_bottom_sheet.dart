import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

void showStandardModalBottomSheet({
  required BuildContext context,
  required Widget content,
  String? title,
  bool isScrollControlled = false,
}) {
  showModalBottomSheet<void>(
    isScrollControlled: isScrollControlled,
    elevation: 0,
    backgroundColor: context.colors.surface,
    shape: RoundedRectangleBorder(borderRadius: borderRadius.br16),
    context: context,
    builder: (BuildContext context) {
      final theme = Theme.of(context);
      return SafeArea(
        child: Padding(
          padding: paddings.x.s16 + paddings.y.s8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                child: Container(
                  height: sizes.s4,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    color: context.colors.gray20,
                    borderRadius: borderRadius.br32,
                  ),
                ),
              ),
              if (title != null) ...[
                spacings.y.s16,
                Align(
                  child: Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: context.colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              spacings.y.s16,
              content,
            ],
          ),
        ),
      );
    },
  );
}
