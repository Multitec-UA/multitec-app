import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';
import 'package:multitec_app/core/ui/theme/context_theme_extension.dart';
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
            text: 'Al continuar aceptas nuestra ',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          TextSpan(
            text: 'política de privacidad',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.primaryBase,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = _launchPrivacyPolicy,
          ),
          TextSpan(
            text: '.',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Future<void> _launchPrivacyPolicy() async {
    final uri = Uri.parse('https://www.google.com');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
