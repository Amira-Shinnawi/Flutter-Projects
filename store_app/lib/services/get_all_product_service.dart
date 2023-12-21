import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await API().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    // print(productsList);
    return productsList;
  }
}
