import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../models/product.dart';
import 'dart:math';

class OrderController with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  void addOrder(List<Product> products) {
    _orders.add(Order(
      id: Random().nextInt(10000).toString(),
      products: products,
      date: DateTime.now(),
    ));
    notifyListeners();
  }
}