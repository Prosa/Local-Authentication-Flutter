

import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:local_auth/local_auth.dart';
import 'package:test_pin/constants/storage_constants.dart';
import 'package:test_pin/services/secure_storage_service.dart';

class StartController extends GetxController{
  static StartController get find => Get.find();

  final SecureStorageService _secureStorage = SecureStorageService.find;

  Rx<bool> localAuthentication = false.obs;

  Rx<bool> biometricsEnabled = false.obs;


  @override
  void onInit(){
    super.onInit();

    checkAuthenticationAvailability();
    checkBiometrics();
  }

  Future<void> deletePin() async{

    await _secureStorage.remove(StorageConstants.localPassword);
    await _secureStorage.remove(StorageConstants.localAuthenticationEnabled);
    await _secureStorage.remove(StorageConstants.biometricsEnabled);
    checkBiometrics();
    checkAuthenticationAvailability();

  }

  Future<void> checkAuthenticationAvailability() async {
    localAuthentication.value = await _secureStorage.readBool(StorageConstants.localAuthenticationEnabled) ?? false;
  }

  Future<void> checkBiometrics() async{
    biometricsEnabled.value = (await _secureStorage.readBool(StorageConstants.biometricsEnabled)) ?? false;
  }


  Future<void> enableBiometrics() async{
    //we need to check if there is any biometric method available for the specific device;
    final availableBiometrics = await LocalAuthentication().getAvailableBiometrics();

    if(availableBiometrics.isEmpty){
      Get.snackbar('No biometrics available', 'it seems that your device does not contain any biometric method for quick login, use pin instead');
      return;
    }

    bool authenticated = await LocalAuthentication().authenticate(localizedReason: 'Please, verify it\'s you');
    if(authenticated){
      await _secureStorage.writeBool(StorageConstants.biometricsEnabled, true);
      await checkBiometrics();
    }else{
      Get.snackbar('Unauthorized', 'Unable to authorize, Please, try again');
    }

  }

}