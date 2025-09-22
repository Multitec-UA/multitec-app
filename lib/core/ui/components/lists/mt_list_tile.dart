import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/mt_style_config.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

/// Custom list tile component with iOS-style design
class MTListTile extends StatelessWidget {
  const MTListTile({
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.selected = false,
    this.enabled = true,
    this.showChevron = false,
    this.backgroundColor,
    this.contentPadding,
    super.key,
  });

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool selected;
  final bool enabled;
  final bool showChevron;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    final effectiveTrailing = _buildTrailing(colors);
    final effectiveBackgroundColor =
        backgroundColor ??
        (selected
            ? colors.primaryBase.withValues(alpha: MTStyleConfig.overlayOpacity)
            : colors.surface);

    return Material(
      color: effectiveBackgroundColor,
      borderRadius: borderRadius.br12,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: borderRadius.br12,
        child: Padding(
          padding: contentPadding ?? paddings.all.s16,
          child: Row(
            children: [
              if (leading != null) ...[leading!, spacings.x.s12],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      DefaultTextStyle(
                        style:
                            textTheme.bodyLarge?.copyWith(
                              color: enabled
                                  ? colors.textPrimary
                                  : colors.textSecondary,
                              fontWeight: FontWeight.normal,
                            ) ??
                            const TextStyle(),
                        child: title!,
                      ),
                    if (subtitle != null) ...[
                      spacings.y.s4,
                      DefaultTextStyle(
                        style:
                            textTheme.bodyMedium?.copyWith(
                              color: colors.textSecondary,
                            ) ??
                            const TextStyle(),
                        child: subtitle!,
                      ),
                    ],
                  ],
                ),
              ),
              if (effectiveTrailing != null) ...[
                spacings.x.s12,
                effectiveTrailing,
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget? _buildTrailing(AppColors colors) {
    if (trailing != null) {
      return trailing;
    }

    if (showChevron && onTap != null) {
      return Icon(Icons.chevron_right, color: colors.textSecondary, size: 20);
    }

    return null;
  }
}

/// Specialized list tile for settings/configuration items
class MTSettingsTile extends StatelessWidget {
  const MTSettingsTile({
    required this.title,
    this.subtitle,
    this.leading,
    this.value,
    this.onTap,
    this.enabled = true,
    this.showChevron = true,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final String? value;
  final VoidCallback? onTap;
  final bool enabled;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return MTListTile(
      leading: leading,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: value != null
          ? Text(
              value!,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.textSecondary,
              ),
            )
          : null,
      onTap: onTap,
      enabled: enabled,
      showChevron: showChevron && onTap != null,
    );
  }
}

/// Specialized list tile with switch control
class MTSwitchTile extends StatelessWidget {
  const MTSwitchTile({
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.leading,
    this.enabled = true,
    super.key,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? subtitle;
  final Widget? leading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MTListTile(
      leading: leading,
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: Switch(
        value: value,
        onChanged: enabled ? onChanged : null,
        activeColor: colors.primaryBase,
        inactiveThumbColor: colors.gray30,
        inactiveTrackColor: colors.gray20,
      ),
      onTap: enabled ? () => onChanged(!value) : null,
      enabled: enabled,
    );
  }
}
