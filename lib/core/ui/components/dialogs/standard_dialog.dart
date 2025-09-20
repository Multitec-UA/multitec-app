import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

Future<void> showStandardDialog({
  required BuildContext context,
  required Widget child,
  bool showCloseButton = true,
  bool barrierDismissible = true,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) {
      return Dialog(
        insetPadding: paddings.all.s32,
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius.br16,
          side: BorderSide(
            color: context.colors.gray20.withValues(alpha: 0.25),
          ),
        ),
        child: Padding(
          padding: paddings.x.s12 + paddings.bottom.s16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showCloseButton)
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close, color: context.colors.textPrimary),
                    onPressed: context.pop,
                  ),
                ),
              child,
            ],
          ),
        ),
      );
    },
  );
}
