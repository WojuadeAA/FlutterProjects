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
  final String userId;
  final String authToken;

  List<OrderItem> get orders {
    return [..._orders];
  }

  Orders(this.authToken, this.userId, this._orders);

  Future<void> fetechAndSetOrders() async {
    final url =
        'https://shop-93c2b.firebaseio.com/orders/$userId.json?auth=$authToken';
    final response = await http.get(url);
    // print(json.decode(response.body));

    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((OrderId, orderData) {
      loadedOrders.add(
        OrderItem(
          id: OrderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quantity'],
                  title: item['title'],
                ),
              )
              .toList(),
        ),
      );
      _orders = loadedOrders;
      notifyListeners();
    });
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url =
        'https://shop-93c2b.firebaseio.com/orders/$userId.json?auth=$authToken';
    var timestamp = DateTime.now();

    try {
      final response = await http.post(url,
          body: json.encode({
            'amount': total,
            'dateTime': timestamp.toIso8601String(),
            'products': cartProducts
                .map((cp) => {
                      'id': cp.id,
                      'title': cp.title,
                      'quantity': cp.quantity,
                      'price': cp.price,
                    })
                .toList(),
          }));
      print(response.body);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<OrderItem> loadedOrders = [];
      extractedData.forEach((orderId, orderData) {
        loadedOrders.add((OrderItem(
          amount: orderData['title'],
          dateTime: orderData[''],
          id: orderData[''],
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
