import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/theme/app_colors.dart';

@immutable
class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  const AppColorsTheme({required this.colors});

  final AppColors colors;

  @override
  AppColorsTheme lerp(ThemeExtension<AppColorsTheme>? other, double t) =>
      other is AppColorsTheme ? other : this;

  @override
  AppColorsTheme copyWith({AppColors? colors}) =>
      AppColorsTheme(colors: colors ?? this.colors);

  static const AppColorsTheme light = AppColorsTheme(colors: LightColors());
  static const AppColorsTheme dark = AppColorsTheme(colors: DarkColors());
}

extension AppStylingContext on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColorsTheme>()!.colors;
}
