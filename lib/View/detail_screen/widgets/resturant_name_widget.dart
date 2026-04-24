import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';

class RestursntName extends StatelessWidget {
  const RestursntName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'by ',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray),
              ),
              TextSpan(
                text: 'Pizza hut',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
