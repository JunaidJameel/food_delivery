import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchTxtFieldController = TextEditingController();
  var initialFoodSelected = 0.obs;
  var initialCategorySelected = 0.obs;

  void mealButtonSwitch(int index) {
    initialFoodSelected.value = index;
  }

  // categorySelection

  void foodButtonSwitch(int index) {
    initialCategorySelected.value = index;
  }
  // Griditems
}
