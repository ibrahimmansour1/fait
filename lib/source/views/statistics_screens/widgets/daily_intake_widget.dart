import 'package:fait/source/theme/theme_helper.dart';
import 'package:fait/source/views/statistics_screens/widgets/daily_intake_item_widget.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';

Widget DailyIntake(BuildContext context) {
  List<Map<String, dynamic>> dailyIntakeData = [
    {
      "text": "Carb",
      "textGram": "100g",
      "textPercentage": "72%",
      "color": appTheme.blue50001
    },
    {
      "text": "Protein",
      "textGram": "90g",
      "textPercentage": "40%",
      "color": appTheme.deepPurple40001
    },
    {
      "text": "Fat",
      "textGram": "100g",
      "textPercentage": "68%",
      "color": appTheme.cyan20001
    },
  ];
  return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 2.v);
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return DailyintakeItemWidget(
              text: dailyIntakeData[index]["text"] ?? "",
              textGram: dailyIntakeData[index]["textGram"] ?? "",
              textPercentage: dailyIntakeData[index]["textPercentage"] ?? "",
              color: dailyIntakeData[index]["color"] ?? appTheme.blue50001,
            );
          }));
}
