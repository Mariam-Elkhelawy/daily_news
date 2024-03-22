import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xFF39A552);
  static ThemeData appTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: GoogleFonts.exo(
          fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
      bodyMedium: GoogleFonts.exo(
          fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),
      bodySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: const Color(0xFF42505C),
      ),
    ),
    appBarTheme: const AppBarTheme(
      toolbarHeight: 70,
      centerTitle: true,
      backgroundColor: primaryColor,
      iconTheme: IconThemeData(color: Colors.white, size: 35),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(35),
          bottomLeft: Radius.circular(35),
        ),
      ),
    ),
  );
}
