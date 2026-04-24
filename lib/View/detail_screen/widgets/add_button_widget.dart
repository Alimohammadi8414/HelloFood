import 'package:flutter/material.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/viewmodel/add_to_cart_provider.dart';
import 'package:provider/provider.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      width: 195,
      child: Consumer<AddToCartProvider>(
        builder: (context, value, child) {
          if (value.cartbox.containsKey(food.name)) {
            return ElevatedButton(
              onPressed: () async {
                await value.deletFromCart(context, food, false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              ),
              child: Text(
                'Remove From Cart',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.white,
                  fontSize: 18,
                ),
              ),
            );
          } else {
            return ElevatedButton(
              onPressed: () async {
                await value.addTocart(context, food);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              ),
              child: Text(
                'Add To Cart',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.white,
                  fontSize: 18,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
