import 'package:flutter/material.dart';

class MyTheme {
  // static final darkTheme = ThemeData(
  //     scaffoldBackgroundColor: Colors.grey.shade900,
  //     primaryColor: Colors.black,
  //     colorScheme: const ColorScheme.dark(),
  //     hoverColor: Colors.transparent,
  //     splashColor: Colors.transparent);
  // static final whiteTheme = ThemeData(
  //     scaffoldBackgroundColor: Colors.white,
  //     primaryColor: Colors.white,
  //     colorScheme: const ColorScheme.light(),
  //     hoverColor: Colors.transparent,
  //     splashColor: Colors.transparent);
  final lightTheme = ThemeData.light().copyWith();
  final darkTheme = ThemeData.dark().copyWith();
}
