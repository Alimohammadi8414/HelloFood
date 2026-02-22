import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/desktopscafolld.dart';
import 'package:food_delivery_app/Screens/mobilescafolld.dart';
import 'package:food_delivery_app/Screens/teabletscafolld.dart';
import 'package:food_delivery_app/responsive/responsive_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveLayout(
        desktopScafolld: Desktopscafolld(),
        mobileScafolld: Mobilescafolld(),
        tabletScafolld: Teabletscafolld(),
      ),
    );
  }
}
