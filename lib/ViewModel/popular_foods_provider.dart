import 'package:flutter/material.dart';
import 'package:hellofood/main.dart';
import 'package:hellofood/models/food.dart';
import 'package:hellofood/theme.dart';
import 'package:hive/hive.dart';

var box = Hive.box<Food>('favorite_foods');

Food food = Food();

class Popularfoodsprovider extends ChangeNotifier {
  addOrRemov(Food fooditem, BuildContext context) async {
    if (box.containsKey(fooditem.name)) {
      removeFromFavoritMessage(fooditem, context);
      await box.delete(fooditem.name);
    } else {
      addToFavoritMessage(fooditem, context);
      await box.put(fooditem.name, fooditem);
    }
    notifyListeners();
  }
}

addToFavoritMessage(Food fooditem, BuildContext context) {
  messengerKey.currentState?.showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: Colors.green,
      content: Text(
        '${fooditem.name} is added to favorit',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ),
  );
}

removeFromFavoritMessage(Food fooditem, BuildContext context) {
  messengerKey.currentState?.showSnackBar(
    SnackBar(
      hitTestBehavior: HitTestBehavior.opaque,
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,

      backgroundColor: AppColors.lightRed,
      content: Text(
        '${fooditem.name} is removed from favorit',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: AppColors.whit),
      ),
    ),
  );
}
