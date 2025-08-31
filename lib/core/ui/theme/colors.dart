import 'package:flutter/material.dart';

abstract class AppColors {
  // Main colors
  Color get primary10;
  Color get primary20;
  Color get primary30;
  Color get primary40;
  Color get primaryBase;
  Color get primary60;
  Color get primary70;

  Color get secondary;

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
  Color get gray10;
  Color get gray20;
  Color get gray30;
  Color get gray40;
  Color get gray50;
}

class LightColors extends AppColors {
  // Main colors
  @override
  final primary10 = const Color(0xFFFF9CA0);
  @override
  final primary20 = const Color(0xFFFF3A41);
  @override
  final primary30 = const Color(0xFFFF0009);
  @override
  final primary40 = const Color(0xFFDB0008);
  @override
  final primaryBase = const Color(0xFFA30006);
  @override
  final primary60 = const Color(0xFF630004);
  @override
  final primary70 = const Color(0xFF330002);

  @override
  final secondary = const Color(0xFFBCBFBE);

  // Background and text
  @override
  final background = const Color(0xFFFFFFFF);
  @override
  final surface = const Color(0xFFFFFFFF);
  @override
  final textPrimary = const Color(0xFF212121);
  @override
  final textSecondary = const Color(0xFF757575);

  // Semantic colors
  @override
  final error = const Color(0xFFE74C3C);
  @override
  final warning = const Color(0xFFF5B041);
  @override
  final success = const Color(0xFF2ECC71);
  @override
  final info = const Color(0xFF3498DB);

  // Gray scale
  @override
  final gray10 = const Color(0xFFF6F6F6);
  @override
  final gray20 = const Color(0xFFDEE5E5);
  @override
  final gray30 = const Color(0xFF7C8484);
  @override
  final gray40 = const Color(0xFF505353);
  @override
  final gray50 = const Color(0xFF1E2121);
}

class DarkColors extends AppColors {
  // Main colors
  @override
  final primary10 = const Color(0xFFFF9CA0);
  @override
  final primary20 = const Color(0xFFFF3A41);
  @override
  final primary30 = const Color(0xFFFF0009);
  @override
  final primary40 = const Color(0xFFDB0008);
  @override
  final primaryBase = const Color(0xFFA30006);
  @override
  final primary60 = const Color(0xFF630004);
  @override
  final primary70 = const Color(0xFF330002);

  @override
  final secondary = const Color(0xFFBCBFBE);

  // Background and text
  @override
  final background = const Color(0xFF121212);
  @override
  final surface = const Color(0xFF1E1E1E);
  @override
  final textPrimary = const Color(0xFFEEEEEE);
  @override
  final textSecondary = const Color(0xFFAAAAAA);

  // Semantic colors
  @override
  final error = const Color(0xFFE57373);
  @override
  final warning = const Color(0xFFFFD54F);
  @override
  final success = const Color(0xFF81C784);
  @override
  final info = const Color(0xFF64B5F6);

  // Gray scale
  @override
  final gray10 = const Color(0xFF1E2121);
  @override
  final gray20 = const Color(0xFF505353);
  @override
  final gray30 = const Color(0xFF7C8484);
  @override
  final gray40 = const Color(0xFFDEE5E5);
  @override
  final gray50 = const Color(0xFFF6F6F6);
}
