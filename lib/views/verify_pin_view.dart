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

class VerifyPinView extends GetView<SetSecurityController> {
  const VerifyPinView({Key? key}) : super(key: key);

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
                onChanged: (value) {
                  controller.checkVerificationFilled();
                },
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
              const VerticalSpacer(),
              const VerticalSpacer(),
              Obx(() => controller.pinsDoNotMatch.value
                  ? const Text(
                      'PINs do not match',
                      style: TextStyle(
                        color: ColorConstants.redColor,
                      ),
                    )
                  : const SizedBox()),
              const VerticalSpacer(),
              const VerticalSpacer(),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      controller.initSetPinPage();
                      Get.offAndToNamed('/set_security');
                    },
                    child: const Text(
                      'BACK',
                      style: TextStyle(color: ColorConstants.whiteColor),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: ColorConstants.primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: ViewConstants.normalPadding)),
                  ),
                  Obx(() => controller.verifyPinFilled.value
                      ? ElevatedButton(
                          onPressed: () async {
                            controller.pinsDoNotMatch.value = false;
                            if (controller.checkValidity()) {
                              Get.defaultDialog(
                                  title: 'Updating...',
                                  content: const CircularProgressIndicator(),
                                  barrierDismissible: false);

                              await controller.updatePassword();
                              Get.back();
                              Get.snackbar('Success',
                                  'Your pin has been updated successfully',
                                  snackPosition: SnackPosition.BOTTOM);
                              Navigator.of(context).pop();
                            } else {
                              controller.pinsDoNotMatch.value = true;
                            }
                          },
                          child: const Text('SAVE'),
                        )
                      : const ElevatedButton(
                          onPressed: null,
                          child: Text('SAVE'),
                        )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
