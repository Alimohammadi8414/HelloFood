import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';

class PromoCodeTextField extends StatelessWidget {
  const PromoCodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        visualDensity: VisualDensity(horizontal: 0.0, vertical: -2),
        filled: true,
        fillColor: AppColors.white,
        suffixIcon: Icon(Icons.sell_rounded, color: AppColors.lightRed),
        hintText: 'Add Your Promo Code',
        hintStyle: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(fontSize: 15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.gray, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.gray, width: 0.5),
        ),
      ),
    );
  }
}
