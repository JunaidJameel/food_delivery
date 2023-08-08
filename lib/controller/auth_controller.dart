import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var lEmailController = TextEditingController();
  var lPasswordController = TextEditingController();
  // register Screen Controllers
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var rEmailController = TextEditingController();
  var phoneNumber = TextEditingController();
  var rPasswordController = TextEditingController();
  var rConfirmPasswordController = TextEditingController();
  // forgot password controller
  var forgotPasswordController = TextEditingController();
  RxBool taped = false.obs;
  RxBool lPasswordvisibility = true.obs;

  void lHidePassword() {
    lPasswordvisibility.value = !lPasswordvisibility.value;
    update();
  }

  RxBool rPasswordvisibility = true.obs;
  RxBool rConfirmPasswordvisibility = true.obs;
  // RxBool checkStatus = false.obs;
  //
  RxBool filterTap = false.obs;
  var initialTap = RxInt(-1);

  RxBool checkBoxValue = false.obs;
  void checkBoxUpdate(bool? value) {
    checkBoxValue.value = value ?? false;
  }

  RxBool isEmailValid = false.obs;
  RxBool isPasswordValid = false.obs;

  void updateEmailValidity(bool isValid) {
    isEmailValid.value = isValid;
    update();
  }

  // Create a function to update the validity of the password field
  void updatePasswordValidity(bool isValid) {
    isPasswordValid.value = isValid;
    update();
  }
}
