class MealNearBy {
  double price;
  bool favButtonTap;
  final String dishName;
  final String dishImg;
  int noOfItems;
  List<Map<String, dynamic>> extraItemslist;
  MealNearBy({
    required this.dishImg,
    required this.dishName,
    required this.favButtonTap,
    required this.price,
    required this.extraItemslist,
    required this.noOfItems,
  });
  static List<MealNearBy> mealNearByList = [
    MealNearBy(
      dishImg: 'assets/images/chiefImg/r3.jpg',
      dishName: 'Chicken Tikka Pizza',
      favButtonTap: false,
      price: 10.35,
      noOfItems: 1,
      extraItemslist: [
        {
          'img': 'assets/icons/cheese.png',
          'title': 'Extra Cheese',
          'price': 3.99,
          'buttonPress': false,
        },
        {
          'img': 'assets/icons/veg.png',
          'title': 'Baby spinach',
          'price': 2.55,
          'buttonPress': false,
        },
        {
          'img': 'assets/icons/mushroom.png',
          'title': 'Mushroom',
          'price': 1.99,
          'buttonPress': false,
        },
      ],
    ),
    MealNearBy(
      dishImg: 'assets/images/chiefImg/d2.jpg',
      dishName: 'SubwaySandwich',
      favButtonTap: false,
      price: 8.35,
      noOfItems: 1,
      extraItemslist: [
        {
          'img': 'assets/icons/cheese.png',
          'title': 'Extra Cheese',
          'price': 1.99,
          'buttonPress': false,
        },
        {
          'img': 'assets/icons/veg.png',
          'title': 'Baby spinach',
          'price': 4.30,
          'buttonPress': false,
        },
        {
          'img': 'assets/icons/mushroom.png',
          'title': 'Mushroom',
          'price': 0.99,
          'buttonPress': false,
        },
      ],
    ),
    MealNearBy(
      dishImg: 'assets/images/chiefImg/d3.jpg',
      dishName: 'Zinger Burger',
      favButtonTap: false,
      price: 11.55,
      noOfItems: 1,
      extraItemslist: [
        {
          'img': 'assets/icons/cheese.png',
          'title': 'Extra Cheese',
          'price': 2.30,
          'buttonPress': false,
        },
        {
          'img': 'assets/icons/veg.png',
          'title': 'Baby spinach',
          'price': 1.99,
          'buttonPress': false,
        },
        {
          'img': 'assets/icons/mushroom.png',
          'title': 'Mushroom',
          'price': 3.30,
          'buttonPress': false,
        },
      ],
    ),
    MealNearBy(
      dishImg: 'assets/images/chiefImg/d4.jpg',
      dishName: 'Chicken Nuggets',
      favButtonTap: false,
      price: 9.59,
      noOfItems: 1,
      extraItemslist: [
        {
          'img': 'assets/icons/cheese.png',
          'title': 'Extra Cheese',
          'price': 3.99,
          'buttonPress': false,
        },
        {
          'img': 'assets/icons/veg.png',
          'title': 'Baby spinach',
          'price': 2.50,
          'buttonPress': false,
        },
        {
          'img': 'assets/icons/mushroom.png',
          'title': 'Mushroom',
          'price': 1.50,
          'buttonPress': false,
        },
      ],
    ),
  ];
}
