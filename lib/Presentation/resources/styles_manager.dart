import 'package:advance_course/Presentation/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';

class StylesManager {
  TextStyle _getTextStyle(
      double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color,
        fontWeight: fontWeight);
  }

  // Light Style
  TextStyle getLightStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(
        fontSize, FontFamilyManager.fontFamily, FontWeightManager.light, color);
  }

  // Reqular Style
  TextStyle getReqularStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontFamilyManager.fontFamily,
        FontWeightManager.reqular, color);
  }

  // Medium Style
  TextStyle getMediumStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontFamilyManager.fontFamily,
        FontWeightManager.medium, color);
  }

  // Semi bold Style
  TextStyle getSemiBoldStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontFamilyManager.fontFamily,
        FontWeightManager.semiBold, color);
  }

  // bold Style
  TextStyle getBoldStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return _getTextStyle(
        fontSize, FontFamilyManager.fontFamily, FontWeightManager.bold, color);
  }
}
