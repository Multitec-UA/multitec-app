import 'package:flutter/material.dart';

import 'package:multitec_app/core/ui/styles/border_radius.dart';
import 'package:multitec_app/core/ui/styles/mt_style_config.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
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
    backgroundColor: lightColors.background.withValues(alpha: 0.95),
    elevation: MTStyleConfig.bottomNavElevation,
    selectedItemColor: lightColors.primaryBase,
    unselectedItemColor: lightColors.textSecondary,
    selectedIconTheme: const IconThemeData(size: 24),
    unselectedIconTheme: const IconThemeData(size: 24),
    showUnselectedLabels: false,
    showSelectedLabels: false,
  ),

  // ElevatedButton theme configuration
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: MTStyleConfig.buttonElevation,
      shadowColor: lightColors.gray20.withValues(
        alpha: MTStyleConfig.shadowOpacity,
      ),
      shape: RoundedRectangleBorder(borderRadius: borderRadius.br12),
      backgroundColor: lightColors.primaryBase,
      foregroundColor: Colors.white,
      disabledBackgroundColor: lightColors.gray20,
      disabledForegroundColor: lightColors.textSecondary,
      padding: EdgeInsets.symmetric(vertical: sizes.s16, horizontal: sizes.s24),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),

  // Card theme configuration
  cardTheme: CardThemeData(
    elevation: MTStyleConfig.cardElevation,
    shadowColor: lightColors.gray20.withValues(
      alpha: MTStyleConfig.shadowOpacity,
    ),
    shape: RoundedRectangleBorder(borderRadius: borderRadius.br16),
    color: lightColors.surface,
    margin: EdgeInsets.zero,
  ),

  // InputDecoration theme configuration
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: lightColors.gray10,
    border: OutlineInputBorder(
      borderRadius: borderRadius.br10,
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: borderRadius.br10,
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: borderRadius.br10,
      borderSide: BorderSide(
        color: lightColors.primaryBase,
        width: MTStyleConfig.focusedBorderWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: borderRadius.br10,
      borderSide: BorderSide(
        color: lightColors.error,
        width: MTStyleConfig.errorBorderWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: borderRadius.br10,
      borderSide: BorderSide(
        color: lightColors.error,
        width: MTStyleConfig.errorBorderWidth,
      ),
    ),
    contentPadding: paddings.all.s16,
    hintStyle: TextStyle(color: lightColors.textSecondary, fontSize: 16),
    labelStyle: TextStyle(
      color: lightColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    floatingLabelStyle: TextStyle(
      color: lightColors.primaryBase,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    errorStyle: TextStyle(color: lightColors.error, fontSize: 12),
  ),

  // ListTile theme configuration
  listTileTheme: ListTileThemeData(
    contentPadding: paddings.all.s16,
    shape: RoundedRectangleBorder(borderRadius: borderRadius.br12),
    tileColor: lightColors.surface,
    selectedTileColor: lightColors.primaryBase.withValues(
      alpha: MTStyleConfig.overlayOpacity,
    ),
    iconColor: lightColors.textSecondary,
    textColor: lightColors.textPrimary,
    titleTextStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    subtitleTextStyle: TextStyle(
      fontSize: 14,
      color: lightColors.textSecondary,
    ),
  ),

  // Dialog theme configuration
  dialogTheme: DialogThemeData(
    elevation: MTStyleConfig.modalElevation,
    shadowColor: lightColors.gray20.withValues(
      alpha: MTStyleConfig.shadowOpacity,
    ),
    shape: RoundedRectangleBorder(borderRadius: borderRadius.br16),
    backgroundColor: lightColors.surface,
    titleTextStyle: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    contentTextStyle: TextStyle(color: lightColors.textPrimary, fontSize: 14),
  ),

  // BottomSheet theme configuration
  bottomSheetTheme: BottomSheetThemeData(
    elevation: MTStyleConfig.modalElevation,
    shadowColor: lightColors.gray20.withValues(
      alpha: MTStyleConfig.shadowOpacity,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius.br16.topLeft.x),
        topRight: Radius.circular(borderRadius.br16.topRight.x),
      ),
    ),
    backgroundColor: lightColors.surface,
  ),

  // SnackBar theme configuration
  snackBarTheme: SnackBarThemeData(
    elevation: MTStyleConfig.cardElevation,
    shape: RoundedRectangleBorder(borderRadius: borderRadius.br12),
    behavior: SnackBarBehavior.floating,
    backgroundColor: lightColors.gray50,
    contentTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
    actionTextColor: lightColors.primaryBase,
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
    backgroundColor: darkColors.background.withValues(alpha: 0.95),
    elevation: MTStyleConfig.bottomNavElevation,
    selectedItemColor: darkColors.primaryBase,
    unselectedItemColor: darkColors.textSecondary,
    selectedIconTheme: const IconThemeData(size: 24),
    unselectedIconTheme: const IconThemeData(size: 24),
    showUnselectedLabels: false,
    showSelectedLabels: false,
  ),

  // ElevatedButton theme configuration
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: MTStyleConfig.buttonElevation,
      shadowColor: darkColors.gray20.withValues(
        alpha: MTStyleConfig.shadowOpacity,
      ),
      shape: RoundedRectangleBorder(borderRadius: borderRadius.br12),
      backgroundColor: darkColors.primaryBase,
      foregroundColor: Colors.white,
      disabledBackgroundColor: darkColors.gray20,
      disabledForegroundColor: darkColors.textSecondary,
      padding: EdgeInsets.symmetric(vertical: sizes.s16, horizontal: sizes.s24),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),

  // Card theme configuration
  cardTheme: CardThemeData(
    elevation: MTStyleConfig.cardElevation,
    shadowColor: darkColors.gray20.withValues(
      alpha: MTStyleConfig.shadowOpacity,
    ),
    shape: RoundedRectangleBorder(borderRadius: borderRadius.br16),
    color: darkColors.surface,
    margin: EdgeInsets.zero,
  ),

  // InputDecoration theme configuration
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: darkColors.gray10,
    border: OutlineInputBorder(
      borderRadius: borderRadius.br10,
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: borderRadius.br10,
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: borderRadius.br10,
      borderSide: BorderSide(
        color: darkColors.primaryBase,
        width: MTStyleConfig.focusedBorderWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: borderRadius.br10,
      borderSide: BorderSide(
        color: darkColors.error,
        width: MTStyleConfig.errorBorderWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: borderRadius.br10,
      borderSide: BorderSide(
        color: darkColors.error,
        width: MTStyleConfig.errorBorderWidth,
      ),
    ),
    contentPadding: paddings.all.s16,
    hintStyle: TextStyle(color: darkColors.textSecondary, fontSize: 16),
    labelStyle: TextStyle(
      color: darkColors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    floatingLabelStyle: TextStyle(
      color: darkColors.primaryBase,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    errorStyle: TextStyle(color: darkColors.error, fontSize: 12),
  ),

  // ListTile theme configuration
  listTileTheme: ListTileThemeData(
    contentPadding: paddings.all.s16,
    shape: RoundedRectangleBorder(borderRadius: borderRadius.br12),
    tileColor: darkColors.surface,
    selectedTileColor: darkColors.primaryBase.withValues(
      alpha: MTStyleConfig.overlayOpacity,
    ),
    iconColor: darkColors.textSecondary,
    textColor: darkColors.textPrimary,
    titleTextStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    subtitleTextStyle: TextStyle(fontSize: 14, color: darkColors.textSecondary),
  ),

  // Dialog theme configuration
  dialogTheme: DialogThemeData(
    elevation: MTStyleConfig.modalElevation,
    shadowColor: darkColors.gray20.withValues(
      alpha: MTStyleConfig.shadowOpacity,
    ),
    shape: RoundedRectangleBorder(borderRadius: borderRadius.br16),
    backgroundColor: darkColors.surface,
    titleTextStyle: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    contentTextStyle: TextStyle(color: darkColors.textPrimary, fontSize: 14),
  ),

  // BottomSheet theme configuration
  bottomSheetTheme: BottomSheetThemeData(
    elevation: MTStyleConfig.modalElevation,
    shadowColor: darkColors.gray20.withValues(
      alpha: MTStyleConfig.shadowOpacity,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius.br16.topLeft.x),
        topRight: Radius.circular(borderRadius.br16.topRight.x),
      ),
    ),
    backgroundColor: darkColors.surface,
  ),

  // SnackBar theme configuration
  snackBarTheme: SnackBarThemeData(
    elevation: MTStyleConfig.cardElevation,
    shape: RoundedRectangleBorder(borderRadius: borderRadius.br12),
    behavior: SnackBarBehavior.floating,
    backgroundColor: darkColors.gray50,
    contentTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
    actionTextColor: darkColors.primaryBase,
  ),
);
