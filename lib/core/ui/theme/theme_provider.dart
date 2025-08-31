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

class AppThemeProvider extends StatefulWidget {
  const AppThemeProvider({
    required this.child,
    this.defaultThemeMode = ThemeMode.dark,
    super.key,
  });

  final Widget child;
  final ThemeMode defaultThemeMode;

  @override
  State<AppThemeProvider> createState() => AppThemeProviderState();
}

class AppThemeProviderState extends State<AppThemeProvider> {
  late final ThemeMode defaultThemeMode = widget.defaultThemeMode;
  ThemeMode? _forcedThemeMode;

  void _toggle() {
    setState(() {
      _forcedThemeMode =
          _forcedThemeMode == null || _forcedThemeMode == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      theme: AppThemeConfig(themeMode: _forcedThemeMode ?? defaultThemeMode),
      toggle: _toggle,
      child: widget.child,
    );
  }
}

class AppTheme extends InheritedWidget {
  const AppTheme({
    required AppThemeConfig theme,
    required this.toggle,
    required super.child,
    super.key,
  }) : _themeConfig = theme;

  final AppThemeConfig _themeConfig;

  final void Function() toggle;

  AppColors get colors => _themeConfig.colors;

  bool get isLight => _themeConfig.isLight;

  static AppTheme of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(result != null, 'No AppTheme found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) =>
      _themeConfig != oldWidget._themeConfig;
}
