import 'package:design/data/model/scrollDeals-model.dart';
import 'package:design/utils/app_constants.dart';
import 'package:design/view/base/custom_divider.dart';
import 'package:design/view/screens/main_screens/explore_screen/widget/scrollDeals_widget.dart';
import 'package:flutter/material.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            'Best Deals',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: s.height * 0.02,
          ),
          const CustomDividerWidget(),
          SizedBox(
            height: s.height * 0.02,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding),
              itemCount: ScrollDealsModel.scrollDealsList.length,
              // Number of containers in the list
              itemBuilder: (context, index) {
                final items = ScrollDealsModel.scrollDealsList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: DealsWidget(
                    s: s,
                    items: items,
                    index: index,
                    right: 0,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
