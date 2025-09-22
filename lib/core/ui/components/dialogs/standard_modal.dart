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
        elevation: 8.0,
        shadowColor: context.colors.gray20.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(borderRadius: borderRadius.br16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showCloseButton)
              Container(
                padding: paddings.all.s8,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: context.colors.gray20.withValues(alpha: 0.3),
                      width: 0.5,
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: context.pop,
                      borderRadius: borderRadius.br8,
                      child: Container(
                        padding: paddings.all.s8,
                        child: Icon(
                          Icons.close,
                          color: context.colors.textSecondary,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            Padding(padding: paddings.all.s24, child: child),
          ],
        ),
      );
    },
  );
}
