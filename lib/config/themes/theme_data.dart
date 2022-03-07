import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:longeviy/config/themes/text_theme.dart';
import 'buttons.dart';
import 'colors.dart';
import 'icon_theme.dart';

// [BUTTONS]

ThemeData longevityLightTheme(BuildContext context) {
  return ThemeData(
    androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: whiteAccent,
      secondary: secondaryColor,
      onSecondary: whiteAccent,
      error: errorColor,
      onError: whiteAccent,
      background: backgroundColor,
      onBackground: primaryColor,
      surface: whiteAccent,
      onSurface: primaryColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    // textTheme: GoogleFonts.montserratTextTheme(),
    textTheme: TextTheme(
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      bodySmall: bodySmall,
      bodyMedium: bodyMedium,
      bodyLarge: bodyLarge,
      labelSmall: labelSmall,
    ),
    elevatedButtonTheme: elevatedButtonThemeData,
    iconTheme: iconTheme,
  );
}
