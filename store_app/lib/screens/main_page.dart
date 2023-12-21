import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/get_all_product_service.dart';
import '../widgets/custom_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: GetAllProductService().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
            return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 30,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(
                    product: products[index],
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
