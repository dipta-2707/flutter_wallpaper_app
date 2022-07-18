import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: Colors.black87,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent),
      home: MyHome(),
    );
  }
}
