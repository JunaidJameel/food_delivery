import 'package:design/controller/exploreScreen_controller.dart';
import 'package:design/data/model/mealNearyBy_model.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/screens/cart_screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class MealDetailScreen extends StatelessWidget {
  final MealNearBy item;

  MealDetailScreen({super.key, required this.item});
  ExploreController exploreController = Get.put(ExploreController());
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: Column(
        children: [
          Container(
            height: s.height * 0.35,
            width: s.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    item.dishImg,
                  ),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding, vertical: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const CircleAvatar(
                      backgroundColor: ColorsOfApp.appScaffoldColor,
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 30,
                        color: ColorsOfApp.greyColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                        backgroundColor: ColorsOfApp.appScaffoldColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(Images.thinCartBag),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: s.height * 0.02,
                      ),
                      Text(
                        item.dishName,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      GetBuilder<ExploreController>(
                        init: ExploreController(),
                        builder: (controller) => Text(
                          "\$${(item.price * item.noOfItems).toStringAsFixed(2)}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 20, color: ColorsOfApp.appColor),
                        ),
                      ),
                      SizedBox(
                        height: s.height * 0.05,
                      ),
                      Text(
                        'Add more items',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      SizedBox(
                        height: s.height * 0.25,
                        width: s.width,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: item.extraItemslist.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: AppConstants.defaultPadding,
                                right: AppConstants.defaultPadding,
                                bottom: AppConstants.defaultPadding,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    item.extraItemslist[index]['img'],
                                    height: s.height * 0.05,
                                  ),
                                  SizedBox(
                                    width: s.width * 0.04,
                                  ),
                                  Text(
                                    item.extraItemslist[index]['title'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                  const Spacer(),
                                  GetBuilder<ExploreController>(
                                    init: ExploreController(),
                                    builder: (controller) => GestureDetector(
                                      onTap: () {
                                        controller.buttonToggle(item, index);
                                      },
                                      child: SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              '\$${item.extraItemslist[index]['price']}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    fontSize: 15,
                                                    color: item.extraItemslist[
                                                                    index][
                                                                'buttonPress'] ==
                                                            true
                                                        ? ColorsOfApp.blackColor
                                                        : ColorsOfApp
                                                            .textFieldgreyColor,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            SizedBox(
                                              width: s.width * 0.04,
                                            ),
                                            Container(
                                              height: s.height * 0.05,
                                              width: s.width * 0.07,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1.5,
                                                  color: item.extraItemslist[
                                                                  index]
                                                              ['buttonPress'] ==
                                                          true
                                                      ? ColorsOfApp.appColor
                                                      : ColorsOfApp
                                                          .textFieldgreyColor,
                                                ),
                                                shape: BoxShape.circle,
                                                color: ColorsOfApp
                                                    .appScaffoldColor,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.5),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      item.extraItemslist[index]
                                                                  [
                                                                  'buttonPress'] ==
                                                              true
                                                          ? ColorsOfApp.appColor
                                                          : ColorsOfApp
                                                              .appScaffoldColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: s.width * 0.01,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      SizedBox(
                        height: s.height * 0.02,
                      ),
                      Text(
                        '${item.dishName} is a delightful fusion of Italian and Indian flavors.The pizza features a tantalizing combination of succulent chicken tikka pieces and classic pizza toppings. Each bite is a burst of flavors, with the smoky, spiced chicken tikka complementing the cheesy goodness of the pizza',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ColorsOfApp.mediumGreyColor,
                            ),
                      ),
                      SizedBox(
                        height: s.height * 0.05,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorsOfApp.appScaffoldColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 0,
              offset: const Offset(0,
                  2), // Changes the position of the shadow (horizontal, vertical)
            ),
          ],
        ),
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        height: s.height * 0.1,
        width: s.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: s.height * 0.07,
              width: s.width * 0.37,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: ColorsOfApp.greyColor),
                  color: ColorsOfApp.appScaffoldColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GetBuilder<ExploreController>(
                    init: ExploreController(),
                    builder: (controller) => GestureDetector(
                      onTap: () {
                        exploreController.removeItems(item);
                        // print(exploreController.checkingVar);
                      },
                      child: SizedBox(
                        height: s.height,
                        //  color: Colors.amber,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: Color.fromARGB(255, 232, 232, 232),
                            child: Icon(
                              Icons.remove,
                              color: ColorsOfApp.greyColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GetBuilder<ExploreController>(
                    init: ExploreController(),
                    builder: (controller) => Text(
                      item.noOfItems.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 21),
                    ),
                  ),
                  GetBuilder<ExploreController>(
                    init: ExploreController(),
                    builder: (controller) => GestureDetector(
                      onTap: () {
                        controller.addItems(
                          item,
                        );
                      },
                      child: SizedBox(
                        height: s.height,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: ColorsOfApp.appColor,
                            child: Icon(
                              Icons.add,
                              color: ColorsOfApp.appScaffoldColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const CartScreen());
              },
              child: Container(
                height: s.height * 0.07,
                width: s.width * 0.51,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorsOfApp.appColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        Images.thinCartBag,
                        height: s.height * 0.028,
                        color: ColorsOfApp.appScaffoldColor,
                      ),
                      Text(
                        'Add To Cart',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorsOfApp.appScaffoldColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
