import 'package:fait/source/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomCircularProgressIndicatorPainter extends CustomPainter {
  CustomCircularProgressIndicatorPainter({
    required this.tealPercentage,
    required this.orangePercentage,
    required this.redPercentage,
  });

  final double tealPercentage;
  final double orangePercentage;
  final double redPercentage;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw white outer circle
    final outerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, outerCirclePaint);

    const startAngle = -90 * (math.pi / 180);

    final tealSweepAngle = 360 * (tealPercentage / 100);
    final orangeSweepAngle = 360 * (orangePercentage / 100);
    final redSweepAngle = 360 * (redPercentage / 100);

    // Draw teal indicator
    drawIndicatorWithPercentage(
      canvas,
      center,
      radius,
      startAngle,
      tealSweepAngle,
      appTheme.teal400,
      tealPercentage,
    );

    // Draw orange indicator
    drawIndicatorWithPercentage(
      canvas,
      center,
      radius,
      startAngle + math.pi * 2 * (tealSweepAngle / 360),
      orangeSweepAngle,
      appTheme.deepOrangeA100,
      orangePercentage,
    );

    // Draw red indicator
    drawIndicatorWithPercentage(
      canvas,
      center,
      radius,
      startAngle + math.pi * 2 * ((tealSweepAngle + orangeSweepAngle) / 360),
      redSweepAngle,
      appTheme.red300,
      redPercentage,
    );

    // Draw white circle at the end of each indicator
    drawWhiteCircleAtEnd(
      canvas,
      center,
      radius,
      startAngle + math.pi * 2 * (tealSweepAngle / 360),
    );

    drawWhiteCircleAtEnd(
      canvas,
      center,
      radius,
      startAngle +
          math.pi * 2 * (tealSweepAngle / 360) +
          math.pi * 2 * (orangeSweepAngle / 360),
    );

    drawWhiteCircleAtEnd(
      canvas,
      center,
      radius,
      startAngle +
          math.pi * 2 * ((tealSweepAngle + orangeSweepAngle) / 360) +
          math.pi * 2 * (redSweepAngle / 360),
    );
  }

  void drawWhiteCircleAtEnd(
      Canvas canvas, Offset center, double radius, double endAngle) {
    final whiteCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final whiteCircleRadius = radius; 

    final whiteCircleX = center.dx + whiteCircleRadius * math.cos(endAngle);
    final whiteCircleY = center.dy + whiteCircleRadius * math.sin(endAngle);

    canvas.drawCircle(Offset(whiteCircleX, whiteCircleY), 4, whiteCirclePaint);
  }

  void drawIndicatorWithPercentage(
    Canvas canvas,
    Offset center,
    double radius,
    double startAngle,
    double sweepAngle,
    Color color,
    double percentage,
  ) {
    // Draw indicator
    final indicatorPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      math.pi * 2 * (sweepAngle / 360),
      false,
      indicatorPaint,
    );

    // Draw percentage text with the same color as the indicator
    final textPainter = TextPainter(
      text: TextSpan(
        text: '${percentage.toInt()}%',
        style: TextStyle(
          color: color, // Use the same color as the indicator
          fontSize: 16,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final textRadius = radius + 30; // Adjust this distance as needed
    final textAngle = startAngle + math.pi * (sweepAngle / 360);

    final textX = center.dx + textRadius * math.cos(textAngle);
    final textY = center.dy + textRadius * math.sin(textAngle);

    // Ensure the text is always readable by adjusting its orientation
    double textRotation = textAngle + math.pi / 2; // Rotate text by 90 degrees

    if (textRotation > math.pi) {
      textRotation -= math.pi; // Keep the rotation within 180 degrees
    }

    if (textRotation > math.pi / 2 && textRotation < 3 * math.pi / 2) {
      textRotation +=
          math.pi; // Flip text orientation for the bottom half of the circle
    }

    canvas.save();
    canvas.translate(textX, textY);
    canvas.rotate(textRotation);

    textPainter.paint(
        canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomCircularProgressIndicatorPainter oldDelegate) {
    return oldDelegate.tealPercentage != tealPercentage ||
        oldDelegate.orangePercentage != orangePercentage ||
        oldDelegate.redPercentage != redPercentage;
  }
}