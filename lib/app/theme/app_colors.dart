import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary Colors
  static const Color primaryColor = Colors.black; // Deep green
  static const Color primaryDark = Color(
    0xff023A2D,
  ); // Darker shade of primaryColor
  static const Color primaryLight = Color(
    0xff3F7B69,
  ); // Lighter shade of primaryColor

  // Secondary Colors
  static const Color secondaryColor = Color(0xffFFBC00);
  static const Color secondaryColorDark = Color(0xffB77F58);

  // Neutral Colors
  static const Color white = Color(0xffffffff);
  static const Color grey = Color(0xffAAAAAA);
  static const Color greyDark = Color(0xff898989);
  static const Color blackColor = Color(0xff000000);

  // Accent Colors
  static const Color greenColor = Color(0xff61df25);
  static const Color goldColor = Color(0xffdcad43);
  static const Color blueColor = Color(0xff2550df);
  static const Color purpleColor = Color(0xffad42ee);
  static const Color redColor = Color(0xffdf2535);

  // Low Priority / Muted Colors
  static const Color lowPriority = Color(0xff848191);

  // UI Specific Colors
  static const Color darkColor = Color(0xff023020);
  static const Color scaffoldColor = Color(0xfff5f5f5);
  static const Color appBarColor = Color(0xffffffff);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
