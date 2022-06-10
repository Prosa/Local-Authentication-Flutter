import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_pin/bindings/main_binding.dart';
import 'package:test_pin/bindings/pin_binding.dart';
import 'package:test_pin/bindings/set_pin_binding.dart';
import 'package:test_pin/bindings/start_binding.dart';
import 'package:test_pin/bindings/verify_pin_binding.dart';
import 'package:test_pin/views/main_view.dart';
import 'package:test_pin/views/pin_view.dart';
import 'package:test_pin/views/set_pin_view.dart';
import 'package:test_pin/views/start_view.dart';
import 'package:test_pin/views/verify_pin_view.dart';

class RouteConstants{

  static const String mainView = '/main-view';
  static const String startView = '/';
  static const String pinView = '/pin-view';
  static const String setPinView = '/set-pin-view';
  static const String verifyPinView = '/verify-pin-view';
  static const String settingsView = '/settings-view';


  static List<GetPage>? get appPages => [
    GetPage(name: startView, page: () => const StartView(), binding: StartBinding()),
    GetPage(name: mainView, page: () => const MainView(), binding: MainBinding()),
    GetPage(name: pinView, page: () => const PinView(), binding: PinBinding()),
    GetPage(name: setPinView, page: () => const SetPinView(), binding: SetPinBinding()),
    GetPage(name: verifyPinView, page: () => const VerifyPinView(), binding: VerifyPinBinding()),
  ];

}