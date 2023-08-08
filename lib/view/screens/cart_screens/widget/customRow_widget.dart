import 'package:design/utils/app_constants.dart';
import 'package:design/utils/colors.dart';
import 'package:flutter/material.dart';

class ReusableTextRow extends StatelessWidget {
  final String firstTxt;
  final String secondTxt;
  final FontWeight? fontWeight;
  final Color? firstColor;
  final Color? secondColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  const ReusableTextRow({
    super.key,
    required this.firstTxt,
    required this.secondTxt,
    this.fontWeight,
    this.firstColor,
    this.secondColor,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 5,
          horizontal: horizontalPadding ?? AppConstants.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            firstTxt,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: firstColor ?? ColorsOfApp.mediumGreyColor,
                fontSize: 13.5,
                fontWeight: fontWeight ?? FontWeight.normal),
          ),
          Text(
            '\$$secondTxt',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: secondColor ?? ColorsOfApp.mediumGreyColor,
                fontSize: 13.5,
                fontWeight: fontWeight ?? FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
