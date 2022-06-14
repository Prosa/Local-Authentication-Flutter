
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:test_pin/constants/route_constants.dart';
import 'package:test_pin/constants/storage_constants.dart';
import 'package:test_pin/controllers/start_controller.dart';
import 'package:test_pin/services/secure_storage_service.dart';

class VerifyPinController extends GetxController{
  static VerifyPinController get find => Get.find();

  Rx<String> pin = ''.obs;

  FocusNode pinFocusNode = FocusNode();
  TextEditingController pinController = TextEditingController();

  Future<void> savePin() async{
    final storageService = SecureStorageService.find;

    await storageService.writeString(StorageConstants.localPassword, pin.value);
    await storageService.writeBool(StorageConstants.localAuthenticationEnabled, true);

    await StartController.find.checkAuthenticationAvailability();

    Get.snackbar('Success', 'Your pin has been created properly', duration: const Duration(milliseconds: 500));

    await Future.delayed(const Duration(milliseconds: 500));

    Get.offAllNamed(RouteConstants.startView);

  }


}