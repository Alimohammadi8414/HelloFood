import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hellofood/models/food.dart';
import 'package:hive/hive.dart';

class AddToCartProvider extends ChangeNotifier {
  var cartbox = Hive.box<Food>('cart_foods');
  List<Food> cartfoods = [];

  // Add To HiveBox
  Future<void> addTocart(Food food) async {
    food.count++;
    await cartbox.put(food.name, food);
    notifyListeners();
  }

  // Delete From HiveBox
  Future<void> deletFromCart(Food food) async {
    await cartbox.delete(food.name);
    cartfoods.remove(food);
    notifyListeners();
  }

  // Get The Foods In The HiveBox
  void getCart() {
    cartfoods.clear();
    cartfoods.addAll(cartbox.values);
  }

  // Summurize All Foods prices
  double sum() {
    double total = 0;
    for (var element in cartfoods) {
      total += element.price! * element.count;
    }
    return total;
  }

  // Increment the Number Of Food
  Future<void> increment(Food food) async {
    food.count++;
    await food.save();
    notifyListeners();
  }

  // Decrement the Number Of Food
  Future<void> decrement(Food food) async {
    food.count--;
    await food.save();

    notifyListeners();
  }
}
