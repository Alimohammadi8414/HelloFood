import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.gray, AppColors.heavyGray],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        Text(
          'Or',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
        ),
        Container(
          height: 1,
          width: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.heavyGray, AppColors.gray],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
