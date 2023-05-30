import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, category;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update Products",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomTextField(
                onChange: (data) {
                  productName = data;
                },
                hintText: 'Product Name',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChange: (data) {
                  desc = data;
                },
                hintText: 'description',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                inputType: TextInputType.number,
                onChange: (data) {
                  price = data;
                },
                hintText: 'Price',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChange: (data) {
                  image = data;
                },
                hintText: 'image',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                onChange: (data) {
                  category = data;
                },
                hintText: 'category',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Update',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct(product);
                    print('success');
                  } on Exception catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProdcutService().updateProdcut(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : desc!,
        category: product.category);
  }
}
