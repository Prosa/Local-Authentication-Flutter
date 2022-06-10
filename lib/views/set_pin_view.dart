import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:test_pin/constants/app_constants.dart';
import 'package:test_pin/constants/color_constants.dart';
import 'package:test_pin/constants/view_constants.dart';
import 'package:test_pin/controllers/set_pin_controller.dart';
import 'package:test_pin/extension/extension.dart';
import 'package:test_pin/widgets/pin_keyboard.dart';
import 'package:test_pin/widgets/spacer.dart';

class SetPinView extends GetView<SetPinController> {
  const SetPinView({Key? key}) : super(key: key);

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
                  'Create PIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: ColorConstants.whiteColor,
                  ),
                ),
                const VerticalSpacer(),
                const VerticalSpacer(),
                PinPut(
                  enabled: false,
                  obscureText: '*',
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  fieldsCount: AppConstants.pinLength,
                  fieldsAlignment: MainAxisAlignment.spaceAround,
                  textStyle:
                      const TextStyle(fontSize: 25.0, color: Colors.black),
                  eachFieldMargin: const EdgeInsets.all(0),
                  eachFieldWidth: 53.0,
                  eachFieldHeight: 55.0,
                  onSubmit: (String pin) {},
                  textInputAction: TextInputAction.done,
                  focusNode: controller.pinFocusNode,
                  controller: controller.pinController,
                  disabledDecoration: ViewConstants.pinDecoration,
                  submittedFieldDecoration: ViewConstants.pinDecoration,
                  selectedFieldDecoration: ViewConstants.pinDecoration,
                  followingFieldDecoration: ViewConstants.pinDecoration,
                  pinAnimationType: PinAnimationType.scale,
                ),
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
            child: PinKeyboard(

              onDigitTapped: (d) {
                if (controller.pin.value.length == AppConstants.pinLength) {
                  return;
                }
                controller.pin.value = controller.pin.value + d.toString();
                controller.pinController.text = controller.pin.value;
              },
              onComplete: null,
              onBackspace: () {
                if (controller.pin.value.isEmpty) {
                  return;
                }
                controller.pin.value =
                    controller.pin.value.removeLastCharacter();
                controller.pinController.text = controller.pin.value;
              },
            ),
          )
        ],
      ),
    );
  }
}
