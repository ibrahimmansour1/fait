import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Musclesset1ItemWidget extends StatelessWidget {
  const Musclesset1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 53.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 53.h,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 7.v,
          ),
          decoration: AppDecoration.outlineBlack9001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Text(
            "All",
            style: CustomTextStyles.bodyLargeOnPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
