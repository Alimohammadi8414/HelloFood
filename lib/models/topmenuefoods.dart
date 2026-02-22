class TopMenuFoodsModel {
  final String? image;
  final String? name;

  TopMenuFoodsModel({this.image, this.name});

  static List<TopMenuFoodsModel> topMenuFoods = [
    TopMenuFoodsModel(image: 'assets/images/ic_pizza.png', name: 'Pizza'),
    TopMenuFoodsModel(image: 'assets/images/ic_burger.png', name: 'Burger'),
    TopMenuFoodsModel(image: 'assets/images/ic_sushi.png', name: 'Sushi'),
    TopMenuFoodsModel(
      image: 'assets/images/ic_soft_drink.png',
      name: 'Soft Drinks',
    ),
    TopMenuFoodsModel(image: 'assets/images/ic_pasta.png', name: 'Pasta'),
    TopMenuFoodsModel(
      image: 'assets/images/ic_ice_cream.png',
      name: 'Ice Cream',
    ),
    TopMenuFoodsModel(image: 'assets/images/ic_cake.png', name: 'cake'),
  ];
}
