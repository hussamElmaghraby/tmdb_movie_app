import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/dimensions.dart';
import 'app_colors.dart';

//"Montserrat_Arabic"
String appFontFamily = "Montserrat-Arabic";
ThemeData lightTheme = ThemeData(
  hoverColor: Colors.black,

  fontFamily: appFontFamily,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xffffffff),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size20,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: const TextStyle(
      color: Colors.black,
      fontSize: Sizer.size30,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size20,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size15,
    ),
    headlineLarge: TextStyle(
      color: Colors.white,
      fontSize: Sizer.size24,
    ),
    headlineMedium: const TextStyle(
      color: Colors.white,
      fontSize: Sizer.size16,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontSize: Sizer.size14,
    ),
    displayLarge: const TextStyle(
      color: Colors.grey,
      fontSize: Sizer.size28,
    ),
    displayMedium: const TextStyle(
      color: Colors.grey,
      fontSize: Sizer.size16,
    ),
    displaySmall: TextStyle(
      color: Colors.grey,
      fontSize: Sizer.size12,
    ),
  ),
  // disabledColor: const Color(0xff949088),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    secondary: Colors.white,
    primary: Colors.black,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.white,
    onSurface: Colors.white,
  ),
);

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff000000),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: Sizer.size20,
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: Sizer.size30,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: Sizer.size20,
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontSize: Sizer.size15,
    ),
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size24,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size16,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size14,
    ),
    displaySmall: TextStyle(
      color: Colors.grey,
      fontSize: Sizer.size28,
    ),
    displayMedium: TextStyle(
      color: Colors.grey,
      fontSize: Sizer.size16,
    ),
    displayLarge: TextStyle(
      color: Colors.grey,
      fontSize: Sizer.size12,
    ),
  ),
  disabledColor: const Color(0xff949088),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    secondary:  Colors.black,
    primary: Colors.black,
    onPrimary: Colors.black,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.white,
    onSurface: Colors.white,
  ),
);




