import 'package:fait/source/theme/theme_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  final List<LineChartBarData> lineBarsData;
  final SideTitles bottomTitles;
  final bool drawHorizontalLine;
  final bool drawVerticalLine;
  const CustomLineChart({
    super.key,
    required this.lineBarsData,
    required this.bottomTitles,
    required this.drawHorizontalLine,
    required this.drawVerticalLine,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          enabled: true,
          handleBuiltInTouches: false,
          mouseCursorResolver:
              (FlTouchEvent event, LineTouchResponse? response) {
            if (response == null || response.lineBarSpots == null) {
              return SystemMouseCursors.basic;
            }
            return SystemMouseCursors.click;
          },
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: appTheme.blueA40002,
            tooltipRoundedRadius: 20,
            getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
              return lineBarsSpot.map((lineBarSpot) {
                return LineTooltipItem(
                  "${lineBarSpot.x.toInt()} mins ago",
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
        lineBarsData: lineBarsData,
        minY: -0.5,
        maxY: 110,
        titlesData: FlTitlesData(
          show: true,
          leftTitles: const AxisTitles(),
          topTitles: const AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: bottomTitles,
          ),
          rightTitles: const AxisTitles(),
        ),
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: drawHorizontalLine,
          drawVerticalLine: drawVerticalLine,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: appTheme.white,
              strokeWidth: 1,
            );
          },
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: theme.colorScheme.primary,
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
    );
  }
}
