import 'package:flutter/material.dart';
import '../models/product.dart';

class CartController with ChangeNotifier {
  final Map<String, Map<String, dynamic>> _cartItems = {};

  Map<String, Map<String, dynamic>> get cart => {..._cartItems};

  void addToCart(Product product) {
    if (_cartItems.containsKey(product.id)) {
      _cartItems[product.id]!['quantity']++;
    } else {
      _cartItems.putIfAbsent(
        product.id,
            () => {'product': product, 'quantity': 1},
      );
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    if (_cartItems.containsKey(id)) {
      if (_cartItems[id]!['quantity'] > 1) {
        _cartItems[id]!['quantity']--;
      } else {
        _cartItems.remove(id);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  bool isProductInCart(String id) {
    return _cartItems.containsKey(id);
  }

  int getProductAmount(String id) {
    return _cartItems[id]?['quantity'] ?? 0;
  }

  double get totalPrice {
    double total = 0.0;
    _cartItems.forEach((key, value) {
      total += value['product'].price * value['quantity'];
    });
    return total;
  }
}