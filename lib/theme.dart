import 'package:flutter/material.dart';

class AppColors {
  static const lightRed = Color.fromARGB(255, 252, 32, 24); // قرمز
  static const gray = Color(0xFFBBBBBB); // خاکستری
  static const whit = Color(0xFFFFFFFF); // سفید
  static const heavyGray = Color(0xFF202124); // خاکستری تیره
  static const backgroundWhit = Color(0xFFF9F9F9); // پس‌زمینه روشن
}

final ThemeData apptheme =  ThemeData(
  textSelectionTheme: TextSelectionThemeData(
    selectionHandleColor: AppColors.heavyGray,
    cursorColor: AppColors.gray,
    selectionColor: AppColors.gray,
  ),
  colorScheme: ColorScheme(
    primary: AppColors.lightRed,
    secondary: AppColors.gray,
    surface: AppColors.backgroundWhit,
    error: Colors.red,
    onPrimary: AppColors.whit,
    onSecondary: AppColors.heavyGray,
    onSurface: AppColors.heavyGray,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.backgroundWhit,
    selectedItemColor: AppColors.lightRed,
    unselectedItemColor: AppColors.gray,
    showSelectedLabels: true,
    elevation: 8.0,
    type: BottomNavigationBarType.fixed,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backgroundWhit,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: AppColors.heavyGray,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: AppColors.heavyGray),
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColors.heavyGray,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      color: AppColors.heavyGray,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14,
      color: AppColors.heavyGray,
      fontWeight: FontWeight.w300,
    ),
  ),
);
