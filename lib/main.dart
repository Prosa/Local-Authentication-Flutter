import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pin/bindings/initial_bindings.dart';
import 'package:test_pin/constants/color_constants.dart';
import 'package:test_pin/views/home_view.dart';

void main() {
  runApp(
      GetMaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: ColorConstants.primaryColor,
            centerTitle: true,

          ),
          buttonTheme:  const ButtonThemeData(
            buttonColor: ColorConstants.secondaryColor,
            colorScheme: ColorScheme(brightness: Brightness.light, primary: ColorConstants.primaryColor, onPrimary: ColorConstants.whiteColor, secondary: ColorConstants.secondaryColor, onSecondary: ColorConstants.whiteColor, error: ColorConstants.redColor, onError: ColorConstants.whiteColor, background: ColorConstants.whiteColor, onBackground: ColorConstants.primaryColor, surface: ColorConstants.whiteColor, onSurface: ColorConstants.primaryColor)
          ),

        ),
    initialBinding: InitialBindings(),
    getPages: [
      GetPage(name: '/', page: () => const HomeView())
    ],
    initialRoute: '/',
  ));
}
