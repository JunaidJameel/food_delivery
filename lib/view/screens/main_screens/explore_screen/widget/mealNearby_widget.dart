import 'package:design/controller/exploreScreen_controller.dart';
import 'package:design/data/model/kitchenNearYou_model.dart';
import 'package:design/data/model/mealNearyBy_model.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/screens/main_screens/explore_screen/mealDetails_screen.dart';
import 'package:design/view/screens/main_screens/explore_screen/widget/customTags_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class MealNearByWidget extends StatelessWidget {
  const MealNearByWidget({super.key});

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
            'Meal Nearby',
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
            height: s.height * 0.26,
            child: ListView.builder(
                itemCount: MealNearBy.mealNearByList.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = MealNearBy.mealNearByList[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(MealDetailScreen(
                          item: item,
                        ));
                      },
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
                                        item.dishImg,
                                      ),
                                      fit: BoxFit.cover),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: s.height * 0.035,
                                        width: s.width * 0.2,
                                        decoration: BoxDecoration(
                                          color: ColorsOfApp.appScaffoldColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                              text: '\$',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    color: ColorsOfApp.appColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: item.price
                                                      .toStringAsFixed(2),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      GetBuilder<ExploreController>(
                                        init:
                                            ExploreController(), // Initialize your controller here
                                        builder: (controller) {
                                          return GestureDetector(
                                            onTap: () {
                                              controller.favButtonToggle(item);
                                            },
                                            child: CircleAvatar(
                                              radius: 18,
                                              backgroundColor:
                                                  ColorsOfApp.appScaffoldColor,
                                              child: Icon(Icons.favorite,
                                                  color: item.favButtonTap ==
                                                          true
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: s.height * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          item.dishName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
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
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
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
                                                  color: ColorsOfApp
                                                      .mediumGreyColor,
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: s.height * 0.004,
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
                                          '\$5 Delivery Fee',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: ColorsOfApp.greyColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: s.width * 0.04,
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
                                                  color: ColorsOfApp.greyColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
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
