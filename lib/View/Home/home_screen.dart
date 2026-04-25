import 'package:flutter/material.dart';
import 'package:hellofood/view/home/widgets/best_food.dart';
import 'package:hellofood/view/home/widgets/popular_foods.dart';
import 'package:hellofood/view/home/widgets/popular_foods_title.dart';
import 'package:hellofood/view/home/widgets/search_widget.dart';
import 'package:hellofood/view/home/widgets/top_menu_foods.dart';

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
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              const SizedBox(height: 10.0),
              TopMenuFoods(),
              PopularFoodTitle(),
              PopularFoods(),
              const SizedBox(height: 10),
              BestFoodTitle(),
              const SizedBox(height: 10),
              BestFood(),
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
