import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/view/Food_Detail-Screen/foods_detail_screen.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/viewmodel/popular_foods_provider.dart';
import 'package:food_delivery_app/theme.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:like_button/like_button.dart';

var box = Hive.box<Food>('favorite_foods');

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
            itemCount: popularfoods.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FoodsDetailScreen(food: popularfoods[index]);
                      },
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.whit,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        spreadRadius: 0,
                        blurStyle: BlurStyle.normal,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 15),
                  margin: EdgeInsets.all(8.0),
                  height: 230,
                  width: 190,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned(
                              top: 3,
                              left: 25,
                              child: Image.asset(
                                popularfoods[index].img!,
                                height: 130,
                                width: 130,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: LikeButton(
                                isLiked: box.containsKey(
                                  popularfoods[index].name,
                                ),
                                size: 18,
                                onTap: (isLiked) async {
                                  value.addOrRemov(
                                    popularfoods[index],
                                    context,
                                  );

                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            popularfoods[index].name!,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          IconButton(
                            visualDensity: VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            onPressed: () {},
                            icon: Icon(
                              Icons.near_me,
                              size: 20,
                              color: AppColors.lightRed,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            popularfoods[index].rate.toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(width: 2.0),
                          RatingBarIndicator(
                            itemCount: 5,
                            itemSize: 10,
                            rating: popularfoods[index].rate!,
                            itemBuilder: (BuildContext context, int index) {
                              return Icon(
                                Icons.star,
                                color: AppColors.lightRed,
                              );
                            },
                          ),
                          SizedBox(width: 2.0),
                          Text(
                            '(${popularfoods[index].numberofratings})',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(fontSize: 12),
                          ),
                          Spacer(),
                          Text(
                            '\$${popularfoods[index].price!.toStringAsFixed(2)}',
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
