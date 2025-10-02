import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/lists/mt_list_tile.dart';
import 'package:multitec_app/core/ui/design/foundations/spacings.dart';
import 'package:multitec_app/core/ui/design/theme/app_colors_extension.dart';
import 'package:multitec_app/features/settings/presentation/cubits/theme_cubit.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final currentThemeMode = context.select((ThemeCubit c) => c.state);

    return Column(
      children: [
        MTSwitchTile(
          title: context.l10n.themeSystemTitle,
          subtitle: context.l10n.themeSystemSubtitle,
          leading: Icon(
            Icons.brightness_auto,
            color: context.colors.primaryBase,
          ),
          value: currentThemeMode == ThemeMode.system,
          onChanged: (value) {
            if (value) {
              context.read<ThemeCubit>().setThemeMode(ThemeMode.system);
            } else {
              context.read<ThemeCubit>().setThemeMode(ThemeMode.light);
            }
          },
        ),
        if (currentThemeMode != ThemeMode.system) ...[
          spacings.y.s8,
          MTSwitchTile(
            title: context.l10n.themeLightTitle,
            leading: Icon(Icons.light_mode, color: context.colors.primaryBase),
            value: currentThemeMode == ThemeMode.light,
            onChanged: (value) {
              context.read<ThemeCubit>().setThemeMode(
                value ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
        ],
      ],
    );
  }
}
