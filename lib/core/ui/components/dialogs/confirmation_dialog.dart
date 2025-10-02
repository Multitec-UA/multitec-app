import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/design/foundations/spacings.dart';
import 'package:multitec_app/core/ui/design/theme/app_colors_extension.dart';

Future<void> showConfirmationDialog({
  required BuildContext context,
  required String content,
  String? title,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  String? confirmText,
  String? cancelText,
}) async {
  await showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: context.colors.surface,
      alignment: Alignment.center,
      title: title != null ? Text(title) : null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(content),
          spacings.y.s20,
          Row(
            children: [
              Expanded(
                child: MTButton(
                  type: MTButtonType.secondary,
                  size: MTButtonSize.small,
                  onPressed: () {
                    ctx.pop();
                    onCancel?.call();
                  },
                  text: cancelText ?? context.l10n.cancel,
                ),
              ),
              spacings.x.s12,
              Expanded(
                child: MTButton(
                  type: MTButtonType.destructive,
                  size: MTButtonSize.small,
                  onPressed: () {
                    onConfirm?.call();
                    ctx.pop();
                  },
                  text: confirmText ?? context.l10n.confirm,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
