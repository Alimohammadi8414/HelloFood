import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/view/cart_screen/widgets/cart_item_tile.dart';
import 'package:hellofood/viewmodel/add_to_cart_provider.dart';
import 'package:provider/provider.dart';

class FoodsList extends StatelessWidget {
  const FoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddToCartProvider>(
      builder: (context, value, child) {
        var cartbox = value.cartbox;
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: cartbox.length,
          itemBuilder: (context, index) {
            final food = cartbox.values.toList()[index];
            return CartItemTile(
              food: food,
              // Increment the number of food
              onIncrement: () {
                value.increment(food);
              },
              // Decrement the number of food
              onDecrement: () async {
                if (food.count > 1) {
                  await value.decrement(food);
                } else {
                  // Alert Dialog for deletion
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text("Delete From Cart"),
                          content: Text("Delete ${food.name}?"),

                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "NO",
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(color: AppColors.heavyGray),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                await value.deletFromCart(context, food, true);
                                if (context.mounted) {
                                  Navigator.pop(context);
                                }
                              },
                              child: Text(
                                "YES",
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(color: AppColors.lightRed),
                              ),
                            ),
                          ],
                        ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
