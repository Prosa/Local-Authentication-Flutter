
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class HomeController extends GetxController{

  final _localAuth = LocalAuthentication();
  var hasAvailableBiometrics = false.obs;
  var isUserAuthenticated = false.obs;

  @override
  void onInit(){

    super.onInit();

    _getAllBiometrics();
  }

  void _getAllBiometrics() async {

    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;

    if(hasLocalAuthentication){
      List<BiometricType> availableBiometrics = await _localAuth.getAvailableBiometrics();
      hasAvailableBiometrics.value = availableBiometrics.isNotEmpty;
    }else{
      Get.snackbar('Error', 'Local authentication is not available');
    }
  }

  void authenticateUser() async {

  }



}