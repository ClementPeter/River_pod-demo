import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/models/product.dart';

//provider to extend cart Notifier using ChangeNotifierProvider - Used to Demo ChangeNotifierProvider in change_notifier_provider_page.dart
final cartNotifierProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});

class CartNotifier extends ChangeNotifier {
  //Empty list that hold the Product when any of the methods are called
  List<Product> _cart = [];

  get cart => _cart;

  void addProduct(Product product) {
    //print(_cart);
    _cart.add(product);
    notifyListeners();
  }


  void clear() {
    _cart.clear();
    notifyListeners();
  }
}
