import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:state_management_test/main.dart';

import '../provider/provider_orders.dart' as prov;

class OrderItem extends StatefulWidget {
  final prov.OrderItem item;

  OrderItem(this.item);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${widget.item.totalPrice}"),
            subtitle:
                Text(DateFormat("dd MM yyyy hh:mm").format(widget.item.time)),
            trailing: IconButton(
              icon: Icon(_expanded
                  ? Icons.expand_less_rounded
                  : Icons.expand_more_rounded),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.all(18),
              height: min(widget.item.products.length * 40, 100),
              child: ListView(
                children: widget.item.products
                    .map((product) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product.title),
                            Text("${product.quantity} X ${product.price}"),
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
