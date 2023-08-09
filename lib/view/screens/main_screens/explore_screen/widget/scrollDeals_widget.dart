import 'dart:async';

import 'package:design/controller/exploreScreen_controller.dart';
import 'package:design/data/model/scrollDeals-model.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScrollDealsWidget extends StatefulWidget {
  const ScrollDealsWidget({super.key});

  @override
  State<ScrollDealsWidget> createState() => _ScrollDealsWidgetState();
}

class _ScrollDealsWidgetState extends State<ScrollDealsWidget> {
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.91);

  int currentIndex = 0;
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentIndex < 2) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }

      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: s.height * 0.02,
        ),
        SizedBox(
          height: s.height * 0.2,
          width: s.width,
          child: PageView.builder(
            controller: pageController,
            itemCount: ScrollDealsModel.scrollDealsList.length,
            itemBuilder: (context, index) {
              final items = ScrollDealsModel.scrollDealsList[index];
              return DealsWidget(
                s: s,
                items: items,
                index: index,
                right: index == 2 ? 0 : 14,
              );
            },
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(
          height: s.height * 0.015,
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: 3,
          effect: ExpandingDotsEffect(
              dotColor: Colors.deepPurple.shade100, dotHeight: 9, dotWidth: 8),
        ),
        SizedBox(
          height: s.height * 0.02,
        ),
      ],
    );
  }
}

class DealsWidget extends StatelessWidget {
  const DealsWidget({
    super.key,
    required this.s,
    required this.items,
    required this.index,
    this.right,
  });

  final Size s;
  final ScrollDealsModel items;
  final index;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: right!),
      height: s.height * 0.2,
      width: s.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: items.backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UPTO',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 12,
                        color: index == 1
                            ? Colors.white
                            : const Color.fromARGB(255, 255, 231, 160),
                      ),
                ),
                RichText(
                  text: TextSpan(
                    text: items.tagTitle,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 25,
                          color: index == 1
                              ? Colors.white
                              : const Color.fromARGB(255, 255, 231, 160),
                        ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' OFF',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: index == 1
                                  ? Colors.white
                                  : const Color.fromARGB(255, 255, 231, 160),
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: s.height * 0.005,
                ),
                Text(
                  items.titleTxt,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: ColorsOfApp.appScaffoldColor),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: items.btnColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.defaultPadding, vertical: 5),
                      child: Text(
                        'Order Now',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                            color: ColorsOfApp.blackColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: s.width * 0.3,
              //color: Colors.amber,
              height: s.height,
              child: Image.asset(
                items.img,
                //  fit: index == 2 ? BoxFit.fill : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
