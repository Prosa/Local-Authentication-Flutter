import 'package:get/get.dart';
import 'package:test_pin/controllers/home_controller.dart';
import 'package:test_pin/controllers/set_security_controller.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SetSecurityController());
    Get.put(HomeController());

  }
  
}