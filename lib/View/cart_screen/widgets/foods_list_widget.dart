import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/view/cart_screen/widgets/cart_item_tile.dart';
import 'package:hellofood/viewmodel/add_to_cart_provider.dart';
import 'package:provider/provider.dart';

bool lessThanTwo = true;

class FoodsList extends StatelessWidget {
  const FoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddToCartProvider>(
      builder: (context, value, child) {
        var cartbox = value.cartbox;
        var size = MediaQuery.sizeOf(context);
        if (value.cartbox.length <= 2) {
          lessThanTwo = true;
        } else {
          lessThanTwo = false;
        }
        return SizedBox(
          width: size.width,
          height: lessThanTwo ? size.height * 0.44 : null,
          child: ListView.builder(
            shrinkWrap: lessThanTwo ? false : true,
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
                            title: Text(
                              "Delete From Cart",
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            content: Text(
                              "Delete ${food.name}?",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),

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
                                  await value.deletFromCart(
                                    context,
                                    food,
                                    true,
                                  );
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
          ),
        );
      },
    );
  }
}
