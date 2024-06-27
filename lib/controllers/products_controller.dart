import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsController with ChangeNotifier {
  final List<Product> _list = [];

  List<Product> get list => [..._list];

  void addProduct(Product product) {
    _list.add(product);
    notifyListeners();
  }

  void removeProduct(String id) {
    _list.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  void editProduct(String id, Product newProduct) {
    final index = _list.indexWhere((product) => product.id == id);
    if (index != -1) {
      _list[index] = newProduct;
      notifyListeners();
    }
  }
}