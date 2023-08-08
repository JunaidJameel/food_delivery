import 'package:flutter/material.dart';

class FeaturedSellerMode {
  final String chiefImg;
  final String chiefName;
  final Color circleColor;
  FeaturedSellerMode({
    required this.chiefImg,
    required this.chiefName,
    required this.circleColor,
  });

  static List<FeaturedSellerMode> featuredSellerList = [
    FeaturedSellerMode(
        circleColor: Colors.orange,
        chiefImg: 'assets/images/chiefImg/3.png',
        chiefName: 'Devon Lane'),
    FeaturedSellerMode(
        circleColor: const Color.fromARGB(255, 255, 148, 184),
        chiefImg: 'assets/images/chiefImg/1.png',
        chiefName: 'Floyd Miles'),
    FeaturedSellerMode(
        circleColor: const Color.fromARGB(255, 161, 155, 155),
        chiefImg: 'assets/images/chiefImg/3.png',
        chiefName: 'Jane Cooper'),
    FeaturedSellerMode(
        circleColor: const Color.fromARGB(255, 219, 198, 255),
        chiefImg: 'assets/images/chiefImg/4.png',
        chiefName: 'Travis Head'),
  ];
}
