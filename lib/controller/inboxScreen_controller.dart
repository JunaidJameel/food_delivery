import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxController extends GetxController {
  var messageController = TextEditingController();
  var messages = <String>[].obs;

  void sendMessage(String message) {
    messages.add(message);
    messageController.clear();
  }
}
