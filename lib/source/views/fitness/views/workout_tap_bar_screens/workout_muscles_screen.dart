import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

// ignore_for_file: must_be_immutable
class WorkoutMusclesScreen extends StatelessWidget {
  WorkoutMusclesScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
            imagePath: ImageConstant.imgMusclesImage,
            height: 424.v,
            width: 224.h),
        SizedBox(height: 30.v),
        Padding(
          padding: EdgeInsets.only(left: 34.h, right: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Rested", style: CustomTextStyles.titleLargeLightblue400),
              Text("Tired", style: CustomTextStyles.titleLargeYellow900),
            ],
          ),
        ),
      ],
    );
  }
}
