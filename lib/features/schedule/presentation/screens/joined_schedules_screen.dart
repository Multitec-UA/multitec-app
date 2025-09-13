import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_joined_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/joined_schedules_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/joined_schedules_state.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_list_error_placeholder.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_list_item.dart';

class JoinedSchedulesScreen extends StatelessWidget {
  const JoinedSchedulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis eventos y actividades'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocProvider(
        create: (_) => JoinedSchedulesCubit(
          locator<GetJoinedScheduleItemsUseCase>(),
          locator<EventBus>(),
        )..loadJoinedSchedules(),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JoinedSchedulesCubit, JoinedSchedulesState>(
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
            message: state.failure.toJoinedSchedulesMessage(context),
            onRetry: () => context
                .read<JoinedSchedulesCubit>()
                .loadJoinedSchedules(isRefreshing: true),
          );
        }

        if (state.items.isNotEmpty) {
          return _ListSection(state: state);
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.event_busy,
                size: 64,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 16),
              Text(
                'No te has unido a ningún evento o actividad',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Explora los eventos y actividades disponibles para unirte',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ListSection extends StatefulWidget {
  const _ListSection({required this.state});

  final JoinedSchedulesState state;

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
      context.read<JoinedSchedulesCubit>().loadJoinedSchedules();
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
      onRefresh: () => context
          .read<JoinedSchedulesCubit>()
          .loadJoinedSchedules(isRefreshing: true),
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
              onRetry: () =>
                  context.read<JoinedSchedulesCubit>().loadJoinedSchedules(),
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

extension _JoinedSchedulesFailureL10nX on Failure? {
  String toJoinedSchedulesMessage(BuildContext context) {
    final l10n = context.l10n;
    if (this == null) return l10n.genericError;

    return switch (this) {
      NetworkFailure _ =>
        'No se han podido obtener tus eventos debido a un fallo de conexión',
      TimeoutFailure _ =>
        'No se han podido obtener tus eventos porque ha tardado demasiado',
      _ => toLocalizedMessage(context)
    };
  }
}
