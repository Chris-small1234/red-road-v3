
import 'app_color.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonTheme {

  static ElevatedButtonThemeData theme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColor.primary,
      elevation: 0.0,
      minimumSize: Size(200, 44),
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    )
  );

}
