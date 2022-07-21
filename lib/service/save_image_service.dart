import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class SaveImageService {
  Future<void> setImage(String url) async {
    //print(Platform.environment);
    if (Platform.isAndroid) {
      try {
        int location = WallpaperManagerFlutter
            .HOME_SCREEN; //Xiaomi/MIUI does not support changing Lock Screen Wallpapers directly from the Android API
        var file = await DefaultCacheManager().getSingleFile(url);
        WallpaperManagerFlutter().setwallpaperfromFile(file, location);
      } catch (_) {
        throw Exception('can not set wallpaper in android');
      }
    }
    // if (Platform.isWindows) {
    //   print("is windows");
    //   try {
    //     await DefaultCacheManager().downloadFile(url);
    //   } catch (_) {
    //     throw Exception('can not download wallpaper in windows');
    //   }
    // }
  }
}
