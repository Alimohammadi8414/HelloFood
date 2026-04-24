import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/viewmodel/add_to_cart_provider.dart';
import 'package:provider/provider.dart';

class TopWidgets extends StatelessWidget {
  const TopWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Your Food Cart',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
        ),
        // Delete All Foods Botton
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Delet All Foods"),
                  content: Text("Delete all foods in your cart?"),

                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "NO",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.heavyGray,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await context.read<AddToCartProvider>().deletAll();

                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "YES",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.lightRed,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          icon: Icon(Icons.delete_outline_rounded),
        ),
      ],
    );
  }
}
