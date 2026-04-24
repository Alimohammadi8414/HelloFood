import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';

class PopularFoodTitle extends StatelessWidget {
  const PopularFoodTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Popular Foods',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w300,
            fontSize: 22,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            overlayColor: AppColors.heavyGray,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {},
          child: Text(
            'See All',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ],
    );
  }
}
