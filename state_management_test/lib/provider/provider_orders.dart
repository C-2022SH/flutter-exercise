import 'package:flutter/material.dart';
import 'package:state_management_test/provider/provider_cart.dart';

class OrderItem {
  final String id;
  final double totalPrice;
  final List<CartItem> products;
  final DateTime time;

  OrderItem({
    required this.id,
    required this.products,
    required this.totalPrice,
    required this.time,
  });
}

class ProviderOrders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartItems, double totalPrice) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        products: cartItems,
        totalPrice: totalPrice,
        time: DateTime.now(),
      ),
    );

    notifyListeners();
  }
}
