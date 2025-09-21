import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/context_theme_extension.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/usecases/is_joined_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/toggle_join_schedule_item_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_detail_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/schedule_detail_state.dart';

class ScheduleDetailScreen extends StatelessWidget {
  const ScheduleDetailScreen({required this.item, super.key});

  final ScheduleItem item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScheduleDetailCubit>(
      create: (context) => ScheduleDetailCubit(
        item: item,
        isJoinedUseCase: locator<IsJoinedUseCase>(),
        toggleJoinUseCase: locator<ToggleJoinScheduleItemUseCase>(),
        eventBus: locator<EventBus>(),
      ),
      child: const _ScheduleDetailView(),
    );
  }
}

class _ScheduleDetailView extends StatelessWidget {
  const _ScheduleDetailView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocConsumer<ScheduleDetailCubit, ScheduleDetailState>(
        listener: (context, state) {
          if (state.toggleJoinStatus == RequestStatus.failure &&
              state.failure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.failure.toLocalizedMessage(context)),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) => SingleChildScrollView(
          padding: paddings.all.s16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeaderSection(item: state.item),
              spacings.y.s24,
              _DetailsSection(item: state.item),
              spacings.y.s24,
              _JoinSection(
                isJoined: state.isJoined,
                isInitial: state.toggleJoinStatus.isInitial,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({required this.item});

  final ScheduleItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        spacings.y.s8,
        if (item.category != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              item.category!,
              style: context.textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          spacings.y.s16,
        ],
        Text(item.description, style: context.textTheme.bodyLarge),
      ],
    );
  }
}

class _DetailsSection extends StatelessWidget {
  const _DetailsSection({required this.item});

  final ScheduleItem item;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final dateFormat = DateFormat('EEEE, MMMM d, y', l10n.localeName);
    final timeFormat = DateFormat('HH:mm', l10n.localeName);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.details,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        spacings.y.s16,
        _DetailRow(
          icon: Icons.calendar_today,
          label: l10n.date,
          value: dateFormat.format(item.startsAt),
        ),
        spacings.y.s12,
        _DetailRow(
          icon: Icons.access_time,
          label: l10n.time,
          value: timeFormat.format(item.startsAt),
        ),
        if (item.location != null) ...[
          spacings.y.s12,
          _DetailRow(
            icon: Icons.location_on,
            label: l10n.location,
            value: item.location!,
          ),
        ],
        spacings.y.s12,
        _DetailRow(
          icon: Icons.people,
          label: l10n.attendees,
          value: '${item.attendeesCount}',
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        spacings.y.s12,
        Expanded(
          child: Row(
            children: [
              Text(
                '$label: ',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(child: Text(value, style: context.textTheme.bodyMedium)),
            ],
          ),
        ),
      ],
    );
  }
}

class _JoinSection extends StatelessWidget {
  const _JoinSection({required this.isJoined, required this.isInitial});

  final bool isJoined;
  final bool isInitial;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    if (isInitial) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isInitial
            ? null
            : () {
                final cubit = context.read<ScheduleDetailCubit>();
                cubit.toggleJoin();
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: isJoined
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.primary,
          foregroundColor: isJoined
              ? Theme.of(context).colorScheme.onError
              : Theme.of(context).colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: isInitial
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(
                isJoined ? l10n.leaveEvent : l10n.joinEvent,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
