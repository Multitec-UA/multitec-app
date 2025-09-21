import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/theme/app_colors.dart';
import 'package:multitec_app/core/ui/theme/app_colors_extension.dart';

final _baseTheme = ThemeData(useMaterial3: true);
const lightColors = LightColors();
const darkColors = DarkColors();

final themeLight = _baseTheme.copyWith(
  extensions: const <ThemeExtension<dynamic>>[AppColorsTheme.light],

  // General theme colors
  scaffoldBackgroundColor: lightColors.background,
  colorScheme: ColorScheme.light(
    primary: lightColors.primaryBase,
    secondary: lightColors.secondary,
    surface: lightColors.surface,
    surfaceContainer: lightColors.background,
    error: lightColors.error,
    onSecondary: Colors.white,
    onSurface: lightColors.textPrimary,
    onSurfaceVariant: lightColors.textPrimary,
  ),

  // Text theme
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      color: lightColors.textPrimary,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(color: lightColors.textPrimary, fontSize: 16),
    bodyMedium: TextStyle(color: lightColors.textPrimary, fontSize: 14),
    bodySmall: TextStyle(color: lightColors.textPrimary, fontSize: 12),
    labelLarge: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: lightColors.background,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: lightColors.background,
    elevation: 0,
    selectedItemColor: lightColors.primaryBase,
    unselectedItemColor: lightColors.secondary,
    selectedIconTheme: const IconThemeData(size: 24),
    unselectedIconTheme: const IconThemeData(size: 24),
    showUnselectedLabels: false,
    showSelectedLabels: false,
  ),
);

final themeDark = _baseTheme.copyWith(
  extensions: const <ThemeExtension<dynamic>>[AppColorsTheme.dark],

  // General theme colors
  scaffoldBackgroundColor: darkColors.background,
  colorScheme: ColorScheme.dark(
    primary: darkColors.primaryBase,
    secondary: darkColors.secondary,
    surface: darkColors.surface,
    surfaceContainer: darkColors.background,
    error: darkColors.error,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: darkColors.textPrimary,
    onSurfaceVariant: darkColors.textPrimary,
    onError: Colors.white,
  ),

  // Text theme
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      color: darkColors.textPrimary,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(color: darkColors.textPrimary, fontSize: 16),
    bodyMedium: TextStyle(color: darkColors.textPrimary, fontSize: 14),
    bodySmall: TextStyle(color: darkColors.textPrimary, fontSize: 12),
    labelLarge: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: darkColors.background,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: darkColors.background,
    elevation: 0,
    selectedItemColor: darkColors.primaryBase,
    unselectedItemColor: darkColors.secondary,
    selectedIconTheme: const IconThemeData(size: 24),
    unselectedIconTheme: const IconThemeData(size: 24),
    showUnselectedLabels: false,
    showSelectedLabels: false,
  ),
);
