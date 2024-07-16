import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Accentprimary decorations
  static BoxDecoration get accentprimary1 => BoxDecoration(
        color: appTheme.teal300,
      );
// Backgraundmain decorations
  static BoxDecoration get backgraundmain => BoxDecoration(
        color: appTheme.gray5001,
      );
// Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillGray200 => BoxDecoration(
        color: appTheme.gray200,
      );
  static BoxDecoration get fillGreenA => BoxDecoration(
        color: appTheme.greenA700,
      );
  static BoxDecoration get fillLightBlueA => BoxDecoration(
        color: appTheme.lightBlueA700,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
// M decorations
  static BoxDecoration get m3ElevationLight3 => BoxDecoration(
        color: appTheme.gray200,
        boxShadow: [
          BoxShadow(
            color: appTheme.black9004c,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          )
        ],
      );
// Outline decorations
  static BoxDecoration get outlineBlackC => BoxDecoration(
        color: appTheme.greenA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black9004c,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          )
        ],
      );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderBL20 => BorderRadius.only(
        topLeft: Radius.circular(20.h),
        topRight: Radius.circular(20.h),
      );
// Rounded borders
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );
}
