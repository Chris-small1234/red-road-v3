import 'app_color.dart';
import 'package:flutter/material.dart';

class AppAppBarTheme {
  static AppBarTheme light = AppBarTheme(
    color: AppColor.primary,
    brightness: Brightness.light,
    //elevation: 0.0,
    centerTitle: false,
    iconTheme: IconThemeData(color: AppColor.secondary),
  );
}
