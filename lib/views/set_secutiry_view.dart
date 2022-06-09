import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:test_pin/constants/color_constants.dart';
import 'package:test_pin/constants/view_constants.dart';
import 'package:test_pin/controllers/set_security_controller.dart';
import 'package:test_pin/widgets/spacer.dart';
import 'package:pinput/pin_put/pin_put.dart';

class SetSecurityView extends GetView<SetSecurityController> {
  const SetSecurityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ViewConstants.normalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const VerticalSpacer(),
              Obx(() => controller.onVerify.value ?
                  //verify column
              Column(
                    children: [
                      PinPut(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        withCursor: true,
                        fieldsCount: 4,
                        fieldsAlignment: MainAxisAlignment.spaceAround,
                        textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
                        eachFieldMargin: const EdgeInsets.all(0),
                        eachFieldWidth: 53.0,
                        eachFieldHeight: 55.0,
                        onSubmit: (String pin) {},
                        textInputAction: TextInputAction.done,
                        focusNode: controller.verifyPinFocusNode,
                        controller: controller.verifyPinController,
                        submittedFieldDecoration: pinPutDecoration,
                        selectedFieldDecoration: pinPutDecoration.copyWith(
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: ColorConstants.primaryColor,
                          ),
                        ),
                        followingFieldDecoration: pinPutDecoration,
                        pinAnimationType: PinAnimationType.scale,
                      ),
                      ElevatedButton(onPressed: () {
                      }, child: const Text('SAVE'),),
                    ],
                  )
              //first step column
                  : Column(
                children: [
                  PinPut(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    withCursor: true,
                    fieldsCount: 4,
                    fieldsAlignment: MainAxisAlignment.spaceAround,
                    textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
                    eachFieldMargin: const EdgeInsets.all(0),
                    eachFieldWidth: 53.0,
                    eachFieldHeight: 55.0,
                    onSubmit: (String pin) {},
                    textInputAction: TextInputAction.done,
                    focusNode: controller.pinFocusNode,
                    controller: controller.pinController,
                    submittedFieldDecoration: pinPutDecoration,
                    selectedFieldDecoration: pinPutDecoration.copyWith(
                      color: Colors.white,
                      border: Border.all(
                        width: 2,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    followingFieldDecoration: pinPutDecoration,
                    pinAnimationType: PinAnimationType.scale,
                  ),
                  PinPut(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    withCursor: true,
                    fieldsCount: 4,
                    fieldsAlignment: MainAxisAlignment.spaceAround,
                    textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
                    eachFieldMargin: const EdgeInsets.all(0),
                    eachFieldWidth: 53.0,
                    eachFieldHeight: 55.0,
                    onSubmit: (String pin) {},
                    textInputAction: TextInputAction.done,
                    focusNode: controller.verifyPinFocusNode,
                    controller: controller.verifyPinController,
                    submittedFieldDecoration: pinPutDecoration,
                    selectedFieldDecoration: pinPutDecoration.copyWith(
                      color: Colors.white,
                      border: Border.all(
                        width: 2,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    followingFieldDecoration: pinPutDecoration,
                    pinAnimationType: PinAnimationType.scale,
                  ),
                  ElevatedButton(onPressed: () {
                    controller.onVerify.value = true;
                    controller.verifyPinController.text = '';
                    controller.pinController.text = '';
                  }, child: const Text('NEXT'),),
                ],

              )

              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration get pinPutDecoration => BoxDecoration(
      color: const Color.fromRGBO(235, 236, 237, 1),
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(color: Colors.black));
}
