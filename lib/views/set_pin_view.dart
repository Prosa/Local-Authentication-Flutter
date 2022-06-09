import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:test_pin/constants/color_constants.dart';
import 'package:test_pin/constants/view_constants.dart';
import 'package:test_pin/controllers/set_security_controller.dart';
import 'package:test_pin/widgets/spacer.dart';

class SetPinView extends GetView<SetSecurityController> {
  const SetPinView({Key? key}) : super(key: key);

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
              PinPut(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                withCursor: true,
                fieldsCount: 4,
                onChanged: (_){
                  controller.checkPinFilled();
                },
                fieldsAlignment: MainAxisAlignment.spaceAround,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
                eachFieldMargin: const EdgeInsets.all(0),
                eachFieldWidth: 53.0,
                eachFieldHeight: 55.0,
                onSubmit: (String pin) {},
                textInputAction: TextInputAction.done,
                focusNode: controller.pinFocusNode,
                controller: controller.pinController,
                submittedFieldDecoration: controller.pinPutDecoration,
                selectedFieldDecoration: controller.pinPutDecoration.copyWith(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: ColorConstants.primaryColor,
                  ),
                ),
                followingFieldDecoration: controller.pinPutDecoration,
                pinAnimationType: PinAnimationType.scale,
              ),
              Obx(
                () => controller.pinFilled.value
                    ? ElevatedButton(
                        onPressed: () {
                          Get.offAndToNamed('/verify_security');
                          controller.initVerifyPinPage();
                        },
                        child: const Text('NEXT'),
                      )
                    : const ElevatedButton(
                        onPressed: null,
                        child: Text('NEXT'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
