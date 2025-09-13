import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_latest_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_carousel_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_carousel_state.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_list_item.dart';

class ScheduleCarousel extends StatelessWidget {
  const ScheduleCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScheduleCarouselCubit(
        locator<GetLatestScheduleItemsUseCase>(),
        locator<EventBus>(),
      )..loadLatestScheduleItems(),
      child: const _CarouselBody(),
    );
  }
}

class _CarouselBody extends StatelessWidget {
  const _CarouselBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleCarouselCubit, ScheduleCarouselState>(
      builder: (context, state) {
        //TODO: Ver si esto es pattern matching y si usar en otras partes de la app
        return switch (state.status) {
          StateStatus.initial || StateStatus.loading => const _LoadingState(),
          StateStatus.loaded => _LoadedState(items: state.items),
          StateStatus.error => _ErrorState(
              onRetry: () => context
                  .read<ScheduleCarouselCubit>()
                  .loadLatestScheduleItems(),
            ),
        };
      },
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: paddings.x.s16,
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          width: 280,
          margin: paddings.right.s12,
          child: Card(
            child: Container(
              padding: paddings.all.s16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 16,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 14,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 14,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadedState extends StatelessWidget {
  const _LoadedState({required this.items});

  final List<ScheduleItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const _EmptyState();
    }

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: paddings.x.s16,
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            return const _SeeMoreButton();
          }

          final item = items[index];
          return SizedBox(
            width: 290,
            child: ScheduleListItem(item: item),
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 200,
      padding: paddings.all.s24,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 48,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'No hay eventos próximos',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Vuelve pronto para ver nuevos eventos y actividades',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 200,
      padding: paddings.all.s24,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error al cargar eventos',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'No se pudieron cargar los eventos próximos',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SeeMoreButton extends StatelessWidget {
  const _SeeMoreButton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 150,
      margin: paddings.right.s12,
      child: Card(
        child: InkWell(
          onTap: () => context.pushNamed(
            AppRoute.schedule.name,
            pathParameters: {'type': 'event'},
          ),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: paddings.all.s16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_forward,
                  size: 32,
                  color: theme.colorScheme.primary,
                ),
                spacings.y.s8,
                Text(
                  'Ver más',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
