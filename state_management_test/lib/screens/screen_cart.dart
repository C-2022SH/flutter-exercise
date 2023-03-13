import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:state_management_test/provider/provider_cart.dart'
    show ProviderCart;
import 'package:state_management_test/provider/provider_orders.dart';
import '../widgets/cart_item.dart';

class ScreenCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ProviderCart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("total"),
                  const Spacer(),
                  Chip(
                    label: Text("\$${cart.totalPrice}"),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<ProviderOrders>(context, listen: false)
                          .addOrder(
                        cart.items.values.toList(),
                        cart.totalPrice,
                      );

                      cart.clear();
                    },
                    child: const Text("order now"),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => CartItem(
                id: cart.items.values.toList()[index].id,
                productID: cart.items.keys.toList()[index],
                price: cart.items.values.toList()[index].price,
                quantity: cart.items.values.toList()[index].quantity,
                title: cart.items.values.toList()[index].title,
              ),
              itemCount: cart.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
