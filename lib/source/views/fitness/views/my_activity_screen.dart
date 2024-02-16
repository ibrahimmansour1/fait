import 'package:fait/source/views/fitness/views/exercise_info_screen.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../widgets/custom_elevated_button.dart';
import '../widgets/in_progress_exercise_card_widget.dart';

class MyActivityScreen extends StatelessWidget {
  const MyActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopPart(context),
            Expanded(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(height: 16.v),
                  _buildExerciseContent(context),
                  SizedBox(height: 30.v),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.v),
                      child: CustomElevatedButton(
                          height: 48.v,
                          width: 272.h,
                          text: "Start",
                          buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                          buttonTextStyle:
                              CustomTextStyles.headlineSmallRobotoSemiBold),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTopPart(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 30.v),
        decoration: AppDecoration.outlineSecondaryContainer1
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgArrowLeft,
                            height: 24.v,
                            width: 16.h,
                            margin: EdgeInsets.only(bottom: 24.v),
                            onTap: () {
                              onTapImgArrowLeft(context);
                            }),
                        Padding(
                            padding: EdgeInsets.only(top: 10.v),
                            child: Text("My activity",
                                style: theme.textTheme.headlineLarge)),
                        SizedBox(
                          width: 16.h,
                        ),
                      ])),
              SizedBox(height: 27.v),
              Stack(alignment: Alignment.centerLeft, children: [
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 44.h, vertical: 22.v),
                        decoration: AppDecoration.fillBluegray80004.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder32),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 7.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(top: 5.v),
                                        child: Text("Keep it up!",
                                            style: CustomTextStyles
                                                .headlineSmallRobotoSemiBold)),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgCrossedFingers,
                                        height: 32.adaptSize,
                                        width: 32.adaptSize,
                                        margin: EdgeInsets.only(
                                            left: 2.h, bottom: 2.v))
                                  ]),
                              SizedBox(height: 9.v),
                              Container(
                                  width: 137.h,
                                  margin: EdgeInsets.only(right: 10.h),
                                  child: Text("Your goal almost completed!",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles
                                          .titleMediumOnPrimaryContainer18))
                            ]))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      // height: 147.adaptSize,
                      // width: 147.adaptSize,
                      margin: EdgeInsets.only(left: 16.h),
                      child: CircularPercentIndicator(
                        progressColor: theme.colorScheme.primary,
                        backgroundColor: appTheme.white,
                        radius: 73.0.adaptSize,
                        lineWidth: 18,
                        animation: true,
                        percent: 0.7,
                        reverse: true,
                        center: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "70",
                                  style:
                                      CustomTextStyles.headlineLargeffffffff),
                              TextSpan(
                                  text: "%",
                                  style: CustomTextStyles.headlineLargebfffffff)
                            ]),
                            textAlign: TextAlign.left),
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ))
              ])
            ]));
  }

  /// Section Widget
  Widget _buildExerciseContent(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h),
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 32.v);
                },
                itemCount: 7,
                itemBuilder: (context, index) {
                  return InProgressExerciseCardWidget(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          isScrollControlled: true,
                          builder: (_) => ExerciseInfoScreen());
                    },
                  );
                })));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
