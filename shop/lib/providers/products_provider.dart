import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/models/http_exception.dart';

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  final String authToken;
  final String userId;

  Products(this.authToken, this.userId, this._items);
  List<Product> get items {
//    if (_showFavoritesOnly) {
//      return _items.where((element) => element.isFavorite).toList();
//    }
    return [..._items];
  }

  List<Product> get favouriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

//  void showFavoritesOnly() {
//    _showFavoritesOnly = true;
//    notifyListeners();
//  }
//
//  void showAll() {
//    _showFavoritesOnly = false;
//    notifyListeners();
//  }

  Future<void> fetchAndSetProducts([bool filterProductsByUser = false]) async {
    var filterString =
        filterProductsByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    final url =
        'https://shop-93c2b.firebaseio.com/products.json?auth=$authToken&$filterString';
    try {
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      final favoriteStatusResponse = await http.get(
          'https://shop-93c2b.firebaseio.com/userfavorites/$userId.json?auth=$authToken');
      final favoriteData = json.decode(favoriteStatusResponse.body);

      final List<Product> loadedProduct = [];

      extractedData.forEach((prodId, prodData) {
        loadedProduct.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          imageUrl: prodData['imageUrl'],
          isFavorite:
              favoriteData == null ? false : favoriteData[prodId] ?? false,
        ));
      });
      _items = loadedProduct;

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(Product product) async {
    final url =
        'https://shop-93c2b.firebaseio.com/products.json?auth=$authToken&orderBy="creatorId"&"equalTo="$userId"';

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'creatorId': userId,
        }),
      );

      final newProduct = Product(
          title: product.title,
          imageUrl: product.imageUrl,
          description: product.description,
          id: json.decode(response.body)['name'],
          price: product.price);
      _items.insert(0, newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      final url =
          'https://shop-93c2b.firebaseio.com/products/$id.json?auth=$authToken';

      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price
          }));

      _items[prodIndex] = newProduct;
    } else {
      print('....');
    }

    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    final url =
        'https://shop-93c2b.firebaseio.com/products/$id.json?auth=$authToken';

    final existingProductIndex =
        _items.indexWhere((element) => element.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    _items.removeWhere((product) => (product.id == id));
    _items.removeAt(existingProductIndex);
    notifyListeners();

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('could not delete product');
    }
    existingProduct = null;
    notifyListeners();
  }
}
