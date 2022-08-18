import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
  );

  static final ThemeData lightTheme =
      ThemeData(brightness: Brightness.light, primaryColor: Colors.blue);
}
