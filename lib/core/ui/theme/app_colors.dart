import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors();

  Color get primary10;
  Color get primary20;
  Color get primary30;
  Color get primary40;
  Color get primaryBase;
  Color get primary60;
  Color get primary70;

  Color get secondary;

  Color get background;
  Color get surface;
  Color get textPrimary;
  Color get textSecondary;

  Color get error;
  Color get warning;
  Color get success;
  Color get info;

  Color get gray10;
  Color get gray20;
  Color get gray30;
  Color get gray40;
  Color get gray50;
}

class LightColors extends AppColors {
  const LightColors();

  @override
  Color get primary10 => const Color(0xFFFF9CA0);
  @override
  Color get primary20 => const Color(0xFFFF3A41);
  @override
  Color get primary30 => const Color(0xFFFF0009);
  @override
  Color get primary40 => const Color(0xFFDB0008);
  @override
  Color get primaryBase => const Color(0xFFA30006);
  @override
  Color get primary60 => const Color(0xFF630004);
  @override
  Color get primary70 => const Color(0xFF330002);

  @override
  Color get secondary => const Color(0xFFBCBFBE);

  @override
  Color get background => const Color(0xFFF6F6F6);
  @override
  Color get surface => const Color(0xFFFFFFFF);
  @override
  Color get textPrimary => const Color(0xFF212121);
  @override
  Color get textSecondary => const Color(0xFF757575);

  @override
  Color get error => const Color(0xFFE74C3C);
  @override
  Color get warning => const Color(0xFFF5B041);
  @override
  Color get success => const Color(0xFF2ECC71);
  @override
  Color get info => const Color(0xFF3498DB);

  @override
  Color get gray10 => const Color(0xFFF6F6F6);
  @override
  Color get gray20 => const Color(0xFFDEE5E5);
  @override
  Color get gray30 => const Color(0xFF7C8484);
  @override
  Color get gray40 => const Color(0xFF505353);
  @override
  Color get gray50 => const Color(0xFF1E2121);
}

class DarkColors extends AppColors {
  const DarkColors();

  @override
  Color get primary10 => const Color(0xFFFF9CA0);
  @override
  Color get primary20 => const Color(0xFFFF3A41);
  @override
  Color get primary30 => const Color(0xFFFF0009);
  @override
  Color get primary40 => const Color(0xFFDB0008);
  @override
  Color get primaryBase => const Color(0xFFA30006);
  @override
  Color get primary60 => const Color(0xFF630004);
  @override
  Color get primary70 => const Color(0xFF330002);

  @override
  Color get secondary => const Color(0xFFBCBFBE);

  @override
  Color get background => const Color(0xFF121212);
  @override
  Color get surface => const Color(0xFF1E1E1E);
  @override
  Color get textPrimary => const Color(0xFFEEEEEE);
  @override
  Color get textSecondary => const Color(0xFFAAAAAA);

  @override
  Color get error => const Color(0xFFE57373);
  @override
  Color get warning => const Color(0xFFFFD54F);
  @override
  Color get success => const Color(0xFF81C784);
  @override
  Color get info => const Color(0xFF64B5F6);

  @override
  Color get gray10 => const Color(0xFF1E2121);
  @override
  Color get gray20 => const Color(0xFF505353);
  @override
  Color get gray30 => const Color(0xFF7C8484);
  @override
  Color get gray40 => const Color(0xFFDEE5E5);
  @override
  Color get gray50 => const Color(0xFFF6F6F6);
}
