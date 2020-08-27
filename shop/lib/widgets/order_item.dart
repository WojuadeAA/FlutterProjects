import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  const OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'N ${widget.order.amount}',
            ),
            subtitle: Text(widget.order.dateTime.toString()),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(
                widget.order.products.length * 20.0 + 100,
                180,
              ),
              child: ListView(
                children: <Widget>[
                  ...widget.order.products.map(
                    (prod) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          prod.title,
                          style: GoogleFonts.lato(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${prod.quantity} X N ${prod.price}  ',
                          style: GoogleFonts.lato(
                              fontSize: 18, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
