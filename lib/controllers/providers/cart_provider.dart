import 'package:flutter/foundation.dart';
import 'package:pos/models/products_model.dart';

class CartProvider extends ChangeNotifier {
  double total = 0.0;

  List<Products> get getCartProducts => cartProducts;
  List<Products> cartProducts = [];

  addToCart(Products product) {
    if (!cartProducts.contains(product)) {
      cartProducts.add(product);
    } else {
      ///show alert product alwready exist
      ///
    }
    notifyListeners();
  }

  removeFromCart(Products product) {
    cartProducts.remove(product);
    notifyListeners();
  }

  calc() {
    cartProducts.forEach((element) {
      total += element.price * element.qty;
    });

    notifyListeners();
  }
}
