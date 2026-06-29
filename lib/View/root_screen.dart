import 'package:flutter/material.dart';
import 'package:hellofood/view/account_screen/signing_screen.dart';
import 'package:hellofood/view/cart_screen/cart_screen.dart';
import 'package:hellofood/view/home/home_screen.dart';
import 'package:hellofood/view/near_by_screen/nearby_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.near_me), label: 'NEAR BY'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'CART',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'ACCOUNT ',
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [HomeScreen(), NearbyScreen(), CartScreen(), SignUpScreen()],
      ),
    );
  }
}
