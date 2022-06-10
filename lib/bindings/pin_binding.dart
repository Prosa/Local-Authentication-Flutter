import 'package:get/get.dart';
import 'package:test_pin/controllers/pin_controller.dart';

class PinBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PinController());
  }

}