import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/components/snackbars/snack_bar.dart';

extension ContextExtension on BuildContext {
  void showSnackBar(AppSnackBar snackBar) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
