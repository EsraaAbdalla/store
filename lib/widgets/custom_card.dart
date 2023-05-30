import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/update_product_page.dart';

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
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 30,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: const Offset(10, 10),
              ),
            ]),
            child: Card(
              elevation: 10,
              // color: Colors.blue,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${product.title.substring(0, 6)}",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' // r to accept $ .
                          "${product.price}",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 32,
              // left: 90,
              // top: 1,
              bottom: 100,
              child: Image.network(
                product.image,
                width: 100,
                height: 100,
              )),
        ],
      ),
    );
  }
}
