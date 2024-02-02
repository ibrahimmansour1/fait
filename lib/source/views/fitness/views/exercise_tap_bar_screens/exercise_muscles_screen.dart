import 'package:fait/source/views/fitness/widgets/taps_exercise_widget.dart';
import 'package:fait/source/views/fitness/widgets/title_date_program.dart';
import 'package:fait/utils/transitions/Fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'exercise_overview_screen.dart';
import 'exercise_screen.dart';

// ignore_for_file: must_be_immutable
class ExerciseMusclesScreen extends StatelessWidget {
  ExerciseMusclesScreen({Key? key}) : super(key: key);

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
              SizedBox(height: 32.v),
              CustomImageView(
                  imagePath: ImageConstant.imgMusclesImage,
                  height: 424.v,
                  width: 224.h),
              SizedBox(height: 30.v),
              Padding(
                padding: EdgeInsets.only(left: 34.h, right: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Rested",
                        style: CustomTextStyles.titleLargeLightblue400),
                    Text("Tired", style: CustomTextStyles.titleLargeYellow900),
                  ],
                ),
              ),
              SizedBox(height: 2.v),
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
              case InfoExercise.Exercise:
                onTapTxtExercise(context);
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

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the workoutOverviewScreen when the action is triggered.
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
  onTapTxtExercise(BuildContext context) {
    Navigator.push(
      context,
      FadePageRouteBuilder(
        page: ExerciseScreen(),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }
}
