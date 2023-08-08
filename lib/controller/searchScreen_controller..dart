import 'package:design/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchTxtFieldController = TextEditingController();
  var initialFoodSelected = 0.obs;
  var initialCategorySelected = 0.obs;
  List<Map<String, dynamic>> mealCategoryList = [
    {
      'title': 'Steak',
    },
    {
      'title': 'Wings',
    },
    {
      'title': 'Breakfast',
    },
  ].obs;

  void mealButtonSwitch(int index) {
    initialFoodSelected.value = index;
  }

  // categorySelection
  List<Map<String, dynamic>> foodCategoryList = [
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
  ].obs;

  void foodButtonSwitch(int index) {
    initialCategorySelected.value = index;
  }
  // Griditems

  List<Map<String, dynamic>> gridItemsList = [
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
}
