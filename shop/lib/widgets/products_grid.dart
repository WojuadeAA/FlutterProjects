import 'package:flutter/material.dart';

import '../models/products.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key key,
    @required this.loadedProducts,
  }) : super(key: key);

  final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ProductItem(
        id: loadedProducts[i].id,
        title: loadedProducts[i].title,
        imageUrl: loadedProducts[i].imageUrl,
      ),
      padding: const EdgeInsets.all(10.0),
    );
  }
}