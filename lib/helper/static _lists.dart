import 'package:flutter/material.dart';

import '../utils/images.dart';

class StaticLists {
  static List<Map<String, dynamic>> pagelist = [
    {
      'icon': (Icons.favorite),
      'title': 'Favorit List',
    },
    {
      'icon': (Icons.online_prediction_rounded),
      'title': 'Orders History',
    },
    {
      'icon': (Icons.wallet),
      'title': 'Wallet',
    },
    {
      'icon': (Icons.wind_power),
      'title': 'Promotion',
    },
    {
      'icon': (Icons.atm),
      'title': 'Payment Method',
    },
  ];

  //
  static List<Map<String, dynamic>> dateList = [
    {
      'day': 'Mon',
      'date': 12,
    },
    {
      'day': 'Tue',
      'date': 13,
    },
    {
      'day': 'Wed',
      'date': 14,
    },
    {
      'day': 'Thu',
      'date': 15,
    },
    {
      'day': 'Fri',
      'date': 16,
    },
    {
      'day': 'Sat',
      'date': 17,
    },
    {
      'day': 'Sun',
      'date': 18,
    },
  ];
  //
  static List<Map<String, dynamic>> timeList = [
    {
      'time': '0700 - 08:00',
      'delivery': '\$2.01',
    },
    {
      'time': '07:00 - 08:00',
      'delivery': '\$1.5',
    },
    {
      'time': '08:00 - 09:00',
      'delivery': 'Free',
    },
    {
      'time': '09:00 - 10:00',
      'delivery': 'Free',
    },
    {
      'time': '10:00 - 11:00',
      'delivery': '\$1.5',
    },
    {
      'time': '11:00 - 12:00',
      'delivery': 'Free',
    },
    {
      'time': '12:00 - 01:00',
      'delivery': 'Free',
    },
  ];
  //

  static List<Map<String, dynamic>> digitalPaymentList = [
    {
      'name': 'Master Card',
    },
    {
      'name': 'PayPal',
    },
    {
      'name': 'Payoneer',
    },
  ];
  //
  static List<Map<String, dynamic>> foodCategoryList = [
    {
      'img': Images.breakfast,
      'title': 'Breakfast',
    },
    {
      'img': Images.healthy,
      'title': 'Healthy',
    },
    {
      'img': Images.dessert,
      'title': 'Dessert',
    },
    {
      'img': Images.burger,
      'title': 'Burger',
    },
    {
      'img': Images.pizza,
      'title': 'Pizza',
    },
    {
      'img': Images.soda,
      'title': 'Soda',
    },
  ];

  static List<Map<String, dynamic>> sortByList = [
    {
      'img': Images.breakfast,
      'title': 'Kitchen Nearby',
      'filter': false,
    },
    {
      'img': Images.healthy,
      'title': 'Delivery Time',
      'filter': false,
    },
    {
      'img': Images.dessert,
      'title': 'Rating',
      'filter': false,
    },
  ];

  //
  static List<String> filterPrices = [
    '5',
    '10',
    '100',
    '1000',
    '2000',
  ];
  //
  static List<Map<String, dynamic>> categoryList = [
    {
      'img': Images.breakfast,
      'title': 'Fast Food',
    },
    {
      'img': Images.healthy,
      'title': 'Wester Food',
    },
    {
      'img': Images.dessert,
      'title': 'Beef and Steak',
    },
    {
      'img': Images.dessert,
      'title': 'Desert Loved',
    },
  ];
  //
  static List<Map<String, dynamic>> mealCategoryList = [
    {
      'title': 'Steak',
    },
    {
      'title': 'Wings',
    },
    {
      'title': 'Breakfast',
    },
  ];
  //
  static List<Map<String, dynamic>> gridItemsList = [
    {'title': 'Fish Fry', 'img': Images.fishFry},
    {'title': 'Fish Grill', 'img': Images.grillFish},
    {
      'title': 'Fruite Juice',
      'img': Images.fruiteJuice,
    },
    {
      'title': 'Cake',
      'img': Images.cake,
    },
    {'title': 'Burger', 'img': Images.zingerBurger},
    {
      'title': 'Sandwich',
      'img': Images.sandwich,
    },
  ];
  //
  static List<Map<String, dynamic>> foodCategory = [
    {
      'title': 'All items',
    },
    {
      'title': 'Popular items',
    },
    {
      'title': 'All Kitchen',
    },
    {
      'title': 'BBQ',
    },
  ];
  //
  static List<Map<String, dynamic>> foodCategry = [
    {
      'title': 'All items',
    },
    {
      'title': 'Popular items',
    },
    {
      'title': 'All Kitchen',
    },
    {
      'title': 'BBQ',
    },
  ];
  //
  static List<Map<String, dynamic>> containerDataList = [
    {
      'img': Images.chiefHat,
      'title': 'Do you love to cook food?',
    },
    {
      'img': Images.cartBag,
      'title': 'Do you love to eat food?',
    }
  ];
}
