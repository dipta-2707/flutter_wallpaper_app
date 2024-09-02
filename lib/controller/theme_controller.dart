import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconController extends GetxController {
  bool isDarkMode = true;

  Widget getIcon() {
    if (isDarkMode) {
      return Icon(Icons.light_mode, color: Colors.yellow);
    } else {
      return Icon(Icons.dark_mode, color: Colors.purple);
    }
  }

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
    update();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
  );

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent);
  // final lightTheme = ThemeData.light().copyWith();
  // final darkTheme = ThemeData.dark().copyWith();
}
