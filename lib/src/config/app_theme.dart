import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final fontBasic = GoogleFonts.roboto(
    color: const Color(0xFF302E33),
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  static ThemeData get appTheme {
    return ThemeData(
      primaryColor: const Color(0xFF062B94),
      backgroundColor: const Color(0xFFF6F6F6),
      hintColor: const Color(0xFF302E33).withOpacity(.3), 
      textTheme: TextTheme(
        headline6: fontBasic.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
        subtitle1: fontBasic,
        subtitle2: fontBasic.copyWith(fontSize: 18),
      ),
      colorScheme: const ColorScheme.light(
        secondary: Color(0xFF302E33),
        outline: Color(0xFF3B3030),
      ),
    );
  }
}
