import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/core/ui/theme/context_theme_extension.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_schedule_items_bytype_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_state.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/empty_list_placeholder.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/list_error_placeholder.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/load_more_items_indicator.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_list_item.dart';

//TODO: Ver si dejar los widgets privados aqui o en archivos diferentes
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key, this.initialTab});

  final ScheduleType? initialTab;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: initialTab == ScheduleType.activity ? 1 : 0,
      child: SafeArea(
        child: Scaffold(
          appBar: const MultitecAppBar(
            action: MultitecAppBarAction.profileShortcut,
          ),
          body: Column(
            children: [
              Padding(
                padding: paddings.all.s12,
                child: Container(
                  padding: paddings.all.s4,
                  decoration: BoxDecoration(
                    color: context.colors.primaryBase.withValues(alpha: 0.06),
                    borderRadius: AppBorderRadius.br16,
                    border: Border.all(
                      color: context.colors.gray20,
                      width: 0.5,
                    ),
                  ),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: context.colors.primaryBase,
                      borderRadius: AppBorderRadius.br12,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: context.colors.textSecondary,
                    labelStyle: context.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: context.textTheme.labelLarge,
                    tabs: const [
                      Tab(text: 'Eventos'),
                      Tab(text: 'Actividades'),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    _ScheduleTabView(type: ScheduleType.event),
                    _ScheduleTabView(type: ScheduleType.activity),
                  ],
                ),
              ),
            ],
          ),
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
      child: _Body(type: widget.type),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.type});

  final ScheduleType type;

  @override
  Widget build(BuildContext context) {
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
            child: CircularProgressIndicator(color: context.colors.primaryBase),
          ),

          RequestStatus.failure => ListErrorPlaceholder(
            message: state.failure.toScheduleListMessage(context),
            onRetry: () => context.read<ScheduleCubit>().loadScheduleItems(
              isRefreshing: true,
            ),
          ),

          RequestStatus.success => EmptyListPlaceholder(
            title:
                'No hay ${type == ScheduleType.event ? 'eventos' : 'actividades'} disponibles',
            subtitle: type == ScheduleType.event
                ? 'Los eventos aparecerán aquí cuando estén disponibles'
                : 'Las actividades aparecerán aquí cuando estén disponibles',
          ),
        };
      },
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
    final itemCount =
        widget.state.items.length + (widget.state.hasMore ? 1 : 0);

    return RefreshIndicator(
      color: context.colors.primaryBase,
      backgroundColor: context.colors.surface,
      onRefresh: () =>
          context.read<ScheduleCubit>().loadScheduleItems(isRefreshing: true),
      child: ListView.builder(
        controller: _scrollController,
        padding: paddings.x.s16,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index >= widget.state.items.length) {
            return LoadMoreItemsIndicator(
              isLoading: widget.state.status.isLoading,
              hasError: widget.state.status.isFailure,
              onRetry: () => context.read<ScheduleCubit>().loadScheduleItems(),
            );
          }

          final item = widget.state.items[index];

          return ScheduleListItem(item: item);
        },
      ),
    );
  }
}

//TODO: Check
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
