import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/theme/colors.dart';

extension AppStylingContext on BuildContext {
  AppColors get colors => AppTheme.of(this).colors;
}

class AppThemeConfig {
  AppThemeConfig({required this.themeMode})
      : colors = themeMode == ThemeMode.light ? LightColors() : DarkColors();

  final ThemeMode themeMode;
  final AppColors colors;

  bool get isLight => themeMode == ThemeMode.light;
}

class AppThemeProvider extends StatelessWidget {
  const AppThemeProvider({
    required this.child,
    required this.themeMode,
    super.key,
  });

  final Widget child;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      theme: AppThemeConfig(themeMode: themeMode),
      child: child,
    );
  }
}

class AppTheme extends InheritedWidget {
  const AppTheme({
    required AppThemeConfig theme,
    required super.child,
    super.key,
  }) : _themeConfig = theme;

  final AppThemeConfig _themeConfig;

  AppColors get colors => _themeConfig.colors;
  bool get isLight => _themeConfig.isLight;

  static AppTheme of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null, 'No AppTheme found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) =>
      _themeConfig.themeMode != oldWidget._themeConfig.themeMode;
}
