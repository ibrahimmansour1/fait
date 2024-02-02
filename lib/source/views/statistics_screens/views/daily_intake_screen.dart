import 'package:fait/source/views/statistics_screens/widgets/daily_intake_widget.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DailyIntakeScreen extends StatelessWidget {
  const DailyIntakeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 32.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowLeft,
                height: 24.v,
                width: 16.h,
                margin: EdgeInsets.only(left: 10.h),
                onTap: () {
                  onTapImgArrowLeft(context);
                },
              ),
              const Spacer(),
              Align(
                  alignment: Alignment.center,
                  child: Text("DAILY INTAKE",
                      style: CustomTextStyles.titleMediumDeeppurple300)),
              SizedBox(height: 9.v),
              Container(
                  width: 197.h,
                  margin: EdgeInsets.only(left: 87.h),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "  Today You have consumed",
                            style: CustomTextStyles.headlineSmallRoboto),
                        const TextSpan(text: " "),
                        TextSpan(
                            text: "500 cal",
                            style: CustomTextStyles
                                .headlineSmallRobotoDeeppurple300)
                      ]),
                      textAlign: TextAlign.left)),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 75.h, vertical: 64.v),
                  child: CircularPercentIndicator(
                    radius: 110.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: 0.72,
                    center: CircularPercentIndicator(
                      radius: 90.0,
                      lineWidth: 13.0,
                      animation: true,
                      percent: 0.68,
                      center: CircularPercentIndicator(
                        radius: 70.0,
                        lineWidth: 13.0,
                        animation: true,
                        percent: 0.4,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("60%",
                                style: CustomTextStyles.headlineSmallRoboto_2),
                            SizedBox(height: 7.v),
                            Text("of daily goals",
                                style: CustomTextStyles
                                    .bodyMediumOnPrimaryContainer_1)
                          ],
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: appTheme.deepPurple40001,
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: appTheme.cyan20001,
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: appTheme.blue50001,
                  ),
                ),
              ),
              DailyIntake(context),
              SizedBox(height: 85.v)
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
