import 'package:flutter/material.dart';

import 'package:store/screens/home-page.dart';
import 'package:store/screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
