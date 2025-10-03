import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/events/event_bus_adapter.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/components/buttons/mt_button.dart';
import 'package:multitec_app/core/ui/components/cards/mt_card.dart';
import 'package:multitec_app/core/ui/components/chips/category_chip.dart';
import 'package:multitec_app/core/ui/components/lists/detail_tile.dart';
import 'package:multitec_app/core/ui/components/lists/section_header.dart';
import 'package:multitec_app/core/ui/components/snackbars/snack_bar.dart';
import 'package:multitec_app/core/ui/design/foundations/foundations.dart';
import 'package:multitec_app/core/ui/design/theme/theme.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_type.dart';
import 'package:multitec_app/features/schedule/domain/usecases/is_joined_usecase.dart';
import 'package:multitec_app/features/schedule/domain/usecases/toggle_join_schedule_item_usecase.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/detail/schedule_detail_cubit.dart';
import 'package:multitec_app/features/schedule/presentation/cubit/detail/schedule_detail_state.dart';

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
      child: _ScheduleDetailView(item: item),
    );
  }
}

class _ScheduleDetailView extends StatelessWidget {
  const _ScheduleDetailView({required this.item});

  final ScheduleItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: MultitecAppBar(
        showTitleLogo: false,
        title: item.type == ScheduleType.event.value
            ? context.l10n.eventDetailsTitle
            : context.l10n.activityDetailsTitle,
      ),
      body: BlocConsumer<ScheduleDetailCubit, ScheduleDetailState>(
        listener: (context, state) {
          if (state.toggleJoinStatus.isFailure && state.failure != null) {
            showErrorSnackBar(
              context,
              message: state.failure.toLocalizedMessage(context),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _HeaderSection(item: state.item),
                _DetailsSection(item: state.item),
                spacings.y.s12,
                _AttendeesSection(item: state.item),
                spacings.y.s16,
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: paddings.all.s16,
        decoration: BoxDecoration(
          color: context.colors.surface,
          border: Border(
            top: BorderSide(color: context.colors.gray20, width: 0.5),
          ),
        ),
        child: const _JoinButton(),
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
                    borderRadius: AppBorderRadius.br2,
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
                        CategoryChip(
                          label: item.category!,
                          padding: EdgeInsets.symmetric(
                            horizontal: sizes.s12,
                            vertical: sizes.s6,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            spacings.y.s16,
            Text(
              item.description,
              style: textTheme.bodyLarge?.copyWith(
                color: colors.textSecondary,
                height: 1.5,
              ),
            ),
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
    //TODO: sacar esto a otro sitio?
    final dateFormat = DateFormat('EEEE, MMMM d, y', context.l10n.localeName);
    final timeFormat = DateFormat('HH:mm', context.l10n.localeName);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: context.l10n.eventInfoSectionTitle),
        Padding(
          padding: paddings.x.s16,
          child: MTCard(
            child: Column(
              children: [
                MTDetailTile(
                  icon: Icons.calendar_today_outlined,
                  iconColor: context.colors.info,
                  title: context.l10n.date,
                  subtitle: dateFormat.format(item.startsAt),
                ),
                spacings.y.s8,
                MTDetailTile(
                  icon: Icons.access_time_outlined,
                  iconColor: context.colors.warning,
                  title: context.l10n.time,
                  subtitle: timeFormat.format(item.startsAt),
                ),
                if (item.location != null) ...[
                  spacings.y.s8,
                  MTDetailTile(
                    icon: Icons.location_on_outlined,
                    iconColor: context.colors.error,
                    title: context.l10n.location,
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
        SectionHeader(title: context.l10n.participationSectionTitle),
        Padding(
          padding: paddings.x.s16,
          child: MTCard(
            child: MTDetailTile(
              icon: Icons.group_outlined,
              iconColor: colors.success,
              title: context.l10n.attendees,
              subtitle: context.l10n.registeredPeople,
              trailing: Container(
                width: 36,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: sizes.s8,
                  vertical: sizes.s6,
                ),
                decoration: BoxDecoration(
                  color: colors.success.withValues(alpha: 0.1),
                  borderRadius: AppBorderRadius.br12,
                ),
                child: Text(
                  '${item.attendeesCount}',
                  style: textTheme.labelMedium?.copyWith(
                    color: colors.success,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _JoinButton extends StatelessWidget {
  const _JoinButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleDetailCubit, ScheduleDetailState>(
      builder: (context, state) {
        if (state.toggleJoinStatus.isInitial) {
          return Center(
            child: CircularProgressIndicator(color: context.colors.primaryBase),
          );
        }

        return MTButton(
          type: state.isJoined
              ? MTButtonType.destructive
              : MTButtonType.primary,
          text: state.isJoined
              ? context.l10n.leaveEvent
              : context.l10n.joinEvent,
          onPressed: state.toggleJoinStatus.isLoading
              ? null
              : () {
                  final cubit = context.read<ScheduleDetailCubit>();
                  cubit.toggleJoin();
                },
          isLoading: state.toggleJoinStatus.isLoading,
        );
      },
    );
  }
}
