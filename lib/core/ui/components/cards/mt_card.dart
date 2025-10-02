import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/design/foundations/foundations.dart';
import 'package:multitec_app/core/ui/design/theme/app_colors_extension.dart';

class MTCard extends StatelessWidget {
  const MTCard({
    required this.child,
    this.onTap,
    this.margin,
    this.padding,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isLight = Theme.of(context).brightness == Brightness.light;

    final card = Card(
      elevation: UIConstants.cardElevation,
      shadowColor: colors.gray20.withValues(alpha: UIConstants.shadowOpacity),
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.br16,
        side: isLight
            ? BorderSide(color: colors.gray20, width: 0.5)
            : BorderSide.none,
      ),
      color: colors.surface,
      margin: margin ?? paddings.bottom.s12,
      child: Padding(padding: padding ?? paddings.all.s16, child: child),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: AppBorderRadius.br16,
        child: card,
      );
    }

    return card;
  }
}
