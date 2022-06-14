import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';
import 'package:test_pin/constants/app_constants.dart';
import 'package:test_pin/constants/color_constants.dart';
import 'package:test_pin/constants/view_constants.dart';
import 'package:test_pin/controllers/verify_pin_controller.dart';
import 'package:test_pin/extension/extension.dart';
import 'package:test_pin/widgets/pin_keyboard.dart';
import 'package:test_pin/widgets/spacer.dart';

class VerifyPinView extends GetView<VerifyPinController> {
  const VerifyPinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstants.primaryColorLight,
      body: Column(
        children: [
          Container(
            height: height * 0.45,
            decoration: const BoxDecoration(
              color: ColorConstants.primaryColorLight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Verify PIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: ColorConstants.whiteColor,
                  ),
                ),
                const VerticalSpacer(),
                const VerticalSpacer(),
                ObxValue((Rx<String> pin) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PinInput(showInput: pin.value.isNotEmpty),
                    PinInput(showInput: pin.value.length > 1),
                    PinInput(showInput: pin.value.length > 2),
                    PinInput(showInput: pin.value.length > 3),
                  ],
                ), controller.pin),
              ],
            ),
          ),
          Container(
            height: height * 0.55,
            decoration: const BoxDecoration(
              color: ColorConstants.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ViewConstants.defaultBorderRadius),
                topRight: Radius.circular(ViewConstants.defaultBorderRadius),
              ),
            ),
            child: ObxValue(
                (Rx<String> pin) => PinKeyboard(
                  completeIconColor: ColorConstants.primaryColor,
                  onDigitTapped: pin.value.length == AppConstants.pinLength ? null : (d) {
                    pin.value = pin.value + d.toString();
                  },
                  completeIcon: pin.value.length < 4
                      ? const Icon(
                    Icons.arrow_back,
                    color: ColorConstants.primaryColor,
                    size: 30,
                  )
                      : const Icon(Icons.check,
                      color: ColorConstants.primaryColor,
                      size: 30),
                  onComplete: pin.value.length < 4 ? Get.back :  () {
                    if(controller.pin.value == Get.arguments[AppConstants.pinArgument]){
                      controller.savePin();
                    }else{
                      Get.snackbar('Wrong', "PINs do not match");
                    }
                  },
                  onBackspace: pin.value.isEmpty ? null : () {
                    pin.value =
                        pin.value.removeLastCharacter();
                  },
                ), controller.pin,
            ),
          )
        ],
      ),
    );
  }
}
