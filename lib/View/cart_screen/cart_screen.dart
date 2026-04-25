import 'package:flutter/material.dart';

import 'package:hellofood/view/cart_screen/widgets/empty_cart_widget.dart';
import 'package:hellofood/view/cart_screen/widgets/foods_list_widget.dart';
import 'package:hellofood/view/cart_screen/widgets/order_summary_widget.dart';
import 'package:hellofood/view/cart_screen/widgets/textfield_widget.dart';
import 'package:hellofood/view/cart_screen/widgets/top_widgets.dart';
import 'package:hellofood/viewmodel/add_to_cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<AddToCartProvider>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          provider.cartbox.isEmpty
              ? null
              : FloatingActionButton.extended(
                onPressed: () {},
                label: SizedBox(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width - 150,
                  child: Center(
                    child: Text(
                      'Place Order    \$${provider.finalPrice().toStringAsFixed(2)}',
                    ),
                  ),
                ),
                extendedTextStyle: Theme.of(context).textTheme.bodyLarge,
              ),
      appBar: AppBar(title: Text('Cart Items'), centerTitle: true),
      body:
          // When your Cart is empty
          provider.cartbox.isEmpty
              ? EmptyCartWidget()
              // When your Cart is NOT empty
              : Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TopWidgets(),
                      FoodsList(),
                      PromoCodeTextField(),
                      OrderSummary(foodList: provider.cartbox),
                      const SizedBox(height: 80),
                      // PlaceOrderBotton(),
                    ],
                  ),
                ),
              ),
    );
  }
}
