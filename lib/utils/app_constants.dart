import 'package:flutter/material.dart';


import 'color_constants.dart';
class AppConstants {
  static const appName = 'fine_gold';

  static TextStyle primaryColorHeading=TextStyle(
      fontSize: 16,
      color: ColorConstants.primary,
      fontWeight: FontWeight.w500
  );
  static TextStyle primaryColorDescription=TextStyle(
      fontSize: 16,
      color: ColorConstants.primary,
      fontWeight: FontWeight.w400
  );
  static TextStyle headingNormal = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headingBold = const TextStyle(
    fontSize: 18,
    color:ColorConstants.black,
    fontWeight: FontWeight.w600,
  );
  static TextStyle description = const TextStyle(
    fontSize: 16,
    color:ColorConstants.black,
    fontWeight: FontWeight.w400,

  );
  static TextStyle descriptionWhite = const TextStyle(
    fontSize: 14,
    color:ColorConstants.white,
    fontWeight: FontWeight.w400,

  );
  static TextStyle descriptionBold = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle heading3 = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static TextStyle heading1_with_gray_color = const TextStyle(
    fontSize: 13,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
  );

  static bool isTablet=false;

  static const phoneNumber = 'phoneNumber';
  static const userId = 'userId';
  static const loginToken = 'loginToken';
  static const isLoggedIn = 'isLoggedIn';
  static const userName = 'userName';
  static const profileImage = "profileImage";
}

