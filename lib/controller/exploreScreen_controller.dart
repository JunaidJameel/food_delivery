import 'dart:async';

import 'package:design/data/model/kitchenNearYou_model.dart';
import 'package:design/data/model/mealNearyBy_model.dart';
import 'package:design/helper/static%20_lists.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  static ExploreController get instance => Get.find<ExploreController>();
  var initialButtonTap = RxInt(-1);

  void toggleFavorite(KitchenNearYou item) {
    item.favButtonCheck = !item.favButtonCheck;
    update();
  }

  void favButtonToggle(MealNearBy item) {
    item.favButtonTap = !item.favButtonTap;
    update();
  }

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

  // RxBool checkFilterStatus = false.obs;
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.91);

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
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
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

  RxBool filterValue = false.obs;
  void onFilterChanged(bool? value, int index) {
    StaticLists.sortByList[index]['filter'] = value ?? true;
    update();
  }

  RxInt categoryInitialIndex = 100.obs;
  void buttonPress(int index) {
    categoryInitialIndex.value = index;
    categoryInitialIndex.value != categoryInitialIndex.value;
  }

// priceRange

  RxInt initalPrice = 100.obs;
  void priceCheck(int index) {
    initalPrice.value = index;
    update();
  }

  // filterCategory

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    update();
  }

  updateLoading(bool value) {
    _loading = value;
    update();
  }
}
