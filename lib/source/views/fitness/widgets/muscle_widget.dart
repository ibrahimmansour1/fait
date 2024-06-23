import 'package:fait/source/models/fitness/muscle_model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_export.dart';

class MuscleWidget extends StatelessWidget {
  final MuscleModel muscleModel;
  const MuscleWidget({
    super.key,
    required this.muscleModel,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      radius: 60.adaptSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomImageView(
              imagePath: muscleModel.image ?? ImageConstant.imgMuscleImage,
              color:
                  muscleModel.isMain! ? appTheme.yellow900 : appTheme.brown900,
              height: 70.adaptSize,
              width: 70.adaptSize),
          Text(muscleModel.name ?? "Name",
              style: muscleModel.isMain!
                  ? CustomTextStyles.titleLargeYellow900
                  : CustomTextStyles.titleLargeBrown900),
        ],
      ),
    );
  }
}
