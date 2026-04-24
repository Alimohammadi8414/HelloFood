import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/view/detail_screen/foods_detail_screen.dart';

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
    return Expanded(
      child: TabBarView(
        clipBehavior: Clip.antiAlias,
        controller: controller,
        children: [
          Text(
            textAlign: TextAlign.start,
            """this is a delicious ${widget.food.name} from Pizza Hut. It is made with fresh ingredients and cooked to perfection. You will love the taste and quality of this food item. Perfect for any occasion, whether you are dining alone or with friends and family. Order now and enjoy a delightful meal!.
It is made with fresh ingredients and cooked to perfection. You will love the taste and quality of this food item. Perfect for any occasion, whether you are dining alone or with friends and family. Order now and enjoy a delightful meal!.""",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.heavyGray),
          ),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                dense: false,
                horizontalTitleGap: 10,
                onTap: () {},
                shape: RoundedRectangleBorder(),
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.gray,
                  child: Icon(Icons.person, size: 29, color: Colors.blueGrey),
                ),
                title: Text(
                  ' Very Good',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: const Text(
                  'here what others are saying about this food item. I belive this food is greater than it looks',
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
