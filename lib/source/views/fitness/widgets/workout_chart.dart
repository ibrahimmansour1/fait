import 'package:fait/source/theme/custom_text_style.dart';
import 'package:fait/source/theme/theme_helper.dart';
import 'package:fait/source/widgets/custom_icon_button.dart';
import 'package:fait/source/widgets/custom_line_chart.dart';
import 'package:fait/utils/app_export.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutChartWidget extends ConsumerStatefulWidget {
  const WorkoutChartWidget({super.key});

  @override
  ConsumerState<WorkoutChartWidget> createState() => _WorkoutChartWidgetState();
}

class _WorkoutChartWidgetState extends ConsumerState<WorkoutChartWidget> {
  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 65.adaptSize,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 1:
        // text = Text('Sun', style: style);
        text = _buildDayCard(
          context,
          dynamicText1: "Sun",
          dynamicText2: "23",
          // onTapDayCard: () {
          //   onTapDayCard2(context);
          // },
        );
        break;
      case 2:
        // text = Text('Mon', style: style);
        text = _buildDayCard(
          context,
          dynamicText1: "Mon",
          dynamicText2: "23",
          // onTapDayCard: () {
          //   onTapDayCard2(context);
          // },
        );
        break;
      case 3:
        // text = Text('Tue', style: style);
        text = _buildDayCard(
          context,
          dynamicText1: "Tue",
          dynamicText2: "23",
          // onTapDayCard: () {
          //   onTapDayCard2(context);
          // },
        );
        break;
      case 4:
        // text = Text('Wed', style: style);
        text = _buildDayCard(
          context,
          dynamicText1: "Wed",
          dynamicText2: "23",
          // onTapDayCard: () {
          //   onTapDayCard2(context);
          // },
        );
        break;
      case 5:
        // text = Text('Thu', style: style);
        text = _buildDayCard(
          context,
          dynamicText1: "Thu",
          dynamicText2: "23",
          // onTapDayCard: () {
          //   onTapDayCard2(context);
          // },
        );
        break;
      case 6:
        // text = Text('Fri', style: style);
        text = _buildDayCard(
          context,
          dynamicText1: "Fri",
          dynamicText2: "23",
          // onTapDayCard: () {
          //   onTapDayCard2(context);
          // },
        );
        break;
      case 7:
        // text = Text('Sat', style: style);
        text = _buildDayCard(
          context,
          dynamicText1: "Sat",
          dynamicText2: "23",
          // onTapDayCard: () {
          //   onTapDayCard2(context);
          // },
        );
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310.h,
      height: 150.v,
      child: CustomLineChart(
        lineBarsData: lineBarsData1,
        bottomTitles: bottomTitles,
        drawHorizontalLine: true,
        drawVerticalLine: false,
      ),
    );
  }

  /// Common widget
  Widget _buildDayCard(
    BuildContext context, {
    required String dynamicText1,
    required String dynamicText2,
    Function? onTapDayCard,
  }) {
    return GestureDetector(
      onTap: () {
        // Show a dialog containing the provided code
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shadowColor: appTheme.transparent,
              backgroundColor: appTheme.transparent,
              surfaceTintColor: appTheme.transparent,
              insetPadding: EdgeInsets.all(20.h),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 125.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.h, vertical: 4.v),
                  decoration: AppDecoration.fillBluegray80004.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.v),
                      Padding(
                        padding: EdgeInsets.only(right: 4.h),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 13.v, bottom: 6.v),
                              child: CustomIconButton(
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                padding: EdgeInsets.all(4.h),
                                decoration: IconButtonStyleHelper.fillBlueGray,
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgLightning),
                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "450",
                                          style: CustomTextStyles
                                              .titleSmallfff4f4fc),
                                      const TextSpan(text: " "),
                                      TextSpan(
                                          text: "cal",
                                          style: CustomTextStyles
                                              .bodySmallbff4f4fc)
                                    ]),
                                    textAlign: TextAlign.left),
                                SizedBox(height: 4.v),
                                Text("Burned", style: theme.textTheme.bodySmall)
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.v),
                      Padding(
                        padding: EdgeInsets.only(right: 4.h),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 9.v, bottom: 7.v),
                              child: CustomIconButton(
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                padding: EdgeInsets.all(4.h),
                                decoration: IconButtonStyleHelper.fillBlueGray,
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgLiftedImage),
                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "148",
                                            style: CustomTextStyles
                                                .titleSmallfff4f4fc),
                                        const TextSpan(text: " "),
                                        TextSpan(
                                            text: "kg",
                                            style: CustomTextStyles
                                                .bodySmallbff4f4fc)
                                      ],
                                    ),
                                    textAlign: TextAlign.left),
                                SizedBox(height: 5.v),
                                Text("Lifted", style: theme.textTheme.bodySmall)
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 13.v),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 8.v,
                              bottom: 10.v,
                            ),
                            child: CustomIconButton(
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              padding: EdgeInsets.all(4.h),
                              decoration: IconButtonStyleHelper.fillBlueGray,
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgDurationImage),
                            ),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "1",
                                        style: CustomTextStyles
                                            .titleSmallffffffff),
                                    TextSpan(
                                        text: "h",
                                        style: CustomTextStyles
                                            .labelLargeRobotobfffffff),
                                    const TextSpan(text: " "),
                                    TextSpan(
                                        text: "24",
                                        style: CustomTextStyles
                                            .titleSmallffffffff),
                                    const TextSpan(text: " "),
                                    TextSpan(
                                        text: "m",
                                        style:
                                            CustomTextStyles.bodySmallbfffffff)
                                  ]),
                                  textAlign: TextAlign.left),
                              SizedBox(height: 7.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 7.h),
                                  child: Text("Total",
                                      style: CustomTextStyles
                                          .bodySmallOnPrimaryContainer))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15.v),
                  decoration: AppDecoration.fillBluegray80004
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        // width: 235.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.v),
                              child: Text("16 workouts",
                                  style: theme.textTheme.titleMedium),
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Container(
                              height: 5.adaptSize,
                              width: 5.adaptSize,
                              margin: EdgeInsets.symmetric(vertical: 7.v),
                              decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer
                                      .withOpacity(0.75),
                                  borderRadius: BorderRadius.circular(2.h)),
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.v),
                              child: Text("2093 kilograms",
                                  style: theme.textTheme.titleMedium),
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            Container(
                              height: 5.adaptSize,
                              width: 5.adaptSize,
                              margin: EdgeInsets.symmetric(vertical: 7.v),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.onPrimaryContainer
                                    .withOpacity(0.75),
                                borderRadius: BorderRadius.circular(2.h),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text("1298 minutes", style: theme.textTheme.titleMedium),
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowRight,
                        height: 12.v,
                        width: 8.h,
                        margin: EdgeInsets.symmetric(vertical: 4.v),
                      ),
                    ],
                  ),
                ),
              ]),
            );
          },
        );
      },
      child: Column(
        children: [
          Text(
            dynamicText1,
            style: CustomTextStyles.titleMediumBlack900.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            ),
          ),
          SizedBox(height: 3.v),
          Text(
            dynamicText2,
            style: CustomTextStyles.bodyLargeOnPrimaryContainer_2.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}

List<LineChartBarData> get lineBarsData1 => [
      lineChartBarData1_1,
    ];

LineChartBarData get lineChartBarData1_1 => LineChartBarData(
      isCurved: true,
      gradient: LinearGradient(colors: [
        appTheme.white,
        appTheme.white,
      ]),
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
          radius: 2,
          color: theme.colorScheme.primary,
          strokeWidth: 2,
          strokeColor: theme.colorScheme.primary,
        ),
      ),
      belowBarData: BarAreaData(show: false),
      spots: const [
        FlSpot(1, 35),
        FlSpot(2, 70),
        FlSpot(3, 40),
        FlSpot(4, 80),
        FlSpot(5, 25),
        FlSpot(6, 70),
        FlSpot(7, 35),
      ],
    );
