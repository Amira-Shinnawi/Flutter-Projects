import 'package:flutter/cupertino.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

   final List<CategoryModel> categories = const[
    CategoryModel(categoryName: 'Entertainment', categoryImage: 'assets/entertaiment.avif'),
    CategoryModel(categoryName: 'Health', categoryImage: 'assets/health.avif'),
    CategoryModel(categoryName: 'Business', categoryImage: 'assets/business.jpg'),
    CategoryModel(categoryName: 'General', categoryImage: 'assets/general.avif'),
    CategoryModel(categoryName: 'Science', categoryImage: 'assets/science.avif'),
    CategoryModel(categoryName: 'Sports', categoryImage: 'assets/sports.avif'),
    CategoryModel(categoryName: 'Technology', categoryImage: 'assets/technology.jpeg'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:100,
      child: ListView.builder(
        physics:const BouncingScrollPhysics(),
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return CategoryCard(
              category: categories[index],
            );
          })),
    );
  }
}
