import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/core/ui/theme/context_theme_extension.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    required this.label,
    this.color,
    this.padding,
    super.key,
  });

  final String label;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? paddings.x.s10 + paddings.y.s4,
      decoration: BoxDecoration(
        color: color ?? context.colors.primaryBase.withValues(alpha: 0.1),
        borderRadius: AppBorderRadius.br12,
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: color ?? context.colors.primaryBase,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
