import 'package:design/data/model/pageview_model.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:design/view/screens/auth_screens/signIn-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.off(SignInScreen());
                },
                child: Text(
                  'Skip',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                height: s.height * 0.7,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: PageViewModel.pageViewList.length,
                  itemBuilder: (context, index) {
                    var items = PageViewModel.pageViewList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: s.height * 0.3,
                              child: Image.asset(items.img)),
                          SizedBox(
                            height: s.height * 0.06,
                          ),
                          Text(items.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 26)),
                          SizedBox(
                            height: s.height * 0.03,
                          ),
                          Text(items.subtitle,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 14,
                                      color: ColorsOfApp.greyColor,
                                      fontWeight: FontWeight.w500))
                        ],
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const JumpingDotEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: ColorsOfApp.appColor,
                      dotColor: ColorsOfApp.textFieldgreyColor),
                ),
              ),
              const Spacer(),
              ButtonWidget(
                  buttonTxt: 'Next',
                  ontap: () {
                    if (_pageController.page != null &&
                        _pageController.page! <
                            PageViewModel.pageViewList.length - 1) {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    } else {
                      Get.to(SignInScreen());
                    }
                  }),
              SizedBox(
                height: s.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
