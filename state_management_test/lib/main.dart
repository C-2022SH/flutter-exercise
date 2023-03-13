import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_test/provider/provider_cart.dart';
import 'package:state_management_test/provider/provider_orders.dart';
import 'package:state_management_test/provider/provider_products.dart';
import 'package:state_management_test/screens/screen_cart.dart';
import 'package:state_management_test/screens/screen_orders.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProviderProducts(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProviderCart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProviderOrders(),
        )
      ],
      child: MaterialApp(
        title: 'my shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ScreenProductsOverview(),
        routes: {
          "/productDetail": (context) => ScreenProductDetail(),
          "/cart": (context) => ScreenCart(),
          "/orders": (context) => ScreenOrders(),
        },
      ),
    );
  }
}
