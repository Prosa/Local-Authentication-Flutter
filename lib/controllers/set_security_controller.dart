
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:test_pin/constants/storage_constants.dart';

class SetSecurityController extends GetxController{



  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  //PinPuts text controllers;
  TextEditingController pinController = TextEditingController();
  TextEditingController verifyPinController = TextEditingController();

  //PinPuts focus nodes;
  FocusNode pinFocusNode = FocusNode();
  FocusNode verifyPinFocusNode = FocusNode();

  //reactive variables;
  Rx<bool> pinsDoNotMatch  = false.obs;
  Rx<bool> onVerify = false.obs;
  Rx<bool> pinFilled = false.obs;
  Rx<bool> verifyPinFilled = false.obs;

  //PinPuts default boxDecoration;
  BoxDecoration get pinPutDecoration => BoxDecoration(
      color: const Color.fromRGBO(235, 236, 237, 1),
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(color: Colors.black));


  //This method is used to clean the variables that used inside the SetPinView;
  void initSetPinPage() {
    pinFilled = false.obs;
    pinController = TextEditingController();
    pinFocusNode = FocusNode();
  }

  //This method is used to clean the variables that used inside the VerifyPinView;
  void initVerifyPinPage() {
    verifyPinFilled = false.obs;
    verifyPinController = TextEditingController();
    verifyPinFocusNode = FocusNode();
    pinsDoNotMatch = false.obs;
  }


  bool checkValidity() {
    if(pinController.text == verifyPinController.text){
      return true;
    }else{
      return false;
    }
  }

  void checkVerificationFilled() {
    verifyPinFilled.value = verifyPinController.text.length == 4;
  }

  void checkPinFilled() {
    pinFilled.value = pinController.text.length == 4;
  }

  Future<void> updatePassword() async{
    secureStorage.write(key: StorageConstants.localPassword, value: pinController.text);
    await Future.delayed(const Duration(milliseconds: 500));
  }

}