import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/styles/ui_constants.dart';
import 'package:multitec_app/core/ui/theme/app_colors.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

enum MTButtonType { primary, secondary, destructive }

enum MTButtonSize { small, medium }

class MTButton extends StatelessWidget {
  const MTButton({
    required this.text,
    required this.onPressed,
    this.type = MTButtonType.primary,
    this.size = MTButtonSize.medium,
    this.isLoading = false,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final MTButtonType type;
  final MTButtonSize size;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final isEnabled = onPressed != null && !isLoading;

    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: _getButtonStyle(colors, type, isEnabled, size),
      child: isLoading
          ? SizedBox(
              height: _loaderSizeFor(size),
              width: _loaderSizeFor(size),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getTextColor(colors, type),
                ),
              ),
            )
          : Text(
              text,
              style: textTheme.labelLarge?.copyWith(
                color: _getTextColor(colors, type),
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }

  ButtonStyle _getButtonStyle(
    AppColors colors,
    MTButtonType variant,
    bool isEnabled,
    MTButtonSize size,
  ) {
    switch (variant) {
      case MTButtonType.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? colors.primaryBase : colors.gray20,
          foregroundColor: Colors.white,
          disabledBackgroundColor: colors.gray20,
          disabledForegroundColor: colors.textSecondary,
          elevation: UIConstants.buttonElevation,
          shadowColor: colors.gray20.withValues(
            alpha: UIConstants.shadowOpacity,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppBorderRadius.br12,
          ),
          padding: _paddingFor(size),
        );

      case MTButtonType.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.primaryBase,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textSecondary,
          elevation: 0,
          shadowColor: Colors.transparent,
          side: BorderSide(
            color: isEnabled ? colors.primaryBase : colors.gray20,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppBorderRadius.br12,
          ),
          padding: _paddingFor(size),
        );

      case MTButtonType.destructive:
        return ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? colors.error : colors.gray20,
          foregroundColor: Colors.white,
          disabledBackgroundColor: colors.gray20,
          disabledForegroundColor: colors.textSecondary,
          elevation: UIConstants.buttonElevation,
          shadowColor: colors.gray20.withValues(
            alpha: UIConstants.shadowOpacity,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppBorderRadius.br12,
          ),
          padding: _paddingFor(size),
        );
    }
  }

  EdgeInsets _paddingFor(MTButtonSize size) {
    switch (size) {
      case MTButtonSize.small:
        return EdgeInsets.symmetric(vertical: sizes.s12, horizontal: sizes.s16);
      case MTButtonSize.medium:
        return EdgeInsets.symmetric(vertical: sizes.s16, horizontal: sizes.s24);
    }
  }

  double _loaderSizeFor(MTButtonSize size) {
    switch (size) {
      case MTButtonSize.small:
        return 16;
      case MTButtonSize.medium:
        return 20;
    }
  }

  Color _getTextColor(AppColors colors, MTButtonType variant) {
    switch (variant) {
      case MTButtonType.primary:
      case MTButtonType.destructive:
        return Colors.white;
      case MTButtonType.secondary:
        return colors.primaryBase;
    }
  }
}
