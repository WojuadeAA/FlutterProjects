import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './Screens/product_detail_screen.dart';
import './Screens/products_overview_screen.dart';
import './providers/products_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Products(),
//      builder: (ctx) => Products(),
      child: MaterialApp(
        title: 'Shop',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.pinkAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato',
          textTheme: GoogleFonts.aBeeZeeTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
        home: ProductsOverviewScreen(),
      ),
    );
  }
}
