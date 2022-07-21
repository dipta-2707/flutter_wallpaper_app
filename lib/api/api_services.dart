import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/api/api_key.dart';

class ApiService {
  //List<WallpaperModel> wallpapersList = List.empty();

  Future<Map> fetchTranding(String searchValue, String pageNumber) async {
    http.Response response;
    try {
      if (searchValue == "") {
        response = await http.get(
            Uri.parse(
                'https://api.pexels.com/v1/curated?&per_page=12&page=$pageNumber'),
            headers: {"Authorization": pixelApiKey});
      } else {
        response = await http.get(
            Uri.parse(
                'https://api.pexels.com/v1/search?query=$searchValue&per_page=12&page=$pageNumber'),
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
        print('did not get data');
        throw Exception('Failed to load data exception');
      }
    } catch (_) {
      throw Exception('no internet');
    }
  }
}
