import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/core/ui/theme/context_theme_extension.dart';

class AppSnackBar extends SnackBar {
  AppSnackBar({
    required super.content,
    super.key,
    super.backgroundColor,
    super.elevation,
    super.margin,
    super.padding,
    ShapeBorder? shape,
    SnackBarBehavior? behavior,
    super.action,
    super.actionOverflowThreshold,
    bool super.showCloseIcon = true,
    super.closeIconColor,
    super.duration,
    super.animation,
    super.onVisible,
    super.dismissDirection = DismissDirection.down,
    super.clipBehavior = Clip.hardEdge,
  }) : super(
         shape:
             shape ?? RoundedRectangleBorder(borderRadius: borderRadius.br12),
         behavior: behavior ?? SnackBarBehavior.floating,
       );

  AppSnackBar.success({
    required Widget content,
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
           icon: Icons.check_circle_rounded,
           iconColor: Colors.white,
         ),
         elevation: elevation ?? 4,
         margin: margin ?? paddings.all.s16,
         padding: padding ?? paddings.all.s16,
         shape:
             shape ?? RoundedRectangleBorder(borderRadius: borderRadius.br12),
         behavior: behavior ?? SnackBarBehavior.floating,
         closeIconColor: closeIconColor ?? Colors.white,
         duration: duration ?? const Duration(seconds: 4),
       );

  AppSnackBar.error({
    required Widget content,
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
           icon: Icons.error_rounded,
           iconColor: Colors.white,
         ),
         elevation: elevation ?? 4,
         margin: margin ?? paddings.all.s16,
         padding: padding ?? paddings.all.s16,
         shape:
             shape ?? RoundedRectangleBorder(borderRadius: borderRadius.br12),
         behavior: behavior ?? SnackBarBehavior.floating,
         closeIconColor: closeIconColor ?? Colors.white,
         duration: duration ?? const Duration(seconds: 4),
       );

  AppSnackBar.warning({
    required Widget content,
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
           icon: Icons.warning_rounded,
           iconColor: Colors.white,
         ),
         elevation: elevation ?? 4,
         margin: margin ?? paddings.all.s16,
         padding: padding ?? paddings.all.s16,
         shape:
             shape ?? RoundedRectangleBorder(borderRadius: borderRadius.br12),
         behavior: behavior ?? SnackBarBehavior.floating,
         closeIconColor: closeIconColor ?? Colors.white,
         duration: duration ?? const Duration(seconds: 4),
       );

  AppSnackBar.info({
    required Widget content,
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
           icon: Icons.info_rounded,
           iconColor: Colors.white,
         ),
         elevation: elevation ?? 4,
         margin: margin ?? paddings.all.s16,
         padding: padding ?? paddings.all.s16,
         shape:
             shape ?? RoundedRectangleBorder(borderRadius: borderRadius.br12),
         behavior: behavior ?? SnackBarBehavior.floating,
         closeIconColor: closeIconColor ?? Colors.white,
         duration: duration ?? const Duration(seconds: 4),
       );
}

class _SnackBarContent extends StatelessWidget {
  const _SnackBarContent({
    required this.content,
    required this.icon,
    required this.iconColor,
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

// Helper functions to show snackbars with semantic colors
void showSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    AppSnackBar.success(
      content: Text(
        message,
        style: context.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: context.colors.success,
    ),
  );
}

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    AppSnackBar.error(
      content: Text(
        message,
        style: context.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: context.colors.error,
    ),
  );
}

void showWarningSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    AppSnackBar.warning(
      content: Text(
        message,
        style: context.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: context.colors.warning,
    ),
  );
}

void showInfoSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    AppSnackBar.info(
      content: Text(
        message,
        style: context.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: context.colors.info,
    ),
  );
}
