import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Screens/product_detail_screen.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';

//import '../Screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
//  final String id;
//  final String title;
//  final String imageUrl;
//
//  ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    //region PROVIDERS LISTNERS
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final scaffold = Scaffold.of(context);
    final authData = Provider.of<Auth>(context, listen: false);

    //endregion

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () async {
                  try {
                    await product.changeFavoriteStatus(
                        authData.token, authData.userId);
                  } catch (error) {
                    scaffold.showSnackBar(SnackBar(
                      content: Text(
                          'favorite status not saved on server try again later'),
                    ));
                  }
                },
                color: Theme.of(context).accentColor),
          ),
          backgroundColor: Colors.black54,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              cart.addItem(product.title, product.price, product.id);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Added item to cart'),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    cart.removeItem(product.id);
                  },
                ),
              ));
            },
          ),
        ),
      ),
    );
  }
}
