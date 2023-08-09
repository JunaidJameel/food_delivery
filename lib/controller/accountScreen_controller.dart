import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountController extends GetxController {
  Rx<File?> img = Rx<File?>(null);
  Future<void> pickFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage == null) return;
    img.value = File(pickedImage.path);
  }

  Future<void> pickFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    img.value = File(pickedImage.path);
  }
}
