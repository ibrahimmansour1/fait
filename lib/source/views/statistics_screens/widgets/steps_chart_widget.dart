import 'package:fait/source/theme/theme_helper.dart';
import 'package:fait/source/views/statistics_screens/views/steps_tracker_screen.dart';
import 'package:fait/source/widgets/custom_line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepsChartWidget extends ConsumerStatefulWidget {
  final TimePeriod selectedTimePeriod;
  const StepsChartWidget(this.selectedTimePeriod, {super.key});

  @override
  ConsumerState<StepsChartWidget> createState() => _StepsChartWidgetState();
}

class _StepsChartWidgetState extends ConsumerState<StepsChartWidget> {
  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: appTheme.white,
      fontSize: 12,
    );

    // If the selected time period is Daily and value is not equal to current day, hide the titles
    if (widget.selectedTimePeriod == TimePeriod.Daily &&
        value.toInt() != DateTime.now().weekday) {
      return const SizedBox();
    }

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

  @override
  Widget build(BuildContext context) {
    return CustomLineChart(
      lineBarsData: getLineBarsData(widget.selectedTimePeriod),
      bottomTitles: bottomTitles,
      drawHorizontalLine: false,
      drawVerticalLine:
          widget.selectedTimePeriod == TimePeriod.Daily ? false : true,
    );
  }
}

LineChartBarData get lineChartBarDataWeek => LineChartBarData(
      isCurved: true,
      gradient: LinearGradient(colors: [
        appTheme.blue50001,
        appTheme.blue50001,
      ]),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
          radius: index == 6 ? 5 : 3,
          color: appTheme.white,
          strokeWidth: 2,
          strokeColor: appTheme.blue50001,
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

LineChartBarData get lineChartBarDataDaily => LineChartBarData(
      isCurved: true,
      gradient: LinearGradient(colors: [
        appTheme.blue50001,
        appTheme.blue50001,
      ]),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) {
          // Check if the spot represents the current day
          bool isCurrentDay = spot.x.toInt() == DateTime.now().weekday;

          return FlDotCirclePainter(
            radius: isCurrentDay
                ? 5
                : 0, // Set radius to 5 only for the current day
            color: appTheme.white,
            strokeWidth: 2,
            strokeColor: appTheme.blueA40002,
          );
        },
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

LineChartBarData get lineChartBarDataMonth => LineChartBarData(
      isCurved: true,
      gradient: LinearGradient(colors: [
        appTheme.blue50001,
        appTheme.blue50001,
      ]),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
          radius: index == 6 ? 5 : 3,
          color: appTheme.white,
          strokeWidth: 2,
          strokeColor: appTheme.blueA40002,
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

List<LineChartBarData> getLineBarsData(TimePeriod selectedPeriod) {
  switch (selectedPeriod) {
    case TimePeriod.Daily:
      return [
        lineChartBarDataDaily,
      ];
    case TimePeriod.Week:
      return [
        lineChartBarDataWeek,
      ];
    case TimePeriod.Month:
      return [
        lineChartBarDataMonth,
      ];
  }
}
