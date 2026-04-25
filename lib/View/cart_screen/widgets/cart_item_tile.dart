import 'package:flutter/material.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/view/theme.dart';

class CartItemTile extends StatelessWidget {
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemTile({
    super.key,
    required this.food,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 3,
            spreadRadius: 0,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(food.img!, fit: BoxFit.fitHeight),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // The name of food
                Text(
                  food.name!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 5),
                // The price of food
                Text(
                  "\$${food.price}",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Decrement the number of food
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.gray.withValues(alpha: 0.3),
                      ),
                      onPressed: onDecrement,
                      icon: const Icon(Icons.remove, size: 20),
                    ),
                    const SizedBox(width: 20),
                    // Food Count
                    Text(
                      food.count.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    const SizedBox(width: 20),

                    // Increment the number of food
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.gray.withValues(alpha: 0.3),
                      ),
                      onPressed: onIncrement,
                      icon: const Icon(Icons.add, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
