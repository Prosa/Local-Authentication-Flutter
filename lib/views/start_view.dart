
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';
import 'package:test_pin/constants/route_constants.dart';
import 'package:test_pin/constants/view_constants.dart';
import 'package:test_pin/controllers/start_controller.dart';

class StartView extends GetView<StartController>{

  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
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
              controller.localAuthentication.value ? ElevatedButton(
                onPressed: () {},
                child: const Text('Quick Login'),
              ) : const ElevatedButton(
                onPressed: null,
                child: Text('Quick Login'),
              ),
              controller.localAuthentication.value ? const ElevatedButton(
                onPressed: null,
                child: Text('Quick Login'),
              ) : ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteConstants.setPinView);
                },
                child: const Text('Create PIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}