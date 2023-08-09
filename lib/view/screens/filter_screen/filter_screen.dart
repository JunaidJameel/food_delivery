import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/view/screens/filter_screen/widget/filterContainer_widget.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: s.height * 0.05,
            ),
            RichText(
              text: TextSpan(
                text: 'h',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'oo',
                    style: TextStyle(
                      color: ColorsOfApp.appColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'made',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.height * 0.12,
            ),
            Center(
              child: Text(
                "What's your need?",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            SizedBox(
              height: s.height * 0.01,
            ),
            Text(
              "Please tell us on a little bit more about\nyourself and what's your need.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: ColorsOfApp.mediumGreyColor,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            FilterContainerWidget(),
          ],
        ),
      ),
    );
  }
}
