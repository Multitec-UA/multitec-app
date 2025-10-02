import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/design/foundations/foundations.dart';
import 'package:multitec_app/core/ui/design/theme/theme.dart';

class MTListTile extends StatelessWidget {
  const MTListTile({
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
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
  final bool enabled;
  final bool showChevron;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Card(
      elevation: UIConstants.cardElevation,
      shadowColor: colors.gray20.withValues(alpha: UIConstants.shadowOpacity),
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.br12,
        side: isLight
            ? BorderSide(color: colors.gray20, width: 0.5)
            : BorderSide.none,
      ),
      color: backgroundColor ?? colors.surface,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: AppBorderRadius.br12,
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
              if (trailing != null || (showChevron && onTap != null)) ...[
                spacings.x.s12,
                trailing ??
                    Icon(
                      Icons.chevron_right,
                      color: colors.textSecondary,
                      size: 20,
                    ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

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
