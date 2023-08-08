import 'package:flutter/material.dart';

class KitchenNearYou {
  final String img;
  final String resturantName;
  final String chiefImg;
  final Color circleColor;
  bool favButtonCheck;
  KitchenNearYou({
    required this.chiefImg,
    required this.circleColor,
    required this.img,
    required this.resturantName,
    required this.favButtonCheck,
  });
  static List<KitchenNearYou> kitchenNearYouList = [
    KitchenNearYou(
        chiefImg: 'assets/images/chiefImg/1.png',
        circleColor: const Color.fromARGB(255, 111, 185, 246),
        img: 'assets/images/chiefImg/r1.jpg',
        resturantName: 'Warren Foods',
        favButtonCheck: false),
    KitchenNearYou(
        chiefImg: 'assets/images/chiefImg/2.png',
        circleColor: const Color.fromARGB(255, 214, 228, 133),
        img: 'assets/images/chiefImg/r2.jpg',
        resturantName: 'Jerome Foods',
        favButtonCheck: false),
    KitchenNearYou(
        chiefImg: 'assets/images/chiefImg/3.png',
        circleColor: const Color.fromARGB(255, 240, 169, 193),
        img: 'assets/images/chiefImg/r3.jpg',
        resturantName: 'Floyd Foods',
        favButtonCheck: false),
    KitchenNearYou(
        chiefImg: 'assets/images/chiefImg/4.png',
        circleColor: const Color.fromARGB(255, 91, 160, 153),
        img: 'assets/images/chiefImg/r4.jpg',
        resturantName: 'Jane Foods',
        favButtonCheck: false),
  ];
}
