import 'package:design/controller/searchScreen_controller..dart';
import 'package:design/helper/static%20_lists.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../explore_screen/searchFilter_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Search',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: s.height * 0.03,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextFieldWidget(
                border: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorsOfApp.mediumGreyColor),
                contentPadding: const EdgeInsets.only(top: 15),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: SizedBox(
                  width: s.width * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: s.height * 0.045,
                        width: s.width * 0.004,
                        color: const Color.fromARGB(255, 209, 209, 209),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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
                textfiledColor: const Color.fromARGB(255, 232, 232, 232),
                hintText: 'Search foods and Ketchen',
              ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            Obx(
              () => Wrap(
                children:
                    List.generate(StaticLists.mealCategoryList.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      searchController.mealButtonSwitch(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          right: AppConstants.defaultPadding),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: searchController.initialFoodSelected.value ==
                                    index
                                ? Colors.transparent
                                : ColorsOfApp.textFieldgreyColor),
                        borderRadius: BorderRadius.circular(30),
                        color: searchController.initialFoodSelected.value ==
                                index
                            ? ColorsOfApp.appColor
                            : ColorsOfApp
                                .appScaffoldColor, // Set the desired color of the circular container
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.defaultPadding,
                            vertical: 10),
                        child: Text(
                          StaticLists.mealCategoryList[index]['title'],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 12,
                                  color: searchController
                                              .initialFoodSelected.value ==
                                          index
                                      ? ColorsOfApp.appScaffoldColor
                                      : ColorsOfApp.blackColor),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            Obx(
              () => Wrap(
                children:
                    List.generate(StaticLists.foodCategoryList.length, (index) {
                  return TextButton(
                    onPressed: () {
                      searchController.foodButtonSwitch(index);
                    },
                    child: Text(
                      StaticLists.foodCategoryList[index]['title'],
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight:
                              searchController.initialCategorySelected.value ==
                                      index
                                  ? FontWeight.bold
                                  : FontWeight.w400,
                          color:
                              searchController.initialCategorySelected.value ==
                                      index
                                  ? ColorsOfApp.blackColor
                                  : ColorsOfApp.mediumGreyColor),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: s.height * 0.01,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    mainAxisExtent: 155),
                itemCount: StaticLists
                    .gridItemsList.length, // Total number of items in the grid
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage(
                              StaticLists.gridItemsList[index]['img']),
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.darken,
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Text(
                        StaticLists.gridItemsList[index]['title'],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
