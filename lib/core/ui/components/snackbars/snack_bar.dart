import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/design/foundations/border_radius.dart';
import 'package:multitec_app/core/ui/design/foundations/spacings.dart';
import 'package:multitec_app/core/ui/design/theme/theme.dart';
import 'package:multitec_app/core/ui/extensions/context_extension.dart';

class AppSnackBar extends SnackBar {
  AppSnackBar({
    required Widget content,
    required IconData icon,
    Color iconColor = Colors.white,
    super.key,
    super.backgroundColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    super.width,
    ShapeBorder? shape,
    SnackBarBehavior? behavior,
    super.action,
    super.actionOverflowThreshold,
    bool super.showCloseIcon = true,
    Color? closeIconColor,
    Duration? duration,
    super.animation,
    super.onVisible,
    DismissDirection super.dismissDirection = DismissDirection.down,
    super.clipBehavior,
  }) : super(
         content: _SnackBarContent(
           content: content,
           icon: icon,
           iconColor: iconColor,
         ),
         elevation: elevation ?? 4,
         margin: margin ?? paddings.all.s16,
         padding: padding ?? paddings.x.s16 + paddings.y.s4,
         shape:
             shape ??
             const RoundedRectangleBorder(borderRadius: AppBorderRadius.br12),
         behavior: behavior ?? SnackBarBehavior.floating,
         closeIconColor: closeIconColor ?? Colors.white,
         duration: duration ?? const Duration(seconds: 4),
       );
}

class _SnackBarContent extends StatelessWidget {
  const _SnackBarContent({
    required this.content,
    required this.icon,
    this.iconColor = Colors.white,
  });

  final Widget content;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 20),
        spacings.x.s12,
        Expanded(child: content),
      ],
    );
  }
}

void showSuccessSnackBar(BuildContext context, {required String message}) {
  context.showSnackBar(
    AppSnackBar(
      content: _defaultSnackBarText(context, message),
      icon: Icons.check_circle_rounded,
      backgroundColor: context.colors.success,
    ),
  );
}

void showErrorSnackBar(BuildContext context, {required String message}) {
  context.showSnackBar(
    AppSnackBar(
      content: _defaultSnackBarText(context, message),
      icon: Icons.error_rounded,
      backgroundColor: context.colors.error,
    ),
  );
}

void showWarningSnackBar(BuildContext context, {required String message}) {
  context.showSnackBar(
    AppSnackBar(
      content: _defaultSnackBarText(context, message),
      icon: Icons.warning_rounded,
      backgroundColor: context.colors.warning,
    ),
  );
}

void showInfoSnackBar(BuildContext context, {required String message}) {
  context.showSnackBar(
    AppSnackBar(
      content: _defaultSnackBarText(context, message),
      icon: Icons.info_rounded,
      backgroundColor: context.colors.info,
    ),
  );
}

Text _defaultSnackBarText(BuildContext context, String message) {
  final style =
      Theme.of(context).snackBarTheme.contentTextStyle ??
      context.textTheme.bodyMedium?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

  return Text(message, style: style);
}
