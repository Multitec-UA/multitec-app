import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';

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
              shape ?? RoundedRectangleBorder(borderRadius: borderRadius.br10),
          behavior: behavior ?? SnackBarBehavior.floating,
        );
  AppSnackBar.success({
    required super.content,
    super.key,
    Color? backgroundColor,
    super.elevation,
    super.margin,
    super.padding,
    super.width,
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
          backgroundColor: backgroundColor ?? Colors.green,
          shape:
              shape ?? RoundedRectangleBorder(borderRadius: borderRadius.br10),
          behavior: behavior ?? SnackBarBehavior.floating,
        );

  AppSnackBar.error({
    required super.content,
    super.key,
    Color? backgroundColor,
    super.elevation,
    super.margin,
    super.padding,
    super.width,
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
          backgroundColor: backgroundColor ?? Colors.redAccent,
          shape:
              shape ?? RoundedRectangleBorder(borderRadius: borderRadius.br10),
          behavior: behavior ?? SnackBarBehavior.floating,
        );
}
