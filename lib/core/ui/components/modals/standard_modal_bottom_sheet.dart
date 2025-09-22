import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/core/ui/theme/context_theme_extension.dart';

void showStandardModalBottomSheet({
  required BuildContext context,
  required Widget content,
  String? title,
  bool isScrollControlled = false,
}) {
  showModalBottomSheet<void>(
    isScrollControlled: isScrollControlled,
    elevation: 8,
    backgroundColor: context.colors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius.br16.topLeft.x),
        topRight: Radius.circular(borderRadius.br16.topRight.x),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Handle bar
            Padding(
              padding: paddings.y.s12,
              child: Align(
                child: Container(
                  height: sizes.s4,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    color: context.colors.gray20.withValues(alpha: 0.6),
                    borderRadius: borderRadius.br32,
                  ),
                ),
              ),
            ),
            // Title section with separator
            if (title != null) ...[
              Padding(
                padding: paddings.x.s24 + paddings.bottom.s16,
                child: Text(
                  title,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 0.5,
                color: context.colors.gray20.withValues(alpha: 0.3),
                margin: paddings.x.s16,
              ),
              spacings.y.s8,
            ],
            // Content
            Padding(
              padding: paddings.x.s16 + paddings.bottom.s16,
              child: content,
            ),
          ],
        ),
      );
    },
  );
}
