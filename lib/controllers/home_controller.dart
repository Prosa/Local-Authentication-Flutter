
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:test_pin/constants/color_constants.dart';
import 'package:test_pin/constants/storage_constants.dart';
import 'package:test_pin/controllers/set_security_controller.dart';

class HomeController extends GetxController{

  final _localAuth = LocalAuthentication();
  final _secureStorage = const FlutterSecureStorage();
  Rx<bool> hasAvailableBiometrics = false.obs;
  Rx<bool> isUserAuthenticated = false.obs;
  Rx<bool> hasPin = false.obs;

  final InputController _inputController = InputController();

  @override
  void onInit(){
    //initialize Page
    //check if there is already a PIN
    _checkForPin();
    super.onInit();
  }

  Future<void> _checkForPin() async {
    hasPin.value = await _secureStorage.read(key: StorageConstants.localPassword) != null;
  }

  Future<void> _getAllBiometrics() async {

    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;

    if(hasLocalAuthentication){
      List<BiometricType> availableBiometrics = await _localAuth.getAvailableBiometrics();
      hasAvailableBiometrics.value = availableBiometrics.isNotEmpty;
    }else{

    }

  }


  Future<void> localAuth(BuildContext context) async {
    final localAuth = LocalAuthentication();
    final didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Please authenticate', options: const AuthenticationOptions(biometricOnly: true));
    if (didAuthenticate) {
      Navigator.of(context).pop();
    }
  }

  Future<bool> authenticateUser(BuildContext context) async {

      String? hasLocalAuthentication = await _secureStorage.read(key: StorageConstants.localPassword);

      if(hasLocalAuthentication == null){
        return false;
      }

      await _getAllBiometrics();



      _inputController.initialize(digits: 4, correctString: '1234');

      screenLock(
        maxRetries: 3,
        context: context,
        canCancel: false,
        screenLockConfig: ScreenLockConfig(
          backgroundColor: ColorConstants.primaryColor.withOpacity(0.8),
        ),
        inputButtonConfig: InputButtonConfig(
          textStyle: const TextStyle(
            color: ColorConstants.primaryColorLight,
            fontSize: 18,
          ),
          buttonStyle: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorConstants.whiteColor),
          ),
        ),
        inputController: _inputController,
        customizedButtonTap: hasAvailableBiometrics.value ? () async {
          await localAuth(context);
        } : null,
        customizedButtonChild: hasAvailableBiometrics.value ? const Icon(
          Icons.fingerprint,
        ) : null,
        correctString: hasLocalAuthentication,

      );

      return true;
  }


  setPinDialog() {
    SetSecurityController securityController = Get.find();
    securityController.initSetPinPage();

    Get.toNamed('/set_security');
  }

}