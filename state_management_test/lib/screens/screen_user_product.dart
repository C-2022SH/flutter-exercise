import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_test/provider/provider_products.dart';
import 'package:state_management_test/widgets/app_drawer.dart';
import 'package:state_management_test/widgets/user_product_item.dart';

class ScreenUserProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProviderProducts>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("your products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/editProduct");
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (_, index) => Column(
            children: [
              UserProdcutItem(
                productsData.items[index].id,
                productsData.items[index].title,
                productsData.items[index].imageUrl,
              ),
              Divider(),
            ],
          ),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
