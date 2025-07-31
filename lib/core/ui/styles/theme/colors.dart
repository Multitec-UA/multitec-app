import 'package:flutter/material.dart';

abstract class AppColors {
  // Main colors
  Color get primary;
  Color get secondary;
  Color get textBackground;

  // Background and text
  Color get background;
  Color get surface;
  Color get textPrimary;
  Color get textSecondary;

  // Semantic colors
  Color get error;
  Color get warning;
  Color get success;
  Color get info;

  // Gray scale
  Color get gray100;
  Color get gray200;
  Color get gray300;
  Color get gray400;
  Color get gray500;
  Color get gray600;
  Color get gray700;
}

class LightColors extends AppColors {
  // Main colors - green shades from the image
  @override
  final primary = const Color(0xFF5DC288); // Light green
  @override
  final secondary = const Color(0xFF2D7A59); // Dark green

  // Background and text
  @override
  final background = const Color.fromARGB(255, 255, 255, 255);
  @override
  final surface = const Color(0xFFFFFFFF);
  @override
  final textPrimary = const Color(0xFF212121);
  @override
  final textSecondary = const Color(0xFF757575);
  @override
  final textBackground = const Color(0xFF1E1E1E);

  // Semantic colors from the image
  @override
  final error = const Color(0xFFE74C3C); // Red
  @override
  final warning = const Color(0xFFF5B041); // Yellow/Orange
  @override
  final success = const Color(0xFF2ECC71); // Green
  @override
  final info = const Color(0xFF3498DB); // Blue

  // Gray scale from the image
  @override
  final gray100 = const Color(0xFFF5F5F5);
  @override
  final gray200 = const Color(0xFFE0E0E0);
  @override
  final gray300 = const Color(0xFFBDBDBD);
  @override
  final gray400 = const Color(0xFF9E9E9E);
  @override
  final gray500 = const Color(0xFF757575);
  @override
  final gray600 = const Color(0xFF424242);
  @override
  final gray700 = const Color(0xFF212121);
}

class DarkColors extends AppColors {
  // Main colors - adjusted for dark theme
  @override
  final primary = const Color(0xFF4DB277); // Slightly darker green for dark theme
  @override
  final secondary = const Color(0xFF266A4A); // Darker green for dark theme

  // Background and text
  @override
  final background = const Color(0xFF121212);
  @override
  final surface = const Color(0xFF1E1E1E);
  @override
  final textPrimary = const Color(0xFFEEEEEE);
  @override
  final textSecondary = const Color(0xFFAAAAAA);
  @override
  final textBackground = const Color.fromARGB(255, 255, 255, 255);

  // Semantic colors - slightly muted for d ark theme
  @override
  final error = const Color(0xFFE57373); // Muted red
  @override
  final warning = const Color(0xFFFFD54F); // Muted yellow
  @override
  final success = const Color(0xFF81C784); // Muted green
  @override
  final info = const Color(0xFF64B5F6); // Muted blue

  // Gray scale - inverted for dark theme
  @override
  final gray100 = const Color(0xFF212121);
  @override
  final gray200 = const Color(0xFF424242);
  @override
  final gray300 = const Color(0xFF616161);
  @override
  final gray400 = const Color(0xFF757575);
  @override
  final gray500 = const Color(0xFF9E9E9E);
  @override
  final gray600 = const Color(0xFFE0E0E0);
  @override
  final gray700 = const Color(0xFFF5F5F5);
}
