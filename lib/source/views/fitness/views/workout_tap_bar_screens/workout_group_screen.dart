import 'package:fait/source/api/api_response.dart';
import 'package:fait/source/models/fitness/fitness_plan_workout_model.dart';
import 'package:fait/source/views/fitness/views/workout_tap_bar_screens/workout_muscles_screen.dart';
import 'package:fait/source/views/fitness/views/workout_tap_bar_screens/workout_overview_screen.dart';
import 'package:fait/source/views/fitness/views/workout_tap_bar_screens/workout_screen.dart';
import 'package:fait/source/views/fitness/widgets/title_date_program.dart';
import 'package:fait/source/widgets/custome_slide_segmented_control_widget.dart';
import 'package:fait/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/fitness/fitness_plan_provider.dart';

// Define enum for different views
enum ProgramView {
  Overview,
  Workout,
  Muscles,
}

// Create a StateProvider for managing the current view
final currentViewProvider =
    StateProvider<ProgramView>((ref) => ProgramView.Overview);

class WorkoutGroupScreen extends ConsumerStatefulWidget {
  final int fitnessPlanId;
  const WorkoutGroupScreen({super.key, required this.fitnessPlanId});

  @override
  ConsumerState<WorkoutGroupScreen> createState() => _WorkoutGroupScreenState();
}

class _WorkoutGroupScreenState extends ConsumerState<WorkoutGroupScreen>
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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(fitnessPlanProvider)
          .getFitnessPlanOverview(widget.fitnessPlanId);
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentView = ref.watch(currentViewProvider);
    final fitnessPlanViewModel = ref.watch(fitnessPlanProvider);
    return SafeArea(
      child: Scaffold(
        body: fitnessPlanViewModel.fitnessPlanOverviewResponse.status !=
                Status.completed
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
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
                      TitleDateProgram(
                        buildText: fitnessPlanViewModel
                            .fitnessPlanOverviewResponse.data!.name!
                            .split(" ")[0],
                        yourBodyText: fitnessPlanViewModel
                                    .fitnessPlanOverviewResponse.data!.name!
                                    .split(" ")
                                    .length >
                                1
                            ? fitnessPlanViewModel
                                .fitnessPlanOverviewResponse.data!.name!
                                .split(" ")[1]
                            : "",
                        dateText: "AUG",
                        dateNumberText: "21-25",
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
                            child: CustomSlideSegmentedControl<ProgramView>(
                              children: {
                                ProgramView.Overview: Padding(
                                  padding: EdgeInsets.all(12.h),
                                  child: Text(
                                    "Overview",
                                    style: theme.textTheme.titleLarge!,
                                  ),
                                ),
                                ProgramView.Workout: Padding(
                                  padding: EdgeInsets.all(12.h),
                                  child: Text(
                                    "Workout",
                                    style: theme.textTheme.titleLarge!,
                                  ),
                                ),
                                ProgramView.Muscles: Padding(
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
                                  ref.read(currentViewProvider.notifier).state =
                                      value;
                                  _animationController.forward(from: 0);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      if (currentView == ProgramView.Overview)
                        SizedBox(height: 64.v),
                      if (currentView == ProgramView.Workout)
                        SizedBox(height: 30.v),
                      if (currentView == ProgramView.Muscles)
                        SizedBox(height: 32.v),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 800),
                        child: _buildView(currentView, widget.fitnessPlanId),
                      ),
                      SizedBox(height: 5.v),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  // Widget to build the current view based on the selected program
  Widget _buildView(ProgramView view, int fitnessPlanId) {
    switch (view) {
      case ProgramView.Overview:
        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          ),
          child: const WorkoutOverviewScreen(),
        );
      case ProgramView.Workout:
        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          ),
          child: WorkoutScreen(
            // fitnessPlanId: fitnessPlanId,
            workouts: workouts,
          ),
        );
      case ProgramView.Muscles:
        return FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          ),
          child: WorkoutMusclesScreen(
            fitnessPlanId: fitnessPlanId,
          ),
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

List<FitnessPlanWorkoutModel> workouts = [
  FitnessPlanWorkoutModel(
    workoutId: 1,
    name: "Workout 1",
    numberOfExercises: 5,
    // playDate: "09-04-2024",
    calories: 350,
    durationInMinutes: 40,
    image: "https://cdn.jefit.com/uc/file/c9cdcb837c0ed515/1.jpg",
  ),
];
