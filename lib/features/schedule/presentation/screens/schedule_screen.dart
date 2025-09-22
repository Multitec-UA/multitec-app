import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/components/lists/section_header.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_schedule_items_bytype_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_state.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_list_error_placeholder.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_list_item.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key, this.initialTab});

  final ScheduleType? initialTab;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DefaultTabController(
      length: 2,
      initialIndex: initialTab == ScheduleType.activity ? 1 : 0,
      child: Scaffold(
        backgroundColor: colors.background,
        appBar: AppBar(
          title: const MultitecAppBar(),
          titleSpacing: 0,
          backgroundColor: colors.surface,
          elevation: 0,
          bottom: TabBar(
            indicatorColor: colors.primaryBase,
            labelColor: colors.primaryBase,
            unselectedLabelColor: colors.textSecondary,
            labelStyle: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
            unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
            tabs: const [
              Tab(text: 'Eventos', icon: Icon(Icons.event)),
              Tab(text: 'Actividades', icon: Icon(Icons.local_activity)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _ScheduleTabView(type: ScheduleType.event),
            _ScheduleTabView(type: ScheduleType.activity),
          ],
        ),
      ),
    );
  }
}

class _ScheduleTabView extends StatefulWidget {
  const _ScheduleTabView({required this.type});

  final ScheduleType type;

  @override
  State<_ScheduleTabView> createState() => _ScheduleTabViewState();
}

class _ScheduleTabViewState extends State<_ScheduleTabView>
    with AutomaticKeepAliveClientMixin<_ScheduleTabView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => ScheduleCubit(
        widget.type,
        locator<GetScheduleItemsByTypeUseCase>(),
        locator<EventBus>(),
      )..loadScheduleItems(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocBuilder<ScheduleCubit, ScheduleState>(
      buildWhen: (p, c) =>
          p.status != c.status ||
          p.items != c.items ||
          p.failure != c.failure ||
          p.hasMore != c.hasMore,
      builder: (context, state) {
        if (state.items.isNotEmpty) {
          return _ListSection(state: state);
        }

        return switch (state.status) {
          RequestStatus.initial || RequestStatus.loading => Center(
            child: CircularProgressIndicator(color: colors.primaryBase),
          ),

          RequestStatus.failure => ScheduleListErrorPlaceholder(
            message: state.failure.toScheduleListMessage(context),
            onRetry: () => context.read<ScheduleCubit>().loadScheduleItems(
              isRefreshing: true,
            ),
          ),

          RequestStatus.success => _EmptyState(),
        };
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: paddings.all.s24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 64,
              color: colors.textSecondary,
            ),
            spacings.y.s16,
            Text(
              'No hay elementos disponibles',
              style: textTheme.headlineSmall?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            spacings.y.s8,
            Text(
              'Los horarios aparecerán aquí cuando estén disponibles',
              style: textTheme.bodyMedium?.copyWith(
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ListSection extends StatefulWidget {
  const _ListSection({required this.state});

  final ScheduleState state;

  @override
  State<_ListSection> createState() => _ListSectionState();
}

class _ListSectionState extends State<_ListSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ScheduleCubit>().loadScheduleItems();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final itemCount =
        widget.state.items.length + (widget.state.hasMore ? 1 : 0);

    return RefreshIndicator(
      color: colors.primaryBase,
      backgroundColor: colors.surface,
      onRefresh: () =>
          context.read<ScheduleCubit>().loadScheduleItems(isRefreshing: true),
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'Horarios',
              subtitle: '${widget.state.items.length} elementos',
            ),
          ),
          SliverPadding(
            padding: paddings.x.s16,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                if (index >= widget.state.items.length) {
                  return _LoadMoreIndicator(
                    isLoading:
                        widget.state.status.isLoading &&
                        widget.state.items.isNotEmpty,
                    hasError:
                        widget.state.status.isFailure &&
                        widget.state.items.isNotEmpty,
                    onRetry: () =>
                        context.read<ScheduleCubit>().loadScheduleItems(),
                  );
                }

                final item = widget.state.items[index];
                final isLast = index == widget.state.items.length - 1;

                return Padding(
                  padding: EdgeInsets.only(
                    bottom: isLast ? sizes.s16 : sizes.s8,
                  ),
                  child: ScheduleListItem(item: item),
                );
              }, childCount: itemCount),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadMoreIndicator extends StatelessWidget {
  const _LoadMoreIndicator({
    required this.isLoading,
    required this.hasError,
    required this.onRetry,
  });

  final bool isLoading;
  final bool hasError;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    if (isLoading) {
      return Padding(
        padding: paddings.all.s16,
        child: Center(
          child: CircularProgressIndicator(color: colors.primaryBase),
        ),
      );
    }

    if (hasError) {
      return Padding(
        padding: paddings.all.s16,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Error al cargar más elementos',
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              spacings.y.s12,
              MTButton(
                variant: MTButtonVariant.secondary,
                text: 'Reintentar',
                onPressed: onRetry,
              ),
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

extension _ScheduleListFailureL10nX on Failure? {
  String toScheduleListMessage(BuildContext context) {
    final l10n = context.l10n;
    if (this == null) return l10n.genericError;

    return switch (this) {
      NetworkFailure _ =>
        'No se ha podido obtener la lista debido a un fallo de conexión',
      TimeoutFailure _ =>
        'No se ha podido obtener la lista porque ha tardado demasiado',
      _ => toLocalizedMessage(context),
    };
  }
}
