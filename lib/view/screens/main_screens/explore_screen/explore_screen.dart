import 'dart:async';

import 'package:design/controller/exploreScreen_controller.dart';
import 'package:design/helper/static%20_lists.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/custom_divider.dart';
import 'package:design/view/base/textfield_widget.dart';
import 'package:design/view/screens/cart_screens/cart_screen.dart';
import 'package:design/view/screens/main_screens/explore_screen/searchFilter_screen.dart';
import 'package:design/view/screens/main_screens/explore_screen/widget/featuredSeller_widget.dart';
import 'package:design/view/screens/main_screens/explore_screen/widget/kitchenNearYou-widget.dart';
import 'package:design/view/screens/main_screens/explore_screen/widget/mealNearby_widget.dart';
import 'package:design/view/screens/main_screens/explore_screen/widget/scrollDeals_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: ColorsOfApp.appScaffoldColor,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset(
            Images.locationIcon,
            color: ColorsOfApp.appColor,
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                text: 'Delivary To',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorsOfApp.greyColor,
                      fontSize: 13,
                    ),
                children: const <TextSpan>[
                  TextSpan(
                    text: '\nBanasree, B-Block',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppConstants.defaultPadding),
            child: GestureDetector(
              onTap: () => Get.to(const CartScreen()),
              child: Image.asset(
                Images.thinCartBag,
                height: s.height * 0.035,
                color: ColorsOfApp.blackColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              //    color: Colors.amber,
              height: s.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: TextFieldWidget(
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                color: ColorsOfApp.mediumGreyColor),
                        contentPadding: const EdgeInsets.only(top: 15),
                        enabledBorder: InputBorder.none,
                        suffixIcon: SizedBox(
                          width: s.width * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: s.height * 0.045,
                                width: s.width * 0.004,
                                color: const Color.fromARGB(255, 209, 209, 209),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(SearchFilterScreen());
                                  },
                                  child: Image.asset(
                                    Images.filterIcon,
                                    color: ColorsOfApp.appColor,
                                    height: s.height * 0.032,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Image.asset(
                            Images.searchIcon,
                            color: ColorsOfApp.appColor,
                            height: s.height * 0.03,
                          ),
                        ),
                        hintTextColor: ColorsOfApp.mediumGreyColor,
                        // inputBorder: InputBorder.none,
                        textfiledColor:
                            const Color.fromARGB(255, 232, 232, 232),
                        hintText: 'Search foods and Ketchen',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppConstants.defaultPadding),
              child: SizedBox(
                height: s.height * 0.14,
                child: ListView.builder(
                  itemCount: StaticLists.foodCategoryList.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                        right: StaticLists.foodCategoryList.length - 1 == index
                            ? 16
                            : 22),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color.fromARGB(154, 163, 196, 192),
                          child: Image.asset(
                            StaticLists.foodCategoryList[index]['img'],
                            height: s.height * 0.05,
                          ),
                        ),
                        SizedBox(
                          height: s.height * 0.015,
                        ),
                        Text(
                          StaticLists.foodCategoryList[index]['title'],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const CustomDividerWidget(),
            const ScrollDealsWidget(),
            const CustomDividerWidget(),
            KitchenNearYouWidget(),
            const CustomDividerWidget(),
            const FeaturedSellerWidget(),
            const CustomDividerWidget(),
            const MealNearByWidget(),
            const CustomDividerWidget(),
          ],
        ),
      ),
    );
  }
}
