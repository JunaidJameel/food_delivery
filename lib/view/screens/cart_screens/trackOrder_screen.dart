import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:design/view/base/custom_divider.dart';
import 'package:design/view/screens/cart_screens/trackLocation_screen.dart';
import 'package:design/view/screens/cart_screens/widget/timelineTile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

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
        // leadingWidth: 10,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDividerWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Order ID',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorsOfApp.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n# 5fez67039',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ColorsOfApp.mediumGreyColor,
                                    // fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.copy,
                    color: ColorsOfApp.mediumGreyColor,
                  )
                ],
              ),
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
                    'Timeline',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorsOfApp.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppConstants.defaultPadding),
                    child: SizedBox(
                      height: s.height * 0.4,
                      //  color: Colors.amber,
                      child: TimelineWidget(),
                    ),
                  ),
                ],
              ),
            ),
            const CustomDividerWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Delivery Address',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorsOfApp.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: s.height * 0.12,
                    width: s.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        Images.mapImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: s.height * 0.02,
                  ),
                  Text(
                    '140 Laurie Meadows Drive, San Matero\nCA, US, 94403',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorsOfApp.greyColor,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  SizedBox(
                    height: s.height * 0.05,
                  ),
                  ButtonWidget(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.locationIcon,
                            color: Colors.white,
                            height: s.height * 0.02,
                          ),
                          SizedBox(
                            width: s.width * 0.025,
                          ),
                          Text(
                            'Track My Order',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: ColorsOfApp.appScaffoldColor),
                          ),
                        ],
                      ),
                      ontap: () {
                        Get.to(const TrackLocationScreen());
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
