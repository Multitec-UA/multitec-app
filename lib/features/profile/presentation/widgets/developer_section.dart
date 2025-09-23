import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/ui/components/lists/mt_list_tile.dart';
import 'package:multitec_app/core/ui/components/lists/section_header.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/features/schedule/data/datasources/schedule_local_datasource.dart';

class DeveloperSection extends StatelessWidget {
  const DeveloperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return kDebugMode
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(title: 'Desarrollador'),
              MTSettingsTile(
                leading: Icon(
                  Icons.delete_outline,
                  color: context.colors.error,
                ),
                title: 'Limpiar base de datos',
                subtitle: 'Eliminar datos locales',
                showChevron: false,
                onTap: () async {
                  await locator<ScheduleLocalDataSource>()
                      .clearJoinedScheduleItems();
                },
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
