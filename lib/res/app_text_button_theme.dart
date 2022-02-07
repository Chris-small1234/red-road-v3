import 'app_color.dart';
import 'package:flutter/material.dart';

class AppTextButtonTheme {
  static TextButtonThemeData theme = TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: AppColor.primary,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
}
