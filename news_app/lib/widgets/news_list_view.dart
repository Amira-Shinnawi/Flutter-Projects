import 'package:flutter/material.dart';
import 'package:news_app/models/atricle_model.dart';

import '../views/web_view.dart';
import 'news_tile.dart';

class newsListView extends StatelessWidget {
  const newsListView({super.key, required this.articles});

 final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => WebView(url:articles[index].url),
                ));
              },
              child: NewsTile(
                articleModel: articles[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
