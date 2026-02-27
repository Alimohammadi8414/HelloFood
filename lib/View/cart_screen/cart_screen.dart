import 'package:flutter/material.dart';
import 'package:hellofood/theme.dart';
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
    var foodList = context.watch<AddToCartProvider>().cartfoods;
    context.read<AddToCartProvider>().getCart();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),

      body:
          foodList.isEmpty
              ? Center(
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
              )
              : Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Food Cart',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(fontSize: 20),
                    ),
                    Expanded(
                      child: Consumer<AddToCartProvider>(
                        builder: (context, value, child) {
                          var cartfoods = value.cartfoods;
                          return ListView.builder(
                            itemCount: cartfoods.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColors.whit,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.5,
                                      blurStyle: BlurStyle.outer,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(8.0),
                                margin: EdgeInsets.all(3),
                                height: 130,
                                width: MediaQuery.sizeOf(context).width,
                                child: Row(
                                  children: [
                                    // The Image
                                    SizedBox(
                                      height: 90,
                                      width: 90,
                                      child: Image.asset(
                                        value.cartfoods[index].img!,
                                      ),
                                    ),
                                    SizedBox(width: 25),
                                    // Name & Price
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartfoods[index].name!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontSize: 16),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "${cartfoods[index].price.toString()} \$",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontSize: 14),
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // Decreament Botton
                                            IconButton(
                                              onPressed: () async {
                                                if (cartfoods[index].count >
                                                    1) {
                                                  await value.decrement(
                                                    cartfoods[index],
                                                  );
                                                } else if (cartfoods[index]
                                                        .count ==
                                                    1) {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'you are going to delet ',
                                                                style:
                                                                    Theme.of(
                                                                          context,
                                                                        )
                                                                        .textTheme
                                                                        .bodyMedium,
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    "${cartfoods[index].name}",
                                                                style: Theme.of(
                                                                      context,
                                                                    )
                                                                    .textTheme
                                                                    .bodyMedium!
                                                                    .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    ' from your cart',
                                                                style:
                                                                    Theme.of(
                                                                          context,
                                                                        )
                                                                        .textTheme
                                                                        .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        title: Text(
                                                          'Dlete From Cart',
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                            },
                                                            child: Text(
                                                              'NO',
                                                              style: Theme.of(
                                                                    context,
                                                                  )
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    color:
                                                                        AppColors
                                                                            .heavyGray,
                                                                  ),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () async {
                                                              await value
                                                                  .deletFromCart(
                                                                    cartfoods[index],
                                                                  );
                                                              if (context
                                                                  .mounted) {
                                                                Navigator.pop(
                                                                  context,
                                                                );
                                                              }
                                                            },
                                                            child: Text(
                                                              'YES',
                                                              style: Theme.of(
                                                                    context,
                                                                  )
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    color:
                                                                        AppColors
                                                                            .lightRed,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                              icon: Icon(
                                                Icons.remove,
                                                size: 20,
                                              ),
                                            ),
                                            const SizedBox(width: 20),

                                            // Count Of Food
                                            Text(
                                              cartfoods[index].count.toString(),
                                            ),
                                            const SizedBox(width: 20),

                                            // Increament Botton
                                            IconButton(
                                              onPressed: () async {
                                                await value.increment(
                                                  cartfoods[index],
                                                );
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                size: 20,
                                                color: AppColors.lightRed,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      height: 260,
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              visualDensity: VisualDensity(
                                horizontal: 0.0,
                                vertical: -2,
                              ),
                              filled: true,
                              fillColor: AppColors.whit,
                              suffixIcon: Icon(
                                Icons.sell_rounded,
                                color: AppColors.lightRed,
                              ),
                              hintText: 'Add Your Promo Code',
                              hintStyle: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(fontSize: 15),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.gray,
                                  width: 0.5,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AppColors.gray,
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: EdgeInsets.all(8),
                            color: AppColors.whit,
                            width: MediaQuery.sizeOf(context).width,
                            height: 140,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Order Count',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 18),
                                    ),
                                    Text(
                                      "${foodList.length.toString()} ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Discount Percent',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 18),
                                    ),
                                    Text(
                                      '0 %',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Discount',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 18),
                                    ),
                                    Text(
                                      '0 \$',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Final Price',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Text(
                                      '${context.watch<AddToCartProvider>().sum().toStringAsFixed(2)} \$',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Center(
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: AppColors.whit),
                                    ),
                                    Text(
                                      "${context.watch<AddToCartProvider>().sum().toStringAsFixed(2)}\$",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: AppColors.whit),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
