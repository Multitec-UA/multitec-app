import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/components/lists/mt_list_tile.dart';
import 'package:multitec_app/core/ui/components/lists/section_header.dart';
import 'package:multitec_app/core/ui/design/foundations/spacings.dart';
import 'package:multitec_app/core/ui/design/theme/app_colors_extension.dart';

class ProfileOptionsSection extends StatelessWidget {
  const ProfileOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: context.l10n.profileMySchedulesSectionTitle),

        MTSettingsTile(
          leading: Icon(
            Icons.event_available,
            color: context.colors.primaryBase,
          ),
          title: context.l10n.profileMySchedulesTitle,
          subtitle: context.l10n.profileMySchedulesSubtitle,
          onTap: () => context.pushNamed(AppRoute.joinedSchedules.name),
        ),

        spacings.y.s20,

        SectionHeader(title: context.l10n.profileSettingsSectionTitle),
        MTSettingsTile(
          leading: Icon(Icons.settings, color: context.colors.primaryBase),
          title: context.l10n.profileSettingsTitle,
          subtitle: context.l10n.profileSettingsSubtitle,
          onTap: () => context.pushNamed(AppRoute.settings.name),
        ),
      ],
    );
  }
}
