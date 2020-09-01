import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop/Screens/cart_screen.dart';
import 'package:shop/Screens/editing_products_screen.dart';
import 'package:shop/Screens/user_product_screen.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/providers/orders.dart';

import './Screens/product_detail_screen.dart';
import './providers/cart.dart';
import './providers/products_provider.dart';
import 'Screens/auth_screen.dart.dart';
import 'Screens/order_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Shop',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.pinkAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato',
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
        home: AuthScreen(),
      ),
    );
  }
}
