import 'package:flutter/material.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 100),
          const SizedBox(height: 8),
          Text(
            'Your Cart Is Empty',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
