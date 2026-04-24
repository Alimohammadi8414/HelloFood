import 'package:flutter/material.dart';
import 'package:hellofood/view/theme.dart';

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
        controller: controller,
        padding: EdgeInsets.symmetric(vertical: 5.0),
        tabs: [const Tab(text: 'Over View'), const Tab(text: 'Reviews')],
      ),
    );
  }
}
