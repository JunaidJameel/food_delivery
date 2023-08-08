import 'package:design/view/screens/splash/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'themes/theme.dart';
import 'package:device_preview/device_preview.dart';

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
      title: 'Food Delivery',
      theme: light(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
