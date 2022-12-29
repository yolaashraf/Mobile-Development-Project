import 'package:flutter/material.dart';

class MyThemes {
  bool picker = false;
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      colorScheme: ColorScheme.dark(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
      ));

  ThemeMode pickTheme(picker) {
    ThemeMode light = ThemeMode.light;
    ThemeMode dark = ThemeMode.dark;
    if (picker == false)
      return light;
    else {
      return dark;
    }
  }
}
