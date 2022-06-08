
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class HomeController extends GetxController{

  final _localAuth = LocalAuthentication();
  var hasFingerPrintLock = false.obs;
  var hasFaceLock = false.obs;
  var isUserAuthenticated = false.obs;

  void _getAllBiometrics() async {

    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;

    if(hasLocalAuthentication){
      List<BiometricType> availableBiometrics = await _localAuth.getAvailableBiometrics();
      await _localAuth.getAvailableBiometrics();
      hasFaceLock.value = availableBiometrics.contains(BiometricType.face);
      hasFingerPrintLock.value = availableBiometrics.contains(BiometricType.fingerprint);
    }else{
      Get.snackbar('Error', 'Local authentication is not available');
    }
  }


}