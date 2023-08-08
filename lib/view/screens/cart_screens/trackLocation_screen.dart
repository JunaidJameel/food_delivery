import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:design/view/base/custom_divider.dart';
import 'package:design/view/screens/cart_screens/widget/feedBack_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TrackLocationScreen extends StatelessWidget {
  const TrackLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Track Order',
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
          children: [
            SizedBox(
              height: s.height * 0.33,
              width: s.width,
              child: Image.asset(
                Images.mapImg,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      Images.profilePic,
                      height: s.height * 0.06,
                    ),
                  ),
                  SizedBox(
                    width: s.width * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Rohan Kunar',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorsOfApp.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\nDelivery hero',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorsOfApp.textFieldgreyColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.message,
                    color: ColorsOfApp.appColor,
                  ),
                ],
              ),
            ),
            const CustomDividerWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: s.height * 0.02,
                  ),
                  Text(
                    'Aliva Ketchen',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorsOfApp.blackColor, fontSize: 14),
                  ),
                  SizedBox(
                    height: s.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                        height: s.height * 0.065,
                        width: s.width * 0.44,
                        ontap: () {},
                        boxBorder: Border.all(
                          color: ColorsOfApp.textFieldgreyColor,
                        ),
                        buttonColor: ColorsOfApp.appScaffoldColor,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: s.width * 0.03,
                            ),
                            Image.asset(
                              Images.thinCartBag,
                              color: ColorsOfApp.appColor,
                              height: s.height * 0.025,
                            ),
                            SizedBox(
                              width: s.width * 0.03,
                            ),
                            Text(
                              '3 items',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: ColorsOfApp.mediumGreyColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      ButtonWidget(
                        height: s.height * 0.065,
                        width: s.width * 0.44,
                        ontap: () {},
                        boxBorder: Border.all(
                          color: ColorsOfApp.textFieldgreyColor,
                        ),
                        buttonColor: ColorsOfApp.appScaffoldColor,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: s.width * 0.03,
                            ),
                            const Icon(
                              Icons.time_to_leave,
                              color: ColorsOfApp.appColor,
                            ),
                            SizedBox(
                              width: s.width * 0.03,
                            ),
                            Text(
                              '30 min (6 Km) ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: ColorsOfApp.mediumGreyColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: s.height * 0.03,
                  ),
                  Text(
                    'items',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorsOfApp.blackColor, fontSize: 14),
                  ),
                  SizedBox(
                    height: s.height * 0.02,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Images.firstPlate,
                        height: s.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          Images.firstPlate,
                          height: s.height * 0.05,
                        ),
                      ),
                      Image.asset(
                        Images.firstPlate,
                        height: s.height * 0.05,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ButtonWidget(
                ontap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.only(top: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        content: FeedBackWidget(),
                      );
                    },
                  );
                },
                buttonTxt: 'Delivered',
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
