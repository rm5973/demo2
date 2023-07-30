import 'package:flutter/material.dart';

class CartNotifier with ChangeNotifier {
  int _totalItems = 0;

  int get totalItems => _totalItems;

  void addToCart(int quantity) {
    _totalItems += quantity;
    notifyListeners();
  }
}
