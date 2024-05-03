import 'package:get/get.dart';
import 'package:prodt/model/news_model.dart';
import 'package:prodt/services/remote_service.dart';

class NewsController extends GetxController {
  final NewsService _newsService = NewsService();
  var news = <Datum>[].obs;
  var filteredNews = <Datum>[].obs;

  @override
  void onInit() {
    fetchNews('national');
    super.onInit();
  }

  void fetchNews(String caty) async {
    try {
      final totalNews = await _newsService.getNews(caty);
      news.assignAll(totalNews.data);
      filteredNews.assignAll(totalNews.data);
      print(news);
    } catch (e) {
      print(e);
    }
  }

  void filterNews(String query) {
    if (query.isEmpty) {
      filteredNews.assignAll(news);
    } else {
      filteredNews.assignAll(news.where((newzes) =>
          newzes.title.toLowerCase().contains(query.toLowerCase())));
    }
  }
}
