import 'package:fait/source/views/fitness/views/exercise_muscles_screen.dart';
import 'package:fait/source/views/fitness/views/exercise_overview_screen.dart';
import 'package:fait/source/views/fitness/widgets/taps_exercise_widget.dart';
import 'package:fait/source/views/fitness/widgets/title_date_program.dart';
import 'package:fait/source/views/fitness/widgets/workout_card.dart';
import 'package:fait/utils/transitions/Fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore_for_file: must_be_immutable
class ExerciseScreen extends StatelessWidget {
  ExerciseScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 36.v),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowLeft,
                height: 24.v,
                width: 16.h,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16.h),
                onTap: () {
                  onTapImgArrowLeft(context);
                },
              ),
              SizedBox(height: 27.v),
              const TitleDateProgram(
                buildText: "Chest",
                yourBodyText: "and legs",
                dateText: "AUG",
                dateNumberText: "21",
              ),
              SizedBox(height: 30.v),
              _buildTaps(context),
              SizedBox(height: 48.v),
              Expanded(
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
                                  margin:
                                      EdgeInsets.only(top: 1.v, bottom: 3.v)),
                              Padding(
                                padding: EdgeInsets.only(left: 10.h),
                                child: Text("Current Workout",
                                    style: CustomTextStyles
                                        .headlineSmallRobotoSemiBold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.v),
                        WorkoutCard(
                          onTap: () {
                            // onTapWorkoutCard(context);
                          },
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
                                style: CustomTextStyles
                                    .headlineSmallRobotoSemiBold)),
                        SizedBox(height: 30.v),
                        WorkoutCard(
                          onTap: () {
                            // onTapWorkoutCard(context);
                          },
                          title: "Full Body A",
                          date: "Nov 16",
                          exercises: "3 exercises",
                          textKg: "3 281 kg",
                          duration: "32 min",
                        ),
                        SizedBox(height: 24.v),
                        WorkoutCard(
                          onTap: () {
                            // onTapWorkoutCard(context);
                          },
                          title: "Pull Workout",
                          date: "Nov 14",
                          exercises: "1  exercise",
                          textKg: "94 kg",
                          duration: "15 min",
                        ),
                        SizedBox(height: 24.v),
                        const WorkoutCard(
                          title: "Full Body A",
                          date: "Nov 16",
                          exercises: "3 exercises",
                          textKg: "3 281 kg",
                          duration: "32 min",
                        ),
                        SizedBox(height: 24.v),
                        const WorkoutCard(
                          title: "Pull Workout",
                          date: "Nov 14",
                          exercises: "1  exercise",
                          textKg: "94 kg",
                          duration: "15 min",
                        ),
                        SizedBox(height: 24.v),
                        const WorkoutCard(
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
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTaps(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          TapsExerciseWidget(
        onValueChanged: (value) {
          if (value != null) {
            ref.read(infoExerciseProvider.notifier).state = value;
            switch (value) {
              case InfoExercise.Overview:
                onTapTxtOverview(context);
                break;
              case InfoExercise.Muscles:
                onTapTxtMuscles(context);
                break;
              default:
                // Handle other cases if needed
                break;
            }
          }
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildChart(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        children: [
          CustomImageView(
              // imagePath: ImageConstant.imgChartPart,
              height: 52.v,
              width: 344.h),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      onTapDayCard(context);
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sat",
                              style: CustomTextStyles.titleMediumBlack900),
                          SizedBox(height: 7.v),
                          Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text("21",
                                style: CustomTextStyles
                                    .bodyLargeOnPrimaryContainer_2),
                          ),
                        ])),
                _buildDayCard1(
                  context,
                  dynamicText1: "Sun",
                  dynamicText2: "22",
                  onTapDayCard1: () {
                    onTapDayCard1(context);
                  },
                ),
                _buildDayCard(
                  context,
                  dynamicText1: "Mon",
                  dynamicText2: "23",
                  onTapDayCard: () {
                    onTapDayCard2(context);
                  },
                ),
                GestureDetector(
                  onTap: () {
                    onTapDayCard3(context);
                  },
                  child: Column(
                    children: [
                      Text("Tue", style: CustomTextStyles.titleMediumBlack900),
                      SizedBox(height: 7.v),
                      Text("24",
                          style:
                              CustomTextStyles.bodyLargeOnPrimaryContainer_2),
                    ],
                  ),
                ),
                _buildDayCard(
                  context,
                  dynamicText1: "Wed",
                  dynamicText2: "25",
                  onTapDayCard: () {
                    onTapDayCard4(context);
                  },
                ),
                _buildDayCard1(
                  context,
                  dynamicText1: "Thu",
                  dynamicText2: "26",
                  onTapDayCard1: () {
                    onTapDayCard5(context);
                  },
                ),
                GestureDetector(
                  onTap: () {
                    onTapDayCard6(context);
                  },
                  child: Column(
                    children: [
                      Text("Fri", style: CustomTextStyles.titleMediumBlack900),
                      SizedBox(height: 7.v),
                      Text("27",
                          style: CustomTextStyles.bodyLargeOnPrimaryContainer_2)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildDayCard(
    BuildContext context, {
    required String dynamicText1,
    required String dynamicText2,
    Function? onTapDayCard,
  }) {
    return GestureDetector(
      onTap: () {
        onTapDayCard!.call();
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

  /// Navigates to the workoutmusclesScreen when the action is triggered.
  onTapTxtOverview(BuildContext context) {
    Navigator.push(
      context,
      FadePageRouteBuilder(
        page: const ExerciseOverviewScreen(),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  /// Navigates to the workoutMusclesScreen when the action is triggered.
  onTapTxtMuscles(BuildContext context) {
    Navigator.push(
      context,
      FadePageRouteBuilder(
        page: ExerciseMusclesScreen(),
        duration: const Duration(milliseconds: 800),
      ),
    );
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
        page: const ExerciseOverviewScreen(),
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
