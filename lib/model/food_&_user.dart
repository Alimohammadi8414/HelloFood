import 'package:hive/hive.dart';

part 'food_&_user.g.dart';

// Food Model
@HiveType(typeId: 0)
class Food extends HiveObject {
  @HiveField(0)
  String? img;
  @HiveField(1)
  String? name;
  @HiveField(2)
  double? price;
  @HiveField(3)
  double? rate;
  @HiveField(4)
  int? numberofratings;
  @HiveField(5)
  String? description;
  @HiveField(6)
  int count;

  Food({
    this.img,
    this.name,
    this.price,
    this.rate,
    this.numberofratings,
    this.count = 0,
  });

  Food copy() {
    return Food(
      count: count,
      name: name,
      img: img,
      price: price,
      numberofratings: numberofratings,
      rate: rate,
    );
  }
}

//  User Model
@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? lastName;
  @HiveField(2)
  final int? phone;
  @HiveField(3)
  final String? password;
  User({this.name, this.lastName, this.phone, this.password});
}

// Offline List of Foods
List<Food> bestfoods = [
  Food(
    img: "assets/images/ic_best_food_1.jpeg",
    name: 'Grilled Meat',
    price: 19.65,
    rate: 2.1,
    numberofratings: 100,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_2.jpeg',
    name: 'Bulani',
    price: 51.5,
    rate: 4.2,
    numberofratings: 400,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_3.jpeg',
    name: 'Ashak',
    price: 13.80,
    rate: 3,
    numberofratings: 214,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_4.jpeg',
    name: 'Daldah',
    price: 46.00,
    rate: 5,
    numberofratings: 142,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_5.jpeg',
    name: 'Atashin',
    price: 14,
    rate: 4,
    numberofratings: 25,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_7.jpeg',
    name: 'Sabzi Ghormah',
    price: 47.30,
    rate: 3.5,
    numberofratings: 112,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_8.jpeg',
    name: 'Some Food',
    price: 64.0,
    rate: 1.5,
    numberofratings: 50,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_9.jpeg',
    name: 'Manto',
    price: 34.10,
    rate: 4.8,
    numberofratings: 150,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_10.jpeg',
    name: 'Hlal',
    price: 65.30,
    rate: 4.1,
    numberofratings: 65,
    count: 0,
  ),
];

List<Food> popularfoods = [
  Food(
    img: 'assets/images/ic_popular_food_1.png',
    name: "Egg with Sauce",
    rate: 2.9,
    price: 15.06,
    numberofratings: 150,
    count: 0,
  ),

  Food(
    img: 'assets/images/ic_popular_food_3.png',
    name: "Mixed Vegetable",
    rate: 2.7,
    price: 8.50,
    numberofratings: 124,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_popular_food_4.png',
    name: 'Salad With Chicken',
    price: 11.00,
    rate: 3.0,
    numberofratings: 80,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_popular_food_5.png',
    name: 'Mixed Salad',
    price: 11.10,
    rate: 4.0,
    numberofratings: 138,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_popular_food_6.png',
    name: 'Potato, Fried Meat',
    price: 23.10,
    rate: 5.0,
    numberofratings: 145,
    count: 0,
  ),
  Food(
    img: "assets/images/ic_best_food_1.jpeg",
    name: 'Mixed Fruits & Milk',
    price: 19.65,
    rate: 2.1,
    numberofratings: 100,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_2.jpeg',
    name: 'Crab Soup',
    price: 51.5,
    rate: 4.2,
    numberofratings: 400,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_3.jpeg',
    name: 'Grilled Beef, Vegetable',
    price: 13.80,
    rate: 3,
    numberofratings: 214,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_4.jpeg',
    name: 'Ice Chocolate & Cream',
    price: 46.00,
    rate: 5,
    numberofratings: 142,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_5.jpeg',
    name: 'Desserts',
    price: 14,
    rate: 4,
    numberofratings: 25,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_7.jpeg',
    name: 'Sweat Dessert',
    price: 47.30,
    rate: 3.5,
    numberofratings: 112,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_8.jpeg',
    name: 'fried Chicken,Spaghetti',
    price: 64.0,
    rate: 1.5,
    numberofratings: 50,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_9.jpeg',
    name: 'Mixed Fruits, Ice Coffee',
    price: 34.10,
    rate: 4.8,
    numberofratings: 150,
    count: 0,
  ),
  Food(
    img: 'assets/images/ic_best_food_10.jpeg',
    name: 'Broccoli Salad',
    price: 65.30,
    rate: 4.1,
    numberofratings: 65,
    count: 0,
  ),
];
