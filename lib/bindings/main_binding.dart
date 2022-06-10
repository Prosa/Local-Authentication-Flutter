import 'package:get/get.dart';
import 'package:test_pin/controllers/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}