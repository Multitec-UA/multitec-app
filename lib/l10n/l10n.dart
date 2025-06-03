import 'package:flutter/widgets.dart';
import 'package:sq1_assignment/l10n/gen/app_localizations.dart';

export 'package:sq1_assignment/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
