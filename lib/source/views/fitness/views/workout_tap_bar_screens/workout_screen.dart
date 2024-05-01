import 'package:fait/source/views/fitness/views/exercise_tap_bar_screens/exercise_group_screen.dart';
import 'package:fait/source/views/fitness/widgets/workout_card.dart';
import 'package:fait/source/views/fitness/widgets/workout_chart.dart';
import 'package:fait/utils/transitions/Fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';

// ignore_for_file: must_be_immutable
class WorkoutScreen extends StatelessWidget {
  final int fitnessPlanId;
  const WorkoutScreen({super.key, required this.fitnessPlanId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22.h),
              child: Column(
                children: [
                  _buildChart(context),
                  SizedBox(height: 31.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgTelevisionPrimary,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            margin: EdgeInsets.only(top: 1.v, bottom: 3.v)),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text("Current Workout",
                              style:
                                  CustomTextStyles.headlineSmallRobotoSemiBold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.v),
                  WorkoutCard(
                    onTap: () {
                      onTapWorkoutCard(context);
                    },
                    imagePath: ImageConstant.imgThumbsUpOnprimarycontainer,
                    title: "Full Body A",
                    date: "Nov 16",
                    exercises: "3 exercises",
                    textKg: "3 281 kg",
                    duration: "32 min",
                  ),
                  SizedBox(height: 32.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Program Workouts",
                          style: CustomTextStyles.headlineSmallRobotoSemiBold)),
                  SizedBox(height: 30.v),
                  WorkoutCard(
                    onTap: () {
                      onTapWorkoutCard(context);
                    },
                    imagePath: ImageConstant.imgThumbsUpOnprimarycontainer,
                    title: "Full Body A",
                    date: "Nov 16",
                    exercises: "3 exercises",
                    textKg: "3 281 kg",
                    duration: "32 min",
                  ),
                  SizedBox(height: 24.v),
                  WorkoutCard(
                    onTap: () {
                      onTapWorkoutCard(context);
                    },
                    imagePath: ImageConstant.imgInbox,
                    title: "Pull Workout",
                    date: "Nov 14",
                    exercises: "1  exercise",
                    textKg: "94 kg",
                    duration: "15 min",
                  ),
                  SizedBox(height: 24.v),
                  WorkoutCard(
                    imagePath: ImageConstant.imgInbox,
                    title: "Full Body A",
                    date: "Nov 16",
                    exercises: "3 exercises",
                    textKg: "3 281 kg",
                    duration: "32 min",
                  ),
                  SizedBox(height: 24.v),
                  WorkoutCard(
                    imagePath: ImageConstant.imgInbox,
                    title: "Pull Workout",
                    date: "Nov 14",
                    exercises: "1  exercise",
                    textKg: "94 kg",
                    duration: "15 min",
                  ),
                  SizedBox(height: 24.v),
                  WorkoutCard(
                    imagePath: ImageConstant.imgInbox,
                    title: "Full Body A",
                    date: "Nov 16",
                    exercises: "3 exercises",
                    textKg: "3 281 kg",
                    duration: "32 min",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildChart(BuildContext context) {
    return const WorkoutChartWidget();
  }

  /// Common widget
  Widget _buildDayCard1(
    BuildContext context, {
    required String dynamicText1,
    required String dynamicText2,
    Function? onTapDayCard1,
  }) {
    return GestureDetector(
      onTap: () {
        onTapDayCard1!.call();
      },
      child: Column(
        children: [
          Text(
            dynamicText1,
            style: CustomTextStyles.titleMediumBlack900.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
            ),
          ),
          SizedBox(height: 7.v),
          Text(
            dynamicText2,
            style: CustomTextStyles.bodyLargeOnPrimaryContainer_2.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the workoutActiveTabContainerScreen when the action is triggered.
  onTapDayCard(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.workoutActiveTabContainerScreen);
  }

  /// Navigates to the workoutActiveTabContainerScreen when the action is triggered.
  onTapDayCard1(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.workoutActiveTabContainerScreen);
  }

  /// Navigates to the workoutActiveTabContainerScreen when the action is triggered.
  onTapDayCard2(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.workoutActiveTabContainerScreen);
  }

  /// Navigates to the workoutActiveTabContainerScreen when the action is triggered.
  onTapDayCard3(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.workoutActiveTabContainerScreen);
  }

  /// Navigates to the workoutActiveTabContainerScreen when the action is triggered.
  onTapDayCard4(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.workoutActiveTabContainerScreen);
  }

  /// Navigates to the workoutActiveTabContainerScreen when the action is triggered.
  onTapDayCard5(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.workoutActiveTabContainerScreen);
  }

  /// Navigates to the workoutActiveTabContainerScreen when the action is triggered.
  onTapDayCard6(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.workoutActiveTabContainerScreen);
  }

  /// Navigates to the overviewOneScreen when the action is triggered.
  onTapWorkoutCard(BuildContext context) {
    Navigator.push(
      context,
      FadePageRouteBuilder(
        page: const ExerciseGroupScreen(),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  /// Navigates to the overviewOneScreen when the action is triggered.
  onTapWorkoutCard1(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.overviewOneScreen);
  }

  /// Navigates to the overviewOneScreen when the action is triggered.
  onTapWorkoutCard2(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.overviewOneScreen);
  }

  /// Navigates to the overviewOneScreen when the action is triggered.
  onTapWorkoutCard3(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.overviewOneScreen);
  }

  /// Navigates to the overviewOneScreen when the action is triggered.
  onTapWorkoutCard4(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.overviewOneScreen);
  }

  /// Navigates to the overviewOneScreen when the action is triggered.
  onTapWorkoutCard5(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.overviewOneScreen);
  }
}
