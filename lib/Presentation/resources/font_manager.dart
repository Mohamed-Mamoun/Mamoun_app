import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FontFamilyManager {
  static const String fontFamily = 'jannah';
}

class FontWeightManager {
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight reqular = FontWeight.w400;
  static const FontWeight semiBold = FontWeight.w600;
}

extension ResponsiveText on double {
  double get sp => Get.width / 100 * (this / 3);
}
