import 'package:flutter/material.dart';
import 'package:food_delivery_app/ViewModel/add_to_cart_provider.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/ViewModel/popular_foods_provider.dart';
import 'package:food_delivery_app/root_screen.dart';
import 'package:food_delivery_app/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FoodAdapter());
  await Hive.openBox<Food>('favorite_foods');
  // await Hive.deleteBoxFromDisk('cart_foods');
  await Hive.openBox<Food>('cart_foods');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Popularfoodsprovider()),
        ChangeNotifierProvider(create: (context) => AddToCartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      theme: apptheme,
      debugShowCheckedModeBanner: false,
      home: RootScreen(),
    );
  }
}
