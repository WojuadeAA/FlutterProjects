import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      'N ${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          //use headline6 instead of title
                          color: Theme.of(context).textTheme.headline6.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('Order Now'),
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalAmount);

                      cart.clear();
                    },
                  ),
                ],
              ),
            ),
          ),

          ///remember you can't put a list view directly into a column because the
          ///the column takes infinite height and the list view also takes a infinite height i.e the children widget in the list view wont show..
          ///..and you will get an 'Vertical viewport was given unbounded height.' error
          ////ALWAYS WRAP THE LISTVIEW WIDGET IN AN A LAYOUT WIDGET WITH A BOUNDED HEIGHT
          Expanded(
            child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (ctx, index) => WCartItem(
                      title: cart.items.values.toList()[index].title,
                      price: cart.items.values.toList()[index].price,
                      id: cart.items.values.toList()[index].id,
                      productId: cart.items.keys.toList()[index],
                      quantity: cart.items.values.toList()[index].quantity,
                    )),
          ),
        ],
      ),
    );
  }
}
