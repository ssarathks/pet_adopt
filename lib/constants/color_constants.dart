import 'package:flutter/material.dart';

class ColorConstants {
  static const Color lightThemeScaffoldColor =
      Color.fromARGB(255, 241, 243, 245);
  static const Color darkThemeScaffoldColor = Color.fromARGB(255, 59, 59, 59);

  static const Color lightThemeMutedScaffoldColor = Color(0xFFF8F8F8);
  static const Color darkThemeMutedScaffoldColor = Color(0xFF404042);

  static Color getScaffoldColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? darkThemeScaffoldColor
        : lightThemeScaffoldColor;
  }

  static Color getMutedScaffoldColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? darkThemeMutedScaffoldColor
        : lightThemeMutedScaffoldColor;
  }
}
