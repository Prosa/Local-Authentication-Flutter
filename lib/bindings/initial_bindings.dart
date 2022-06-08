import 'package:get/get.dart';
import 'package:test_pin/controllers/home_controller.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
  
}