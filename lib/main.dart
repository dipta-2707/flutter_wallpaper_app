import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/controller/theme_controller.dart';
import 'package:wallpaper_app/view/home.dart';
import 'package:wallpaper_app/view/splash_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wallpaper Pool',
      debugShowCheckedModeBanner: false,
      //themeMode: _themeController.themeMode,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: const MyHome(),
      routes: {'/home/': (context) => const MyHome()},
    );
  }
}
