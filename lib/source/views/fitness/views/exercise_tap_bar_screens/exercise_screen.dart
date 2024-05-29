import 'package:fait/source/models/fitness/exercise_response_body/exercise_response_body.dart';
import 'package:flutter/material.dart';
import 'package:fait/utils/app_export.dart';
import '../../widgets/exercise_card_widget.dart';
import '../exercise_info_screen.dart';

// ignore_for_file: must_be_immutable
class ExerciseScreen extends StatelessWidget {
  ExerciseScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 22.v),
            child: Column(children: [
              //  ListView.separated(
              //         shrinkWrap: true,
              //         itemBuilder: (context, index) {
              //           final FitnessPlanWorkoutModel workout =
              //               widget.workouts[index];
              //           return WorkoutCard(
              //             onTap: () {
              //               onTapWorkoutCard(context);
              //             },
              //             imagePath: ImageConstant.imgInbox,
              //             title: workout.name!,
              //             date: DateFormat('MMM dd')
              //                 .format(DateTime.parse(workout.playDate!)),
              //             exercises: "${workout.numberOfExercises} exercise",
              //             textKg: "${workout.weightLifted} kg",
              //             duration: "${workout.durationInMinutes} min",
              //           );
              //         },
              //         separatorBuilder: (context, index) =>
              //             SizedBox(height: 24.v),
              //         itemCount: widget.workouts.length),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ExerciseCardWidget(
                  exerciseModel: exercises[index],
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        useRootNavigator: true,
                        isScrollControlled: true,
                        builder: (_) => ExerciseInfoScreen(
                              tryIt: true,
                            ));
                  },
                ),
                separatorBuilder: (context, index) => SizedBox(height: 32.v),
                itemCount: exercises.length,
              ),
              SizedBox(height: 39.v),
            ]),
          ),
        ],
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
}

List<ExerciseResponseBody> exercises = [
  ExerciseResponseBody(
    id: 1,
    name: "Dumbbell Plie Squat",
    image: "https://cdn.jefit.com/assets/img/exercises/thumbnails/v2/213a.jpg",
    isInFavorite: true,
    steps: 4,
  ),
  ExerciseResponseBody(
    id: 2,
    name: "Dumbbell Deadlift",
    image: "https://cdn.jefit.com/assets/img/exercises/thumbnails/v2/193a.jpg",
    isInFavorite: false,
    steps: 4,
  ),
  ExerciseResponseBody(
    id: 3,
    name: "Dumbbell Incline Row",
    image: "https://cdn.jefit.com/assets/img/exercises/thumbnails/v2/1040a.jpg",
    isInFavorite: true,
    steps: 4,
  ),
  ExerciseResponseBody(
    id: 4,
    name: "Dumbbell Incline Press",
    image: "https://cdn.jefit.com/assets/img/exercises/thumbnails/v2/31a.jpg",
    isInFavorite: true,
    steps: 4,
  ),
  ExerciseResponseBody(
    id: 5,
    name: "Dumbbell Lateral Raise",
    image: "https://cdn.jefit.com/assets/img/exercises/thumbnails/v2/33a.jpg",
    isInFavorite: false,
    steps: 4,
  ),
  ExerciseResponseBody(
    id: 6,
    name: "Cable Trice Pushdown (Rope)",
    image: "https://cdn.jefit.com/assets/img/exercises/thumbnails/v2/159a.jpg",
    isInFavorite: true,
    steps: 4,
  ),
  ExerciseResponseBody(
    id: 7,
    name: "Bench Weighted Crunch",
    image: "https://cdn.jefit.com/assets/img/exercises/thumbnails/v2/675a.jpg",
    isInFavorite: true,
    steps: 4,
  ),
  ExerciseResponseBody(
    id: 8,
    name: "Forearm Plank with Hip",
    image: "https://cdn.jefit.com/assets/img/exercises/thumbnails/v2/628a.jpg",
    isInFavorite: false,
    steps: 4,
  ),
  ExerciseResponseBody(
    id: 9,
    name: "Dumbbell Shoulder Press",
    image: "https://cdn.jefit.com/assets/img/exercises/thumbnails/v2/884a.jpg",
    isInFavorite: true,
    steps: 4,
  ),
];
