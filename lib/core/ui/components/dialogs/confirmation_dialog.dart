import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

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
                  text: cancelText ?? 'Cancelar',
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
                  text: confirmText ?? 'Aceptar',
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
