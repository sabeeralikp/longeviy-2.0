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
    textTheme: TextTheme(
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      bodySmall: bodySmall,
      bodyMedium: bodyMedium,
      bodyLarge: bodyLarge,
      labelSmall: labelSmall,
      displayLarge: displayLarge,
    ),
    elevatedButtonTheme: elevatedButtonThemeData,
    iconTheme: iconTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 20,
      ),
      selectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: unSelectedWidgetColor,
        size: 20,
      ),
    ),
  );
}
