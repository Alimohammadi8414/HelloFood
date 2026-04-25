import 'package:flutter/material.dart';
import 'package:hellofood/main.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hive/hive.dart';

var box = Hive.box<Food>('favorite_foods');

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
addMessage(Food fooditem, BuildContext context) {
  messengerKey.currentState?.showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      content: Text(
        textAlign: TextAlign.center,
        '${fooditem.name} was added to favorites',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
      ),
    ),
  );
}

// Remove message when the food item is removed from favorites
// removeMessage(Food fooditem, BuildContext context) {
//   messengerKey.currentState?.showSnackBar(
//     SnackBar(
//       hitTestBehavior: HitTestBehavior.opaque,
//       duration: Duration(seconds: 2),
//       behavior: SnackBarBehavior.floating,
//       dismissDirection: DismissDirection.horizontal,
//       content: Text(
//         textAlign: TextAlign.center,
//         '${fooditem.name} is removed from favorites',
//       ),
//     ),
//   );
// }
