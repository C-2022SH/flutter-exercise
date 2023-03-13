import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_test/provider/provider_cart.dart';

import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final currentItem = Provider.of<Product>(context);
    final cart = Provider.of<ProviderCart>(context);
    return Consumer<Product>(builder: (ctx, currentItem, child) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            title: Text(
              currentItem.title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black54,
            leading: IconButton(
              icon: Icon(
                currentItem.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
              ),
              onPressed: () {
                currentItem.toggleFavorite();
              },
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart_rounded),
              onPressed: () {
                cart.addItem(
                  currentItem.id,
                  currentItem.title,
                  currentItem.price,
                );
              },
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed("/productDetail", arguments: currentItem.id);
            },
            child: Image.network(
              currentItem.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    });
  }
}
