import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:samachar/models/article.dart';
import 'package:samachar/secrete.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$api_key";
    var response = await http.get(Uri.parse(url));
    var jsonBody = jsonDecode(response.body);
    if (jsonBody['status'] == "ok") {
      jsonBody['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            content: element['content'],
            description: element['description'],
            author: element['author'],
            urlToImage: element['urlToImage'],
            url: element['url'],
          );
          news.add(articleModel);
          // print(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$api_key";
    var response = await http.get(Uri.parse(url));
    var jsonBody = jsonDecode(response.body);
    if (jsonBody['status'] == "ok") {
      jsonBody['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            content: element['content'],
            description: element['description'],
            author: element['author'],
            urlToImage: element['urlToImage'],
            url: element['url'],
          );
          news.add(articleModel);
          // print(articleModel);
        }
      });
    }
  }
}