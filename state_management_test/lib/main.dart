import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_test/provider/provider_products.dart';
import 'package:state_management_test/screens/screen_product_detail.dart';

import 'package:state_management_test/screens/screen_products_overview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProviderProducts(),
      child: MaterialApp(
        title: 'my shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ScreenProductsOverview(),
        routes: {
          "/productDetail": (context) => ScreenProductDetail(),
        },
      ),
    );
  }
}
