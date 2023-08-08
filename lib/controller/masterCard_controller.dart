// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MasterCardController extends GetxController {
//   var cardNumber = ''.obs;
//   var expiryDate = ''.obs;
//   var cardHolderName = ''.obs;
//   var cvvCode = ''.obs;
//   var showBackView = false.obs;
//   var saveCard = false.obs;

//   TextEditingController cardNumberController = TextEditingController();
//   TextEditingController expiryDateController = TextEditingController();
//   TextEditingController cardHolderNameController = TextEditingController();
//   TextEditingController cvvCodeController = TextEditingController();

//   void updateCardBrand() {
//     // ... You can add logic here to detect the credit card brand if needed.
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize the values of observables from text controllers
//     cardNumber.value = cardNumberController.text;
//     expiryDate.value = expiryDateController.text;
//     cardHolderName.value = cardHolderNameController.text;
//     cvvCode.value = cvvCodeController.text;
//   }

//   @override
//   void onClose() {
//     // Dispose the controllers when the controller is closed.
//     cardNumberController.dispose();
//     expiryDateController.dispose();
//     cardHolderNameController.dispose();
//     cvvCodeController.dispose();
//     super.onClose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MasterCardController extends GetxController {
  var cardNumber = ''.obs;
  var expiryDate = ''.obs;
  var cardHolderName = ''.obs;
  var cvvCode = ''.obs;
  var showBackView = false.obs;
  var saveCard = false.obs;

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cvvCodeController = TextEditingController();

  void updateCardBrand() {
    // ... You can add logic here to detect the credit card brand if needed.
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize the values of observables from text controllers
    cardNumberController.addListener(updateCardNumber);
    expiryDateController.addListener(updateExpiryDate);
    cardHolderNameController.addListener(updateCardHolderName);
    cvvCodeController.addListener(updateCvvCode);
    updateCardNumber();
    updateExpiryDate();
    updateCardHolderName();
    updateCvvCode();
  }

  void updateCardNumber() {
    cardNumber.value = cardNumberController.text;
  }

  void updateExpiryDate() {
    expiryDate.value = expiryDateController.text;
  }

  void updateCardHolderName() {
    cardHolderName.value = cardHolderNameController.text;
  }

  void updateCvvCode() {
    cvvCode.value = cvvCodeController.text;
  }

  @override
  void onClose() {
    // Dispose the controllers when the controller is closed.
    cardNumberController.dispose();
    expiryDateController.dispose();
    cardHolderNameController.dispose();
    cvvCodeController.dispose();
    super.onClose();
  }
}
