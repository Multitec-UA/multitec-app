import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/mt_style_config.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

/// Button variants for different use cases
enum MTButtonVariant { primary, secondary, destructive }

/// Custom button component with iOS-style design
class MTButton extends StatelessWidget {
  const MTButton({
    required this.text,
    required this.onPressed,
    this.variant = MTButtonVariant.primary,
    this.isLoading = false,
    this.fullWidth = false,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final MTButtonVariant variant;
  final bool isLoading;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    final isEnabled = onPressed != null && !isLoading;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: _getButtonStyle(colors, variant, isEnabled),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getTextColor(colors, variant),
                  ),
                ),
              )
            : Text(
                text,
                style: textTheme.labelLarge?.copyWith(
                  color: _getTextColor(colors, variant),
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  ButtonStyle _getButtonStyle(
    AppColors colors,
    MTButtonVariant variant,
    bool isEnabled,
  ) {
    switch (variant) {
      case MTButtonVariant.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? colors.primaryBase : colors.gray20,
          foregroundColor: Colors.white,
          disabledBackgroundColor: colors.gray20,
          disabledForegroundColor: colors.textSecondary,
          elevation: MTStyleConfig.buttonElevation,
          shadowColor: colors.gray20.withValues(
            alpha: MTStyleConfig.shadowOpacity,
          ),
          shape: RoundedRectangleBorder(borderRadius: borderRadius.br12),
          padding: EdgeInsets.symmetric(
            vertical: sizes.s16,
            horizontal: sizes.s24,
          ),
        );

      case MTButtonVariant.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.primaryBase,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textSecondary,
          elevation: 0,
          shadowColor: Colors.transparent,
          side: BorderSide(
            color: isEnabled ? colors.primaryBase : colors.gray20,
            width: MTStyleConfig.normalBorderWidth,
          ),
          shape: RoundedRectangleBorder(borderRadius: borderRadius.br12),
          padding: EdgeInsets.symmetric(
            vertical: sizes.s16,
            horizontal: sizes.s24,
          ),
        );

      case MTButtonVariant.destructive:
        return ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? colors.error : colors.gray20,
          foregroundColor: Colors.white,
          disabledBackgroundColor: colors.gray20,
          disabledForegroundColor: colors.textSecondary,
          elevation: MTStyleConfig.buttonElevation,
          shadowColor: colors.gray20.withValues(
            alpha: MTStyleConfig.shadowOpacity,
          ),
          shape: RoundedRectangleBorder(borderRadius: borderRadius.br12),
          padding: EdgeInsets.symmetric(
            vertical: sizes.s16,
            horizontal: sizes.s24,
          ),
        );
    }
  }

  Color _getTextColor(AppColors colors, MTButtonVariant variant) {
    switch (variant) {
      case MTButtonVariant.primary:
      case MTButtonVariant.destructive:
        return Colors.white;
      case MTButtonVariant.secondary:
        return colors.primaryBase;
    }
  }
}
