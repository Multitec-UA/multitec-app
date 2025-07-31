import 'package:flutter/material.dart';
import 'package:sq1_assignment/core/ui/styles/spacings.dart';
import 'package:sq1_assignment/core/ui/styles/theme/colors.dart';

final _baseTheme = ThemeData(useMaterial3: true);
final LightColors lightColors = LightColors();
final DarkColors darkColors = DarkColors();

final themeLight = _baseTheme.copyWith(
  // General theme colors
  scaffoldBackgroundColor: lightColors.background,
  colorScheme: ColorScheme.light(
    primary: lightColors.primary,
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
    headlineMedium: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 20,
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
      color: lightColors.textSecondary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(color: lightColors.textPrimary, fontSize: 16),
    bodyMedium: TextStyle(color: lightColors.textPrimary, fontSize: 14),
    bodySmall: TextStyle(color: lightColors.textSecondary, fontSize: 12),
    labelLarge: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ),
  sliderTheme: SliderThemeData(
    padding: paddings.x.s8,
    valueIndicatorColor: lightColors.primary,
    valueIndicatorTextStyle: TextStyle(color: lightColors.textPrimary),
    valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
    showValueIndicator: ShowValueIndicator.always,
    trackHeight: 6,
    inactiveTrackColor: lightColors.primary.withValues(alpha: 0.5),
  ),
  // AppBar theme
  appBarTheme: AppBarTheme(
    backgroundColor: lightColors.background,
    elevation: 0,
    iconTheme: IconThemeData(color: lightColors.secondary),
    titleTextStyle: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),

  // Card theme
  cardTheme: CardThemeData(
    color: lightColors.surface,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  ),

  // Button themes
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColors.primary,
      foregroundColor: Colors.white,
      elevation: 2,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: lightColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: lightColors.primary,
      side: BorderSide(color: lightColors.primary),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  // Input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: lightColors.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: lightColors.gray300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: lightColors.gray300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: lightColors.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: lightColors.error),
    ),
    labelStyle: TextStyle(color: lightColors.textSecondary),
    hintStyle: TextStyle(color: lightColors.gray400),
  ),

  // Switch theme
  switchTheme: SwitchThemeData(
    trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.transparent;
      }
      return lightColors.gray400;
    }),
    thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return lightColors.primary;
      }
      return lightColors.gray400;
    }),
    trackColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return lightColors.primary.withValues(alpha: 0.5);
      }
      return lightColors.gray300;
    }),
  ),

  // Checkbox theme
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return lightColors.primary;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.all(Colors.white),
    side: BorderSide(color: lightColors.gray400),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ),

  // Divider theme
  dividerTheme: DividerThemeData(
    color: lightColors.gray200,
    thickness: 1,
    space: 16,
  ),

  // Bottom navigation theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightColors.surface,
    selectedItemColor: lightColors.primary,
    unselectedItemColor: lightColors.gray400,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),
  chipTheme: ChipThemeData(
    selectedColor: lightColors.primary,
    secondaryLabelStyle: const TextStyle(fontSize: 14, color: Colors.white),
    labelStyle: TextStyle(fontSize: 14, color: lightColors.textPrimary),
  ),
);

final themeDark = _baseTheme.copyWith(
  // General theme colors
  scaffoldBackgroundColor: darkColors.background,
  colorScheme: ColorScheme.dark(
    primary: darkColors.primary,
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
    headlineMedium: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 20,
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
      color: darkColors.textSecondary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(color: darkColors.textPrimary, fontSize: 16),
    bodyMedium: TextStyle(color: darkColors.textPrimary, fontSize: 14),
    bodySmall: TextStyle(color: darkColors.textSecondary, fontSize: 12),
    labelLarge: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ),

  // AppBar theme
  appBarTheme: AppBarTheme(
    backgroundColor: darkColors.background,
    elevation: 0,
    iconTheme: IconThemeData(color: darkColors.secondary),
    titleTextStyle: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),

  // Card theme
  cardTheme: CardThemeData(
    color: darkColors.surface,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  ),

  // Button themes
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkColors.primary,
      foregroundColor: Colors.white,
      elevation: 2,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: darkColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: darkColors.primary,
      side: BorderSide(color: darkColors.primary),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  // Input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: darkColors.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: darkColors.gray300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: darkColors.gray300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: darkColors.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: darkColors.error),
    ),
    labelStyle: TextStyle(color: darkColors.textSecondary),
    hintStyle: TextStyle(color: darkColors.gray400),
  ),

  // Slider theme
  sliderTheme: SliderThemeData(
    padding: paddings.x.s8,
    valueIndicatorColor: darkColors.primary,
    valueIndicatorTextStyle: TextStyle(color: darkColors.textPrimary),
    valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
    showValueIndicator: ShowValueIndicator.always,
    trackHeight: 6,
    inactiveTrackColor: darkColors.primary.withValues(alpha: 0.5),
  ),

  // Switch theme
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return darkColors.primary;
      }
      return darkColors.gray400;
    }),
    trackColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return darkColors.primary.withValues(alpha: 0.5);
      }
      return darkColors.gray500;
    }),
  ),

  // Checkbox theme
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return darkColors.primary;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.all(Colors.white),
    side: BorderSide(color: darkColors.gray400),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ),

  // Divider theme
  dividerTheme: DividerThemeData(
    color: darkColors.gray600,
    thickness: 1,
    space: 16,
  ),

  // Bottom navigation theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkColors.surface,
    selectedItemColor: darkColors.primary,
    unselectedItemColor: darkColors.gray400,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),
);
