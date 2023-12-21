import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

import '../views/category_view.dart';

class CategoryCard extends StatelessWidget {
 const CategoryCard({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryView(category: category.categoryName,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(category.categoryImage),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
              child: Text(
            category.categoryName,
            style:const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}
