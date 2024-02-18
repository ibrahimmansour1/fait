import 'package:fait/source/views/fitness/views/exercise_tap_bar_screens/exercise_muscles_screen.dart';
import 'package:fait/source/views/fitness/views/exercise_tap_bar_screens/exercise_overview_screen.dart';
import 'package:fait/source/views/fitness/views/exercise_tap_bar_screens/exercise_screen.dart';
import 'package:fait/source/views/fitness/widgets/title_date_program.dart';
import 'package:fait/source/widgets/custome_slide_segmented_control_widget.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define enum for different views
enum ExerciseView {
  Overview,
  Exercise,
  Muscles,
}

// Create a StateProvider for managing the current view
final currentViewExerciseProvider =
    StateProvider<ExerciseView>((ref) => ExerciseView.Overview);

class ExerciseGroupScreen extends ConsumerStatefulWidget {
  const ExerciseGroupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ExerciseGroupScreen> createState() =>
      _ExerciseGroupScreenState();
}

class _ExerciseGroupScreenState extends ConsumerState<ExerciseGroupScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    // Trigger animation when the page is first loaded
    _animationController.forward(from: 0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentView = ref.watch(currentViewExerciseProvider);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 36.v),
          child: SingleChildScrollView(
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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 14.h,
                      left: 14.h,
                    ),
                    child: SizedBox(
                      height: 60.v,
                      width: 480.h,
                      child: CustomSlideSegmentedControl<ExerciseView>(
                        children: {
                          ExerciseView.Overview: Padding(
                            padding: EdgeInsets.all(12.h),
                            child: Text(
                              "Overview",
                              style: theme.textTheme.titleLarge!,
                            ),
                          ),
                          ExerciseView.Exercise: Padding(
                            padding: EdgeInsets.all(12.h),
                            child: Text(
                              "Exercise",
                              style: theme.textTheme.titleLarge!,
                            ),
                          ),
                          ExerciseView.Muscles: Padding(
                            padding: EdgeInsets.all(12.h),
                            child: Text(
                              "Muscles",
                              style: theme.textTheme.titleLarge!,
                            ),
                          ),
                        },
                        thumbColor: theme.colorScheme.primary,
                        backgroundColor: appTheme.transparent,
                        groupValue: currentView,
                        onValueChanged: (value) {
                          if (value != null) {
                            ref
                                .read(currentViewExerciseProvider.notifier)
                                .state = value;
                            _animationController.forward(from: 0);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                if (currentView == ExerciseView.Overview)
                  SizedBox(height: 64.v),
                if (currentView == ExerciseView.Muscles) SizedBox(height: 32.v),
                _buildView(currentView),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build the current view based on the selected program
  Widget _buildView(ExerciseView view) {
    switch (view) {
      case ExerciseView.Overview:
        return const ExerciseOverviewScreen();
      case ExerciseView.Exercise:
        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          ),
          child: ExerciseScreen(),
        );
      case ExerciseView.Muscles:
        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          ),
          child: const ExerciseMusclesScreen(),
        );
      default:
        return Container();
    }
  }

  // Navigate back to the previous screen
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
