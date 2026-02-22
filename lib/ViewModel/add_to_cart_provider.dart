import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:hive/hive.dart';

class AddToCartProvider extends ChangeNotifier {
  var cartbox = Hive.box<Food>('cart_foods');
  List<Food> cartfoods = [];

  // Add To HiveBox By food.name as Key & food as value
  void addtocart(Food food) async {
    increament(food);
    await cartbox.put(food.name, food);
    notifyListeners();
  }

  // Delete From HiveBox
  void deletFromCart(Food food) async {
    await cartbox.delete(food.name);
    cartfoods.remove(food);
    notifyListeners();
  }

  // Get The Foods In The HiveBox
  void getCart() async {
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

  // Increament the Nomber Of Food
  void increament(Food food) async {
    // if (cartbox.containsKey(food.name)) {
    //   await cartbox.delete(food.name);
    food.count++;
    await cartbox.put(food.name, food);
    // } else {
    //   food.count++;
    //   await cartbox.put(food.name, food);
    // }

    notifyListeners();
  }

  // Decreament the Nomber Of Food
  void decreament(Food food) async {
    // if (cartbox.containsKey(food.name)) {
    //   await cartbox.delete(food.name);
    food.count--;
    await cartbox.put(food.name, food);
    // } else {
    //   await cartbox.delete(food.name);

    // }

    notifyListeners();
  }
}
