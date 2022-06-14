import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';
import 'package:test_pin/constants/route_constants.dart';
import 'package:test_pin/constants/view_constants.dart';
import 'package:test_pin/controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start View'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ViewConstants.normalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              ObxValue(
                  (Rx<bool> localAuthentication) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ObxValue(
                              (Rx<bool> biometricsEnabled) => ElevatedButton(
                            onPressed: !localAuthentication.value ? null :  biometricsEnabled.value ? () {

                            } : () {
                              controller.enableBiometrics();
                            },
                            child: biometricsEnabled.value ? const Text('Disable Biometrics') : const Text('Enable biometrics'),
                          ), controller.biometricsEnabled
                      ),
                      ElevatedButton(
                        onPressed: localAuthentication.value ? () {
                          Get.toNamed(RouteConstants.pinView);
                        } : null,
                        child: const Text('Quick Login'),
                      ),
                      ElevatedButton(
                        onPressed: localAuthentication.value ? null : () {
                          Get.toNamed(RouteConstants.setPinView);
                        },
                        child: const Text('Create PIN'),
                      ),
                      ElevatedButton(
                        onPressed: localAuthentication.value ? () {
                          controller.deletePin();
                        } : null,
                        child: const Text('Delete PIN'),
                      ),
                    ],
                  ), controller.localAuthentication,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
