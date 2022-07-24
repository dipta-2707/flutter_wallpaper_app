import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/home.dart';
import 'package:wallpaper_app/view/splash_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Pool',
      theme: ThemeData(
          backgroundColor: Colors.black87,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent),
      home: const MyHome(),
      routes: {'/home/': (context) => const MyHome()},
    );
  }
}
