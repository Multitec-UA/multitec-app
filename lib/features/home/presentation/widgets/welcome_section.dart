import 'package:flutter/material.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/cards/mt_card.dart';
import 'package:multitec_app/core/ui/design/foundations/spacings.dart';
import 'package:multitec_app/core/ui/design/theme/theme.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({required this.userName, super.key});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return MTCard(
      margin: paddings.all.s16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.l10n.welcomeUser(userName.split(' ')[0])} 🌟',
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
