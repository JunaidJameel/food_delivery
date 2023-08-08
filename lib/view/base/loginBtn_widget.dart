import 'package:design/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginBtn extends StatelessWidget {
  final Function()? ontap;
  final String firstText;
  final String secondText;
  const LoginBtn({
    required this.firstText,
    required this.secondText,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: s.height * 0.075,
        width: s.width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 229, 231, 232),
          border: Border.all(color: ColorsOfApp.textFieldgreyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: firstText,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
              children: <TextSpan>[
                TextSpan(
                  text: secondText,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 15,
                      color: ColorsOfApp.appColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
