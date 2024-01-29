import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(0, size.height * 0.004605765);
    path_0.cubicTo(
        0,
        size.height * 0.006894727,
        size.width * 0.0008184579,
        size.height * 0.009079426,
        size.width * 0.002257336,
        size.height * 0.01063123);
    path_0.lineTo(size.width * 0.1474224, size.height * 0.1671891);
    path_0.cubicTo(
        size.width * 0.1669643,
        size.height * 0.1882648,
        size.width * 0.1923804,
        size.height * 0.2003350,
        size.width * 0.2189547,
        size.height * 0.2011604);
    path_0.lineTo(size.width * 0.7725584, size.height * 0.2183560);
    path_0.cubicTo(size.width * 0.8991355, size.height * 0.2222874, size.width,
        size.height * 0.3434126, size.width, size.height * 0.4914836);
    path_0.lineTo(size.width, size.height * 1.002732);
    path_0.lineTo(0, size.height * 1.002732);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff262444).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}