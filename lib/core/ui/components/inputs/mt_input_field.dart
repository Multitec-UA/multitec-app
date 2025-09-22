import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/mt_style_config.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

/// Custom input field component with iOS-style design
class MTInputField extends StatelessWidget {
  const MTInputField({
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.autofocus = false,
    super.key,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: textTheme.labelMedium?.copyWith(
              color: colors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          spacings.y.s6,
        ],
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          enabled: enabled,
          readOnly: readOnly,
          maxLines: maxLines,
          maxLength: maxLength,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          onTap: onTap,
          autofocus: autofocus,
          style: textTheme.bodyLarge?.copyWith(
            color: enabled ? colors.textPrimary : colors.textSecondary,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            helperText: helperText,
            errorText: errorText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: enabled
                ? colors.gray10
                : colors.gray10.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: borderRadius.br10,
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius.br10,
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius.br10,
              borderSide: BorderSide(
                color: colors.primaryBase,
                width: MTStyleConfig.focusedBorderWidth,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius.br10,
              borderSide: BorderSide(
                color: colors.error,
                width: MTStyleConfig.errorBorderWidth,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius.br10,
              borderSide: BorderSide(
                color: colors.error,
                width: MTStyleConfig.errorBorderWidth,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: borderRadius.br10,
              borderSide: BorderSide.none,
            ),
            contentPadding: paddings.all.s16,
            hintStyle: textTheme.bodyLarge?.copyWith(
              color: colors.textSecondary,
            ),
            helperStyle: textTheme.bodySmall?.copyWith(
              color: colors.textSecondary,
            ),
            errorStyle: textTheme.bodySmall?.copyWith(color: colors.error),
            prefixIconColor: colors.textSecondary,
            suffixIconColor: colors.textSecondary,
            counterStyle: textTheme.bodySmall?.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

/// Specialized input field for passwords with toggle visibility
class MTPasswordField extends StatefulWidget {
  const MTPasswordField({
    this.controller,
    this.label,
    this.hintText = 'Enter password',
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.autofocus = false,
    super.key,
  });

  final TextEditingController? controller;
  final String? label;
  final String hintText;
  final String? helperText;
  final String? errorText;
  final bool enabled;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<MTPasswordField> createState() => _MTPasswordFieldState();
}

class _MTPasswordFieldState extends State<MTPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MTInputField(
      controller: widget.controller,
      label: widget.label,
      hintText: widget.hintText,
      helperText: widget.helperText,
      errorText: widget.errorText,
      enabled: widget.enabled,
      obscureText: _obscureText,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: colors.textSecondary,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
