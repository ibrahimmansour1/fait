import 'package:fait/source/views/statistics_screens/widgets/infocalories_item_widget.dart';
import 'package:fait/source/widgets/custom_icon_button.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

class infoCaloriesWidget extends StatelessWidget {
  const infoCaloriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> infoCaloriesData = [
      {
        "icon": ImageConstant.imgExercising,
        "decoration": IconButtonStyleHelper.fillDeepOrangeAF,
        "text": "260",
      },
      {
        "icon": ImageConstant.imgRunningIcon,
        "decoration": IconButtonStyleHelper.fillCustomPrimary,
        "text": "260",
      },
      {
        "icon": ImageConstant.imgRectangle,
        "decoration": IconButtonStyleHelper.fillRed3000,
        "text": "260",
      },
    ];
    return Row(
      children: [
        SizedBox(width: 15.h),
        Expanded(
          child: SizedBox(
            height: 150.v,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 16.h);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return InfoCaloriesItemWidget(
                  icon: infoCaloriesData[index]['icon'],
                  text: infoCaloriesData[index]['text'],
                  decoration: infoCaloriesData[index]['decoration'],
                );
              },
            ),
          ),
        ),
        SizedBox(width: 15.h),
      ],
    );
  }
}
