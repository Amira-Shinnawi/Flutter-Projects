import 'package:flutter/material.dart';
import 'package:store_app/screens/update_product.dart';

import '../models/product_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    super.key,
  });
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 220,
            height: 130,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  blurRadius: 16,
                  spreadRadius: 0,
                  offset: const Offset(5, 10),
                ),
              ],
            ),
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        product.title.substring(0, 6),
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${product.price.toString()}',
                            style: const TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          const Icon(Icons.favorite, color: Colors.red),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
          Positioned(
              right: 32,
              top: -65,
              child: Image.network(
                product.image,
                height: 100,
                width: 100,
              )),
        ],
      ),
    );
  }
}
