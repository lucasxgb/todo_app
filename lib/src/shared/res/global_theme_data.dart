import 'package:flutter/material.dart';
import 'package:todo_app/src/shared/res/global_theme_text.dart';

class GlobalThemeData {
  static final Color _lightFocusColor = Colors.white.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.black.withOpacity(0.12);

  static const ColorScheme darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFF6F8FC),
      onPrimary: Color(0xFF393E46),
      secondary: Color(0xFFF6F8FC),
      onSecondary: Color(0xFF393E46),
      tertiary: Colors.black,
      onTertiary: Colors.white,
      error: Colors.redAccent,
      onError: Color(0xFFEEEEEE),
      background: Color(0xFF222831),
      onBackground: Color(0xFFF6F8FC),
      surface: Color(0xFF393E46),
      onSurface: Color(0xFFF6F8FC));

  static const ColorScheme lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF393E46),
      onPrimary: Color(0xFFF6F8FC),
      secondary: Color(0xFF393E46),
      onSecondary: Color(0xFFF6F8FC),
      tertiary: Colors.white,
      onTertiary: Colors.black,
      error: Colors.redAccent,
      onError: Color(0xFFEEEEEE),
      background: Color(0xFFF6F8FC),
      onBackground: Color(0xFF393E46),
      surface: Color(0xFFF6F8FC),
      onSurface: Color(0xFF393E46));

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        textTheme: GlobalThemeText.textTheme,
        colorScheme: colorScheme,
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        highlightColor: Colors.transparent,
        focusColor: focusColor);
  }
}
