import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/components/cards/mt_card.dart';
import 'package:multitec_app/core/ui/components/chips/category_chip.dart';
import 'package:multitec_app/core/ui/styles/styles.dart';
import 'package:multitec_app/core/ui/theme/theme.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';

class ScheduleListItem extends StatelessWidget {
  const ScheduleListItem({required this.item, super.key});

  final ScheduleItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    //TODO: Ver donde poner esto bien, hay otro TODO parecido en DetailScreen
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('HH:mm');

    return MTCard(
      onTap: () => context.pushNamed(AppRoute.scheduleDetail.name, extra: item),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(item: item),
          spacings.y.s12,
          Padding(
            padding: paddings.left.s16,
            child: Text(
              item.description,
              style: context.textTheme.bodyMedium?.copyWith(
                color: colors.textSecondary,
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          spacings.y.s16,
          Padding(
            padding: paddings.left.s16,
            child: Wrap(
              spacing: sizes.s12,
              runSpacing: sizes.s8,
              children: [
                _InfoChip(
                  text:
                      '${dateFormat.format(item.startsAt)} • ${timeFormat.format(item.startsAt)}',
                  icon: Icons.access_time_outlined,
                  iconColor: colors.warning,
                ),
                _InfoChip(
                  text: '${item.attendeesCount}',
                  icon: Icons.people_outline,
                  iconColor: colors.success,
                ),
                if (item.location != null)
                  _InfoChip(
                    text: item.location!,
                    icon: Icons.location_on_outlined,
                    iconColor: colors.error,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.item});

  final ScheduleItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 48,
          decoration: BoxDecoration(
            color: context.colors.primaryBase,
            borderRadius: AppBorderRadius.br2,
          ),
        ),
        spacings.x.s12,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colors.textPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (item.category != null) ...[
                spacings.y.s6,
                CategoryChip(
                  label: item.category!,
                  padding: EdgeInsets.symmetric(
                    horizontal: sizes.s12,
                    vertical: sizes.s4,
                  ),
                ),
              ],
            ],
          ),
        ),

        Icon(
          Icons.chevron_right,
          color: context.colors.textSecondary,
          size: 20,
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.text,
    required this.icon,
    required this.iconColor,
  });

  final String text;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: sizes.s8, vertical: sizes.s4),
      decoration: BoxDecoration(
        color: context.colors.gray10,
        borderRadius: AppBorderRadius.br8,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: iconColor),
          spacings.x.s4,
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.55,
            ),
            child: Text(
              text,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
