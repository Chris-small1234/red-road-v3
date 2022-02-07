import 'app_text_theme.dart';
import 'package:flutter/material.dart';
import 'app_color.dart';

class AppChipTheme {
  static ChipThemeData theme = ChipThemeData(
    brightness: Brightness.light,
    backgroundColor: AppColor.unselected,
    deleteIconColor: AppColor.secondary2,
    selectedColor: AppColor.primary,
    secondarySelectedColor: AppColor.secondary,
    disabledColor: AppColor.unselected,
    labelPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
    labelStyle: AppTextTheme.lightTheme.headline6!,
    secondaryLabelStyle: AppTextTheme.lightTheme.headline6!.copyWith(color: Colors.white),
    shape: StadiumBorder(
      side: BorderSide(color: AppColor.primary),
    ),
  );
}
