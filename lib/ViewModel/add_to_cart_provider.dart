import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hellofood/main.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hive/hive.dart';

Food food = Food();

class AddToCartProvider extends ChangeNotifier {
  var cartbox = Hive.box<Food>('cart_foods');

  // Add To HiveBox
  Future<void> addTocart(BuildContext context, Food food) async {
    messengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${food.name} ",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            Text(
              'was added to your cart',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
            ),
          ],
        ),
        backgroundColor: AppColors.green,
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
      ),
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
      messengerKey.currentState!.showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${food.name} ",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              Text(
                'was removed from your cart',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
              ),
            ],
          ),
          backgroundColor: AppColors.lightRed,
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.horizontal,
        ),
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
