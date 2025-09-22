import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/components/lists/mt_list_tile.dart';
import 'package:multitec_app/core/ui/components/lists/section_header.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

class ProfileOptionsSection extends StatelessWidget {
  const ProfileOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GroupedSectionHeader(
          title: 'Mis actividades y Eventos',
          topSpacing: false,
        ),
        MTSettingsTile(
          leading: Icon(
            Icons.event_available,
            color: context.colors.primaryBase,
          ),
          title: 'Mis actividades y eventos',
          subtitle: 'Ver guardados',
          onTap: () => context.pushNamed(AppRoute.joinedSchedules.name),
        ),

        const GroupedSectionHeader(title: 'Configuración'),
        MTSettingsTile(
          leading: Icon(Icons.settings, color: context.colors.primaryBase),
          title: 'Ajustes',
          subtitle: 'Tema, idioma y más',
          onTap: () => context.pushNamed(AppRoute.settings.name),
        ),
      ],
    );
  }
}
