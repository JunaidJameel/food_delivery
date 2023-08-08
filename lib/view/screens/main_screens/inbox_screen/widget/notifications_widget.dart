import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/custom_divider.dart';
import 'package:design/view/screens/main_screens/inbox_screen/widget/pastOrders_widget.dart';
import 'package:flutter/material.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: AppConstants.defaultPadding, top: 10),
          child: Text(
            'Active Orders',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        SizedBox(
          height: s.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.blue[200],
                backgroundImage: const AssetImage(
                  'assets/images/chiefImg/3.png',
                ),
              ),
              SizedBox(
                width: s.width * 0.05,
              ),
              RichText(
                text: TextSpan(
                  text: 'Wade Warren Food',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n3 item Order ID #023481',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    TextSpan(
                      text: '\nOct 2, 11:30 am',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: '\$ ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorsOfApp.appColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: '45.99',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 226, 226, 226)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          'View Order',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppConstants.defaultPadding),
          child: CustomDividerWidget(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: AppConstants.defaultPadding),
          child: Text(
            'Past Orders',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        // PastOrdersWidget(),
        const PastOrdersWidget(),
      ],
    );
  }
}
