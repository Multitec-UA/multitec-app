import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/design/foundations/spacings.dart';
import 'package:multitec_app/features/home/presentation/widgets/quick_action_card.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_type.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddings.x.s16,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: QuickActionCard(
                  icon: Icons.event,
                  title: context.l10n.quickActionsEventsTitle,
                  subtitle: context.l10n.quickActionsEventsSubtitle,
                  onTap: () => context.goNamed(
                    AppRoute.schedule.name,
                    extra: ScheduleType.event,
                  ),
                ),
              ),
              spacings.x.s12,
              Expanded(
                child: QuickActionCard(
                  icon: Icons.local_activity,
                  title: context.l10n.quickActionsActivitiesTitle,
                  subtitle: context.l10n.quickActionsActivitiesSubtitle,
                  onTap: () => context.goNamed(
                    AppRoute.schedule.name,
                    extra: ScheduleType.activity,
                  ),
                ),
              ),
            ],
          ),
          spacings.y.s12,
          Row(
            children: [
              Expanded(
                child: QuickActionCard(
                  icon: Icons.schedule,
                  title: context.l10n.quickActionsSavedTitle,
                  subtitle: context.l10n.quickActionsSavedSubtitle,
                  onTap: () => context.goNamed(AppRoute.joinedSchedules.name),
                ),
              ),
            ],
          ),
          if (kDebugMode) ...[
            spacings.y.s12,
            Row(
              children: [
                Expanded(
                  child: QuickActionCard(
                    icon: Icons.temple_hindu_rounded,
                    title: context.l10n.quickActionsExampleTitle,
                    subtitle: context.l10n.quickActionsExampleSubtitle,
                    onTap: () => context.pushNamed(AppRoute.example.name),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
