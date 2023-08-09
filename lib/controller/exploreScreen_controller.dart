import 'package:design/data/model/kitchenNearYou_model.dart';
import 'package:design/data/model/mealNearyBy_model.dart';
import 'package:design/helper/static%20_lists.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  static ExploreController get instance => Get.find<ExploreController>();
  int initialButtonTap = -1;

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
