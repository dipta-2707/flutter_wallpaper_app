import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/api/api_key.dart';

class ApiService {
  //List<WallpaperModel> wallpapersList = List.empty();

  Future<Map> fetchTranding(String searchValue) async {
    http.Response response;
    try {
      if (searchValue == "") {
        response = await http.get(
            Uri.parse(
                'https://api.pexels.com/v1/search?query=wallpaper&per_page=48&page=1'),
            headers: {"Authorization": pixelApiKey});
      } else {
        response = await http.get(
            Uri.parse(
                'https://api.pexels.com/v1/search?query=${searchValue}%20wallpaper&per_page=48&page=1'),
            headers: {"Authorization": pixelApiKey});
      }

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        var json = jsonDecode(response.body);

        //print("-----------------------------------------");
        ///print(json);
        return json;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data exception');
      }
    } catch (_) {
      throw Exception('no internet');
    }
  }
}
