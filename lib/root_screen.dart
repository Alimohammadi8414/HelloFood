import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/account_Screen/account_screen.dart';
import 'package:food_delivery_app/view/cart_screen/cart_screen.dart';
import 'package:food_delivery_app/view/Home/home_screen.dart';
import 'package:food_delivery_app/view/Near_By_Screen/nearby_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

int selectedindex = 0;

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: selectedindex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedindex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.near_me), label: 'NEAR BY'),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'CART',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'ACCOUNT ',
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedindex,
        children: [HomeScreen(), NearbyScreen(), CartScreen(), AccountScreen()],
      ),
    );
  }
}
