import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
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
    return DefaultTabController(
      length: 2,
      initialIndex: initialTab == ScheduleType.activity ? 1 : 0,
      child: Scaffold(
        appBar: AppBar(
          title: const MultitecAppBar(
            action: MultitecAppBarAction.profileShortcut,
          ),
          titleSpacing: 0,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Events', icon: Icon(Icons.event)),
              Tab(text: 'Activities', icon: Icon(Icons.local_activity)),
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
    return BlocBuilder<ScheduleCubit, ScheduleState>(
      buildWhen: (p, c) =>
          p.status != c.status ||
          p.items != c.items ||
          p.failure != c.failure ||
          p.hasMore != c.hasMore,
      builder: (context, state) {
        if (state.status.isInitial ||
            (state.status.isLoading && state.items.isEmpty)) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status.isError && state.items.isEmpty) {
          return ScheduleListErrorPlaceholder(
            message: state.failure.toScheduleListMessage(context),
            onRetry: () => context
                .read<ScheduleCubit>()
                .loadScheduleItems(isRefreshing: true),
          );
        }

        if (state.items.isNotEmpty) {
          return _ListSection(state: state);
        }

        return const Center(
          child: Text('No hay elementos disponibles'),
        );
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
      onRefresh: () =>
          context.read<ScheduleCubit>().loadScheduleItems(isRefreshing: true),
      child: ListView.builder(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index >= widget.state.items.length) {
            return _LoadMoreIndicator(
              isLoading: widget.state.status.isLoading &&
                  widget.state.items.isNotEmpty,
              hasError:
                  widget.state.status.isError && widget.state.items.isNotEmpty,
              onRetry: () => context.read<ScheduleCubit>().loadScheduleItems(),
            );
          }
          return ScheduleListItem(item: widget.state.items[index]);
        },
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
    if (isLoading) {
      return Padding(
        padding: paddings.all.s16,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (hasError) {
      return Padding(
        padding: paddings.all.s16,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Error al cargar más elementos'),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Reintentar'),
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
      _ => toLocalizedMessage(context)
    };
  }
}
