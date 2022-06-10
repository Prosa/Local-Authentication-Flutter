import 'package:get/get.dart';
import 'package:test_pin/controllers/verify_pin_controller.dart';

class VerifyPinBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyPinController());
  }

}