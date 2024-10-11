// app color constants

import 'package:flutter/material.dart';

import 'extensions.dart';

class ColorConstants {
  //basics colours
    static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  //App theme colours
  static Color primary = CustomColor.fromHex("#BD9941");
  static Color secondary = CustomColor.fromHex("#FAF0D8");
  static Color scaffoldColor=white.withOpacity(0.95);
  // static Color secondary = CustomColor.fromHex("#1ecfc2");

  static Color APP_TEXT_BLUE = CustomColor.fromHex("#5f89bc");
  static Color DEFAULT_TEXT_COLOR = CustomColor.fromHex("#808080");

  static Color hexToColor(String? code) {
    //print(int.parse(code!.substring(1, 7), radix: 16) + 0xFF000000);
    return Color(int.parse(code!.substring(1, 7), radix: 16) + 0xFF000000);
  }




  //Extra's
  static const grey = Colors.grey;
  static const blue = Colors.blue;
  static const inputColor = Colors.white;
  static const drawerTextColor = Colors.black;
  static const transparent = Colors.transparent;
  static const buttonSky = Color(0xFF54c1ef);
  static const skyDark = Color.fromARGB(255, 125, 189, 225);
  static const sky = Color.fromARGB(255, 224, 244, 255);
  static const greyTextDark = Color(0xFF8d8d8d);
  static Color buttonBlue = secondary;
  static const feedbackContainerColor = Color(0xFFEAEAEA);
  static Color green = Colors.green;
  static Color gold = const Color(0xffFFECBE);
  static Color silver = const Color(0xffE3E3E3);
  static Color platinum =const Color(0xffD1E4FF);
}
