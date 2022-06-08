import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pin/constants/view_constants.dart';
import 'package:test_pin/controllers/home_controller.dart';
import 'package:test_pin/widgets/spacer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

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
            color: Colors.greenAccent[200],
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
                Obx(() => controller.hasFingerPrintLock.value
                    ? Icon(
                        Icons.check,
                        color: Colors.green[600],
                      )
                    : Icon(
                        Icons.clear,
                        color: Colors.red[600],
                      )),
                const HorizontalSpacer(),
                const Text(
                  'Finger print Authentication',
                  style: TextStyle(
                    fontSize: ViewConstants.normalFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const VerticalSpacer(),
          Container(
            margin: const EdgeInsets.only(
                left: ViewConstants.normalMargin,
                right: ViewConstants.normalMargin),
            child: Row(
              children: [
                Obx(() => controller.hasFaceLock.value
                    ? Icon(
                        Icons.check,
                        color: Colors.green[600],
                      )
                    : Icon(
                        Icons.clear,
                        color: Colors.red[600],
                      )),
                const HorizontalSpacer(),
                const Text(
                  'Face Authentication',
                  style: TextStyle(
                    fontSize: ViewConstants.normalFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: controller.authenticateUser,
              child: const Text('Authenticate'),
            ),
          )
        ],
      ),
    );
  }
}
