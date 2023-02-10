import 'package:flutter/material.dart';
import 'package:goshop/src/config/theme/app_colors.dart';

class AppTheme {
  static ThemeData get appTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Dana',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.scaffold,
      dividerColor: AppColors.divider,
      colorScheme: const ColorScheme.light(),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.icon,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w900,
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: TextStyle(
          color: Color(0xFF171725),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: Color(0xFF171725),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        overline: TextStyle(
          color: Color(0xFF696974),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        subtitle1: TextStyle(
          color: Color(0xFF696974),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        button: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        caption: TextStyle(
          color: Color(0xFF44444F),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        hintStyle: TextStyle(
          color: AppColors.hint,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
