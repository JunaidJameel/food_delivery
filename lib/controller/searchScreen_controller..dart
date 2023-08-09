import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
<<<<<<< HEAD
=======
  
>>>>>>> 650b1a9e7d822cdd9131b07132a710ffa5dc6e0d
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
