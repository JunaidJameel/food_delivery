import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/base/button-widget.dart';
import 'package:flutter/material.dart';

class CheckEmailWidget extends StatelessWidget {
  const CheckEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;

    return Container(
      height: s.height * 0.6,
      width: s.width,
      decoration: const BoxDecoration(
        color: ColorsOfApp.appScaffoldColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: s.height * 0.01,
            ),
            Container(
              height: s.height * 0.005,
              width: s.width * 0.14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: ColorsOfApp.textFieldgreyColor,
              ),
            ),
            SizedBox(
              height: s.height * 0.08,
            ),
            Image.asset(
              Images.openedEmail,
              height: s.height * 0.08,
            ),
            SizedBox(
              height: s.height * 0.04,
            ),
            Text(
              'Check your Email',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700, color: ColorsOfApp.blackColor),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            FittedBox(
              alignment: Alignment.center,
              child: Text(
                'We have sent a password recovering instruction\nemail to iamnasir368@gmail.com',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500,
                    color: ColorsOfApp.greyColor),
              ),
            ),
            SizedBox(
              height: s.height * 0.05,
            ),
            ButtonWidget(buttonTxt: 'Open Email', ontap: () {}),
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Did not receve the email? Check your spam filter,\nOr, ',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text: 'try another email address',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14,
                        color: ColorsOfApp.appColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: s.height * 0.03,
            )
          ],
        ),
      ),
    );
  }
}
