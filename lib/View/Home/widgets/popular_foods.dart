import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hellofood/view/detail_screen/foods_detail_screen.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/viewmodel/add_to_cart_provider.dart';
import 'package:hellofood/viewmodel/popular_foods_provider.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

var box = Hive.box<Food>('favorite_foods');
var cartbox = Hive.box<Food>('cart_foods');
var foods = popularfoods;

class PopularFoods extends StatefulWidget {
  const PopularFoods({super.key});

  @override
  State<PopularFoods> createState() => _PopularFoodsState();
}

class _PopularFoodsState extends State<PopularFoods> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: MediaQuery.sizeOf(context).width,
      child: Consumer<Popularfoodsprovider>(
        builder: (context, value, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foods.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FoodsDetailScreen(food: foods[index]);
                      },
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        spreadRadius: 0,
                        blurStyle: BlurStyle.normal,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 15),
                  margin: const EdgeInsets.all(8.0),
                  height: 230,
                  width: 190,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            //Image
                            Positioned(
                              top: 8,
                              left: 25,
                              child: Container(
                                height: 130,
                                width: 130,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),

                                child: Image.asset(
                                  foods[index].img!,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            // Add Icon
                            Consumer<AddToCartProvider>(
                              builder: (context, value, child) {
                                return Positioned(
                                  top: -2,
                                  right: -2,
                                  child:
                                      cartbox.containsKey(foods[index].name)
                                          ? IconButton(
                                            style: IconButton.styleFrom(
                                              iconSize: 18,
                                              visualDensity: VisualDensity(
                                                horizontal: -2,
                                                vertical: -2,
                                              ),
                                              backgroundColor: AppColors.gray
                                                  .withValues(alpha: 0.3),
                                            ),
                                            onPressed: () {
                                              value.deletFromCart(
                                                context,
                                                foods[index],
                                                false,
                                              );
                                            },
                                            icon: Icon(Icons.remove),
                                          )
                                          : IconButton(
                                            style: IconButton.styleFrom(
                                              iconSize: 18,
                                              visualDensity: VisualDensity(
                                                horizontal: -2,
                                                vertical: -2,
                                              ),
                                              backgroundColor: AppColors.gray
                                                  .withValues(alpha: 0.3),
                                            ),
                                            onPressed: () {
                                              value.addTocart(
                                                context,
                                                foods[index],
                                              );
                                            },
                                            icon: const Icon(Icons.add),
                                          ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Name of the food
                          Text(
                            foods[index].name!,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),

                          // Navigation Icon
                          IconButton(
                            visualDensity: VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.near_me,
                              size: 20,
                              color: AppColors.lightRed,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Rate Number
                          Text(
                            foods[index].rate.toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 2.0),

                          // Rating Bar
                          RatingBarIndicator(
                            itemCount: 5,
                            itemSize: 10,
                            rating: foods[index].rate!,
                            itemBuilder: (BuildContext context, int index) {
                              return Icon(
                                Icons.star,
                                color: AppColors.lightRed,
                              );
                            },
                          ),

                          const SizedBox(width: 2.0),

                          // Number Of Rating
                          Text(
                            '(${foods[index].numberofratings})',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(fontSize: 12),
                          ),
                          const Spacer(),

                          // Price
                          Text(
                            '\$${foods[index].price!.toStringAsFixed(2)}',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
