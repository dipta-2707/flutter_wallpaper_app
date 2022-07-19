import 'package:flutter/cupertino.dart';

class WallpaperModel {
  String portrait;
  String landscape;

  WallpaperModel({required this.portrait, required this.landscape});
  factory WallpaperModel.fromJson(Map<String, dynamic> jsonData) {
    return WallpaperModel(
        portrait: jsonData["photos"]["src"]["portrait"],
        landscape: jsonData["photos"]["src"]["landscape"]);
  }
}
