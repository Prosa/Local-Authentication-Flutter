

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:local_auth/local_auth.dart';
import 'package:test_pin/constants/route_constants.dart';
import 'package:test_pin/constants/storage_constants.dart';
import 'package:test_pin/services/secure_storage_service.dart';

class PinController extends GetxController{
  static PinController get find => Get.find();

  Rx<bool> biometricsEnabled = false.obs;

  final _secureStorageService = SecureStorageService.find;

  @override
  void onInit(){
    super.onInit();

    checkBiometrics();

  }

  Rx<String> pin = ''.obs;

  FocusNode pinFocusNode = FocusNode();
  TextEditingController pinController = TextEditingController();

  Future<void> checkBiometrics() async{
    biometricsEnabled.value = (await _secureStorageService.readBool(StorageConstants.biometricsEnabled)) ?? false;
    if(!biometricsEnabled.value){
      return;
    }else{
      bool authenticated = await LocalAuthentication().authenticate(localizedReason: 'Verify it\'s you', options: const AuthenticationOptions(biometricOnly: true));
      if(authenticated){
        Get.offAndToNamed(RouteConstants.mainView);
      }
    }
  }

  Future<void> checkPin() async{


    if(pin.value == (await _secureStorageService.readString(StorageConstants.localPassword))){
      Get.offAndToNamed(RouteConstants.mainView);
    }else{
      pin.value = '';
      Get.snackbar('Wrong Password', 'Given PIN is not correct');
    }

  }

}