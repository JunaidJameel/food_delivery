import 'package:design/view/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'helper/bindings.dart';
import 'themes/theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyControllerBindings(),
      title: 'Food Delivery',
      theme: light(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
