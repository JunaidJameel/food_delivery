import 'dart:developer';

import 'package:design/controller/bottomNavigation_controller.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/screens/main_screens/account_screen/account_screen.dart';
import 'package:design/view/screens/main_screens/deals_screen/deals_screen.dart';
import 'package:design/view/screens/main_screens/explore_screen/explore_screen.dart';
import 'package:design/view/screens/main_screens/inbox_screen/inbox_screen.dart';
import 'package:design/view/screens/main_screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandiBottomNavigationngPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  LandiBottomNavigationngPage({super.key});

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            unselectedItemColor: ColorsOfApp.hintTextColor,
            selectedItemColor: ColorsOfApp.appColor,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.explorIcon,
                    height: MediaQuery.of(context).size.height * 0.03,
                    color: ColorsOfApp.appColor,
                  ),
                ),
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.explorIcon,
                    height: MediaQuery.of(context).size.height * 0.03,
                    color: ColorsOfApp.greyColor,
                  ),
                ),
                label: 'Explore',
                backgroundColor: ColorsOfApp.appScaffoldColor,
              ),
              BottomNavigationBarItem(
                backgroundColor: ColorsOfApp.appScaffoldColor,
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.searchIcon,
                    color: ColorsOfApp.appColor,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.searchIcon,
                    color: ColorsOfApp.greyColor,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.dealsIcon,
                    color: ColorsOfApp.appColor,
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                ),
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.dealsIcon,
                    color: ColorsOfApp.greyColor,
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                ),
                label: 'Deals',
                backgroundColor: ColorsOfApp.appScaffoldColor,
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.inboxIcon,
                    color: ColorsOfApp.appColor,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.inboxIcon,
                    color: ColorsOfApp.greyColor,
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                ),
                label: 'Inbox',
                backgroundColor: ColorsOfApp.appScaffoldColor,
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.accountIcon,
                    color: ColorsOfApp.appColor,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Image.asset(
                    Images.accountIcon,
                    color: ColorsOfApp.greyColor,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                label: 'Account',
                backgroundColor: ColorsOfApp.appScaffoldColor,
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationController landingPageController =
        Get.put(BottomNavigationController(), permanent: false);
    return Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              ExploreScreen(),
              SearchScreen(),
              const DealsScreen(),
              const InboxScreen(),
              AccountScreen(),
            ],
          )),
    );
  }
}
