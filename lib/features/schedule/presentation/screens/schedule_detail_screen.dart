import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/components/cards/mt_card.dart';
import 'package:multitec_app/core/ui/components/lists/mt_list_tile.dart';
import 'package:multitec_app/core/ui/components/lists/section_header.dart';
import 'package:multitec_app/core/ui/components/snackbars/snack_bar.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
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
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          'Detalles del Evento',
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: colors.textPrimary,
          ),
        ),
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: colors.primaryBase),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocConsumer<ScheduleDetailCubit, ScheduleDetailState>(
        listener: (context, state) {
          if (state.toggleJoinStatus == RequestStatus.failure &&
              state.failure != null) {
            showErrorSnackBar(
              context,
              state.failure.toLocalizedMessage(context),
            );
          }
        },
        builder: (context, state) => CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _HeaderSection(item: state.item)),
            SliverToBoxAdapter(child: _DetailsSection(item: state.item)),
            SliverToBoxAdapter(child: _AttendeesSection(item: state.item)),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  _JoinSection(
                    isJoined: state.isJoined,
                    isLoading: state.toggleJoinStatus.isLoading,
                    isInitial: state.toggleJoinStatus.isInitial,
                  ),
                  spacings.y.s24,
                ],
              ),
            ),
          ],
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
    final colors = context.colors;
    final textTheme = context.textTheme;

    return Padding(
      padding: paddings.all.s16,
      child: MTCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 4,
                  height: 60,
                  decoration: BoxDecoration(
                    color: colors.primaryBase,
                    borderRadius: borderRadius.br2,
                  ),
                ),
                spacings.x.s16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colors.textPrimary,
                        ),
                      ),
                      spacings.y.s8,
                      if (item.category != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: sizes.s12,
                            vertical: sizes.s6,
                          ),
                          decoration: BoxDecoration(
                            color: colors.primaryBase.withValues(alpha: 0.1),
                            borderRadius: borderRadius.br16,
                          ),
                          child: Text(
                            item.category!,
                            style: textTheme.labelSmall?.copyWith(
                              color: colors.primaryBase,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (item.description.isNotEmpty) ...[
              spacings.y.s16,
              Text(
                item.description,
                style: textTheme.bodyLarge?.copyWith(
                  color: colors.textSecondary,
                  height: 1.5,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DetailsSection extends StatelessWidget {
  const _DetailsSection({required this.item});

  final ScheduleItem item;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final dateFormat = DateFormat('EEEE, MMMM d, y', l10n.localeName);
    final timeFormat = DateFormat('HH:mm', l10n.localeName);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Información del Evento'),
        Padding(
          padding: paddings.x.s16,
          child: MTCard(
            child: Column(
              children: [
                _DetailTile(
                  icon: Icons.calendar_today_outlined,
                  iconColor: colors.info,
                  title: 'Fecha',
                  subtitle: dateFormat.format(item.startsAt),
                ),
                _buildDivider(context),
                _DetailTile(
                  icon: Icons.access_time_outlined,
                  iconColor: colors.warning,
                  title: 'Hora',
                  subtitle: timeFormat.format(item.startsAt),
                ),
                if (item.location != null) ...[
                  _buildDivider(context),
                  _DetailTile(
                    icon: Icons.location_on_outlined,
                    iconColor: colors.error,
                    title: 'Ubicación',
                    subtitle: item.location!,
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.only(left: sizes.s52),
      child: Divider(height: 1, thickness: 1, color: colors.gray20),
    );
  }
}

class _DetailTile extends StatelessWidget {
  const _DetailTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    return MTListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.1),
          borderRadius: borderRadius.br8,
        ),
        child: Icon(icon, size: 20, color: iconColor),
      ),
      title: Text(
        title,
        style: textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: colors.textPrimary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: textTheme.bodyMedium?.copyWith(color: colors.textSecondary),
      ),
      contentPadding: paddings.all.s16,
    );
  }
}

class _AttendeesSection extends StatelessWidget {
  const _AttendeesSection({required this.item});

  final ScheduleItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Participación'),
        Padding(
          padding: paddings.x.s16,
          child: MTCard(
            child: MTListTile(
              leading: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: colors.success.withValues(alpha: 0.1),
                  borderRadius: borderRadius.br8,
                ),
                child: Icon(
                  Icons.people_outline,
                  size: 20,
                  color: colors.success,
                ),
              ),
              title: Text(
                'Asistentes',
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
              subtitle: Text(
                '${item.attendeesCount} personas registradas',
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sizes.s12,
                  vertical: sizes.s6,
                ),
                decoration: BoxDecoration(
                  color: colors.success.withValues(alpha: 0.1),
                  borderRadius: borderRadius.br12,
                ),
                child: Text(
                  '${item.attendeesCount}',
                  style: textTheme.labelMedium?.copyWith(
                    color: colors.success,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              contentPadding: paddings.all.s16,
            ),
          ),
        ),
      ],
    );
  }
}

class _JoinSection extends StatelessWidget {
  const _JoinSection({
    required this.isJoined,
    required this.isLoading,
    required this.isInitial,
  });

  final bool isJoined;
  final bool isLoading;
  final bool isInitial;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;

    if (isInitial) {
      return Center(
        child: CircularProgressIndicator(color: colors.primaryBase),
      );
    }

    return Padding(
      padding: paddings.x.s16,
      child: Column(
        children: [
          if (isJoined)
            MTButton(
              variant: MTButtonVariant.destructive,
              text: l10n.leaveEvent,
              onPressed: isLoading
                  ? null
                  : () {
                      final cubit = context.read<ScheduleDetailCubit>();
                      cubit.toggleJoin();
                    },
              isLoading: isLoading,
            )
          else
            MTButton(
              variant: MTButtonVariant.primary,
              text: l10n.joinEvent,
              onPressed: isLoading
                  ? null
                  : () {
                      final cubit = context.read<ScheduleDetailCubit>();
                      cubit.toggleJoin();
                    },
              isLoading: isLoading,
            ),
          spacings.y.s12,
          Text(
            isJoined
                ? 'Ya estás registrado en este evento'
                : 'Únete para recibir notificaciones y actualizaciones',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: colors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
