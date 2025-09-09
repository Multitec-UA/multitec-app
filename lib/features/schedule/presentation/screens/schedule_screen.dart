import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/features/schedule/domain/models/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/usecases/get_schedule_items_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_state.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_list_error_placeholder.dart';
import 'package:multitec_app/features/schedule/presentation/widgets/schedule_list_item.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Schedule'),
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
        locator<GetScheduleItemsUseCase>(),
      )..loadScheduleItems(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const _ListSection();
  }
}

class _ListSection extends StatelessWidget {
  const _ListSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleCubit, ScheduleState>(
      buildWhen: (p, c) =>
          p.listStatus != c.listStatus ||
          p.items != c.items ||
          p.listFailure != c.listFailure,
      builder: (context, state) {
        if (state.listStatus.isInitial || state.listStatus.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.listStatus.isError) {
          return ScheduleListErrorPlaceholder(
            message: state.listFailure.toScheduleListMessage(context),
            onRetry: () => context.read<ScheduleCubit>().loadScheduleItems(),
          );
        }

        if (state.listStatus.isLoaded && state.items.isEmpty) {
          return const Center(
            child: Text('No hay elementos disponibles'),
          );
        }

        return RefreshIndicator(
          onRefresh: () => context.read<ScheduleCubit>().loadScheduleItems(),
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: state.items.length,
            itemBuilder: (_, i) => ScheduleListItem(item: state.items[i]),
            separatorBuilder: (_, __) => const Divider(height: 1),
          ),
        );
      },
    );
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
