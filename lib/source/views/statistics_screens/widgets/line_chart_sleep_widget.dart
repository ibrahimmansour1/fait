import 'package:fait/utils/app_export.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SleepChartWidget extends StatefulWidget {
  const SleepChartWidget({super.key});

  @override
  State<SleepChartWidget> createState() => _SleepChartWidgetState();
}

class _SleepChartWidgetState extends State<SleepChartWidget> {
  List<int> showingTooltipOnSpots = [4];

  @override
  Widget build(BuildContext context) {
    final tooltipsOnBar = lineBarsData1[0];
    return SizedBox(
      height: 91.v,
      width: 376.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: LineChart(
              LineChartData(
                showingTooltipIndicators: showingTooltipOnSpots.map((index) {
                  return ShowingTooltipIndicators([
                    LineBarSpot(
                      tooltipsOnBar,
                      lineBarsData1.indexOf(tooltipsOnBar),
                      tooltipsOnBar.spots[index],
                    ),
                  ]);
                }).toList(),
                lineTouchData: LineTouchData(
                  enabled: true,
                  handleBuiltInTouches: false,
                  touchCallback:
                      (FlTouchEvent event, LineTouchResponse? response) {
                    if (response == null || response.lineBarSpots == null) {
                      return;
                    }
                    if (event is FlTapUpEvent) {
                      final spotIndex = response.lineBarSpots!.first.spotIndex;
                      showingTooltipOnSpots.clear();
                      setState(() {
                        showingTooltipOnSpots.add(spotIndex);
                      });
                    }
                  },
                  mouseCursorResolver:
                      (FlTouchEvent event, LineTouchResponse? response) {
                    if (response == null || response.lineBarSpots == null) {
                      return SystemMouseCursors.basic;
                    }
                    return SystemMouseCursors.click;
                  },
                  getTouchedSpotIndicator:
                      (LineChartBarData barData, List<int> spotIndexes) {
                    return spotIndexes.map((index) {
                      return TouchedSpotIndicatorData(
                        FlLine(
                          color: appTheme.transparent,
                        ),
                        FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                            radius: 3,
                            color: appTheme.white,
                            strokeWidth: 1,
                            strokeColor: appTheme.blueGray40001,
                          ),
                        ),
                      );
                    }).toList();
                  },
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: appTheme.deepPurple300,
                    tooltipRoundedRadius: 5,
                    getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                      return lineBarsSpot.map((lineBarSpot) {
                        return LineTooltipItem(
                          "${lineBarSpot.y.toInt()} hours",
                          TextStyle(
                            color: appTheme.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                lineBarsData: lineBarsData1,
                minY: -0.01,
                maxY: 10.01,
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: bottomTitles,
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: rightTitles,
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  horizontalInterval: 2,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: appTheme.gray.withOpacity(0.15),
                      strokeWidth: 2,
                    );
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: appTheme.transparent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          appTheme.indigoA200,
          appTheme.indigoA200,
        ]),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            appTheme.sleepShapeColor,
            appTheme.sleepShapeColor,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        spots: const [
          FlSpot(1, 3),
          FlSpot(2, 5),
          FlSpot(3, 4),
          FlSpot(4, 7),
          FlSpot(5, 4),
          FlSpot(6, 8),
          FlSpot(7, 5),
        ],
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  SideTitles get rightTitles => SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 2,
        reservedSize: 30,
      );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0h';
        break;

      case 10:
        text = '10h';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color: appTheme.gray,
          fontSize: 12,
        ),
        textAlign: TextAlign.center);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: appTheme.gray,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Sun', style: style);
        break;
      case 2:
        text = Text('Mon', style: style);
        break;
      case 3:
        text = Text('Tue', style: style);
        break;
      case 4:
        text = Text('Wed', style: style);
        break;
      case 5:
        text = Text('Thu', style: style);
        break;
      case 6:
        text = Text('Fri', style: style);
        break;
      case 7:
        text = Text('Sat', style: style);
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
}
