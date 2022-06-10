

import 'package:get/instance_manager.dart';
import 'package:test_pin/services/secure_storage_service.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SecureStorageService());
  }
  
}