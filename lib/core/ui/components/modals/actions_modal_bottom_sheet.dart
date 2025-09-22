import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/ui/components/modals/standard_modal_bottom_sheet.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/core/ui/theme/context_theme_extension.dart';

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
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < modalActions.length; i++) ...[
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                context.pop();
                modalActions[i].action.call();
              },
              child: Container(
                width: double.infinity,
                padding: paddings.x.s24 + paddings.y.s16,
                child: Text(
                  modalActions[i].title,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color:
                        modalActions[i].titleColor ??
                        context.colors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          if (i < modalActions.length - 1)
            Container(
              height: 0.5,
              color: context.colors.gray20.withValues(alpha: 0.3),
              margin: paddings.x.s16,
            ),
        ],
      ],
    ),
  );
}
