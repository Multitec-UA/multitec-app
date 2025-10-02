import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/design/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

//TODO: Ver si dejar este nombre u otro
class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: context.l10n.privacyPolicyPrefix,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          TextSpan(
            text: context.l10n.privacyPolicyLinkText,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.primaryBase,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _launchPrivacyPolicy(context),
          ),
          TextSpan(
            text: context.l10n.privacyPolicySuffix,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Future<void> _launchPrivacyPolicy(BuildContext context) async {
    final uri = Uri.parse(AppLocalizations.of(context).privacyPolicyUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
