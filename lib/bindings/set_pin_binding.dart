import 'package:get/get.dart';
import 'package:test_pin/controllers/set_pin_controller.dart';

class SetPinBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => SetPinController());
  }

}