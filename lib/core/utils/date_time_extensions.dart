import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multitec_app/core/l10n/l10n.dart';

extension DateTimeFormatting on DateTime {
  String toLocalizedFullDate(BuildContext context) {
    return DateFormat('EEEE, MMMM d, y', context.l10n.localeName).format(this);
  }

  String toShortDate(BuildContext context) {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String toTime(BuildContext context) {
    return DateFormat('HH:mm', context.l10n.localeName).format(this);
  }
}
