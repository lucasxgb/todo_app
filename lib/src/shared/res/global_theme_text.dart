import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalThemeText {
  static TextStyle textStyle =
      TextStyle(fontFamily: GoogleFonts.poppins().fontFamily);
  static TextTheme textTheme = TextTheme(
      titleSmall: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      titleMedium:
          textStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
      bodyMedium: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
      labelMedium: textStyle.copyWith(
          fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.2),
      labelSmall: textStyle.copyWith(
          fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.26));
}
