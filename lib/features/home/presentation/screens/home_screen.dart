import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const MultitecAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spacings.y.s24,
            Padding(
              padding: paddings.x.s16,
              child: Text(
                'Próximos eventos y actividades',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            spacings.y.s16,
            const ScheduleCarousel(),
            spacings.y.s24,
            Padding(
              padding: paddings.x.s16,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => context.pushNamed(
                        AppRoute.schedule.name,
                        pathParameters: {'type': ScheduleType.event.value},
                      ),
                      icon: const Icon(Icons.event),
                      label: const Text('Ver todos los eventos'),
                      style: ElevatedButton.styleFrom(
                        padding: paddings.all.s16,
                      ),
                    ),
                  ),
                  spacings.x.s12,
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => context.pushNamed(
                        AppRoute.schedule.name,
                        pathParameters: {'type': ScheduleType.activity.value},
                      ),
                      icon: const Icon(Icons.local_activity),
                      label: const Text('Ver todas las actividades'),
                      style: ElevatedButton.styleFrom(
                        padding: paddings.all.s16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            spacings.y.s24,
          ],
        ),
      ),
    );
  }
}
