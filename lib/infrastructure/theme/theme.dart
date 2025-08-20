import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Color primaryColor = Color(0xFFFDBD2A);
Color secondaryColor = Color(0xFF158CB7);


// Light Mode Colors
Color whiteColor = const Color(0xFFFFFFFF);
Color regularColor = const Color(0xFF262626);
Color regularLightColor = const Color(0xFF4D4D4D);
Color borderColor = const Color(0xFFD0D0D0);
Color greyLightColor = const Color(0xFFF5F5F5);
Color scaffoldLightColor = const Color(0xFFFFFFFF);

// Dark Mode Colors
Color whiteColorDark = const Color(0xFF00413B);
Color secondaryColorDark = const Color(0xFF046159);
Color regularColorDark = const Color(0xFFFFFFFF);
Color borderColorDark = const Color(0xFFD0D0D0);
Color greyLightColorDark = const Color(0xFF262626);
Color scaffoldDarkColor = Colors.black;

Color successColor = const Color(0xFF76BB70);
Color dangerColor = const Color(0xFFFF5C58);
Color warningColor = const Color(0xFFFEA404);
Color infoColor = const Color(0xFF6CAAD8);


TextStyle heading1 = const TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

TextStyle heading2 = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

TextStyle heading3 = const TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
);

TextStyle regular20pt = const TextStyle(
  fontSize: 20,
);

TextStyle regular18pt = const TextStyle(
  fontSize: 18,
);

TextStyle regular16pt = const TextStyle(
  fontSize: 16,
);

TextStyle regular14pt = const TextStyle(
  fontSize: 14,
);

TextStyle regular12pt = const TextStyle(
  fontSize: 12,
);

TextStyle regular10pt = const TextStyle(
  fontSize: 10,
);

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Neue Haas Grotesk',
    useMaterial3: false,
    splashColor: primaryColor.withOpacity(0.2),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: regularColor),
      bodyMedium: TextStyle(color: regularColor),
      bodySmall: TextStyle(color: regularColor),
    ),
    primaryColor: primaryColor,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: whiteColor,
      titleTextStyle: heading2.copyWith(color: regularColor),
      iconTheme: IconThemeData(
        color: regularColor,
      ),
    ),
    listTileTheme: ListTileThemeData(
      textColor: regularColor,
    ),
    scaffoldBackgroundColor: scaffoldLightColor,
    cardColor: greyLightColor,
    cardTheme: CardTheme(
      color: whiteColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1.0, color: whiteColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      disabledColor: greyLightColor,
    ),
    dividerColor: borderColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: secondaryColorDark,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      unselectedLabelStyle: regular14pt.copyWith(color: whiteColor.withOpacity(0.7)),
      unselectedItemColor: whiteColor.withOpacity(0.7),
      unselectedIconTheme: IconThemeData(
        color: whiteColor.withOpacity(0.7),
        size: 14,
      ),
      selectedLabelStyle: regular14pt.copyWith(color: whiteColor),
      selectedItemColor: whiteColor,
      selectedIconTheme: IconThemeData(
        color: whiteColor,
        size: 14,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 0,
      color: whiteColor,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: whiteColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: whiteColor),
    popupMenuTheme: PopupMenuThemeData(
      color: whiteColor,
      textStyle: regular14pt.copyWith(color: regularColor),
    ),
   
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Neue Haas Grotesk',
    useMaterial3: false,
    splashColor: primaryColor.withOpacity(0.2),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: whiteColor),
      bodyMedium: TextStyle(color: whiteColor),
      bodySmall: TextStyle(color: whiteColor),
    ),
    primaryColor: primaryColor,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: whiteColorDark,
      titleTextStyle: heading2.copyWith(color: whiteColor),
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    listTileTheme: ListTileThemeData(
      textColor: whiteColor,
    ),
    scaffoldBackgroundColor: scaffoldDarkColor,
    cardColor: greyLightColorDark,
    cardTheme: CardTheme(
      color: whiteColorDark,
      elevation: 6,
      shadowColor: regularColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      disabledColor: greyLightColor,
    ),
    dividerColor: borderColorDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: secondaryColorDark,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      unselectedLabelStyle: regular14pt.copyWith(color: whiteColor.withOpacity(0.5)),
      unselectedItemColor: whiteColor.withOpacity(0.5),
      unselectedIconTheme: IconThemeData(
        color: whiteColor.withOpacity(0.5),
        size: 14,
      ),
      selectedLabelStyle: regular14pt.copyWith(color: secondaryColor),
      selectedItemColor: whiteColor,
      selectedIconTheme: IconThemeData(
        color: secondaryColor,
        size: 14,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 0,
      color: whiteColor,
    ),
    dialogTheme: DialogTheme(backgroundColor: regularColor),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: regularColor),
    popupMenuTheme: PopupMenuThemeData(
      color: whiteColorDark,
      textStyle: regular14pt.copyWith(color: whiteColor),
    ),
   
  );
}
