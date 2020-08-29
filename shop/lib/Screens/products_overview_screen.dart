import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Screens/cart_screen.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/widgets/app_drawer.dart';

import '../widgets//products_grid.dart';
import '../widgets/badge.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;
  @override
  void initState() {
    /// Provider.of<Products>(context).FetchandSetProducts(); won't work because we cant use anything .of(context) in init state because init state runs before the widgets are fully wiredup

//    Future.delayed(Duration.zero).then((_) {
//      Provider.of<Products>(context).FetchandSetProducts();
//    });

    //this is another way of doing it .....
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isLoading = true;
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('SHOP'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text(
                  'Only Favourites',
                ),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text(
                  'Show All',
                ),
                value: FilterOptions.All,
              )
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });

              // print(selectedValue);
            },
          ),
          Consumer<Cart>(
            builder: (ctx, cartData, ch) => Badge(
              child: ch,
              value: cartData.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () {
                Navigator.of(context).pushNamed('/');
              },
              child: ProductsGrid(_showOnlyFavorites)),
    );
    return scaffold;
  }
}

//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//
//import './cart_screen.dart';
//import '../providers/cart.dart';
//import '../widgets/badge.dart';
//import '../widgets/products_grid.dart';
//
//enum FilterOptions {
//  Favorites,
//  All,
//}
//
//class ProductsOverviewScreen extends StatefulWidget {
//  @override
//  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
//}
//
//class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
//  var _showOnlyFavorites = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('MyShop'),
//        actions: <Widget>[
//          PopupMenuButton(
//            onSelected: (FilterOptions selectedValue) {
//              setState(() {
//                if (selectedValue == FilterOptions.Favorites) {
//                  _showOnlyFavorites = true;
//                } else {
//                  _showOnlyFavorites = false;
//                }
//              });
//            },
//            icon: Icon(
//              Icons.more_vert,
//            ),
//            itemBuilder: (_) => [
//              PopupMenuItem(
//                child: Text('Only Favorites'),
//                value: FilterOptions.Favorites,
//              ),
//              PopupMenuItem(
//                child: Text('Show All'),
//                value: FilterOptions.All,
//              ),
//            ],
//          ),
//          Consumer<Cart>(
//            builder: (_, cart, ch) => Badge(
//              child: ch,
//              value: cart.itemCount.toString(),
//            ),
//            child: IconButton(
//              icon: Icon(
//                Icons.shopping_cart,
//              ),
//              onPressed: () {
//                Navigator.of(context).pushNamed(CartScreen.routeName);
//              },
//            ),
//          ),
//        ],
//      ),
////      drawer: AppDrawer(),
//      body: ProductsGrid(_showOnlyFavorites),
//    );
//  }
//}
