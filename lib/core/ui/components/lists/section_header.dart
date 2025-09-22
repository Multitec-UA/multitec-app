import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

/// Section header component with iOS-style design
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    this.subtitle,
    this.action,
    this.padding,
    this.backgroundColor,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? action;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: backgroundColor ?? colors.background,
      padding:
          padding ??
          EdgeInsets.symmetric(horizontal: sizes.s16, vertical: sizes.s8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title.toUpperCase(),
                  style: textTheme.labelMedium?.copyWith(
                    color: colors.textSecondary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                if (subtitle != null) ...[
                  spacings.y.s4,
                  Text(
                    subtitle!,
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (action != null) ...[spacings.x.s12, action!],
        ],
      ),
    );
  }
}

/// Specialized section header for grouped lists
class GroupedSectionHeader extends StatelessWidget {
  const GroupedSectionHeader({
    required this.title,
    this.subtitle,
    this.action,
    this.topSpacing = true,
    this.bottomSpacing = true,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? action;
  final bool topSpacing;
  final bool bottomSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (topSpacing) spacings.y.s16,
        SectionHeader(title: title, subtitle: subtitle, action: action),
        if (bottomSpacing) spacings.y.s8,
      ],
    );
  }
}

/// Specialized section header with divider
class DividedSectionHeader extends StatelessWidget {
  const DividedSectionHeader({
    required this.title,
    this.subtitle,
    this.action,
    this.showTopDivider = false,
    this.showBottomDivider = true,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? action;
  final bool showTopDivider;
  final bool showBottomDivider;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showTopDivider)
          Divider(height: 1, thickness: 1, color: colors.gray20),
        SectionHeader(title: title, subtitle: subtitle, action: action),
        if (showBottomDivider)
          Divider(height: 1, thickness: 1, color: colors.gray20),
      ],
    );
  }
}
