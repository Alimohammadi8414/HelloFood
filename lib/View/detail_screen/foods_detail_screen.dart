import 'package:flutter/material.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/view/detail_screen/widgets/resturant_name_widget.dart';
import 'package:hellofood/view/detail_screen/widgets/add_button_widget.dart';
import 'package:hellofood/view/detail_screen/widgets/bottom_menu_widget.dart';
import 'package:hellofood/view/detail_screen/widgets/name_price_widget.dart';
import 'package:hellofood/view/detail_screen/widgets/tab_bar_widget.dart';
import 'package:hellofood/view/detail_screen/widgets/tab_bar_view_widget.dart';
import 'package:hellofood/viewmodel/popular_foods_provider.dart';
import 'package:hive/hive.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

var box = Hive.box<Food>('favorite_foods');

class FoodsDetailScreen extends StatefulWidget {
  final Food food;
  const FoodsDetailScreen({super.key, required this.food});

  @override
  State<FoodsDetailScreen> createState() => _FoodsDetailScreenState();
}

class _FoodsDetailScreenState extends State<FoodsDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<Popularfoodsprovider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          LikeButton(
            padding: EdgeInsets.only(right: 15),
            isLiked: box.containsKey(widget.food.name),
            size: 25,
            onTap: (isLiked) async {
              await provider.addOrRemove(widget.food, context);

              return null;
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Image.asset(widget.food.img!, height: 250, width: 250),
            const SizedBox(height: 10),
            NameAndPriceWidget(widget: widget),
            RestursntName(),
            const SizedBox(height: 15),
            AddButtonWidget(food: widget.food),
            const SizedBox(height: 10),
            TabBarWidget(controller: controller),
            TabBarViewWidget(controller: controller, widget: widget),
            const SizedBox(height: 5),
            BottomMenuWidgets(),
          ],
        ),
      ),
    );
  }
}
