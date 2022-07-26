import 'package:flutter/material.dart';

class ThemeController with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  void toggleTheme() {
    themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent);
  static final whiteTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent);
}
