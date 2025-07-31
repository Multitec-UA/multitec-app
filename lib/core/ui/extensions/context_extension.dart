import 'package:flutter/material.dart';
import 'package:sq1_assignment/core/ui/components/snack_bar.dart';

extension ContextExtension on BuildContext {
  void showSnackBar(AppSnackBar snackBar) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
