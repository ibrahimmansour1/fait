import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

import '../../widgets/muscle_widget.dart';

// ignore_for_file: must_be_immutable
class ExerciseMusclesScreen extends StatelessWidget {
  const ExerciseMusclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 60.h, right: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Main", style: CustomTextStyles.titleLargeYellow900),
              Text(
                "Secondary",
                style: CustomTextStyles.titleLargeBrown900,
              ),
            ],
          ),
        ),
        SizedBox(height: 30.v),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMusclesList(),
              Container(
                width: 1.h,
                height: mediaQueryData.size.height * 0.5,
                decoration: const BoxDecoration(color: Colors.white),
              ),
              _buildMusclesList(),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox _buildMusclesList() {
    return SizedBox(
      width: mediaQueryData.size.width * 0.4,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => SizedBox(height: 10.h),
          separatorBuilder: (context, index) {
            return const MuscleWidget();
          },
          itemCount: 5),
    );
  }
}
