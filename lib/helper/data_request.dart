import 'dart:convert';

import 'package:berita/models/respon_berita.dart';
import 'package:http/http.dart' as http;

const String kApiKey = "598cb25ad3504218af3e807123f7a91f";

class News {
  Future<ResponBerita> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=id&apiKey=$kApiKey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponBerita.fromJsonMap(jsonData);
  }
}

class RequestByCategory {
  Future<ResponBerita> getNewsByCategory(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=$kApiKey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponBerita.fromJsonMap(jsonData);
  }
}
