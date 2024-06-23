import 'package:fait/source/views/statistics_screens/widgets/arrow_painter_widget.dart';
import 'package:fait/source/views/statistics_screens/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

// ignore_for_file: must_be_immutable
class WaterIntakeScreen extends StatelessWidget {
  double progress = 0.8;
  int totalSteps = 46;
  WaterIntakeScreen({Key? key}) : super(key: key);

  TextEditingController waterMeasurementController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double adjustedProgress = progress > 1 ? progress / 100.0 : progress;
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(height: 32.v),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        onTapImgArrowLeft(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 66.v),
                Text("HYDRATION", style: CustomTextStyles.titleMediumPrimary18),
                SizedBox(height: 9.v),
                SizedBox(
                    height: 72.v,
                    width: 190.h,
                    child: Stack(alignment: Alignment.bottomRight, children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                              width: 178.h,
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "  Today You took ",
                                        style: CustomTextStyles
                                            .headlineSmallRoboto),
                                    TextSpan(
                                        text: "750 ml ",
                                        style: CustomTextStyles
                                            .headlineSmallRobotoff17d1e0),
                                    TextSpan(
                                        text: "of water",
                                        style: CustomTextStyles
                                            .headlineSmallRoboto)
                                  ]),
                                  textAlign: TextAlign.left))),
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorLightBlueA200,
                          height: 20.v,
                          width: 14.h,
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(bottom: 22.v))
                    ])),
                SizedBox(height: 2.v),
                Text("Almost there! keep hydrated",
                    style: theme.textTheme.bodyMedium),
                SizedBox(height: 62.v),
                Transform.translate(
                  offset: Offset(
                    ((360.h / 2) * 2 * adjustedProgress) - (360.h / 2),
                    -5,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 81.h,
                        height: 100.v,
                        padding: const EdgeInsets.only(
                            left: 4, right: 4, top: 4, bottom: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.colorScheme.primary,
                        ),
                        child: Center(
                          child: Text(
                            "${adjustedProgress * 100}%",
                            style: TextStyle(
                                fontSize: 24.fSize,
                                color: appTheme.white,
                                height: 0.8),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                        height: 10.v,
                        child: CustomPaint(
                          painter: ArrowPainter(),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 65.v,
                  width: 360.h,
                  child: LiquidLinearProgressIndicator(
                    value: adjustedProgress,
                    valueColor: AlwaysStoppedAnimation(appTheme.cyan200),
                    backgroundColor: appTheme.cyan300,
                    borderColor: appTheme.cyan300,
                    borderWidth: 5.0,
                    borderRadius: 40.0,
                    direction: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 20.v),
                SizedBox(
                  height: 24.v,
                  width: 350.h,
                  child: CustomStepProgressIndicator(
                    totalSteps: totalSteps,
                    currentStep: (adjustedProgress * totalSteps).round(),
                  ),
                ),
                SizedBox(height: 61.v),
                _buildBg(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBg(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 50.h, vertical: 32.v),
        decoration: AppDecoration.fillGray100
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 80.v,
            width: 245.h,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    onTapImgMinusCupOnprimarycontainer(context);
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgMinusCupOnprimarycontainer,
                  ),
                ),
                SizedBox(
                  width: 32.h,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgCupOnprimarycontainer,
                ),
                SizedBox(
                  width: 32.h,
                ),
                InkWell(
                  onTap: () {
                    onTapImgAddCupOnprimarycontainer(context);
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgAddCupOnprimarycontainer,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 62.v),
          Text("1x Glass 200 ml",
              style: CustomTextStyles.titleMediumBlack900SemiBold),
          SizedBox(height: 31.v),
          CustomElevatedButton(
              onPressed: () {
                onPressedAddDrinkButton(context);
              },
              height: 64.v,
              text: "Add Drink",
              leftIcon: Container(
                  margin: EdgeInsets.only(right: 12.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgVectorOnprimarycontainer18x14,
                      height: 18.v,
                      width: 14.h)),
              buttonStyle: CustomButtonStyles.fillPrimary2,
              buttonTextStyle: CustomTextStyles.titleLargeBold),
          SizedBox(height: 10.v)
        ]));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// For minus cup
  onTapImgMinusCupOnprimarycontainer(BuildContext context) {}

  /// For add cup
  onTapImgAddCupOnprimarycontainer(BuildContext context) {}

  /// For add cup from the Add Drink button
  onPressedAddDrinkButton(BuildContext context) {}
}
