import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:fait/source/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class InfoCaloriesItemWidget extends StatelessWidget {
  final String? icon;
  final String text;
  final BoxDecoration? decoration;
  const InfoCaloriesItemWidget({
    Key? key,
    this.icon,
    required this.text,
    this.decoration,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillBlueGrayE.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      width: 122.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 32.adaptSize,
            width: 32.adaptSize,
            padding: EdgeInsets.all(4.h),
            decoration: decoration,
            child: CustomImageView(
              imagePath: icon,
            ),
          ),
          SizedBox(height: 10.v),
          Text(
            text,
            style: CustomTextStyles.headlineSmallRobotoRed30002,
          ),
          SizedBox(height: 11.v),
          Text(
            "KCAL",
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
