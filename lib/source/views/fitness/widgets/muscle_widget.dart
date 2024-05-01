import 'package:flutter/material.dart';

import '../../../../utils/app_export.dart';

class MuscleWidget extends StatelessWidget {
  const MuscleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: appTheme.blueA40003,
      radius: 60.adaptSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomImageView(
              imagePath: ImageConstant.imgMuscleImage,
              color: "isMain" == true ? appTheme.yellow900 : appTheme.brown900,
              height: 70.adaptSize,
              width: 70.adaptSize),
          Text("Name",
              style: "isMain" == true
                  ? CustomTextStyles.titleLargeYellow900
                  : CustomTextStyles.titleLargeBrown900),
        ],
      ),
    );
  }
}
