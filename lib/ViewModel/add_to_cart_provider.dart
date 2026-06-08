import 'dart:core';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hive/hive.dart';

Food food = Food();
var font = 'assets/fonts/Roboto-Regular.ttf';
var fontsize = 16.0;

class CartProvider extends ChangeNotifier {
  var cartbox = Hive.box<Food>('cart_foods');

  // Add To HiveBox
  Future<void> addTocart(BuildContext context, Food food) async {
    await Fluttertoast.showToast(
      msg: ' ${food.name} was added to your cart ',
      backgroundColor: AppColors.green,
      fontAsset: font,
      fontSize: fontsize,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      textColor: AppColors.white,
    );
    food.count++;
    await cartbox.put(food.name, food);
    notifyListeners();
  }

  // Delete From HiveBox
  Future<void> deletFromCart(
    BuildContext context,
    Food food,
    bool inCartScreen,
  ) async {
    if (!inCartScreen) {
      await Fluttertoast.showToast(
        msg: ' ${food.name} was removed from your cart ',
        backgroundColor: AppColors.lightRed,
        fontAsset: font,
        fontSize: fontsize,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        textColor: AppColors.white,
      );
    }
    food.count = 0;
    await cartbox.delete(food.name);
    notifyListeners();
  }

  // Summurize All Foods prices
  double finalPrice() {
    double total = 0;
    for (var element in cartbox.values) {
      total += element.price! * element.count;
    }
    return total;
  }

  // the number of orders  
  int orderCount() {
    var count = 0;
    for (var element in cartbox.values) {
      count += element.count;
    }
    return count;
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

  // Delet all foods from cart
  Future<void> deletAll() async {
    for (var element in cartbox.values) {
      element.count = 0;
    }
    await cartbox.clear();
    notifyListeners();
  }
}
