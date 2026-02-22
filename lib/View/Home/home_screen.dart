import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/Home/widgets/best_food.dart';
import 'package:food_delivery_app/view/Home/widgets/search_widget.dart';
import 'package:food_delivery_app/view/Home/widgets/top_menu_foods.dart';
import 'package:food_delivery_app/view/Home/widgets/popular_foods.dart';
import 'package:food_delivery_app/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'What would you like to eat?',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              SizedBox(height: 10.0),
              TopMenuFoods(),
              PopularFoodTitle(),
              PopularFoods(),
              SizedBox(height: 10),
              BestFoodTitle(),
              SizedBox(height: 10),
              BestFood(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class BestFoodTitle extends StatelessWidget {
  const BestFoodTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Best Foods',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w300,
        fontSize: 22,
      ),
    );
  }
}

class PopularFoodTitle extends StatelessWidget {
  const PopularFoodTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Popular Foods',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w300,
            fontSize: 22,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            overlayColor: AppColors.heavyGray,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {},
          child: Text(
            'See All',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ],
    );
  }
}
