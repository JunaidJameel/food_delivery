import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountController extends GetxController {
  List<Map<String, dynamic>> pagelist = [
    {
      'icon': (Icons.favorite),
      'title': 'Favorit List',
    },
    {
      'icon': (Icons.online_prediction_rounded),
      'title': 'Orders History',
    },
    {
      'icon': (Icons.wallet),
      'title': 'Wallet',
    },
    {
      'icon': (Icons.wind_power),
      'title': 'Promotion',
    },
    {
      'icon': (Icons.atm),
      'title': 'Payment Method',
    },
  ];
  Rx<File?> img = Rx<File?>(null);
  Future<void> pickFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage == null) return;
    img.value = File(pickedImage.path);
  }

  // gallery
  Future<void> pickFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    img.value = File(pickedImage.path);
  }
}
