import 'package:design/controller/auth_controller.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:design/view/base/loginBtn_widget.dart';
import 'package:design/view/base/textfield_widget.dart';
import 'package:design/view/screens/auth_screens/signIn-screen.dart';
import 'package:design/view/screens/auth_screens/widget/auth_Textfield.dart';
import 'package:design/view/screens/filter_screen/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: s.height * 0.1),
                Text(
                  'Create Account',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 34, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: s.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AuthTxtField(
                        controller: authController.rEmailController,
                        validatorTxt: 'Please enter first name',
                        labelText: 'First name',
                      ),
                    ),
                    SizedBox(
                      width: s.width * 0.05,
                    ),
                    Expanded(
                      child: AuthTxtField(
                        controller: authController.rPasswordController,
                        validatorTxt: 'Please enter last name',
                        labelText: 'Last name',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: s.height * 0.04,
                ),
                AuthTxtField(
                  controller: authController.rEmailController,
                  validatorTxt: 'Please enter email',
                  labelText: 'Email address',
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Text(
                  'Enter a valid email address we will send confirmation\nlink for verification',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w500,
                        color: ColorsOfApp.mediumGreyColor,
                      ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                AuthTxtField(
                  keyboardType: TextInputType.phone,
                  controller: authController.phoneNumber,
                  validatorTxt: 'Please enter your Phone number',
                  labelText: 'Phone number',
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Obx(
                  () => AuthTxtField(
                    controller: authController.rPasswordController,
                    validatorTxt: 'Please enter Password',
                    labelText: 'Password',
                    obscureText: authController.rPasswordvisibility.value,
                    suffixIcon: IconButton(
                      onPressed: () {
                        authController.rPasswordvisibility.value =
                            !authController.rPasswordvisibility.value;
                      },
                      icon: Icon(
                          authController.rPasswordvisibility.value == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Text(
                  'Password must be 8 character long including one\ncapital letter',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w500,
                        color: ColorsOfApp.mediumGreyColor,
                      ),
                ),
                SizedBox(
                  height: s.height * 0.015,
                ),
                Obx(
                  () => AuthTxtField(
                    controller: authController.rConfirmPasswordController,
                    validatorTxt: 'Please enter confirm password',
                    labelText: 'Confirm Password',
                    obscureText:
                        authController.rConfirmPasswordvisibility.value,
                    suffixIcon: IconButton(
                      onPressed: () {
                        authController.rConfirmPasswordvisibility.value =
                            !authController.rConfirmPasswordvisibility.value;
                      },
                      icon: Icon(
                          authController.rConfirmPasswordvisibility.value ==
                                  true
                              ? Icons.visibility_off
                              : Icons.visibility),
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.04,
                ),
                ButtonWidget(
                  buttonTxt: 'Sign Up',
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      Get.off(FilterScreen());
                    }
                  },
                  buttonColor: (authController.rEmailController.text.length >=
                              4 &&
                          authController.phoneNumber.text.length == 11 &&
                          authController.rPasswordController.text.length >= 4 &&
                          authController
                                  .rConfirmPasswordController.text.length >=
                              4)
                      ? ColorsOfApp.appColor
                      : ColorsOfApp.textFieldgreyColor,
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            'By Clicking "Sign up" You certify that agree to our',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            // color: Colors.black,
                            fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nPrivacy policy',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 13.5,
                                    color: ColorsOfApp.appColor,
                                    fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(),
                          ),
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 13.5,
                                    color: ColorsOfApp.appColor,
                                    fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: s.height * 0.05,
                ),
                LoginBtn(
                  firstText: 'Already have an account?',
                  secondText: ' Sign In',
                  ontap: () {
                    Get.off(SignInScreen());
                  },
                ),
                SizedBox(
                  height: s.height * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
