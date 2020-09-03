import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Screens/editing_products_screen.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/user_products_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = 'user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        .fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('your Products'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              }),
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, snapshot) =>
            (snapshot.connectionState != ConnectionState.done)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshProducts(context),
                    child: Consumer<Products>(
                      builder: (ctx, productsData, _) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemBuilder: (_, i) => UserProductItem(
                            productsData.items[i].id,
                            productsData.items[i].title,
                            productsData.items[i].imageUrl,
                          ),
                          itemCount: productsData.items.length,
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
