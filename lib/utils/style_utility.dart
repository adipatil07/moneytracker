import 'package:flutter/material.dart';

import 'colors_utility.dart';

class StyleUtility{
  static TextStyle buttonTextStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    color: ColorsUtility.textColor,
    fontFamily: "JosefinSans",
    fontSize: 16,
  );

  static TextStyle normalTextStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    color: ColorsUtility.textColor,
    fontFamily: "JosefinSans",
    fontSize: 14,
  );

  static TextStyle mediumTextStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    color: ColorsUtility.textColor,
    fontFamily: "JosefinSans",
    fontSize: 16,
  );

  static TextStyle largeTextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    color: ColorsUtility.textColor,
    fontFamily: "JosefinSans",
    fontSize: 18,
  );

  static TextStyle cardHeadingTextStyle = const TextStyle(
    fontWeight: FontWeight.w700,
    color: ColorsUtility.textColor,
    fontFamily: "JosefinSans",
    fontSize: 18,
  );

  static TextStyle appBarTextStyle = const TextStyle(
    color: Colors.white,
    fontFamily: "JosefinSans",
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

}