import 'package:design/controller/cart_controller.dart';
import 'package:design/helper/static%20_lists.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:design/view/base/custom_divider.dart';
import 'package:design/view/screens/cart_screens/masterCard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DigitalPaymentScreen extends StatelessWidget {
  DigitalPaymentScreen({super.key});
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Digital Payment',
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
      body: Column(
        children: [
          const CustomDividerWidget(),
          SizedBox(
            height: s.height * 0.21,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: s.width,
                  child: ListTile(
                    leading: Container(
                      // color: Colors.red,
                      height: s.height * 0.05,
                      width: s.width * 0.1,
                      child: Image.asset(
                        index == 0
                            ? Images.masterCard
                            : index == 1
                                ? Images.paypal
                                : Images.payoneer,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      StaticLists.digitalPaymentList[index]['name'],
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    trailing: GetBuilder<CartController>(
                      init: CartController(),
                      builder: (controller) => Radio(
                        activeColor: ColorsOfApp.appColor,
                        toggleable: true,
                        value: index,
                        groupValue: controller.radioBtnValue,
                        onChanged: (value) {
                          controller.radioButton(value ?? 0);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 238, 238, 238),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: s.height * 0.01,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.add_circle,
                          color: ColorsOfApp.appColor,
                        ),
                        SizedBox(
                          width: s.width * 0.01,
                        ),
                        Text(
                          'Add Card',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: ColorsOfApp.appColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ButtonWidget(
                        buttonTxt: 'Confirm',
                        ontap: () {
                          Get.to(MasterCardScreen());
                        }),
                    SizedBox(
                      height: s.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
