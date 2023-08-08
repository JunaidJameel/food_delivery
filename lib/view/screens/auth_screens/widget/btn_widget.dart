import 'package:design/utils/colors.dart';
import 'package:flutter/material.dart';

class BtnWidget extends StatelessWidget {
  final Function()? ontap;
  final Color btnColor;
  final String img;
  final String btnText;
  const BtnWidget(
      {required this.img,
      required this.btnText,
      this.ontap,
      required this.btnColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: s.height * 0.07,
        width: s.width * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: btnColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: s.width * 0.05,
                height: s.height * 0.05,
                child: Image.asset(
                  img,
                  color: ColorsOfApp.appScaffoldColor,
                )),
            SizedBox(
              width: s.width * 0.02,
            ),
            Text(
              btnText,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorsOfApp.appScaffoldColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5),
            ),
          ],
        ),
      ),
    );
  }
}
