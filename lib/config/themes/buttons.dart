import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:longeviy/config/themes/colors.dart';

const EdgeInsets elevatedButtonPadding = EdgeInsets.symmetric(
  horizontal: 32,
  vertical: 16,
);
TextStyle elevatedButtonTextStyle = GoogleFonts.montserrat(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: whiteAccent,
);
OutlinedBorder elevatedButtonBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(40),
);

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    textStyle: elevatedButtonTextStyle,
    padding: elevatedButtonPadding,
    shape: elevatedButtonBorder,
  ),
);
