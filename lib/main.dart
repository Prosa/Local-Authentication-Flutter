import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pin/bindings/initial_bindings.dart';
import 'package:test_pin/constants/color_constants.dart';
import 'package:test_pin/constants/route_constants.dart';
import 'package:test_pin/constants/view_constants.dart';

void main() {
  runApp(
      GetMaterialApp(
        theme: ThemeData(
          textButtonTheme: ViewConstants.textButtonTheme,
          elevatedButtonTheme: ViewConstants.elevatedButtonTheme,
          backgroundColor: ColorConstants.backgroundColor,
          appBarTheme: ViewConstants.appBarTheme,
          buttonTheme:  ViewConstants.buttonTheme,
        ),
    initialBinding: InitialBindings(),
    debugShowCheckedModeBanner: false,
    getPages: RouteConstants.appPages,
    initialRoute: RouteConstants.startView,
  ));
}
