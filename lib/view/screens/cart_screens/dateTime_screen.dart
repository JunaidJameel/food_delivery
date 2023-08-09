import 'package:design/controller/cart_controller.dart';
import 'package:design/helper/static%20_lists.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:design/view/screens/cart_screens/orderConfirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimeScreen extends StatelessWidget {
  DateTimeScreen({super.key});
  // CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Delivery',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                width: AppConstants.defaultPadding,
              ),
              Image.asset(
                Images.locationIcon,
                color: ColorsOfApp.appColor,
                height: s.height * 0.035,
              ),
              SizedBox(
                width: s.width * 0.03,
              ),
              RichText(
                text: TextSpan(
                  text: 'Delivary To',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorsOfApp.greyColor,
                        fontSize: 12,
                      ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: '\nBanasree, B-Block',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: ColorsOfApp.blackColor,
              ),
            ],
          ),
          SizedBox(
            height: s.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppConstants.defaultPadding),
            child: Text(
              'Book a Date & Time',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorsOfApp.blackColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: s.height * 0.13,
            child: ListView.builder(
              itemCount: 7,
              padding: const EdgeInsets.only(
                  left: AppConstants.defaultPadding,
                  top: AppConstants.defaultPadding,
                  bottom: AppConstants.defaultPadding),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GetBuilder<CartController>(
                  builder: (cartController) => GestureDetector(
                    onTap: () {
                      cartController.selectDate(index);
                    },
                    child: Container(
                      width: s.width * 0.135,
                      margin: EdgeInsets.only(right: index == 6 ? 16 : 10),
                      decoration: BoxDecoration(
                          color: cartController.initalDate.value == index
                              ? ColorsOfApp.appColor
                              : Colors.transparent,
                          border: Border.all(
                              color: cartController.initalDate.value == index
                                  ? Colors.transparent
                                  : ColorsOfApp.textFieldgreyColor),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StaticLists.dateList[index]['day'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: cartController.initalDate.value ==
                                              index
                                          ? ColorsOfApp.appScaffoldColor
                                          : ColorsOfApp.mediumGreyColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11),
                            ),
                            SizedBox(
                              height: s.height * 0.005,
                            ),
                            Text(
                              StaticLists.dateList[index]['date'].toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: cartController.initalDate.value ==
                                              index
                                          ? ColorsOfApp.appScaffoldColor
                                          : Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding),
            itemCount: 7,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: s.height * 0.045,
                    child: Row(
                      children: [
                        Text(StaticLists.timeList[index]['time'],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontWeight: FontWeight.w600)),
                        const Spacer(),
                        Text(
                          StaticLists.timeList[index]['delivery'],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: ColorsOfApp.mediumGreyColor,
                                  fontWeight: FontWeight.normal),
                        ),
                        GetBuilder<CartController>(
                          init: CartController(),
                          builder: (controller) => Radio(
                            activeColor: ColorsOfApp.appColor,
                            toggleable: true,
                            value: index,
                            groupValue: controller.selectedValue,
                            onChanged: (value) {
                              controller.setSelectedValue(value ?? 0);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Divider(
                      color: Color.fromARGB(255, 241, 241, 241),
                    ),
                  ),
                ],
              );
            },
          )),
          GetBuilder<CartController>(
            builder: (cartController) =>
                cartController.selectedValue.isLowerThan(8)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.defaultPadding),
                        child: ButtonWidget(
                            buttonTxt: 'Confirm Order',
                            ontap: () {
                              Get.to(OrderConfirmScreen());
                            }),
                      )
                    : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
