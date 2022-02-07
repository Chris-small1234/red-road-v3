import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_text_theme.dart';

class AppOutlineButton {
  static OutlinedButtonThemeData theme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        primary: AppColor.primary,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColor.primary),
          borderRadius: BorderRadius.circular(5.0),
        ),
        minimumSize: Size(200, 44),
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4)),
  );
}
