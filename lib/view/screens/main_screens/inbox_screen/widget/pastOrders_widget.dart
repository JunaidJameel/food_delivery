import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:flutter/material.dart';

class PastOrdersWidget extends StatelessWidget {
  const PastOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;

    return Expanded(
        child: ListView.builder(
      padding:
          const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
      scrollDirection: Axis.vertical,
      itemCount: 5,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: AppConstants.defaultPadding),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.pink[200],
                  backgroundImage: const AssetImage(
                    'assets/images/chiefImg/4.png',
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
                const Spacer(),
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
                    const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
//   }
// }
