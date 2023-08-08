import 'package:design/utils/colors.dart';
import 'package:design/utils/images.dart';
import 'package:design/view/screens/intro_screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      const Duration(milliseconds: 500);
      Get.off(
        const IntroScreens(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsOfApp.appColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: s.height * 0.3,
              child: Image.asset(
                Images.logo,
              ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            RichText(
              text: TextSpan(
                text: 'h',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'oo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'made',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
