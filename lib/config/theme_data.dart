import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0XFF07807B);
Color whiteAccent = const Color(0XFFFFFFFF);
Color secondaryColor = const Color(0XFF0A7799);
Color errorColor = const Color(0XFFCF1616);
Color backgroundColor = const Color(0xFFFAFAFB);

// ThemeData longevityLightTheme = ThemeData(
//   colorScheme: ColorScheme(
//     brightness: Brightness.light,
//     primary: primaryColor,
//     onPrimary: whiteAccent,
//     secondary: secondaryColor,
//     onSecondary: whiteAccent,
//     error: errorColor,
//     onError: whiteAccent,
//     background: backgroundColor,
//     onBackground: whiteAccent,
//     surface: whiteAccent,
//     onSurface: primaryColor,
//   ),
// );

ThemeData longevityLightTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: whiteAccent,
      secondary: secondaryColor,
      onSecondary: whiteAccent,
      error: errorColor,
      onError: whiteAccent,
      background: backgroundColor,
      onBackground: whiteAccent,
      surface: whiteAccent,
      onSurface: primaryColor,
    ),
    textTheme: GoogleFonts.nunitoTextTheme(
      Theme.of(context).textTheme,
    ),
    primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Color.fromARGB(255, 255, 34, 34),
      ),
    ),
  );
}
