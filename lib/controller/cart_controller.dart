import 'package:get/get.dart';

class CartController extends GetxController {
  var initalDate = 100.obs;

  void selectDate(int index) {
    initalDate.value = index;
  }

  List<Map<String, dynamic>> dateList = [
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
  ].obs;
  List<Map<String, dynamic>> timeList = [
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
  Rx<int> selectedValue = 100.obs;

  void setSelectedValue(int value) {
    selectedValue.value = value;
    update();
  }
  // digitalPayment Screen

  List<Map<String, dynamic>> digitalPaymentList = [
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
  Rx<int> radioBtnValue = 0.obs;

  void radioButton(int value) {
    radioBtnValue.value = value;

    update();
  }

  RxInt starRating = 0.obs;
}
