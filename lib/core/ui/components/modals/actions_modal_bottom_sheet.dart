import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/ui/components/modals/standard_modal_bottom_sheet.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

class ModalActionModel {
  ModalActionModel({
    required this.title,
    required this.action,
    this.titleColor,
  });
  final String title;
  final VoidCallback action;
  final Color? titleColor;
}

void showActionsModalBottomSheet({
  required BuildContext context,
  required List<ModalActionModel> modalActions,
  String? title,
}) {
  return showStandardModalBottomSheet(
    context: context,
    title: title,
    content: Builder(
      builder: (context) {
        final theme = Theme.of(context);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < modalActions.length; i++)
              ListTile(
                contentPadding: paddings.x.s24 + paddings.y.s8,
                title: Text(
                  modalActions[i].title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: modalActions[i].titleColor ??
                        context.colors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  context.pop();
                  modalActions[i].action.call();
                },
              ),
          ],
        );
      },
    ),
  );
}
