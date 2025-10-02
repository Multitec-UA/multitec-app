import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/router/app_router.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/components/lists/mt_list_tile.dart';
import 'package:multitec_app/core/ui/design/foundations/spacings.dart';
import 'package:multitec_app/core/ui/design/theme/app_colors_extension.dart';
import 'package:multitec_app/features/auth/presentation/widgets/sign_out_button.dart';
import 'package:multitec_app/features/settings/presentation/widgets/language_selector.dart';
import 'package:multitec_app/features/settings/presentation/widgets/settings_section.dart';
import 'package:multitec_app/features/settings/presentation/widgets/theme_selector.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: const MultitecAppBar(showTitleLogo: false, title: 'Ajustes'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _PreferencesSection(),
            spacings.y.s24,
            const _HelpSection(),
            spacings.y.s24,
            const _AccountSection(),
            spacings.y.s16,
          ],
        ),
      ),
    );
  }
}

class _PreferencesSection extends StatelessWidget {
  const _PreferencesSection();

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: 'Preferencias',
      children: [
        const LanguageSelector(),
        spacings.y.s16,
        const ThemeSelector(),
      ],
    );
  }
}

class _HelpSection extends StatelessWidget {
  const _HelpSection();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SettingsSection(
      title: 'Ayuda',
      children: [
        MTSettingsTile(
          title: 'Ayuda y Feedback',
          subtitle: 'Obtener ayuda y enviar comentarios',
          leading: Icon(Icons.help_outline, color: colors.primaryBase),
          onTap: () => context.pushNamed(AppRoute.helpAndFeedback.name),
        ),
      ],
    );
  }
}

class _AccountSection extends StatelessWidget {
  const _AccountSection();

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: 'Cuenta',
      children: [const SignOutButton(), spacings.y.s24],
    );
  }
}
