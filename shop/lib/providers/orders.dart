import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:shop/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    const url = 'https://shop-93c2b.firebaseio.com/orders.json';
    try {
      final response = await http.post(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<OrderItem> loadedOrders = [];
      extractedData.forEach((orderId, orderData) {
        loadedOrders.add((OrderItem(
          amount: null,
          dateTime: null,
          id: null,
          products: <CartItem>[],
        )));
      });
    } catch (error) {}

    _orders.insert(
      0,
      OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          products: cartProducts),
    );
    notifyListeners();
  }
}
