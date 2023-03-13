import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:state_management_test/provider/provider_products.dart';
import 'package:state_management_test/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showOnlyFavorites;

  ProductGrid(this.showOnlyFavorites);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProviderProducts>(context);
    final products =
        showOnlyFavorites ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
      ),
    );
  }
}
