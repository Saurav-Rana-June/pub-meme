import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color white = const Color(0xFFFFFFFF);
Color primary = Color(0xFF158CB7);
Color secondary = Color(0xFFFDBD2A);

Color scaffoldLight = Colors.white;
Color scaffoldDark = Colors.black;

Color regular = const Color(0xFF01080D);
Color regular10 = const Color(0xFFEAEBED);
Color regular30 = const Color(0xFFBEC3C8);
Color regular50 = const Color(0xFF929BA2);

Color successColor = const Color(0xFF76BB70);
Color dangerColor = const Color(0xFFFF5C58);
Color warningColor = const Color(0xFFfea404);
Color infoColor = const Color(0xFF6CAAD8);

TextStyle h1 = GoogleFonts.jost(fontSize: 32, fontWeight: FontWeight.w600);

TextStyle h2 = GoogleFonts.jost(fontSize: 22, fontWeight: FontWeight.w600);

TextStyle r20 = GoogleFonts.jost(fontSize: 20, fontWeight: FontWeight.w400);

TextStyle r18 = GoogleFonts.jost(fontSize: 18, fontWeight: FontWeight.w400);

TextStyle r16 = GoogleFonts.jost(fontSize: 16, fontWeight: FontWeight.w400);

TextStyle r14 = GoogleFonts.jost(fontSize: 14, fontWeight: FontWeight.w400);

TextStyle r12 = GoogleFonts.jost(fontSize: 12, fontWeight: FontWeight.w400);

class AppTheme {
  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyLarge: r18.copyWith(color: white),
      bodyMedium: r16.copyWith(color: white),
      bodySmall: r14.copyWith(color: white),
    ),
    primaryColor: primary,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: scaffoldDark,
      iconTheme: IconThemeData(color: white),
    ),
    listTileTheme: ListTileThemeData(textColor: white),
    scaffoldBackgroundColor: scaffoldDark,
    cardColor: regular,
    tabBarTheme: TabBarThemeData(
      indicatorColor: primary,
      dividerColor: regular,
    ),
    dividerColor: white,
  );

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyLarge: r18.copyWith(color: regular),
      bodyMedium: r16.copyWith(color: regular),
      bodySmall: r14.copyWith(color: regular),
    ),
    primaryColor: primary,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: scaffoldLight,
      iconTheme: IconThemeData(color: regular),
    ),

    listTileTheme: ListTileThemeData(textColor: regular),
    scaffoldBackgroundColor: scaffoldLight,
    cardColor: regular,
    tabBarTheme: TabBarThemeData(
      indicatorColor: primary,
      dividerColor: regular,
    ),
    dividerColor: regular50,
  );
}
