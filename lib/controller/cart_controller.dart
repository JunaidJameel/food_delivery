import 'package:get/get.dart';

class CartController extends GetxController {
  var initalDate = 100.obs;

  void selectDate(int index) {
    initalDate.value = index;
  }

  Rx<int> selectedValue = 100.obs;

  void setSelectedValue(int value) {
    selectedValue.value = value;
    update();
  }
  // digitalPayment Screen

  Rx<int> radioBtnValue = 0.obs;

  void radioButton(int value) {
    radioBtnValue.value = value;

    update();
  }

  RxInt starRating = 0.obs;
}
