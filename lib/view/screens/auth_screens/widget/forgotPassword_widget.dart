import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:design/view/screens/auth_screens/widget/auth_Textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'checkEmailWidget.dart';

class ForgotPasswordWidget extends StatelessWidget {
  ForgotPasswordWidget({
    super.key,
  });
  var forgotPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;

    return Container(
      height: s.height * 0.6,
      width: s.width,
      decoration: const BoxDecoration(
        color: ColorsOfApp.appScaffoldColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: s.height * 0.01,
                ),
                Container(
                  height: s.height * 0.005,
                  width: s.width * 0.14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ColorsOfApp.textFieldgreyColor,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.08,
                ),
                Image.asset(
                  Images.lockIcon,
                  height: s.height * 0.08,
                ),
                SizedBox(
                  height: s.height * 0.04,
                ),
                Text(
                  'Forgot password?',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorsOfApp.blackColor),
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Text(
                  'Enter your email address and we will send\nyou a reset instructions.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.5,
                      color: ColorsOfApp.greyColor),
                ),
                SizedBox(
                  height: s.height * 0.04,
                ),
                AuthTxtField(
                  controller: forgotPasswordController,
                  validatorTxt: 'Please enter email',
                  labelText: 'Enter Email',
                  onchange: (value) {
                    // authController.updateEmailValidity(value.length > 7);
                  },
                ),
                SizedBox(
                  height: s.height * 0.04,
                ),
                ButtonWidget(
                    buttonTxt: 'Send Email',
                    buttonColor: forgotPasswordController.text.length >= 4
                        ? ColorsOfApp.appColor
                        : ColorsOfApp.textFieldgreyColor,
                    ontap: () {
                      if (formKey.currentState!.validate()) {
                        if (forgotPasswordController.text.length > 4) {
                          Get.back();

                          showModalBottomSheet<dynamic>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Wrap(children: const [
                                  CheckEmailWidget(),
                                ]);
                              });
                        }
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
