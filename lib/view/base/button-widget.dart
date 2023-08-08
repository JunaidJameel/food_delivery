import 'package:design/utils/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final BoxBorder? boxBorder;
  final double? height;
  final double? width;
  final Function() ontap;
  final String? buttonTxt;
  final Color? buttonColor;
  final Widget? widget;
  const ButtonWidget(
      {this.buttonTxt,
      this.boxBorder,
      this.buttonColor,
      required this.ontap,
      this.widget,
      this.height,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height ?? s.height * 0.07,
        width: width ?? s.width,
        decoration: BoxDecoration(
          border: boxBorder,
          color: buttonColor ?? ColorsOfApp.appColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: widget ??
              Text(
                buttonTxt.toString(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    letterSpacing: 1, color: Colors.white, fontSize: 15),
              ),
        ),
      ),
    );
  }
}
