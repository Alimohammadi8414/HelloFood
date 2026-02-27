import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hellofood/models/food.dart';

class BestFood extends StatelessWidget {
  const BestFood({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: MediaQuery.sizeOf(context).width,
      child: CarouselSlider.builder(
        itemCount: bestfoods.length,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.asset(bestfoods[index].img!, fit: BoxFit.fill),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          animateToClosest: false,
          enableInfiniteScroll: true,
          initialPage: 0,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}
