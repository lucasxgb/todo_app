import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalThemeText {
  static TextStyle textStyle =
      TextStyle(fontFamily: GoogleFonts.poppins().fontFamily);
  static TextTheme textTheme = TextTheme(
    titleMedium: textStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
    bodyMedium: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
  );
}
