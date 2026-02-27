import 'package:flutter/material.dart';
import 'package:food_delivery_app/viewmodel/add_to_cart_provider.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/theme.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(icon: Icon(Icons.local_mall_rounded), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset(widget.food.img!),
              SizedBox(height: 10),
              NameAndPriceWidget(widget: widget),
              RestursntName(),
              SizedBox(height: 15),
              AddButtonWidget(widget: widget),
              SizedBox(height: 10),
              TabBarWidget(controller: controller),
              TabBarViewWidget(controller: controller, widget: widget),
              SizedBox(height: 15),

              BottonMenuWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({super.key, required this.widget});

  final FoodsDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      width: 195,
      child: Consumer<AddToCartProvider>(
        builder: (context, value, child) {
          if (value.cartbox.containsKey(widget.food.name)) {
            return Container(
              alignment: Alignment(0, 0),
              padding: EdgeInsets.all(5),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'This Item Is In The Cart',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: AppColors.whit),
              ),
            );
          } else {
            return ElevatedButton(
              onPressed: () async {
                await value.addTocart(widget.food);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8.0),
                ),
              ),
              child: Text(
                'Add To Cart',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.whit,
                  fontSize: 18,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class BottonMenuWidgets extends StatelessWidget {
  const BottonMenuWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(
              Icons.timelapse_outlined,
              color: Colors.indigoAccent,
              size: 38,
            ),
            SizedBox(height: 12.0),
            Text(
              '12am-3pm',
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.gray),
            ),
          ],
        ),
        Column(
          children: [
            Icon(Icons.directions, color: Colors.green, size: 38),
            SizedBox(height: 12.0),
            Text(
              '3.5km',
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.gray),
            ),
          ],
        ),
        Column(
          children: [
            Icon(Icons.map, color: Colors.pink, size: 38),
            SizedBox(height: 12.0),
            Text(
              'Map View',
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.gray),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.directions_bike_outlined,
              color: Colors.orange[800],
              size: 38,
            ),
            SizedBox(height: 12.0),
            Text(
              'Delivery',
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.gray),
            ),
          ],
        ),
      ],
    );
  }
}

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({
    super.key,
    required this.controller,
    required this.widget,
  });

  final TabController controller;
  final FoodsDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: TabBarView(
        clipBehavior: Clip.antiAlias,
        controller: controller,
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Text(
              textAlign: TextAlign.justify,
              'this is a delicious ${widget.food.name} from Pizza Hut. It is made with fresh ingredients and cooked to perfection. You will love the taste and quality of this food item. Perfect for any occasion, whether you are dining alone or with friends and family. Order now and enjoy a delightful meal!.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.heavyGray,
                fontSize: 14,
              ),
            ),
          ),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                horizontalTitleGap: 10,
                onTap: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.gray,
                  child: Icon(Icons.person, size: 29, color: Colors.blueGrey),
                ),
                title: Text(
                  ' Very Good',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text(
                  'here what others are saying about this food item.',
                ),
              );
            },
            physics: ClampingScrollPhysics(),
          ),
        ],
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      child: TabBar(
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        dividerHeight: 0,
        labelColor: AppColors.lightRed,
        unselectedLabelColor: AppColors.gray,
        indicatorAnimation: TabIndicatorAnimation.elastic,
        isScrollable: false,
        controller: controller,
        padding: EdgeInsets.symmetric(vertical: 5.0),
        tabs: [Tab(text: 'Food Detail'), Tab(text: 'Food Reviews')],
      ),
    );
  }
}

class RestursntName extends StatelessWidget {
  const RestursntName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'by ',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.gray),
              ),
              TextSpan(
                text: 'Pizza hut',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NameAndPriceWidget extends StatelessWidget {
  const NameAndPriceWidget({super.key, required this.widget});

  final FoodsDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.food.name!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
        ),
        Text(
          '\$${widget.food.price}',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
