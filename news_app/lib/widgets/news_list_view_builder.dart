import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/atricle_model.dart';
import '../services/news_service.dart';
import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key, required this.category,
  });

  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return newsListView(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text('oops Try again later!'),
              ),
            );
          } else {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
