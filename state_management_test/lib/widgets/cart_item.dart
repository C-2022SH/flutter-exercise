import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_test/provider/provider_cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productID;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.productID,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete_rounded,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<ProviderCart>(context, listen: false).removeItem(productID);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(child: FittedBox(child: Text("\$${price}"))),
            title: Text(title),
            subtitle: Text("total: \$${price * quantity}"),
            trailing: Text("${quantity} x"),
          ),
        ),
      ),
    );
  }
}
