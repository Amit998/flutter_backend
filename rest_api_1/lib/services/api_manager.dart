import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_1/constants/strings.dart';
import 'package:rest_api_1/models/news_info.dart';

class API_Manager {
  Future<NewsModel> getNews() async {
    NewsModel newsModel;
    var client = http.Client();

    try {
      var response = await client.get(Strings.news_Url);
      // print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        // print(jsonMap);

        newsModel = NewsModel.fromJson(jsonMap);

        // print(newsModel.totalResults);
      }
    } catch (Exception) {
      print("exp");
      // print(Exception.toString());
      return newsModel;
    }
    // print(newsModel.totalResults);

    return newsModel;
  }
}
