import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_test/provider/provider_orders.dart'
    show ProviderOrders;
import 'package:state_management_test/widgets/app_drawer.dart';

import '../widgets/order_item.dart';

class ScreenOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<ProviderOrders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("your orders"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => OrderItem(orders.orders[index]),
        itemCount: orders.orders.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
