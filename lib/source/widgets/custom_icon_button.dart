import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
                  borderRadius: BorderRadius.circular(32.h),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray600,
        borderRadius: BorderRadius.circular(24.h),
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(24.h),
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue500,
        borderRadius: BorderRadius.circular(12.h),
      );
  static BoxDecoration get fillDeepPurpleA => BoxDecoration(
        color: appTheme.deepPurpleA100,
        borderRadius: BorderRadius.circular(12.h),
      );
  static BoxDecoration get fillIndigoA => BoxDecoration(
        color: appTheme.indigoA100,
        borderRadius: BorderRadius.circular(12.h),
      );
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
        borderRadius: BorderRadius.circular(12.h),
      );
  static BoxDecoration get fillOnPrimaryContainerTL4 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        borderRadius: BorderRadius.circular(4.h),
      );
  static BoxDecoration get fillOnPrimaryContainerTL9 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        borderRadius: BorderRadius.circular(9.h),
      );
  static BoxDecoration get fillOnPrimaryContainerTL12 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        borderRadius: BorderRadius.circular(12.h),
      );
  static BoxDecoration get fillDeepOrangeAF => BoxDecoration(
        color: appTheme.deepOrangeA1003f,
        borderRadius: BorderRadius.circular(4.h),
      );
  static BoxDecoration get fillRed3000 => BoxDecoration(
        color: appTheme.red30001,
        borderRadius: BorderRadius.circular(4.h),
      );
  static BoxDecoration get fillCustomPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(4.h),
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray10001,
        borderRadius: BorderRadius.circular(20.h),
      );
  static BoxDecoration get fillGrayTL12 => BoxDecoration(
        color: appTheme.gray10001,
        borderRadius: BorderRadius.circular(12.h),
      );
  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
        color: theme.colorScheme.onErrorContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.h),
      );
}
