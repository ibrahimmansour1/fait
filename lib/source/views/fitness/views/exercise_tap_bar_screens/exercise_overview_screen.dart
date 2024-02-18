import 'package:fait/source/views/fitness/widgets/overview_percentages_widget.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:fait/source/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class ExerciseOverviewScreen extends StatefulWidget {
  const ExerciseOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ExerciseOverviewScreen> createState() => _ExerciseOverviewScreenState();
}

class _ExerciseOverviewScreenState extends State<ExerciseOverviewScreen> {
  bool isButtonSelect = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const OverviewPercentagesWidget(
            cardioText: "Cardio",
            cardioPercentageText: "18 %",
            strengthText: "Strength",
            strengthPercentageText: "53 %",
            stretchText: "Stretch",
            stretchPercentageText: "35 %",
            cardioPercentageIndicator: 18,
            strengthPercentageIndicator: 53,
            stretchPercentageIndicator: 35,
          ),
          SizedBox(height: 73.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 41.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: 178.h,
                      margin: EdgeInsets.only(left: 6.h, right: 4.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconButton(
                            height: 48.adaptSize,
                            width: 48.adaptSize,
                            padding: EdgeInsets.all(12.h),
                            decoration: IconButtonStyleHelper.fillBlueGray,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgLightning,
                            ),
                          ),
                          CustomIconButton(
                            height: 48.adaptSize,
                            width: 48.adaptSize,
                            padding: EdgeInsets.all(12.h),
                            decoration: IconButtonStyleHelper.fillBlueGray,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgLiftedImage,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 22.v),
                    SizedBox(
                      width: 188.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "450",
                                        style:
                                            CustomTextStyles.titleLargeBold,
                                      ),
                                      const TextSpan(text: " "),
                                      TextSpan(
                                        text: "cal",
                                        style:
                                            CustomTextStyles.titleLargeBold,
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left),
                              SizedBox(height: 7.v),
                              Text("Burned",
                                  style: CustomTextStyles
                                      .bodyLargeOnPrimaryContainer_2),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4.v),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "148",
                                            style: CustomTextStyles
                                                .titleLargeBold),
                                        const TextSpan(text: " "),
                                        TextSpan(
                                            text: "kg",
                                            style: CustomTextStyles
                                                .titleLargeBold),
                                      ],
                                    ),
                                    textAlign: TextAlign.left),
                                SizedBox(height: 8.v),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: Text("Lifted",
                                      style: CustomTextStyles
                                          .bodyLargeOnPrimaryContainer_2),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 4.h),
                      child: CustomIconButton(
                        height: 48.adaptSize,
                        width: 48.adaptSize,
                        padding: EdgeInsets.all(12.h),
                        decoration: IconButtonStyleHelper.fillBlueGray,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgDurationImage,
                        ),
                      ),
                    ),
                    SizedBox(height: 25.v),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "50",
                              style: CustomTextStyles.titleLargeBold),
                          const TextSpan(text: " "),
                          TextSpan(
                              text: "min",
                              style: CustomTextStyles.titleLargeBold)
                        ]),
                        textAlign: TextAlign.left),
                    SizedBox(height: 10.v),
                    Text("Duration",
                        style:
                            CustomTextStyles.bodyLargeOnPrimaryContainer_2),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
  }
}
