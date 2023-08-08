import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/custom_divider.dart';
import 'package:design/view/screens/cart_screens/widget/confirmOrder_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/customRow_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        centerTitle: true,
        title: Text(
          'Cart',
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
            color: Color.fromARGB(255, 69, 69, 69),
            size: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: s.height * 0.465,
            width: s.width,
            //  color: Colors.amber,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: s.height * 0.005,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding,
                      ),
                      child: SizedBox(
                        height: s.height * 0.1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(Images.firstPlate),
                            ),
                            SizedBox(
                              height: s.height * 0.1,
                              width: s.width * 0.73,
                              //  color: Colors.amber,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Chicken Cheese Burger',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                  SizedBox(
                                    height: s.height * 0.002,
                                  ),
                                  Text(
                                    'Burger & Salad',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            fontSize: 11,
                                            color: ColorsOfApp.mediumGreyColor),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: '\$ ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: ColorsOfApp.appColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '6.57',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: s.width * 0.2,
                                        height: s.height * 0.04,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorsOfApp
                                                  .textFieldgreyColor),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const CircleAvatar(
                                              radius: 10,
                                              child: Icon(
                                                Icons.remove,
                                                color: ColorsOfApp.blackColor,
                                                size: 18,
                                              ),
                                              backgroundColor: Color.fromARGB(
                                                  255, 232, 232, 232),
                                            ),
                                            Text(
                                              '1',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            const Icon(
                                              Icons.add_circle,
                                              color: ColorsOfApp.appColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 17, bottom: 10),
                      child: Divider(
                        color: Color.fromARGB(255, 241, 241, 241),
                      ),
                    ),
                  ],
                );
              },
            ),
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
                'Add items',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsOfApp.appColor,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: AppConstants.defaultPadding,
              ),
            ],
          ),
          SizedBox(height: s.height * 0.01),
          const CustomDividerWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding, vertical: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.wind_power,
                  color: ColorsOfApp.appColor,
                ),
                SizedBox(
                  width: s.width * 0.02,
                ),
                Text(
                  'Add Promo Code',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorsOfApp.blackColor,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: ColorsOfApp.mediumGreyColor,
                ),
              ],
            ),
          ),
          const CustomDividerWidget(),
          SizedBox(
            height: s.height * 0.01,
          ),
          const ReusableTextRow(
            firstTxt: 'Subtotal',
            secondTxt: '18.99',
          ),
          const ReusableTextRow(
            firstTxt: 'Discount',
            secondTxt: '0',
          ),
          const ReusableTextRow(
            firstTxt: 'Delivery fee',
            secondTxt: '15',
          ),
          const Divider(
            color: Color.fromARGB(255, 241, 241, 241),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding),
            child: Row(
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsOfApp.blackColor,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: s.width * 0.01,
                ),
                Text(
                  '(Val Tax)',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsOfApp.textFieldgreyColor,
                      fontSize: 9,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(
                  '\$33.99',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsOfApp.blackColor,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding),
            child: GestureDetector(
              onTap: () {
                Get.bottomSheet(const ConfirmOrderWidget());
              },
              child: Container(
                height: s.height * 0.07,
                width: s.width,
                decoration: BoxDecoration(
                  color: ColorsOfApp.appColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Place Order',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          letterSpacing: 1, color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: s.height * 0.01,
          ),
        ],
      ),
    );
  }
}
