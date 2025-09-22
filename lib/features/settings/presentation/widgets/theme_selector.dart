import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/components/lists/mt_list_tile.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/features/settings/presentation/cubits/theme_cubit.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final currentThemeMode = context.select((ThemeCubit c) => c.state);

    return Column(
      children: [
        MTSwitchTile(
          title: 'Tema del sistema',
          subtitle: 'Seguir configuración del dispositivo',
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
            title: 'Tema claro',
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
