import 'package:fait/source/views/fitness/widgets/taps_exercise_widget.dart';
import 'package:fait/source/views/fitness/widgets/title_date_program.dart';
import 'package:fait/utils/transitions/Fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/exercise_card_widget.dart';
import 'exercise_muscles_screen.dart';
import 'exercise_overview_screen.dart';

// ignore_for_file: must_be_immutable
class ExerciseScreen extends StatelessWidget {
  ExerciseScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.h, vertical: 22.v),
                  child: Column(children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        child: _buildSetNoMuscle(context,
                            setText: "Set 1", setText1: "Quads & Back")),
                    SizedBox(height: 30.v),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => ExerciseCardWidget(),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 32.v),
                        itemCount: 2),
                    SizedBox(height: 39.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        child: _buildSetNoMuscle(context,
                            setText: "Set 2", setText1: "Butt & Lower Back")),
                    SizedBox(height: 30.v),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => ExerciseCardWidget(),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 32.v),
                        itemCount: 3),
                  ]),
                ),
              ],
            ),
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

  /// Common widget
  Widget _buildSetNoMuscle(
    BuildContext context, {
    required String setText,
    required String setText1,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(setText,
          style: CustomTextStyles.headlineLargeSemiBold.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(1))),
      Padding(
          padding: EdgeInsets.only(top: 9.v),
          child: Text(setText1,
              style: CustomTextStyles
                  .headlineSmallRobotoOnPrimaryContainerRegular
                  .copyWith(
                      color: theme.colorScheme.onPrimaryContainer
                          .withOpacity(0.75))))
    ]);
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
}
