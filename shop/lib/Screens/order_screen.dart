import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/orders.dart' show Orders;
import 'package:shop/widgets/app_drawer.dart';

import '../widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orderscreen';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var _isloading = false;

//  @override
//  void initState() {
//    Future.delayed(Duration.zero).then((_) async {
//      setState(() {
//        _isloading = true;
//      });
//      await Provider.of<Orders>(context, listen: false).fetechAndSetOrders();
//
//      setState(() {
//        _isloading = false;
//      });
//    });
//
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      drawer: AppDrawer(),
      body: _isloading
          ? Center(child: CircularProgressIndicator())
          :

//      onRefresh: () {
//      return Navigator.of(context).pushNamed('/');
//    },
          RefreshIndicator(
              onRefresh: () {
                return Navigator.of(context).pushNamed(OrdersScreen.routeName);
              },
              child: ListView.builder(
                itemCount: orderData.orders.length,
                itemBuilder: (context, index) =>
                    OrderItem(orderData.orders[index]),
              ),
            ),
    );
  }
}
