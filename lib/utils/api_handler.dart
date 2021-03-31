import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/secret.dart';

class ApiHandler {
  List<Article> news = [];

  Future<void> getLastestNews() async {
    try {
      //your apiKey
      String url =
          'http://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

      Response response = await get(url);
      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == 'ok') {
        jsonData['articles'].forEach(
          (articleJson) {
            if (articleJson['urlToImage'] != null &&
                articleJson['description'] != null) {
              Article article = Article.fromJson(articleJson);
              news.add(article);
            }
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getNewsBasedOnCat(String category) async {
    news = [];
    try {
      //your apikey
      String url =
          'https://newsapi.org/v2/top-headlines?country=us&category=${category.toLowerCase()}&apiKey=$apiKey';
      Response response = await get(url);
      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == 'ok') {
        jsonData['articles'].forEach(
          (articleJson) {
            if (articleJson['urlToImage'] != null &&
                articleJson['description'] != null) {
              Article article = Article.fromJson(articleJson);
              news.add(article);
            }
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
