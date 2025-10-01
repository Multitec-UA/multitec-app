import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/components/cards/mt_card.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/core/ui/styles/styles.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_latest_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_carousel_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_carousel_state.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/empty_list_placeholder.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/list_error_placeholder.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_list_item.dart';

class ScheduleCarousel extends StatelessWidget {
  const ScheduleCarousel({super.key});

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
        return switch (state.status) {
          RequestStatus.initial ||
          RequestStatus.loading => const _LoadingState(),
          RequestStatus.success =>
            state.items.isEmpty
                ? const EmptyListPlaceholder(
                    title: 'No hay eventos próximos',
                    subtitle:
                        'Vuelve pronto para ver nuevos eventos y actividades',
                  )
                : _Carousel(items: state.items),
          RequestStatus.failure => ListErrorPlaceholder(
            message: 'Error al cargar eventos',
            onRetry: () =>
                context.read<ScheduleCarouselCubit>().loadLatestScheduleItems(),
          ),
        };
      },
    );
  }
}

class _Carousel extends StatelessWidget {
  const _Carousel({required this.items});

  final List<ScheduleItem> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: paddings.x.s16,
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == items.length) {
            return const _SeeMoreSchedulesButton();
          }

          final item = items[index];
          return Container(
            width: 290,
            margin: paddings.right.s8,
            child: ScheduleListItem(item: item),
          );
        },
      ),
    );
  }
}

class _SeeMoreSchedulesButton extends StatelessWidget {
  const _SeeMoreSchedulesButton();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 150,
      margin: paddings.right.s8,
      child: MTCard(
        onTap: () =>
            context.goNamed(AppRoute.schedule.name, extra: ScheduleType.event),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: colors.primaryBase.withValues(alpha: 0.1),
                borderRadius: AppBorderRadius.br24,
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 24,
                color: colors.primaryBase,
              ),
            ),
            spacings.y.s12,
            Text(
              'Ver más',
              style: textTheme.titleSmall?.copyWith(
                color: colors.primaryBase,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            spacings.y.s4,
            Text(
              'eventos',
              style: textTheme.bodySmall?.copyWith(color: colors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

//TODO: Quitar loadingstate y hacerlo con paquete shimmer
class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: paddings.x.s16,
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          width: 280,
          margin: paddings.right.s8,
          child: MTCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 4,
                      height: 48,
                      decoration: BoxDecoration(
                        color: colors.gray20,
                        borderRadius: AppBorderRadius.br2,
                      ),
                    ),
                    spacings.x.s12,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ShimmerBox(
                            height: 20,
                            width: double.infinity,
                            color: colors.gray20,
                          ),
                          spacings.y.s8,
                          _ShimmerBox(
                            height: 16,
                            width: 100,
                            color: colors.gray20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                spacings.y.s12,
                Padding(
                  padding: EdgeInsets.only(left: sizes.s16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ShimmerBox(
                        height: 14,
                        width: double.infinity,
                        color: colors.gray20,
                      ),
                      spacings.y.s4,
                      _ShimmerBox(height: 14, width: 150, color: colors.gray20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  const _ShimmerBox({
    required this.height,
    required this.width,
    required this.color,
  });

  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppBorderRadius.br4,
      ),
    );
  }
}
