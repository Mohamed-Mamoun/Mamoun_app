import 'package:advance_course/Presentation/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';

class StylesManager {
  // Light Style
  TextStyle getLightStyle({
    double fontSize = 12,
  }) {
    return _getTextStyle(
        fontSize, FontFamilyManager.fontFamily, FontWeightManager.light);
  }

  // Reqular Style
  TextStyle getReqularStyle({double fontSize = 12}) {
    return _getTextStyle(
        fontSize, FontFamilyManager.fontFamily, FontWeightManager.reqular);
  }

  // Medium Style
  TextStyle getMediumStyle({double fontSize = 12}) {
    return _getTextStyle(
        fontSize, FontFamilyManager.fontFamily, FontWeightManager.medium);
  }

  // Semi bold Style
  TextStyle getSemiBoldStyle({double fontSize = 12, Color? color}) {
    return _getTextStyle(
        fontSize, FontFamilyManager.fontFamily, FontWeightManager.semiBold);
  }

  // bold Style
  TextStyle getBoldStyle({double fontSize = 12}) {
    return _getTextStyle(
        fontSize, FontFamilyManager.fontFamily, FontWeightManager.bold);
  }

  TextStyle _getTextStyle(
      double fontSize, String fontFamily, FontWeight fontWeight) {
    return TextStyle(
        fontSize: fontSize, fontFamily: fontFamily, fontWeight: fontWeight);
  }
}
