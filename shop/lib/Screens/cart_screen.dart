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
                  Orderbutton(cart: cart),
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

class Orderbutton extends StatefulWidget {
  const Orderbutton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderbuttonState createState() => _OrderbuttonState();
}

class _OrderbuttonState extends State<Orderbutton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Order Now'),
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<Orders>(context, listen: false).addOrder(
                widget.cart.items.values.toList(),
                widget.cart.totalAmount,
              );
              setState(() {
                _isLoading = false;
              });

              widget.cart.clear();
            },
    );
  }
}
