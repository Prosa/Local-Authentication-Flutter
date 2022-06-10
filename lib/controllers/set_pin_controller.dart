
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class SetPinController extends GetxController{
  static SetPinController get find => Get.find();

  Rx<String> pin = ''.obs;

  FocusNode pinFocusNode = FocusNode();
  TextEditingController pinController = TextEditingController();

}