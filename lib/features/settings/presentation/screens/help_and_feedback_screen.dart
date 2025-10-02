import 'package:flutter/material.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/components/lists/mt_list_tile.dart';
import 'package:multitec_app/core/ui/design/foundations/spacings.dart';
import 'package:multitec_app/core/ui/design/theme/app_colors_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpAndFeedbackScreen extends StatelessWidget {
  const HelpAndFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: MultitecAppBar(
        showTitleLogo: false,
        title: context.l10n.helpAndFeedbackTitle,
      ),
      body: Padding(
        padding: paddings.all.s16,
        child: Column(
          children: [
            spacings.y.s16,
            MTSettingsTile(
              title: context.l10n.contactDeveloperTitle,
              subtitle: context.l10n.contactDeveloperSubtitle,
              leading: Icon(Icons.coffee, color: context.colors.primaryBase),
              onTap: () async {
                const email = 'davidgab08@gmail.com';
                final subject = context.l10n.contactDeveloperEmailSubject;
                final body = context.l10n.contactDeveloperEmailBody;
                await _launchEmail(email: email, subject: subject, body: body);
              },
            ),
            spacings.y.s20,
            MTSettingsTile(
              title: context.l10n.reportBugTitle,
              subtitle: context.l10n.reportBugSubtitle,
              leading: Icon(
                Icons.bug_report_rounded,
                color: context.colors.primaryBase,
              ),
              onTap: () async {
                const email = 'davidgab08@gmail.com';
                final subject = context.l10n.reportBugEmailSubject;
                final body = context.l10n.reportBugEmailBody;
                await _launchEmail(email: email, subject: subject, body: body);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchEmail({
  required String email,
  required String subject,
  required String body,
}) async {
  final uri = Uri.parse(
    'mailto:${Uri.encodeComponent(email)}?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
  );
  await launchUrl(uri);
}
