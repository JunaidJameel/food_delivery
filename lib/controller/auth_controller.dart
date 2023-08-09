import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();

  bool _filterTap = false;

  bool get filterTap => _filterTap;

  set filterTap(bool val) {
    _filterTap = val;
    update();
  }

  var initialTap = RxInt(-1);
}
