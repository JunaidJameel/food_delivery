import 'package:design/controller/cart_controller.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:design/view/base/custom_divider.dart';
import 'package:design/view/base/textfield_widget.dart';
import 'package:design/view/screens/cart_screens/digitalPayment_screen.dart';
import 'package:design/view/screens/cart_screens/widget/customRow_widget.dart';
import 'package:design/view/screens/cart_screens/widget/dotedBorder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderConfirmScreen extends StatelessWidget {
  OrderConfirmScreen({super.key});
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Order Confirmation',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Color.fromARGB(255, 109, 109, 109),
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomDividerWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(Images.profilePic),
                  ),
                  SizedBox(
                    width: s.width * 0.04,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Aliva Ketchen',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorsOfApp.blackColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\nHouse-277/3 Flat-A-5, Road-30/A',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorsOfApp.mediumGreyColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        TextSpan(
                          text: '\nSr NY 10013, New York',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorsOfApp.mediumGreyColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const CustomDividerWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: s.height * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        Images.locationIcon,
                        color: ColorsOfApp.appColor,
                        height: s.height * 0.025,
                      ),
                      SizedBox(
                        width: s.width * 0.03,
                      ),
                      Text(
                        'Delivery Address',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorsOfApp.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        'Edit Address',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorsOfApp.appColor,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: s.height * 0.03,
                  ),
                  TextFieldWidget(
                    suffixIcon: Checkbox(
                      side: const BorderSide(
                          color: ColorsOfApp.textFieldgreyColor),
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      value: true,
                      onChanged: (bool? value) {},
                    ),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorsOfApp.greyColor, fontSize: 12),
                    contentPadding: const EdgeInsets.only(left: 15),
                    hintText: 'Type Address',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).dividerColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(
                    height: s.height * 0.02,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.language,
                        color: ColorsOfApp.appColor,
                      ),
                      SizedBox(
                        width: s.width * 0.02,
                      ),
                      const Text(
                        'Additional Instruction',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: s.height * 0.02,
                  ),
                  TextFieldWidget(
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ColorsOfApp.greyColor, fontSize: 12),
                      contentPadding: const EdgeInsets.only(left: 15),
                      hintTextColor: Theme.of(context).dividerColor,
                      hintText: 'Type something',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).dividerColor),
                      )),
                  SizedBox(
                    height: s.height * 0.02,
                  ),
                ],
              ),
            ),
            const CustomDividerWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: s.height * 0.02,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.message,
                        color: ColorsOfApp.appColor,
                      ),
                      SizedBox(
                        width: s.width * 0.02,
                      ),
                      const Text(
                        'Order Summary',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.height * 0.01,
            ),
            SizedBox(
              height: s.height * 0.3,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage(Images.firstPlate),
                      ),
                      title: Text(
                        'Chicken Cheese Burger',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorsOfApp.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          text: '\$',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorsOfApp.appColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' 20.16',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: ColorsOfApp.blackColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Text(
                        '1x',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorsOfApp.mediumGreyColor, fontSize: 12.5),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: s.height * 0.01,
                width: s.width,
                child: Flex(
                  direction: Axis.vertical,
                  children: const [
                    MySeparator(color: Colors.grey),
                  ],
                ),
              ),
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: Color.fromARGB(255, 241, 241, 241),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
            const CustomDividerWidget(),
            SizedBox(
              height: s.height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: s.width * 0.04,
                ),
                const Icon(
                  Icons.payment,
                  color: ColorsOfApp.appColor,
                ),
                SizedBox(
                  width: s.width * 0.035,
                ),
                Text(
                  'Payment Method',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: s.height * 0.01,
            ),
            SizedBox(
              height: s.height * 0.16,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: s.width,
                    child: ListTile(
                      leading: Image.asset(
                        index == 0
                            ? Images.cashOnDelivery
                            : Images.digitalPayment,
                        height: s.height * 0.03,
                      ),
                      minLeadingWidth: 20,
                      title: Text(
                        index == 0 ? 'Cash on Delivery' : 'Digital Payment',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 13, fontWeight: FontWeight.w500),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ButtonWidget(
                ontap: () {
                  Get.to(DigitalPaymentScreen());
                },
                buttonTxt: 'Confirm Order',
              ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
