import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/lists/mt_list_tile.dart';
import 'package:multitec_app/core/ui/design/foundations/foundations.dart';
import 'package:multitec_app/core/ui/design/theme/theme.dart';
import 'package:multitec_app/features/settings/presentation/cubits/locale_cubit.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    const supportedLocales = AppLocalizations.supportedLocales;
    final currentLocale = Localizations.localeOf(context);

    return PopupMenuButton<Locale>(
      position: PopupMenuPosition.under,
      color: context.colors.surface,
      offset: const Offset(0, 4),
      padding: EdgeInsets.zero,
      elevation: 3,
      shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.br12),
      itemBuilder: (context) {
        return supportedLocales.map((locale) {
          final isSelected = locale.languageCode == currentLocale.languageCode;
          final displayName = _getLanguageDisplayName(context, locale);
          return PopupMenuItem<Locale>(
            value: locale,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colors.primaryBase
                    : context.colors.surface,
                borderRadius: AppBorderRadius.br8,
              ),
              padding: paddings.all.s12,
              child: Text(
                displayName,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: isSelected ? Colors.white : context.colors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList();
      },
      onSelected: (value) {
        context.read<LocaleCubit>().setLocale(value);
      },
      child: MTSettingsTile(
        title: context.l10n.languageTitle,
        value: _getLanguageDisplayName(context, currentLocale),
        leading: Icon(Icons.language, color: context.colors.primaryBase),
        showChevron: false,
      ),
    );
  }

  String _getLanguageDisplayName(BuildContext context, Locale locale) {
    switch (locale.languageCode) {
      case 'es':
        return context.l10n.languageSpanish;
      case 'en':
        return context.l10n.languageEnglish;
      default:
        return locale.languageCode.toUpperCase();
    }
  }
}
