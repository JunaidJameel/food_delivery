import 'package:design/controller/exploreScreen_controller.dart';
import 'package:design/helper/static%20_lists.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFilterScreen extends StatelessWidget {
  SearchFilterScreen({super.key});
  ExploreController exploreController = Get.put(ExploreController());
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Filters',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: 'Gilroy', fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.close,
            color: Color.fromARGB(255, 69, 69, 69),
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppConstants.defaultPadding),
            child: GetBuilder<ExploreController>(
              init: ExploreController(),
              builder: (controller) => TextButton(
                onPressed: () {
                  //  exploreController.clearAllFilters();
                },
                child: Text(
                  'Reset',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.red[200]),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sort By',
            ),
            SizedBox(
              height: s.height * 0.25,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: StaticLists.sortByList.length,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: s.height * 0.05,
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                        minLeadingWidth: 0,
                        leading: Image.asset(
                          StaticLists.sortByList[index]['img'],
                          height: s.height * 0.028,
                        ),
                        title: Text(StaticLists.sortByList[index]['title']),
                        trailing: Transform.scale(
                          scale: 1.3,
                          child: GetBuilder<ExploreController>(
                            init: ExploreController(),
                            builder: (controller) => Checkbox(
                              side: const BorderSide(
                                  color: ColorsOfApp.textFieldgreyColor),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              value: StaticLists.sortByList[index]
                                  ['filter'], // Use .value here
                              onChanged: (bool? value) {
                                controller.onFilterChanged(
                                    value, index); // No need to set .value here
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Text('Price range'),
            SizedBox(
              height: s.height * 0.14,
              child: ListView.builder(
                itemCount: StaticLists.filterPrices.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                      right: StaticLists.foodCategoryList.length - 1 == index
                          ? 16
                          : 22),
                  child: GetBuilder<ExploreController>(
                    init: ExploreController(),
                    builder: (controller) => GestureDetector(
                      onTap: () {
                        exploreController.priceCheck(index);
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor:
                            exploreController.initalPrice.value == index
                                ? ColorsOfApp.appColor
                                : const Color.fromARGB(154, 239, 239, 239),
                        child: Text(
                          '${StaticLists.filterPrices[index]}\$',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: exploreController.initalPrice.value ==
                                          index
                                      ? ColorsOfApp.appScaffoldColor
                                      : ColorsOfApp.blackColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Text('Categories'),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 100),
                itemCount: 4, // Number of items in the grid
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => GestureDetector(
                        onTap: () {
                          exploreController.buttonPress(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                exploreController.categoryInitialIndex.value ==
                                        index
                                    ? ColorsOfApp.appColor
                                    : const Color.fromARGB(255, 238, 238, 238),
                            borderRadius: BorderRadius.circular(
                                10), // Set the radius to make rounded corners
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  StaticLists.categoryList[index]['img'],
                                  height: s.height * 0.05,
                                ),
                                Text(
                                  StaticLists.categoryList[index]['title'],
                                  style: TextStyle(
                                      color: index ==
                                              exploreController
                                                  .categoryInitialIndex.value
                                          ? Colors.white
                                          : ColorsOfApp.blackColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            ButtonWidget(
              buttonTxt: 'Apply Filters',
              ontap: Get.back,
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
