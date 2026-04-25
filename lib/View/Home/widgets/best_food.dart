import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/view/detail_screen/foods_detail_screen.dart';

class BestFood extends StatefulWidget {
  const BestFood({super.key});

  @override
  State<BestFood> createState() => _BestFoodState();
}

class _BestFoodState extends State<BestFood> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: MediaQuery.sizeOf(context).width,
      child: CarouselSlider.builder(
        itemCount: bestfoods.length,
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FoodsDetailScreen(food: bestfoods[index]);
                  },
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.asset(bestfoods[index].img!, fit: BoxFit.fill),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          animateToClosest: true,
          enableInfiniteScroll: true,
          initialPage: 0,
          enlargeCenterPage: true,
          viewportFraction: 0.7,
          enlargeFactor: 0.4,
        ),
      ),
    );
  }
}
