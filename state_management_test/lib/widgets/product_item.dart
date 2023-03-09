import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentItem = Provider.of<Product>(context);
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
            onPressed: () {},
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
  }
}
