import 'package:flutter/material.dart';
import 'package:hellofood/view/topmenuedetail.dart';
import 'package:hellofood/models/topmenuefoods.dart';
import 'package:hellofood/theme.dart';

class TopMenuFoods extends StatelessWidget {
  const TopMenuFoods({super.key});

  @override
  Widget build(BuildContext context) {
    final topfoods = TopMenuFoodsModel.topMenuFoods;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFE6E6), AppColors.backgroundWhit],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topfoods.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Topmenuedetail(
                      index: index,
                      name: topfoods[index].name!,
                    );
                  },
                ),
              );
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: EdgeInsets.all(8.0),
              width: 90,
              height: 100,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppColors.whit,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.asset(topfoods[index].image!),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    topfoods[index].name!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
