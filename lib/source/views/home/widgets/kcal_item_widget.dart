import 'package:fait/source/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

// ignore: must_be_immutable
class KcalItemWidget extends StatelessWidget {
  const KcalItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgMeals1,
          height: 56.adaptSize,
          width: 56.adaptSize,
          radius: BorderRadius.circular(
            8.h,
          ),
          margin: EdgeInsets.symmetric(vertical: 14.v),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 6.h,
            bottom: 10.v,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "lbl_regular_oats".tr,
                  style: CustomTextStyles.titleMediumOnPrimaryContainerBold,
                ),
              ),
              SizedBox(height: 11.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgCalories,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(
                      top: 1.v,
                      bottom: 3.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 1.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "lbl_28_02".tr,
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgSettings,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(
                      left: 7.h,
                      top: 1.v,
                      bottom: 3.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 1.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "lbl_3_34".tr,
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgProtiens,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(
                      left: 19.h,
                      top: 1.v,
                      bottom: 3.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 1.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "lbl_6_63".tr,
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 20.adaptSize,
                  //   width: 20.adaptSize,
                  //   margin: EdgeInsets.only(left: 22.h),
                  //   decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                  //     borderRadius: BorderRadiusStyle.roundedBorder8,
                  //   ),
                  //   child: CustomImageView(
                  //     imagePath: ImageConstant.imgChangeIcon,
                  //     height: 20.adaptSize,
                  //     width: 20.adaptSize,
                  //     radius: BorderRadius.circular(
                  //       10.h,
                  //     ),
                  //     alignment: Alignment.center,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 2.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.h,
                      vertical: 4.v,
                    ),
                    decoration: AppDecoration.fillPrimaryContainer.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child: Text(
                      "lbl_40_0_gram".tr,
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.h,
                      vertical: 4.v,
                    ),
                    decoration: AppDecoration.fillPrimaryContainer.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder8,
                    ),
                    child: Text(
                      "lbl_151_kcal".tr,
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
