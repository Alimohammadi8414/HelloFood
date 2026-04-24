import 'package:flutter/material.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/viewmodel/add_to_cart_provider.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.foodList});

  final Box<Food> foodList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.sizeOf(context).width,
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Count',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 18),
              ),
              Text(
                "${context.watch<AddToCartProvider>().orderCount().toString()} ",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount Percent',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 18),
              ),
              Text(
                '0 %',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Discount',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 18),
              ),
              Text(
                '0 \$',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Final Price', style: Theme.of(context).textTheme.bodyLarge),
              Text(
                '\$${context.watch<AddToCartProvider>().finalPrice().toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
