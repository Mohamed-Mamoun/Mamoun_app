import 'package:advance_course/Presentation/color_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  // App Theme
  ThemeData getAppTheme() {
    return ThemeData(
        // main app Colors
        primaryColor: ColorManager.primary,
        primaryColorLight: ColorManager.primaryOpacity70,
        primaryColorDark: ColorManager.darkPrimary,
        disabledColor: ColorManager.grey1,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey));
  }
}
