import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/design/foundations/foundations.dart';
import 'package:multitec_app/core/ui/design/theme/app_colors.dart';
import 'package:multitec_app/core/ui/design/theme/app_colors_extension.dart';

final _baseTheme = ThemeData(useMaterial3: true);
const lightColors = LightColors();
const darkColors = DarkColors();

final themeLight = _baseTheme.copyWith(
  extensions: const <ThemeExtension<dynamic>>[AppColorsTheme.light],

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
    elevation: UIConstants.bottomNavElevation,
    selectedItemColor: lightColors.primaryBase,
    unselectedItemColor: lightColors.textSecondary,
    selectedIconTheme: const IconThemeData(size: 24),
    unselectedIconTheme: const IconThemeData(size: 24),
    showUnselectedLabels: false,
    showSelectedLabels: false,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: UIConstants.buttonElevation,
      shadowColor: lightColors.gray20.withValues(
        alpha: UIConstants.shadowOpacity,
      ),
      shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.br12),
      backgroundColor: lightColors.primaryBase,
      foregroundColor: Colors.white,
      disabledBackgroundColor: lightColors.gray20,
      disabledForegroundColor: lightColors.textSecondary,
      padding: EdgeInsets.symmetric(vertical: sizes.s16, horizontal: sizes.s24),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),

  cardTheme: CardThemeData(
    elevation: UIConstants.cardElevation,
    shadowColor: lightColors.gray20.withValues(
      alpha: UIConstants.shadowOpacity,
    ),
    shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.br16),
    color: lightColors.surface,
    margin: EdgeInsets.zero,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: lightColors.gray10,
    border: const OutlineInputBorder(
      borderRadius: AppBorderRadius.br10,
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: AppBorderRadius.br10,
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.br10,
      borderSide: BorderSide(
        color: lightColors.primaryBase,
        width: UIConstants.focusedBorderWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.br10,
      borderSide: BorderSide(
        color: lightColors.error,
        width: UIConstants.errorBorderWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.br10,
      borderSide: BorderSide(
        color: lightColors.error,
        width: UIConstants.errorBorderWidth,
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

  listTileTheme: ListTileThemeData(
    contentPadding: paddings.all.s16,
    shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.br12),
    tileColor: lightColors.surface,
    selectedTileColor: lightColors.primaryBase.withValues(
      alpha: UIConstants.overlayOpacity,
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

  dialogTheme: DialogThemeData(
    elevation: UIConstants.modalElevation,
    shadowColor: lightColors.gray20.withValues(
      alpha: UIConstants.shadowOpacity,
    ),
    shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.br16),
    backgroundColor: lightColors.surface,
    titleTextStyle: TextStyle(
      color: lightColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    contentTextStyle: TextStyle(color: lightColors.textPrimary, fontSize: 14),
  ),

  bottomSheetTheme: BottomSheetThemeData(
    elevation: UIConstants.modalElevation,
    shadowColor: lightColors.gray20.withValues(
      alpha: UIConstants.shadowOpacity,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppBorderRadius.br16.topLeft.x),
        topRight: Radius.circular(AppBorderRadius.br16.topRight.x),
      ),
    ),
    backgroundColor: lightColors.surface,
  ),

  snackBarTheme: SnackBarThemeData(
    elevation: UIConstants.cardElevation,
    shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.br12),
    behavior: SnackBarBehavior.floating,
    backgroundColor: lightColors.gray50,
    contentTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
    actionTextColor: lightColors.primaryBase,
  ),
);

final themeDark = _baseTheme.copyWith(
  extensions: const <ThemeExtension<dynamic>>[AppColorsTheme.dark],

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
    elevation: UIConstants.bottomNavElevation,
    selectedItemColor: darkColors.primaryBase,
    unselectedItemColor: darkColors.textSecondary,
    selectedIconTheme: const IconThemeData(size: 24),
    unselectedIconTheme: const IconThemeData(size: 24),
    showUnselectedLabels: false,
    showSelectedLabels: false,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: UIConstants.buttonElevation,
      shadowColor: darkColors.gray20.withValues(
        alpha: UIConstants.shadowOpacity,
      ),
      shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.br12),
      backgroundColor: darkColors.primaryBase,
      foregroundColor: Colors.white,
      disabledBackgroundColor: darkColors.gray20,
      disabledForegroundColor: darkColors.textSecondary,
      padding: EdgeInsets.symmetric(vertical: sizes.s16, horizontal: sizes.s24),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),

  cardTheme: CardThemeData(
    elevation: UIConstants.cardElevation,
    shadowColor: darkColors.gray20.withValues(alpha: UIConstants.shadowOpacity),
    shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.br16),
    color: darkColors.surface,
    margin: EdgeInsets.zero,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: darkColors.gray10,
    border: const OutlineInputBorder(
      borderRadius: AppBorderRadius.br10,
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: AppBorderRadius.br10,
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.br10,
      borderSide: BorderSide(
        color: darkColors.primaryBase,
        width: UIConstants.focusedBorderWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.br10,
      borderSide: BorderSide(
        color: darkColors.error,
        width: UIConstants.errorBorderWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppBorderRadius.br10,
      borderSide: BorderSide(
        color: darkColors.error,
        width: UIConstants.errorBorderWidth,
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

  listTileTheme: ListTileThemeData(
    contentPadding: paddings.all.s16,
    shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.br12),
    tileColor: darkColors.surface,
    selectedTileColor: darkColors.primaryBase.withValues(
      alpha: UIConstants.overlayOpacity,
    ),
    iconColor: darkColors.textSecondary,
    textColor: darkColors.textPrimary,
    titleTextStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    subtitleTextStyle: TextStyle(fontSize: 14, color: darkColors.textSecondary),
  ),

  dialogTheme: DialogThemeData(
    elevation: UIConstants.modalElevation,
    shadowColor: darkColors.gray20.withValues(alpha: UIConstants.shadowOpacity),
    shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.br16),
    backgroundColor: darkColors.surface,
    titleTextStyle: TextStyle(
      color: darkColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    contentTextStyle: TextStyle(color: darkColors.textPrimary, fontSize: 14),
  ),

  bottomSheetTheme: BottomSheetThemeData(
    elevation: UIConstants.modalElevation,
    shadowColor: darkColors.gray20.withValues(alpha: UIConstants.shadowOpacity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppBorderRadius.br16.topLeft.x),
        topRight: Radius.circular(AppBorderRadius.br16.topRight.x),
      ),
    ),
    backgroundColor: darkColors.surface,
  ),

  snackBarTheme: SnackBarThemeData(
    elevation: UIConstants.cardElevation,
    shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.br12),
    behavior: SnackBarBehavior.floating,
    backgroundColor: darkColors.gray50,
    contentTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
    actionTextColor: darkColors.primaryBase,
  ),
);
