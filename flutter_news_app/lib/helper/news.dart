import 'dart:convert';

import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/views/article_view.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    http.Response response;
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=5e611d3a2cc1462fab98743fcbb0b1f3';

    response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            authorName: element['author'],
            desc: element['description'],
            url: element['url'],
            urlToImg: element['urlToImage'],
            content: element['content'],
            publishDate: element['publishedAt'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    http.Response response;
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=${category}&apiKey=5e611d3a2cc1462fab98743fcbb0b1f3';

    response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            authorName: element['author'],
            desc: element['description'],
            url: element['url'],
            urlToImg: element['urlToImage'],
            content: element['content'],
            publishDate: element['publishedAt'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
