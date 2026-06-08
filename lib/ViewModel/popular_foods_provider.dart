import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hellofood/main.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hive/hive.dart';

var box = Hive.box<Food>('favorite_foods');
var font = 'assets/fonts/Roboto-Regular.ttf';
var fontsize = 16.0;

class Popularfoodsprovider extends ChangeNotifier {
  Future<void> addOrRemove(Food food, BuildContext context) async {
    final newFood = food.copy();
    if (box.containsKey(food.name)) {
      await box.delete(food.name);
    } else {
      addMessage(food, context);
      await box.put(food.name, newFood);
    }
    notifyListeners();
  }
}

// Add message when the food item is added to favorites
Future<void> addMessage(Food food, BuildContext context) async {
  await Fluttertoast.showToast(
    msg: ' ${food.name} was added to your cart ',
    backgroundColor: AppColors.darkGray,
    fontAsset: font,
    fontSize: fontsize,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_SHORT,
    textColor: AppColors.white,
  );
}
