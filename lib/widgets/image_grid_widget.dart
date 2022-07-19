import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpapers_model.dart';

Widget imageGridWidget({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      children: wallpapers.map((e) {
        return GridTile(
            child: Container(
          child: Image.network(e.portrait),
        ));
      }).toList(),
    ),
  );
}
