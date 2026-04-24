import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/viewmodel/add_to_cart_provider.dart';
import 'package:provider/provider.dart';

class PlaceOrderBotton extends StatelessWidget {
  const PlaceOrderBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lightRed,
          ),
          height: 50,
          width: MediaQuery.sizeOf(context).width - 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Place Order ',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppColors.white),
              ),
              Text(
                "${context.watch<AddToCartProvider>().finalPrice().toStringAsFixed(2)}\$",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
