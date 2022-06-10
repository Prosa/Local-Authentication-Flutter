import 'package:flutter/material.dart';
import 'package:test_pin/constants/color_constants.dart';

class ViewConstants {
  //padding
  static const double normalPadding = 16;

  //margin
  static const double normalMargin = 16;

  //TextStyle
  //fontSizes;
  static const double normalFontSize = 16;
  static const double titleFontSize = 18;
  static const double topTitleFontSize = 20;
  static const double smallFontSize = 14;

  //Spacers
  //vertically
  static const double spaceBetweenVertical = 10;
  static const double spaceBetweenVerticalInner = 8;

  //horizontally
  static const double spaceBetweenHorizontal = 6;
  static const double spaceBetweenHorizontalInner = 4;

  //views
  static const double defaultBorderRadius = 25.0;

  //User interface
  static const buttonTheme = ButtonThemeData(
      buttonColor: ColorConstants.secondaryColor,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: ColorConstants.primaryColor,
          onPrimary: ColorConstants.whiteColor,
          secondary: ColorConstants.secondaryColor,
          onSecondary: ColorConstants.whiteColor,
          error: ColorConstants.redColor,
          onError: ColorConstants.whiteColor,
          background: ColorConstants.whiteColor,
          onBackground: ColorConstants.primaryColor,
          surface: ColorConstants.whiteColor,
          onSurface: ColorConstants.primaryColor));

  static const appBarTheme = AppBarTheme(
    color: ColorConstants.primaryColor,
    centerTitle: true,
  );

  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(
    primary: ColorConstants.primaryColor,
    onSurface: ColorConstants.primaryColorDark,
  ));

  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(defaultBorderRadius),
    ),
    primary: ColorConstants.primaryColor,
    onPrimary: ColorConstants.whiteColor,
    onSurface: ColorConstants.primaryColorDark,
  ));

  static TextStyle pinKeyboardTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: Colors.black.withBlue(40),
  );

  static BoxDecoration pinDecoration = BoxDecoration(
    color: ColorConstants.whiteColor,
    borderRadius: BorderRadius.circular(8.0),
  );
}
