import 'package:fait/source/views/statistics_screens/widgets/line_chart_sleep_widget.dart';
import 'package:fait/source/views/statistics_screens/widgets/note_widget.dart';
import 'package:fait/source/views/statistics_screens/widgets/total_time_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SleepTrackerScreen extends StatefulWidget {
  const SleepTrackerScreen({Key? key}) : super(key: key);

  @override
  State<SleepTrackerScreen> createState() => _SleepTrackerScreenState();
}

class _SleepTrackerScreenState extends State<SleepTrackerScreen> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 32.v),
            child: Column(
              children: [
                Align(
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
                SizedBox(height: 27.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.h, right: 40.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 4.v),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sleep Tue 11",
                                    style: CustomTextStyles
                                        .headlineSmallRobotoRegular),
                                SizedBox(height: 4.v),
                                Text("HR & Stages 11:24 pm - 7:13 am",
                                    style: CustomTextStyles
                                        .bodyLargeOnPrimaryContainer18),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 28.h, top: 2.v),
                          child: Text("73",
                              style: CustomTextStyles
                                  .displayMediumRobotoIndigo300),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 64.v),
                const TotalTimeInfoWidget(),
                SizedBox(height: 8.v),
                Padding(
                  padding: EdgeInsets.only(left: 16.h, right: 17.h),
                  child: Container(
                    height: 12.v,
                    width: 363.h,
                    decoration: BoxDecoration(
                        color: appTheme.indigo900,
                        borderRadius: BorderRadius.circular(6.h)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.h),
                      child: LinearProgressIndicator(
                        value: 0.81,
                        backgroundColor: appTheme.indigo900,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(appTheme.tealA70001),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.h, right: 84.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.v),
                          child: Text("Time asleep",
                              style: CustomTextStyles.bodyLargeTealA70001),
                        ),
                        Text("7h 41m",
                            style: CustomTextStyles.bodyLargeTealA70001),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40.v),
                const SleepChartWidget(),
                SizedBox(height: 40.v),
                _buildProgress(context, 0.21, appTheme.blue50, "Awake 2h 46m",
                    CustomTextStyles.bodyLargeBlue50),
                SizedBox(height: 16.v),
                _buildProgress(context, 0.16, appTheme.indigo700, "Deep 2h 32m",
                    CustomTextStyles.bodyLargeIndigo700),
                SizedBox(height: 13.v),
                _buildProgress(context, 0.23, appTheme.indigoA10001,
                    "REm 1h 32m", CustomTextStyles.bodyLargeIndigoA10001),
                SizedBox(height: 16.v),
                _buildProgress(context, 0.61, theme.colorScheme.errorContainer,
                    "Light 4h 16m", CustomTextStyles.bodyLargeErrorContainer),
                SizedBox(height: 50.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.h),
                    child: Text("Bio Metrices",
                        style: CustomTextStyles.headlineSmallRobotoSemiBold!
                            .copyWith(
                          color: theme.colorScheme.tertiary,
                        )),
                  ),
                ),
                SizedBox(height: 17.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text("Average for a 31 year old male",
                          style:
                              CustomTextStyles.bodyLargeOnPrimaryContainer18)),
                ),
                SizedBox(height: 29.v),
                const NoteWidget(),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProgress(
      BuildContext context, progressValue, progressColor, text, textStyle) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        children: [
          LinearPercentIndicator(
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 0.h),
            width: 160,
            animation: true,
            animationDuration: 1000,
            lineHeight: 18,
            percent: progressValue,
            center: Text("${(progressValue * 100).toInt()}%",
                style: progressValue <= 0.43
                    ? TextStyle(
                        color: progressColor,
                        fontSize: 16.fSize,
                        fontWeight: FontWeight.w400,
                      )
                    : TextStyle(
                        color: text == "Awake 2h 46m"
                            ? appTheme.black900
                            : appTheme.white,
                        fontSize: 16.fSize,
                        fontWeight: FontWeight.w400,
                      )),
            progressColor: progressColor,
          ),
          const Spacer(),
          Text(text, style: textStyle),
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
