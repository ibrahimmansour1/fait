import 'package:fait/source/theme/theme_helper.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

class CustomStepProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const CustomStepProgressIndicator({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22, // Set the height of the first step
      child: Row(
        children: List.generate(totalSteps, (index) {
          final double stepHeight = _calculateStepHeight(index);
          return Row(
            children: [
              Container(
                width: 4, // Set the width of each step
                height: stepHeight,
                decoration: BoxDecoration(
                  color: index <= currentStep - 1
                      ? theme.colorScheme.primary
                      : appTheme.blueGray10001,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              if (index < totalSteps - 1)
                SizedBox(
                  width: 3.h,
                ),
            ],
          );
        }),
      ),
    );
  }

  double _calculateStepHeight(int index) {
    // Define your logic for step height based on the step's position
    const double firstStepHeight = 22.0;
    const double subsequentStepHeight = 14.0;

    if (index == 0) {
      return firstStepHeight; // Height for the first step
    } else {
      final int groupNumber = index ~/ 1;
      return (groupNumber % 5 != 0) ? subsequentStepHeight : firstStepHeight;
    }
  }
}
