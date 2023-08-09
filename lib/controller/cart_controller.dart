import 'package:get/get.dart';

class CartController extends GetxController {
  var initalDate = 100.obs;

  void selectDate(int index) {
    initalDate.value = index;
    update();
  }

  int selectedValue = 100;

  void setSelectedValue(int value) {
    selectedValue = value;
    update();
  }

  int radioBtnValue = 0;

  void radioButton(int value) {
    radioBtnValue = value;

    update();
  }

  RxInt starRating = 0.obs;
}
