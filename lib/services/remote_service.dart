import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:prodt/model/news_model.dart';

class NewsService {
  static const String baseUrl = 'https://inshortsapi.vercel.app/news?category=';
  Future<NewsData> getNews(String category) async {
    final response = await http.get(
        Uri.parse('$baseUrl$category'),
     );
    if (response.statusCode == 200) {
      print(response.body);
      return NewsData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load quiz score');
    }
  }
}
