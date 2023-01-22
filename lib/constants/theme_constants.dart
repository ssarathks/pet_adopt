import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_constants.dart';

class ThemeConstants {
  static double scaffoldHorizontalPadding = 15;
  static double cardBorderRadius = 12;

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: ColorConstants.lightThemeScaffoldColor,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorConstants.lightThemeScaffoldColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light),
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.black, unselectedItemColor: Colors.black26),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    ),
    scaffoldBackgroundColor: ColorConstants.lightThemeScaffoldColor,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Roboto',
    brightness: Brightness.dark,
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: ColorConstants.darkThemeScaffoldColor,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorConstants.darkThemeScaffoldColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
    cardTheme: const CardTheme(
      color: const Color.fromARGB(255, 44, 44, 44),
    ),
    scaffoldBackgroundColor: ColorConstants.darkThemeScaffoldColor,
  );
}
