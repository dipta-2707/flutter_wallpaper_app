import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/api/api_key.dart';

class ApiService {
  Future getTranding() async {
    await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?&per_page=15&page=1'),
        headers: {"Authorization": pixelApiKey}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((i) {});
    });
  }
}
