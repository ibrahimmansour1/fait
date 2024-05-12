import 'package:fait/source/views/statistics_screens/widgets/custom_circle_progress_indicator_painter.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    Key? key,
    required this.tealPercentage,
    required this.orangePercentage,
    required this.redPercentage,
  }) : super(key: key);

  final double tealPercentage;
  final double orangePercentage;
  final double redPercentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.v,
      width: 200.h,
      child: CustomPaint(
        painter: CustomCircularProgressIndicatorPainter(
          tealPercentage: tealPercentage,
          orangePercentage: orangePercentage,
          redPercentage: redPercentage,
        ),
        child: Center(
          child: CustomImageView(
            imagePath: ImageConstant.imgContrast,
            height: 64.adaptSize,
            width: 64.adaptSize,
            margin: EdgeInsets.only(top: 33.v, bottom: 37.v),
          ),
        ),
      ),
    );
  }
}
