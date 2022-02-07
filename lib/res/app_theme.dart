
import 'package:flutter/material.dart';
import 'app_app_bar_theme.dart';
import 'app_chip_theme.dart';
import 'app_color.dart';
import 'app_elevated_button_theme.dart';
import 'app_icon_theme.dart';
import 'app_outline_button_theme.dart';
import 'app_text_button_theme.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    accentColor: AppColor.secondary,
    accentColorBrightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppAppBarTheme.light,
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColor.secondary,
    ),
    //primarySwatch: Colors.blue,
    textTheme: AppTextTheme.lightTheme,
    outlinedButtonTheme: AppOutlineButton.theme,
    textButtonTheme: AppTextButtonTheme.theme,
    elevatedButtonTheme: AppElevatedButtonTheme.theme,
    iconTheme: AppIconTheme.theme,
    chipTheme: AppChipTheme.theme,
  );
}
