import 'package:flutter/material.dart';
import 'package:hellofood/view/detail_screen/foods_detail_screen.dart';

class NameAndPriceWidget extends StatelessWidget {
  const NameAndPriceWidget({super.key, required this.widget});

  final FoodsDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.food.name!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
        ),
        Text(
          '\$${widget.food.price}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
