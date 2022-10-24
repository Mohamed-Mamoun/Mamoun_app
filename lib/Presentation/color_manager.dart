import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#ED9728');
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color grey = HexColor.fromHex('#737477');
  static Color lightGrey = HexColor.fromHex('#9E9E9E');
  static Color primaryOpacity70 = HexColor.fromHex('#B3ED9728');
}

extension HexColor on Color {
  static Color fromHex(String HexColorCode) {
    HexColorCode = HexColorCode.replaceAll('#', '');
    if (HexColorCode.length == 6) {
      HexColorCode = "FF$HexColorCode";
    }
    return Color(int.parse(HexColorCode, radix: 16));
  }
}
