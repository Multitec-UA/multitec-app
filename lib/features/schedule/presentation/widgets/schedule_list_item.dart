import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/components/cards/mt_card.dart';
import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/features/schedule/domain/entities/schedule_item.dart';

class ScheduleListItem extends StatelessWidget {
  const ScheduleListItem({required this.item, super.key});

  final ScheduleItem item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('HH:mm');

    return MTCard(
      onTap: () => context.pushNamed(
        AppRoute.scheduleDetail.name,
        pathParameters: {'itemId': item.id},
        extra: item,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and category
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time indicator
              Container(
                width: 4,
                height: 48,
                decoration: BoxDecoration(
                  color: colors.primaryBase,
                  borderRadius: borderRadius.br2,
                ),
              ),
              spacings.x.s12,
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (item.category != null) ...[
                      spacings.y.s6,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: sizes.s10,
                          vertical: sizes.s4,
                        ),
                        decoration: BoxDecoration(
                          color: colors.primaryBase.withValues(alpha: 0.1),
                          borderRadius: borderRadius.br12,
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
                  ],
                ),
              ),
              // Chevron
              Icon(Icons.chevron_right, color: colors.textSecondary, size: 20),
            ],
          ),

          // Description
          if (item.description.isNotEmpty) ...[
            spacings.y.s12,
            Padding(
              padding: EdgeInsets.only(left: sizes.s16),
              child: Text(
                item.description,
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.textSecondary,
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],

          spacings.y.s16,

          // Info row
          Padding(
            padding: EdgeInsets.only(left: sizes.s16),
            child: Row(
              children: [
                // Date and time
                _InfoChip(
                  icon: Icons.access_time_outlined,
                  iconColor: colors.warning,
                  text:
                      '${dateFormat.format(item.startsAt)} • ${timeFormat.format(item.startsAt)}',
                ),
                spacings.x.s12,
                // Attendees
                _InfoChip(
                  icon: Icons.people_outline,
                  iconColor: colors.success,
                  text: '${item.attendeesCount}',
                ),
                if (item.location != null) ...[
                  spacings.x.s12,
                  Expanded(
                    child: _InfoChip(
                      icon: Icons.location_on_outlined,
                      iconColor: colors.error,
                      text: item.location!,
                      isExpanded: true,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.iconColor,
    required this.text,
    this.isExpanded = false,
  });

  final IconData icon;
  final Color iconColor;
  final String text;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    final content = Row(
      mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: iconColor),
        spacings.x.s4,
        if (isExpanded)
          Expanded(
            child: Text(
              text,
              style: textTheme.labelSmall?.copyWith(
                color: colors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        else
          Text(
            text,
            style: textTheme.labelSmall?.copyWith(
              color: colors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sizes.s8, vertical: sizes.s4),
      decoration: BoxDecoration(
        color: colors.gray10,
        borderRadius: borderRadius.br8,
      ),
      child: content,
    );
  }
}
