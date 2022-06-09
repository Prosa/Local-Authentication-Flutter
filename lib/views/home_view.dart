import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pin/constants/color_constants.dart';
import 'package:test_pin/constants/view_constants.dart';
import 'package:test_pin/controllers/home_controller.dart';
import 'package:test_pin/widgets/spacer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Authentication'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(ViewConstants.normalPadding),
            color: ColorConstants.greenColor,
            child: const Text(
              'Biometric',
              style: TextStyle(
                fontSize: ViewConstants.normalFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const VerticalSpacer(),
          Container(
            margin: const EdgeInsets.only(
                left: ViewConstants.normalMargin,
                right: ViewConstants.normalMargin),
            child: Row(
              children: [
                Obx(() => controller.hasAvailableBiometrics.value
                    ? const Icon(
                        Icons.check,
                        color: ColorConstants.greenColor,
                      )
                    : const Icon(
                        Icons.clear,
                        color: ColorConstants.redColor,
                      )),
                const HorizontalSpacer(),
                const Text(
                  'Available Biometrics',
                  style: TextStyle(
                    fontSize: ViewConstants.normalFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const VerticalSpacer(),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: (){
                controller.authenticateUser(context);
              },
              child: const Text('Authenticate'),
              style: ElevatedButton.styleFrom(
                primary: ColorConstants.primaryColor,
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: controller.setPinDialog,
              child: const Text('Set a PIN'),
              style: ElevatedButton.styleFrom(
                primary: ColorConstants.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
