import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_test/provider/provider_cart.dart';
import 'package:state_management_test/widgets/app_drawer.dart';
import 'package:state_management_test/widgets/badge.dart';

import '../widgets/product_grid.dart';

enum FilterOptions { favorites, all }

class ScreenProductsOverview extends StatefulWidget {
  @override
  State<ScreenProductsOverview> createState() => _ScreenProductsOverviewState();
}

class _ScreenProductsOverviewState extends State<ScreenProductsOverview> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.all) {
                  _showOnlyFavorites = false;
                } else {
                  _showOnlyFavorites = true;
                }
              });
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text("Favorites Only"),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text("Show All"),
              ),
            ],
          ),
          Consumer<ProviderCart>(
            builder: (_, cart, ch) => Badge(
              value: cart.itemCount.toString(),
              color: Colors.red,
              child: ch!,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed("/cart");
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(_showOnlyFavorites),
    );
  }
}
