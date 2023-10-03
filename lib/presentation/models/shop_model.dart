import 'package:flutter/material.dart';

import 'food_model.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
        name: 'salmon',
        price: '300.00',
        imagePath: 'assets/img/tuna.png',
        rating: '5'),
    Food(
        name: 'sushi casa',
        price: '400.00',
        imagePath: 'assets/img/sushi3.png',
        rating: '5'),
    Food(
        name: 'sushi 2',
        price: '400.00',
        imagePath: 'assets/img/sushis.png',
        rating: '5.5'),
  ];

  //customer Card

  // ignore: prefer_final_fields
  List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
