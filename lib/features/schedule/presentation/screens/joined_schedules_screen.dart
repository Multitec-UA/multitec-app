import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/core/ui/design/foundations/spacings.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_joined_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/joined_schedules_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/joined_schedules_state.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/empty_list_placeholder.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/list_error_placeholder.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/load_more_items_indicator.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_list_item.dart';

class JoinedSchedulesScreen extends StatelessWidget {
  const JoinedSchedulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MultitecAppBar(
        showTitleLogo: false,
        title: context.l10n.joinedSchedulesTitle,
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
        if (state.items.isNotEmpty) {
          return _ListSection(state: state);
        }

        return switch (state.status) {
          RequestStatus.initial || RequestStatus.loading => const Center(
            child: CircularProgressIndicator(),
          ),

          RequestStatus.failure => ListErrorPlaceholder(
            message: state.failure.toJoinedSchedulesMessage(context),
            onRetry: () => context
                .read<JoinedSchedulesCubit>()
                .loadJoinedSchedules(isRefreshing: true),
          ),

          RequestStatus.success => EmptyListPlaceholder(
            title: context.l10n.joinedSchedulesEmptyTitle,
            subtitle: context.l10n.joinedSchedulesEmptySubtitle,
          ),
        };
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
      onRefresh: () => context.read<JoinedSchedulesCubit>().loadJoinedSchedules(
        isRefreshing: true,
      ),
      child: ListView.builder(
        controller: _scrollController,
        padding: paddings.x.s16,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index >= widget.state.items.length) {
            return LoadMoreItemsIndicator(
              isLoading: widget.state.status.isLoading,
              hasError: widget.state.status.isFailure,
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

//TODO: Check
extension _JoinedSchedulesFailureL10nX on Failure? {
  String toJoinedSchedulesMessage(BuildContext context) {
    final l10n = context.l10n;
    if (this == null) return l10n.genericError;

    return switch (this) {
      NetworkFailure _ => l10n.joinedSchedulesNetworkError,
      TimeoutFailure _ => l10n.joinedSchedulesTimeoutError,
      _ => toLocalizedMessage(context),
    };
  }
}
