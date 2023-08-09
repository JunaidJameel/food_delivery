import 'package:get/get.dart';

class InboxController extends GetxController {
  var messages = <String>[].obs;

  void sendMessage(String message, controller) {
    messages.add(message);
    controller.clear();
  }
}
