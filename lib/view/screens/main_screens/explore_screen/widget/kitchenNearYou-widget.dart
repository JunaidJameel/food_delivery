import 'dart:math';

import 'package:design/controller/exploreScreen_controller.dart';
import 'package:design/data/model/kitchenNearYou_model.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/screens/main_screens/explore_screen/widget/customTags_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KitchenNearYouWidget extends StatelessWidget {
  KitchenNearYouWidget({super.key});
  ExploreController exploreController = Get.put(ExploreController());
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: s.height * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.only(left: AppConstants.defaultPadding),
          child: Text(
            'Kitchen Near You',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
          ),
        ),
        SizedBox(
          height: s.height * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.only(left: AppConstants.defaultPadding),
          child: SizedBox(
            height: s.height * 0.29,
            child: ListView.builder(
                itemCount: KitchenNearYou.kitchenNearYouList.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = KitchenNearYou.kitchenNearYouList[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        height: s.height * 0.1,
                        width: s.width * 0.7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: s.height * 0.15,
                              width: s.width,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      item.img,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorsOfApp.appScaffoldColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: s.width * 0.01,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: s.width * 0.01,
                                            ),
                                            Text(
                                              '4.5',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: s.width * 0.005,
                                            ),
                                            Text(
                                              '(25+)',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color:
                                                          ColorsOfApp.greyColor,
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GetBuilder<ExploreController>(
                                      init:
                                          ExploreController(), // Initialize your controller here
                                      builder: (controller) {
                                        return GestureDetector(
                                          onTap: () {
                                            controller.toggleFavorite(item);
                                          },
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor:
                                                ColorsOfApp.appScaffoldColor,
                                            child: Icon(Icons.favorite,
                                                color:
                                                    item.favButtonCheck == true
                                                        ? Colors.red
                                                        : ColorsOfApp.appColor),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Container(
                                      height: s.height * 0.05,
                                      width: s.width * 0.1,
                                      decoration: BoxDecoration(
                                          color: item.circleColor,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(item.chiefImg),
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              item.resturantName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                            ),
                                            SizedBox(
                                              width: s.width * 0.02,
                                            ),
                                            CircleAvatar(
                                              radius: 7,
                                              backgroundColor: Colors.blue,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(1),
                                                child: Image.asset(
                                                  Images.check,
                                                  color: ColorsOfApp
                                                      .appScaffoldColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              Images.foodDeliveryBike,
                                              color: ColorsOfApp.appColor,
                                              height: s.height * 0.024,
                                            ),
                                            SizedBox(
                                              width: s.width * 0.01,
                                            ),
                                            Text(
                                              'Free delivery',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color:
                                                          ColorsOfApp.appColor,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: s.width * 0.02,
                                            ),
                                            Image.asset(
                                              Images.clockIcon,
                                              color: ColorsOfApp.greyColor,
                                              height: s.height * 0.018,
                                            ),
                                            SizedBox(
                                              width: s.width * 0.02,
                                            ),
                                            Text(
                                              '10-15 min',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color:
                                                          ColorsOfApp.greyColor,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: s.height * 0.02,
                                        ),
                                        Row(
                                          children: const [
                                            CategoryTagCustom(title: 'Burger'),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6),
                                              child: CategoryTagCustom(
                                                  title: 'Chicken'),
                                            ),
                                            CategoryTagCustom(title: 'Meal'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
        SizedBox(
          height: s.height * 0.02,
        ),
      ],
    );
  }
}
