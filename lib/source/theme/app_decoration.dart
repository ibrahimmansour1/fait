import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900.withOpacity(0.25),
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray900,
      );
  static BoxDecoration get fillBlueGrayE => BoxDecoration(
        color: appTheme.blueGray900E5,
      );
  static BoxDecoration get fillBluegray50 => BoxDecoration(
        color: appTheme.blueGray50,
      );
  static BoxDecoration get fillBluegray80004 => BoxDecoration(
        color: appTheme.blueGray80004,
      );
  static BoxDecoration get fillBluegray90002 => BoxDecoration(
        color: appTheme.blueGray90002,
      );
  static BoxDecoration get fillBluegray90004 => BoxDecoration(
        color: appTheme.blueGray90004,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray10004,
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillGray900 => BoxDecoration(
        color: appTheme.gray900,
      );
  static BoxDecoration get fillGray10001 => BoxDecoration(
        color: appTheme.gray10001,
      );
  static BoxDecoration get fillGray90002 => BoxDecoration(
        color: appTheme.gray90002,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo30001,
      );
  static BoxDecoration get fillIndigoA => BoxDecoration(
        color: appTheme.indigoA10002,
      );
  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
        color: theme.colorScheme.onErrorContainer.withOpacity(0.25),
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red30001,
      );

  // Gradient decorations
  static BoxDecoration get gradientGrayToGray => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.86, 0.95),
          colors: [
            appTheme.gray90002,
            appTheme.gray90001,
          ],
        ),
      );
  static BoxDecoration get gradientGrayToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.02, 0.58),
          end: const Alignment(0.93, 0.94),
          colors: [
            appTheme.gray90001,
            appTheme.blueGray80003,
          ],
        ),
      );
  static BoxDecoration get gradientGrayToBluegray80003 => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.primary,
            width: 2.h,
          ),
        ),
        gradient: LinearGradient(
          begin: const Alignment(0.02, 0.58),
          end: const Alignment(0.93, 0.94),
          colors: [
            appTheme.gray90001,
            appTheme.blueGray80003,
          ],
        ),
      );
  static BoxDecoration get gradientOnPrimaryToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0, 0.51),
          end: const Alignment(0.95, 0.66),
          colors: [
            theme.colorScheme.onPrimary,
            appTheme.blueGray800,
            appTheme.blueGray80001,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.blueGray80004,
        border: Border(
          bottom: BorderSide(
            color: appTheme.black900.withOpacity(0.25),
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineBlack9001 => BoxDecoration(
        color: appTheme.blueGray80004,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.5),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              1,
              1,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: appTheme.blueGray90002,
        border: Border(
          bottom: BorderSide(
            color: appTheme.blueGray90002,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.gray10004,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 3.h,
        ),
      );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        color: appTheme.blueGray900,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.primary.withOpacity(0.25),
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlinePrimary2 => BoxDecoration(
        color: appTheme.blueGray80004,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.primary,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlinePrimary3 => BoxDecoration(
        color: appTheme.blueGray900,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.primary.withOpacity(0.25),
            width: 2.h,
          ),
        ),
      );
  static BoxDecoration get outlineSecondaryContainer => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.secondaryContainer,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineSecondaryContainer1 => BoxDecoration(
        color: appTheme.blueGray900,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.secondaryContainer,
            width: 1.h,
          ),
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get circleBorder48 => BorderRadius.circular(
        48.h,
      );
  static BorderRadius get circleBorder64 => BorderRadius.circular(
        64.h,
      );
  static BorderRadius get customBorderTL8 => BorderRadius.vertical(
        top: Radius.circular(8.h),
      );

  // Custom borders
  static BorderRadius get customBorderBL12 => BorderRadius.only(
        topRight: Radius.circular(12.h),
        bottomLeft: Radius.circular(12.h),
        bottomRight: Radius.circular(12.h),
      );

  static BorderRadius get customBorderBL22 => BorderRadius.vertical(
        bottom: Radius.circular(22.h),
      );
  static BorderRadius get customBorderTL20 => BorderRadius.vertical(
        top: Radius.circular(20.h),
      );
  static BorderRadius get customBorderTL24 => BorderRadius.vertical(
        top: Radius.circular(24.h),
      );
  static BorderRadius get customBorderTL32 => BorderRadius.vertical(
        top: Radius.circular(32.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(
        1.h,
      );
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder22 => BorderRadius.circular(
        22.h,
      );
  static BorderRadius get roundedBorder32 => BorderRadius.circular(
        32.h,
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    