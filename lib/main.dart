import 'package:flutter/material.dart';
import 'package:hellofood/model/food_&_user.dart';
import 'package:hellofood/view/account_screen/account_screen.dart';
import 'package:hellofood/view/theme.dart';
import 'package:hellofood/viewmodel/add_to_cart_provider.dart';
import 'package:hellofood/viewmodel/popular_foods_provider.dart';
import 'package:hellofood/viewmodel/sign_up_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FoodAdapter());
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<Food>('favorite_foods');
  await Hive.openBox<Food>('cart_foods');
  await Hive.openBox<User>('User');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Popularfoodsprovider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
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
      theme: apptheme,
      debugShowCheckedModeBanner: false,
      home: AccountScreen(),
    );
  }
}
