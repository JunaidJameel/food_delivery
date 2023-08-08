import 'dart:async';

import 'package:design/data/model/kitchenNearYou_model.dart';
import 'package:design/data/model/mealNearyBy_model.dart';
import 'package:design/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  var initialButtonTap = RxInt(-1);

  void toggleFavorite(KitchenNearYou item) {
    item.favButtonCheck = !item.favButtonCheck;
    update();
  }

  void favButtonToggle(MealNearBy item) {
    item.favButtonTap = !item.favButtonTap;
    update();
  }

// Extra Items in Food Button

  void buttonToggle(MealNearBy item, index) {
    item.extraItemslist[index]['buttonPress'] =
        !item.extraItemslist[index]['buttonPress'];

    item.extraItemslist[index]['buttonPress'] == true
        ? item.price = item.price + item.extraItemslist[index]['price']
        : item.price = item.price - item.extraItemslist[index]['price'];

    update();
  }

  void addItems(MealNearBy item) {
    if (item.noOfItems > 0) {
      item.noOfItems++;
      item.price * item.noOfItems;
    }

    update();
  }

  //remove items
  void removeItems(MealNearBy item) {
    if (item.noOfItems > 1) {
      item.noOfItems--;
    }
    update();
  }

  List<Map<String, dynamic>> foodCategoryList = [
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
  // RxBool checkFilterStatus = false.obs;
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.91);
  var exploreTxtController = TextEditingController();
  RxInt currentIndex = 0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  @override
  void onClose() {
    _stopTimer();
    pageController.dispose();
    super.onClose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 300000), (timer) {
      if (currentIndex < 2) {
        currentIndex++;
      } else {
        currentIndex.value = 0;
      }

      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  // filter screen data
  List<Map<String, dynamic>> sortByList = [
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
  ].obs;
  RxBool filterValue = false.obs;
  void onFilterChanged(bool? value, int index) {
    sortByList[index]['filter'] = value ?? true;
    update();
  }

  RxInt categoryInitialIndex = 100.obs;
  void buttonPress(int index) {
    categoryInitialIndex.value = index;
    categoryInitialIndex.value != categoryInitialIndex.value;
  }

// priceRange
  List<String> filterPrices = [
    '5',
    '10',
    '100',
    '1000',
    '2000',
  ];
  RxInt initalPrice = 100.obs;
  void priceCheck(int index) {
    initalPrice.value = index;
    update();
  }

  // filterCategory
  List<Map<String, dynamic>> categoryList = [
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
  ].obs;

  // void clearAllFilters() {

  //   initalPrice.value == -1;
  //   categoryInitialIndex.value == -1;
  //   update();
  // }
}
