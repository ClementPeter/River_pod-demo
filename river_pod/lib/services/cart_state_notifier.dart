import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/models/product.dart';

//Create a provider for StateNotifierProvider
final cartNotifierProvider = StateNotifierProvider<CartStateNotifier, List<Product>>((ref) {
  return  CartStateNotifier();
});

//State notifier is more preferred to Change Provider Notifier
class CartStateNotifier extends StateNotifier<List<Product>> {
  CartStateNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void clearCart() {
    state = [];
  }

}