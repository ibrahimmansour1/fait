import 'package:fait/source/views/statistics_screens/widgets/custom_circular_progress_indicator.dart';
import 'package:fait/source/views/statistics_screens/widgets/custom_painter.dart';
import 'package:fait/source/views/statistics_screens/widgets/info_calories_widget.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

class AfterLoginScreen extends StatelessWidget {
  const AfterLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.v),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowLeft,
                  height: 24.v,
                  width: 16.h,
                  margin: EdgeInsets.only(left: 32.h),
                  onTap: () {
                    onTapImgArrowLeft(context);
                  },
                ),
                SizedBox(height: 31.v),
                Padding(
                    padding: EdgeInsets.only(left: 32.h),
                    child:
                        Text("GOOD MORNING", style: theme.textTheme.bodyLarge)),
                SizedBox(height: 8.v),
                Container(
                  width: 207.h,
                  margin: EdgeInsets.only(left: 32.h),
                  child: Text("Today’s Workouts",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.displayMediumRoboto),
                ),
                SizedBox(height: 41.v),
                Container(
                  height: 225.v,
                  alignment: Alignment.center,
                  child: const CustomCircularProgressIndicator(
                    tealPercentage: 25,
                    orangePercentage: 13,
                    redPercentage: 50,
                  ),
                ),
                SizedBox(height: 24.v),
                _buildEightySix(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEightySix(BuildContext context) {
    return SizedBox(
      height: 380.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20.v),
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "620 ",
                        style: CustomTextStyles
                            .titleMediumOnPrimaryContainerSemiBold),
                    TextSpan(
                        text: "Average calories per day",
                        style: CustomTextStyles.bodyLargeOnPrimaryContainer)
                  ]),
                  textAlign: TextAlign.left),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CustomPaint(
              size: Size(435.h, 367.v),
              painter: RPSCustomPainter(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 40.v),
                  Padding(
                    padding: EdgeInsets.only(left: 17.h, right: 59.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 53.v, left: 32.v),
                            child: Text("Today’s  Status",
                                style: CustomTextStyles
                                    .headlineSmallRobotoSemiBold)),
                        CustomImageView(
                          imagePath: ImageConstant.imgTodaySStatusIcon,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          margin: EdgeInsets.only(
                              left: 12.h, top: 56.v, bottom: 2.v),
                        ),
                        SizedBox(
                          width: 64.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapGoToHome1(context);
                          },
                          child: Container(
                            height: 80.v,
                            width: 56.h,
                            margin: EdgeInsets.only(bottom: 2.v),
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.h, vertical: 32.v),
                            decoration: AppDecoration.fillRed.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder12),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgArrowright,
                                height: 16.v,
                                width: 20.h,
                                alignment: Alignment.center),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 45.v),
                  const infoCaloriesWidget(),
                  SizedBox(
                    height: 48.v,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the homeDashbordContainerScreen when the action is triggered.
  onTapGoToHome1(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.homeDashbordContainerScreen);
  }
}
