import 'package:flutter/material.dart';
import 'package:isssApps/core/app_export.dart';

class AppStyle {
  static TextStyle txtGilroySemiBold24 = TextStyle(
    color: ColorConstant.blueGray900,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtRobotoRegular16 = TextStyle(
    color: ColorConstant.blueGray400,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtGilroyMedium16Bluegray200 = TextStyle(
    color: ColorConstant.blueGray200,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtGilroyMedium16Bluegray900 = TextStyle(
    color: ColorConstant.blueGray900,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtRobotoRegular20 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtGilroyMedium16 = TextStyle(
    color: ColorConstant.blueGray800,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w500,
  );
}
