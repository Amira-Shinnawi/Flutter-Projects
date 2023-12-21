import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '$category',
          style:const TextStyle(
            color: Colors.black
          ),
        ),
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.orangeAccent),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
        slivers: [
          NewsListViewBuilder(
            category: category,
          ),
        ],
          ),
      ),
    );
  }
}