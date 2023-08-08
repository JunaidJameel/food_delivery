import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:design/view/screens/cart_screens/dateTime_screen.dart';
import 'package:design/view/screens/cart_screens/widget/customRow_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmOrderWidget extends StatelessWidget {
  const ConfirmOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Container(
      height: s.height * 0.4,
      width: s.width,
      decoration: const BoxDecoration(
        color: ColorsOfApp.appScaffoldColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: s.height * 0.01,
            ),
            Center(
              child: Container(
                height: s.height * 0.005,
                width: s.width * 0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorsOfApp.textFieldgreyColor,
                ),
              ),
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            Row(
              children: [
                const Text('Delivery'),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Get.to(DateTimeScreen());
                  },
                  child: Text(
                    'Select method & state',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorsOfApp.mediumGreyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: ColorsOfApp.textFieldgreyColor,
                ),
              ],
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            const ReusableTextRow(
              fontWeight: FontWeight.bold,
              firstTxt: 'Estimated total cost',
              firstColor: Colors.black,
              secondTxt: '33.99',
              secondColor: Colors.black,
              verticalPadding: 0,
              horizontalPadding: 0,
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            Text(
              'Please note that for item sold by weight, the exact\nprice may very depending on the weight of items\navailable.',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorsOfApp.mediumGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: s.height * 0.04,
            ),
            Row(
              children: [
                const Icon(
                  Icons.money,
                  color: ColorsOfApp.mediumGreyColor,
                ),
                SizedBox(
                  width: s.width * 0.02,
                ),
                const Text('Cash On delivery'),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: ColorsOfApp.textFieldgreyColor,
                ),
              ],
            ),
            const Spacer(),
            ButtonWidget(buttonTxt: 'Confirm Order', ontap: () {}),
            // SizedBox(
            //   height: s.height * 0.02,
            // ),
          ],
        ),
      ),
    );
  }
}
