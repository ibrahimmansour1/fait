import 'package:fait/source/widgets/custom_icon_button.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../views/replace_with_screen/replace_with_tab_container_screen.dart';

// ignore: must_be_immutable
class InProgressExerciseCardWidget extends StatelessWidget {
  bool replacable;
  VoidCallback? onTap;

  InProgressExerciseCardWidget({super.key, this.replacable = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: replacable,
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        Container(
          height: 32.adaptSize,
          width: 32.adaptSize,
          margin: EdgeInsets.only(
            left: 10.h,
            top: 36.v,
            bottom: 36.v,
          ),
          decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder16,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgCloseDeepPurpleA200,
            height: 32.adaptSize,
            width: 32.adaptSize,
            radius: BorderRadius.circular(
              16.h,
            ),
            alignment: Alignment.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    builder: (_) => ReplaceWithTabContainerScreen(inProgressExercise: true,));
          },
          child: Container(
            height: 32.adaptSize,
            width: 32.adaptSize,
            margin: EdgeInsets.only(
              left: 8.h,
              top: 36.v,
              bottom: 36.v,
            ),
            decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder16,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgCloseOrangeA20032x32,
              height: 32.adaptSize,
              width: 32.adaptSize,
              radius: BorderRadius.circular(
                16.h,
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
      ]),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: appTheme.blueGray80004,
            borderRadius: BorderRadius.circular(
              8.h,
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 17.h,
              vertical: 12.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 80.v,
                  width: 72.h,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgMindBodyBalance,
                        height: 72.adaptSize,
                        width: 72.adaptSize,
                        radius: BorderRadius.circular(
                          8.h,
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 13.h,
                          margin: EdgeInsets.only(left: 8.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.h,
                            vertical: 1.v,
                          ),
                          decoration: AppDecoration.fillBlueGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder8,
                          ),
                          child: Text(
                            "6",
                            style: CustomTextStyles.labelLargeRobotoPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 9.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Side Jump",
                        style: CustomTextStyles.headlineSmallRoboto_2,
                      ),
                      SizedBox(height: 13.v),
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgClockLightBlue700,
                            height: 16.adaptSize,
                            width: 16.adaptSize,
                            margin: EdgeInsets.symmetric(vertical: 1.v),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text(
                              "10 mins",
                              style: CustomTextStyles
                                  .bodyLargeOnPrimaryContainer_2,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgClockOrange700,
                            height: 16.adaptSize,
                            width: 16.adaptSize,
                            margin: EdgeInsets.only(
                              left: 16.h,
                              top: 1.v,
                              bottom: 1.v,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text(
                              "40 Kcal",
                              style: CustomTextStyles
                                  .bodyLargeOnPrimaryContainer_2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.v),
                  child: 'status' == 'failed'
                      ? Container(
                          height: 40.adaptSize,
                          width: 40.adaptSize,
                          decoration: AppDecoration.fillRed.copyWith(
                            color: const Color(0xFFE7162F),
                            borderRadius: BorderRadiusStyle.circleBorder64,
                          ),
                          child: Icon(
                            Icons.close,
                            color: appTheme.white,
                            size: 26.adaptSize,
                          ),
                        )
                      : 'status' == 'in progress'
                          ? CircularPercentIndicator(
                              progressColor: theme.colorScheme.primary,
                              backgroundColor: const Color(0x33B8C7CB),
                              radius: 20.adaptSize,
                              lineWidth: 5,
                              animation: true,
                              percent: 0.5,
                              center: Text(
                                '3/6',
                                style: TextStyle(color: appTheme.white),
                              ),
                            )
                          : CustomIconButton(
                              height: 40.adaptSize,
                              width: 40.adaptSize,
                              decoration: 'status' == 'completed'
                                  ? IconButtonStyleHelper.fillBlueGray
                                  : IconButtonStyleHelper.fillGray,
                              child: CustomImageView(
                                imagePath:
                                    ImageConstant.imgCheckmarkBlueGray900,
                                color: 'status' == 'completed'
                                    ? theme.colorScheme.primary
                                    : null,
                              ),
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
