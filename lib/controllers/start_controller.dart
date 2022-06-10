

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:test_pin/constants/storage_constants.dart';
import 'package:test_pin/services/secure_storage_service.dart';

class StartController extends GetxController{
  static StartController get find => Get.find();

  final SecureStorageService _secureStorage = SecureStorageService.find;

  Rx<bool> localAuthentication = false.obs;

  @override
  void onInit(){
    super.onInit();

    _checkAuthenticationAvailability();
  }

  Future<void> _checkAuthenticationAvailability() async {
    localAuthentication.value = await _secureStorage.readBool(StorageConstants.localAuthenticationEnabled) ?? false;
  }

}