import 'package:dio/dio.dart';
import 'package:news_app/models/atricle_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response =
          await dio.get('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=b45bfb2dc3984c89a3d7becd1f1d9c7a');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'] ?? "",
          title: article['title'] ?? "",
          subTitle: article['description'] ?? "",
          url: article['url'] ?? "",
        );
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
