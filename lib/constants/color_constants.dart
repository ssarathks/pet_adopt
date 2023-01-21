import 'package:flutter/material.dart';

class ColorConstants {
  static const Color lightThemeScaffoldColor =
      Color.fromARGB(255, 241, 243, 245);
  static const Color darkThemeScaffoldColor = Color.fromARGB(255, 59, 59, 59);

  static Color getScaffoldColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? darkThemeScaffoldColor
        : lightThemeScaffoldColor;
  }
}
