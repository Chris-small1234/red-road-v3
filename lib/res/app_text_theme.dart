import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTextTheme {
  static TextTheme lightTheme = TextTheme(
    headline1: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    headline3: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
    headline4: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
    headline5: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
    headline6: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
    subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    subtitle2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
    bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
    bodyText2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    button: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
    caption: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
    overline: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal),
  ).apply(
    displayColor: AppColor.displayTextColor,
    bodyColor: AppColor.bodyTextColor,
  );
}
