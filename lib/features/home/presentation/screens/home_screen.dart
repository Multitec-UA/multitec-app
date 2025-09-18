import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_carousel.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_cubit.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const MultitecAppBar(
        action: MultitecAppBarAction.profileShortcut,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: paddings.x.s16,
              child: BlocBuilder<UserCubit, UserState>(
                buildWhen: (p, c) => p.user != c.user || p.status != c.status,
                builder: (context, state) {
                  final name = state.user?.name ?? 'Multitec';
                  return Text(
                    context.l10n.welcomeUser(name),
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
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
            const ScheduleCarousel(),
            spacings.y.s16,
            Padding(
              padding: paddings.x.s16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => context.pushNamed(
                      AppRoute.example.name,
                    ),
                    child: const Text('Ir a Example Feature'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => context.goNamed(
                        AppRoute.schedule.name,
                        extra: ScheduleType.event,
                      ),
                      icon: const Icon(Icons.event),
                      label: const Text('Ver todos los eventos'),
                      style: ElevatedButton.styleFrom(
                        padding: paddings.all.s20,
                      ),
                    ),
                  ),
                  spacings.y.s12,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => context.goNamed(
                        AppRoute.schedule.name,
                        extra: ScheduleType.activity,
                      ),
                      icon: const Icon(Icons.local_activity),
                      label: const Text('Ver todas las actividades'),
                      style: ElevatedButton.styleFrom(
                        padding: paddings.all.s20,
                      ),
                    ),
                  ),
                  spacings.y.s12,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => context.goNamed(
                        AppRoute.joinedSchedules.name,
                        extra: ScheduleType.activity,
                      ),
                      icon: const Icon(Icons.local_activity),
                      label: const Text('Ver mis eventos y actividades'),
                      style: ElevatedButton.styleFrom(
                        padding: paddings.all.s20,
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
