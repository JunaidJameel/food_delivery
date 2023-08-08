import 'package:design/controller/masterCard_controller.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:design/view/base/custom_divider.dart';
import 'package:design/view/base/textfield_widget.dart';
import 'package:design/view/screens/cart_screens/trackOrder_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:get/get.dart';

import 'widget/inputFormater_widget.dart';

class MasterCardScreen extends StatelessWidget {
  MasterCardScreen({super.key});
  MasterCardController controller = Get.put(MasterCardController());
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsOfApp.appScaffoldColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Master Card',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Color.fromARGB(255, 109, 109, 109),
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDividerWidget(),
            SizedBox(
              height: s.height * 0.32,
              child: Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CreditCardWidget(
                      labelValidThru: '',
                      cardNumber: controller.cardNumber.value,
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                      expiryDate: controller.expiryDate.value,
                      cardHolderName: controller.cardHolderName.value,
                      cvvCode: controller.cvvCode.value,
                      showBackView: controller.showBackView.value,
                      onCreditCardWidgetChange: (brand) {
                        controller.updateCardBrand();
                      },
                    ),
                  )),
            ),
            const CustomDividerWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: s.height * 0.01,
                  ),
                  Text(
                    'Card Details',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 13.5, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: s.height * 0.02,
                  ),
                  TextFieldWidget(
                    contentPadding: const EdgeInsets.only(left: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    controller: controller.cardHolderNameController,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: ColorsOfApp.textFieldgreyColor)),
                    labelText: 'Card Holder',
                    labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorsOfApp.mediumGreyColor,
                        ),
                  ),
                  SizedBox(
                    height: s.height * 0.03,
                  ),
                  TextFieldWidget(
                    controller: controller.cardNumberController,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CardNumberFormatter(),
                    ],
                    keyboardType: TextInputType.number,
                    contentPadding: const EdgeInsets.only(left: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    maxLength: 19,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: ColorsOfApp.textFieldgreyColor)),
                    labelText: 'Card Number',
                    labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorsOfApp.mediumGreyColor,
                        ),
                  ),
                  SizedBox(
                    height: s.height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          contentPadding: const EdgeInsets.only(left: 20),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          controller: controller.expiryDateController,
                          keyboardType: TextInputType.number,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: ColorsOfApp.textFieldgreyColor)),
                          labelText: 'MM/YY',
                          maxLength: 4,
                          labelStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorsOfApp.mediumGreyColor,
                                  ),
                        ),
                      ),
                      SizedBox(
                        width: s.width * 0.04,
                      ),
                      Expanded(
                        child: TextFieldWidget(
                          keyboardType: TextInputType.number,
                          contentPadding: const EdgeInsets.only(left: 20),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          controller: controller.cvvCodeController,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: ColorsOfApp.textFieldgreyColor)),
                          labelText: 'CVC',
                          maxLength: 3,
                          labelStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorsOfApp.mediumGreyColor,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      side: const BorderSide(
                          color: ColorsOfApp.textFieldgreyColor),
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      value: true,
                      onChanged: (bool? value) {},
                    ),
                    Text(
                      'Save Card',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultPadding),
                  child: Obx(
                    () => ButtonWidget(
                        buttonColor: controller.cvvCode.value.length == 3
                            ? ColorsOfApp.appColor
                            : Colors.grey,
                        buttonTxt: 'Done',
                        ontap: () {
                          if (controller.cvvCode.value.length == 3) {
                            Get.to(TrackOrderScreen());
                          }
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
