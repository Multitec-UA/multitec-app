import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/mt_style_config.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

/// Card variants for different use cases
enum MTCardVariant { primary, list }

/// Custom card component with iOS-style design
class MTCard extends StatelessWidget {
  const MTCard({
    required this.child,
    this.variant = MTCardVariant.primary,
    this.onTap,
    this.margin,
    this.padding,
    super.key,
  });

  final Widget child;
  final MTCardVariant variant;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final cardPadding = padding ?? _getDefaultPadding(variant);
    final cardMargin = margin ?? _getDefaultMargin(variant);

    final card = Card(
      elevation: MTStyleConfig.cardElevation,
      shadowColor: colors.gray20.withValues(alpha: MTStyleConfig.shadowOpacity),
      shape: RoundedRectangleBorder(borderRadius: _getBorderRadius(variant)),
      color: colors.surface,
      margin: cardMargin,
      child: Padding(padding: cardPadding, child: child),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: _getBorderRadius(variant),
        child: card,
      );
    }

    return card;
  }

  BorderRadius _getBorderRadius(MTCardVariant variant) {
    switch (variant) {
      case MTCardVariant.primary:
        return borderRadius.br16;
      case MTCardVariant.list:
        return borderRadius.br12;
    }
  }

  EdgeInsetsGeometry _getDefaultPadding(MTCardVariant variant) {
    switch (variant) {
      case MTCardVariant.primary:
        return paddings.all.s16;
      case MTCardVariant.list:
        return paddings.all.s12;
    }
  }

  EdgeInsetsGeometry _getDefaultMargin(MTCardVariant variant) {
    switch (variant) {
      case MTCardVariant.primary:
        return EdgeInsets.only(bottom: sizes.s12);
      case MTCardVariant.list:
        return EdgeInsets.only(bottom: sizes.s8);
    }
  }
}

/// Specialized card for list items with built-in separator support
class MTListCard extends StatelessWidget {
  const MTListCard({
    required this.children,
    this.showDividers = true,
    this.margin,
    super.key,
  });

  final List<Widget> children;
  final bool showDividers;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MTCard(
      variant: MTCardVariant.list,
      margin: margin,
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: showDividers ? _buildChildrenWithDividers(colors) : children,
      ),
    );
  }

  List<Widget> _buildChildrenWithDividers(AppColors colors) {
    final result = <Widget>[];

    for (var i = 0; i < children.length; i++) {
      result.add(Padding(padding: paddings.all.s12, child: children[i]));

      // Add divider between items (not after the last item)
      if (i < children.length - 1) {
        result.add(
          Padding(
            padding: paddings.x.s12,
            child: Divider(height: 1, thickness: 1, color: colors.gray20),
          ),
        );
      }
    }

    return result;
  }
}
