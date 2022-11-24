import 'package:flutter/material.dart';

class ColorManager {
  static Color black = HexColor.fromHex("#000000");
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  // // //
  static Color error = HexColor.fromHex("#e61f34");
  static Color grey = HexColor.fromHex('#737477');
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color lightGrey = HexColor.fromHex('#9E9E9E');
  // // //
  static Color primary = HexColor.fromHex('#ED9728');
  static Color primaryOpacity70 = HexColor.fromHex('#B3ED9728');
  static Color white = HexColor.fromHex("#FFFFFF");
}

extension HexColor on Color {
  static Color fromHex(String hexColorCode) {
    hexColorCode = hexColorCode.replaceAll('#', '');
    if (hexColorCode.length == 6) {
      hexColorCode = "FF$hexColorCode";
    }
    return Color(int.parse(hexColorCode, radix: 16));
  }
}
