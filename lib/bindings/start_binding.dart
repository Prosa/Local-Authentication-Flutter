import 'package:get/get.dart';
import 'package:test_pin/controllers/start_controller.dart';

class StartBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StartController());
  }

}