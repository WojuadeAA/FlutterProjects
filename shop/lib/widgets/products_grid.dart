import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';

import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showFavs ? productsData.favouriteItems : productsData.items;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      // an alternative if you are not using the context
      //use changeNotifierProvider.value if you are using a provider...
      // ..on something that is part of a list builder or grid builder
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
//        builder: (ctx) => products[i],
        child: ProductItem(),
      ),
      padding: const EdgeInsets.all(10.0),
    );
  }
}
