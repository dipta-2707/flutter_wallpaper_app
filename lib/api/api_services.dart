import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/api/api_key.dart';
import 'package:wallpaper_app/model/wallpapers_model.dart';

class ApiService {
  //List<WallpaperModel> wallpapersList = List.empty();

  Future<Map> fetchTranding() async {
    final response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?&per_page=12&page=1'),
        headers: {"Authorization": pixelApiKey});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var json = jsonDecode(response.body);

      return json;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
