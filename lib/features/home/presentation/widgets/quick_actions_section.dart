import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
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
                  title: 'Eventos',
                  subtitle: 'Ver eventos disponibles',
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
                  title: 'Actividades',
                  subtitle: 'Ver actividades disponibles',
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
                  title: 'Mis guardados',
                  subtitle: 'Eventos y actividades guardadas',
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
                    title: 'Feature Example',
                    subtitle: 'Ir a Feature Example',
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
