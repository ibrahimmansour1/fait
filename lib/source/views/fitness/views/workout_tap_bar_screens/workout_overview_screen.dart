import 'package:fait/source/views/fitness/widgets/overview_percentages_widget.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:fait/source/widgets/custom_elevated_button.dart';
import 'package:fait/source/widgets/custom_icon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/fitness/fitness_plan_provider.dart';

// ignore_for_file: must_be_immutable
class WorkoutOverviewScreen extends ConsumerStatefulWidget {
  const WorkoutOverviewScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WorkoutOverviewScreen> createState() =>
      _WorkoutOverviewScreenState();
}

class _WorkoutOverviewScreenState extends ConsumerState<WorkoutOverviewScreen> {
  bool isButtonSelect = true;

  @override
  Widget build(BuildContext context) {
    final fitnessPlanOverviewViewModel =
        ref.watch(fitnessPlanProvider).fitnessPlanOverviewResponse;
    return Column(
      children: [
        OverviewPercentagesWidget(
          cardioText: "Cardio",
          cardioPercentageText:
              "${fitnessPlanOverviewViewModel.data?.cardio} %",
          strengthText: "Strength",
          strengthPercentageText:
              "${fitnessPlanOverviewViewModel.data?.strength} %",
          stretchText: "Stretch",
          stretchPercentageText:
              "${fitnessPlanOverviewViewModel.data?.stretch} %",
          cardioPercentageIndicator:
              fitnessPlanOverviewViewModel.data?.cardio!.toDouble() ?? 0,
          strengthPercentageIndicator:
              fitnessPlanOverviewViewModel.data?.strength!.toDouble() ?? 0,
          stretchPercentageIndicator:
              fitnessPlanOverviewViewModel.data?.stretch!.toDouble() ?? 0,
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
                                      text:
                                          "${fitnessPlanOverviewViewModel.data?.caloriesBurned}",
                                      style: CustomTextStyles.titleLargeBold,
                                    ),
                                    const TextSpan(text: " "),
                                    TextSpan(
                                      text: "cal",
                                      style: CustomTextStyles.titleLargeBold,
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
                                          text:
                                              "${fitnessPlanOverviewViewModel.data?.weightLifted}",
                                          style:
                                              CustomTextStyles.titleLargeBold),
                                      const TextSpan(text: " "),
                                      TextSpan(
                                          text: "kg",
                                          style:
                                              CustomTextStyles.titleLargeBold),
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
                            text:
                                "${fitnessPlanOverviewViewModel.data?.duration}",
                            style: CustomTextStyles.titleLargeBold),
                        const TextSpan(text: " "),
                        TextSpan(
                            text: "min", style: CustomTextStyles.titleLargeBold)
                      ]),
                      textAlign: TextAlign.left),
                  SizedBox(height: 10.v),
                  Text("Duration",
                      style: CustomTextStyles.bodyLargeOnPrimaryContainer_2),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 70.v),
        CustomElevatedButton(
            onPressed: () {
              // setState(() {
              //   isButtonSelect = !isButtonSelect;
              // });
            },
            height: 48.v,
            width: 256.h,
            text: !isButtonSelect ? "Select this program" : "Selected",
            buttonStyle: !isButtonSelect
                ? CustomButtonStyles.fillPrimary
                : CustomButtonStyles.fillBlueGray),
      ],
    );
  }
}
