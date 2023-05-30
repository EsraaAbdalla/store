import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class UpdateProdcutService {
  Future<ProductModel> updateProdcut({
    required String title,
    required String price,
    required String desc,
    required String image,
    required int id,
    required String category,
  }) async {
    print('product id = $id');
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'peice': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}
