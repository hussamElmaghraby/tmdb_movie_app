import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/dimensions.dart';
import 'app_colors.dart';

//"Montserrat_Arabic"
String appFontFamily = "Montserrat-Arabic";
ThemeData lightTheme = ThemeData(
  hoverColor: Colors.black,

  fontFamily: appFontFamily,
  appBarTheme:  AppBarTheme(
    backgroundColor: Color(0xffffffff),
    titleTextStyle: TextStyle(
      color: AppColors.primaryColor,
      fontSize: Sizer.size20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: Sizer.size28,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.titleColor,
      fontSize: Sizer.size14,
    ),
    titleSmall:  TextStyle(
      color: AppColors.primaryColor,
      fontSize: Sizer.size13,
    ),
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: Sizer.size24,
    ),
    headlineMedium: const TextStyle(
      color: Colors.black,
      fontSize: Sizer.size16,
    ),
    headlineSmall: TextStyle(
      color: AppColors.appBlackColor,
      fontSize: Sizer.size14,
    ),
    displayLarge: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xff27003F),
      fontSize: Sizer.size28,
    ),
    displayMedium: const TextStyle(
      color: Color(0xcc404B5A),
      height: 1.3,
      fontSize: Sizer.size16,
    ),
    displaySmall:  TextStyle(
      color: AppColors.secondaryColor,
      fontSize: Sizer.size12,
    ),
  ),
  // disabledColor: const Color(0xff949088),
  colorScheme:  ColorScheme(
    brightness: Brightness.light,
    secondary: AppColors.primaryColor,
    primary: AppColors.primaryColor,
    onPrimary: AppColors.appDisplayColor,
    onSecondary: Colors.black,
    error: Colors.white,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: AppColors.onSurfaceColor,
  ),
);

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff000000),
    titleTextStyle: TextStyle(
      color: Color(0xffD4B373),
      fontSize: Sizer.size20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xffD4B373),
      fontSize: Sizer.size30,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xffD4B373),
      fontSize: Sizer.size25,
    ),
    titleSmall: TextStyle(
      color: Color(0xffD4B373),
      fontSize: Sizer.size20,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      color: Color(0xffD4B373),
      fontSize: Sizer.size20,
    ),
    headlineMedium: TextStyle(
      color: Color(0xffD4B373),
      fontSize: Sizer.size15,
    ),
    headlineSmall: TextStyle(
      color: Color(0xffD4B373),
      fontSize: Sizer.size12,
    ),
  ),
  disabledColor: const Color(0xff949088),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    secondary: Color(0xffffffff),
    primary: Color(0xff906A12),
    onPrimary: Color(0xffddd6c8),
    onSecondary: Color(0xffD4B373),
    error: Colors.white,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.white, background: AppColors.onSurfaceColor, onBackground: AppColors.onSurfaceColor,
  ),
);

class CommonTextStyles  {
  static TextStyle brown13TextSTyle = TextStyle(
    color: AppColors.appBrownColor,
    fontSize: Sizer.size13,
  );
}

extension TextThemeExtension on TextTheme {
   TextStyle get brown13TextSTyle => TextStyle(
    color: AppColors.appBrownColor,
    fontSize: Sizer.size13,
  );
}
