import 'dart:math' as math;

import 'package:fait/source/theme/theme_helper.dart';
import 'package:flutter/material.dart';





class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    Key? key,
    required this.cardioPercentage,
    required this.strengthPercentage,
    required this.stretchPercentage,
  }) : super(key: key);

  final double cardioPercentage;
  final double strengthPercentage;
  final double stretchPercentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: CustomPaint(
        painter: _CustomCircularProgressIndicatorPainter(
          cardioPercentage: cardioPercentage,
          strengthPercentage: strengthPercentage,
          stretchPercentage: stretchPercentage,
        ),
      ),
    );
  }
}

class _CustomCircularProgressIndicatorPainter extends CustomPainter {
  _CustomCircularProgressIndicatorPainter({
    required this.cardioPercentage,
    required this.strengthPercentage,
    required this.stretchPercentage,
  });

  final double cardioPercentage;
  final double strengthPercentage;
  final double stretchPercentage;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 8.0;
    const space = 5.0; // Adjust the space between indicators as needed

    final cardio = Paint()
      ..color = appTheme.amber600
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final strength = Paint()
      ..color = appTheme.deepPurpleA2000
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final stretch = Paint()
      ..color = appTheme.lightBlue300
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    const startAngle = -90 * (math.pi / 180);

    final totalPercentage =
        cardioPercentage + space + strengthPercentage + stretchPercentage;

    // Calculate sweep angles
    final cardioSweepAngle = 360 * (cardioPercentage / totalPercentage);
    final strengthSweepAngle = 360 * (strengthPercentage / totalPercentage);
    final stretchSweepAngle = 360 * (stretchPercentage / totalPercentage);

    // Draw cardio arc
    drawArcWithSpace(
      canvas,
      center,
      radius,
      startAngle,
      cardioSweepAngle,
      cardio,
      space,
    );

    // Draw strength arc
    final endCardioAngle = startAngle +
        math.pi * 2 * (cardioSweepAngle / 360) +
        space * (math.pi / 180);
    drawArcWithSpace(
      canvas,
      center,
      radius,
      endCardioAngle,
      strengthSweepAngle,
      strength,
      space,
    );

    // Draw stretch arc
    final endStrengthAngle = endCardioAngle +
        math.pi * 2 * (strengthSweepAngle / 360) +
        space * (math.pi / 180);
    drawArcWithSpace(
      canvas,
      center,
      radius,
      endStrengthAngle,
      stretchSweepAngle,
      stretch,
      space,
    );
  }

  void drawArcWithSpace(
    Canvas canvas,
    Offset center,
    double radius,
    double startAngle,
    double sweepAngle,
    Paint paint,
    double space,
  ) {
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      math.pi * 2 * (sweepAngle / 360),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_CustomCircularProgressIndicatorPainter oldDelegate) {
    return oldDelegate.cardioPercentage != cardioPercentage ||
        oldDelegate.strengthPercentage != strengthPercentage ||
        oldDelegate.stretchPercentage != stretchPercentage;
  }
}
