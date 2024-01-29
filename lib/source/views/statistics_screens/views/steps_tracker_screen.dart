import 'package:fait/source/views/statistics_screens/widgets/steps_chart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:fait/source/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

enum TimePeriod { Daily, Week, Month }

final selectedTimePeriodProvider =
    StateProvider<TimePeriod>((ref) => TimePeriod.Week);

class StepsTrackerScreen extends StatelessWidget {
  const StepsTrackerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progressValue = 950;
    double minProgress = 0.72;
    double kmProgress = 0.72;
    double kclProgress = 0.72;
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 24.v),
          child: Column(
            children: [
              SizedBox(height: 24.v),
              Text("DAILY STEPS",
                  style: CustomTextStyles.titleMediumDeeppurple300),
              SizedBox(height: 9.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 185.h,
                  margin: EdgeInsets.only(left: 101.h),
                  child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: " You have walked ",
                              style: CustomTextStyles.headlineSmallRoboto),
                          TextSpan(
                              text: "40% ",
                              style: CustomTextStyles
                                  .headlineSmallRobotoDeeppurple300),
                          TextSpan(
                              text: "of your goal",
                              style: CustomTextStyles.headlineSmallRoboto),
                        ],
                      ),
                      textAlign: TextAlign.left),
                ),
              ),
              SizedBox(height: 45.v),
              SizedBox(
                height: 368.v,
                width: 314.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 264.adaptSize,
                        width: 264.adaptSize,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                height: 240.adaptSize,
                                width: 210.adaptSize,
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgPointAround,
                                    height: 264.adaptSize,
                                    width: 264.adaptSize,
                                    alignment: Alignment.center),
                              ),
                            ),
                            SfRadialGauge(
                              axes: <RadialAxis>[
                                RadialAxis(
                                  minimum: 0,
                                  maximum: 1000,
                                  showLabels: false,
                                  showTicks: false,
                                  axisLineStyle: AxisLineStyle(
                                    thickness: 0.1,
                                    cornerStyle: CornerStyle.bothCurve,
                                    color: appTheme.white,
                                    thicknessUnit: GaugeSizeUnit.factor,
                                  ),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                      value: progressValue,
                                      cornerStyle: CornerStyle.bothCurve,
                                      color: appTheme.indigoA10002,
                                      width: 0.1,
                                      sizeUnit: GaugeSizeUnit.factor,
                                    )
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                      positionFactor: 0.1,
                                      angle: 90,
                                      widget: Column(
                                        children: [
                                          SizedBox(
                                            height: 54.v,
                                          ),
                                          CustomImageView(
                                            imagePath: ImageConstant
                                                .imgRunningFemaleAmber400,
                                            height: 64.v,
                                            width: 80.h,
                                          ),
                                          SizedBox(
                                            height: 28.v,
                                          ),
                                          Text(
                                            "7,235",
                                            style: CustomTextStyles
                                                .headlineLargeSemiBold,
                                          ),
                                          Text("Steps",
                                              style: CustomTextStyles
                                                  .headlineSmallRobotoOnPrimaryContainer)
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 264.v,
                            ),
                            CircularPercentIndicator(
                              progressColor: appTheme.amber600,
                              backgroundColor: appTheme.amber700,
                              radius: 30.0,
                              lineWidth: 8.0,
                              animation: true,
                              percent: kclProgress,
                              center: CustomImageView(
                                  imagePath: ImageConstant.imgLightning,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  alignment: Alignment.center),
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                            SizedBox(height: 7.v),
                            Text(
                              "31 kcl",
                              style: CustomTextStyles
                                  .titleMediumOnPrimaryContainer,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 264.v,
                            ),
                            CircularPercentIndicator(
                              progressColor: appTheme.blueA40002,
                              backgroundColor: appTheme.blueA40003,
                              radius: 30.0,
                              lineWidth: 8.0,
                              animation: true,
                              percent: minProgress,
                              center: CustomImageView(
                                  imagePath: ImageConstant.imgGroup,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  alignment: Alignment.center),
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                            SizedBox(height: 7.v),
                            Text(
                              "50 min",
                              style: CustomTextStyles
                                  .titleMediumOnPrimaryContainer,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 264.v,
                            ),
                            CircularPercentIndicator(
                              progressColor: appTheme.deepPurpleA10001,
                              backgroundColor: appTheme.deepPurpleA10002,
                              radius: 30.0,
                              lineWidth: 8.0,
                              animation: true,
                              percent: kmProgress,
                              center: CustomImageView(
                                  imagePath:
                                      ImageConstant.imgLocationDeepPurpleA10001,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  alignment: Alignment.center),
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                            SizedBox(height: 7.v),
                            Text("2 km",
                                style: CustomTextStyles
                                    .titleMediumOnPrimaryContainer),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 27.v),
              _buildStepsInfoCard(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 72.v,
      leadingWidth: double.maxFinite,
      leading: Container(
        height: 25.v,
        width: 16.h,
        margin: EdgeInsets.fromLTRB(32.h, 15.v, 380.h, 15.v),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              height: 25.v,
              width: 16.h,
              alignment: Alignment.center,
              onTap: () {
                onTapImgArrowLeft(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStepsInfoCard(BuildContext context) {
    return Container(
      width: 404.h,
      height: 236.v,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 17.v),
      decoration: AppDecoration.fillIndigoA
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22),
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final selectedTimePeriod = ref.watch(selectedTimePeriodProvider);
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.0.v,
                width: 500.h,
                child: CupertinoSlidingSegmentedControl<TimePeriod>(
                  children: {
                    TimePeriod.Daily: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0.v,
                        horizontal: 28.h,
                      ),
                      child: Text(
                        "DAILY",
                        style: CustomTextStyles.titleMediumOnPrimaryContainer,
                      ),
                    ),
                    TimePeriod.Week: Text(
                      "WEEK",
                      style: CustomTextStyles.titleMediumOnPrimaryContainer,
                    ),
                    TimePeriod.Month: Text(
                      "MONTH",
                      style: CustomTextStyles.titleMediumOnPrimaryContainer,
                    ),
                  },
                  thumbColor:
                      theme.colorScheme.onErrorContainer.withOpacity(0.25),
                  backgroundColor: appTheme.transparent,
                  groupValue: selectedTimePeriod,
                  onValueChanged: (value) {
                    ref.read(selectedTimePeriodProvider.notifier).state =
                        value!;
                  },
                ),
              ),
              SizedBox(height: 30.v),
              Center(
                child: SizedBox(
                  width: 300.h,
                  height: 100.v,
                  child: selectedTimePeriod == TimePeriod.Month
                      ? SizedBox(
                          width: 300.h,
                          height: 100.v,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                4, // Number of charts you want to display
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: index == 0 ? 10.h : 40.h),
                                child: SizedBox(
                                  width: 283.h,
                                  height: 100.v,
                                  child: StepsChartWidget(selectedTimePeriod),
                                ),
                              );
                            },
                          ),
                        )
                      : StepsChartWidget(selectedTimePeriod),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft1(BuildContext context) {
    Navigator.pop(context);
  }
}
