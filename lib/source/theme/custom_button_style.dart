import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blueGray80004,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              12.h,
            ),
            bottomLeft: Radius.circular(
              12.h,
            ),
            bottomRight: Radius.circular(
              12.h,
            ),
          ),
        ),
      );
  static ButtonStyle get fillDeepPurple => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepPurple400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.h),
        ),
      );
  static ButtonStyle get fillGreenA => ElevatedButton.styleFrom(
        backgroundColor: appTheme.greenA700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  static ButtonStyle get fillOnErrorContainer => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onErrorContainer.withOpacity(0.25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
      );
  static ButtonStyle get fillOnPrimaryContainer => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.h),
        ),
      );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  static ButtonStyle get fillPrimaryContainer => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.h),
        ),
      );
  static ButtonStyle get fillPrimaryTL12 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
      );
  static ButtonStyle get fillPrimaryTL16 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.h),
        ),
      );
  static ButtonStyle get fillPrimaryTL20 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.h),
        ),
      );
  static ButtonStyle get fillPrimaryTL24 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.h),
        ),
      );

  // Outline button style
  static ButtonStyle get outlineRed => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.red500,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      );
  static ButtonStyle get outlineGray => OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        side: BorderSide(
          color: appTheme.gray90003,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.h),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
