import 'package:demo1/bookingPage.dart';
import 'package:flutter/material.dart';

class CartNotifier extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get totalItems => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get totalCost =>
      _cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void updateQuantity(CartItem item, int quantity) {
    item.quantity = quantity;
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
