import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addPreoduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().post(
        url: 'https://fakestoreapi.com/products',
        body: {
          'title': title,
          'peice': price,
          'description': desc,
          'image': image,
          'categoty': category,
        },
        token: '');
    return ProductModel.fromJson(data);
  }
}
