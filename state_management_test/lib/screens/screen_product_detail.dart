import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_test/provider/provider_products.dart';

class ScreenProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<ProviderProducts>(
      context,
      listen: false,
    ).findByID(productID);

    return Scaffold(
        appBar: AppBar(
      title: Text(loadedProduct.title),
    ));
  }
}
