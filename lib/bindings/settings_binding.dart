import 'package:get/get.dart';
import 'package:test_pin/controllers/settings_controller.dart';

class SettingsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }

}