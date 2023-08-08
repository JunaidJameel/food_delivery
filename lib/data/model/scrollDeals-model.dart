import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:flutter/material.dart';

class ScrollDealsModel {
  final String titleTxt;
  final String tagTitle;
  final Color btnColor;
  final String img;
  final Color backgroundColor;
  ScrollDealsModel(
      {required this.btnColor,
      required this.img,
      required this.tagTitle,
      required this.titleTxt,
      required this.backgroundColor});

  static List<ScrollDealsModel> scrollDealsList = [
    ScrollDealsModel(
        btnColor: ColorsOfApp.appScaffoldColor,
        img: Images.firstPlate,
        tagTitle: '20%',
        titleTxt: 'On your first order!',
        backgroundColor: Colors.black),
    ScrollDealsModel(
        btnColor: const Color.fromARGB(255, 255, 202, 45),
        img: Images.secondPlate,
        tagTitle: '25%',
        titleTxt: "Every sunday special dish\nfrom saima's kitchen",
        backgroundColor: const Color.fromARGB(255, 192, 37, 34)),
    ScrollDealsModel(
      btnColor: const Color.fromARGB(255, 255, 224, 130),
      img: Images.thirdPlate,
      tagTitle: '10%',
      titleTxt: "Onboarding orders you'll\nget discount",
      backgroundColor: const Color.fromARGB(255, 14, 123, 112),
    ),
  ];
}
