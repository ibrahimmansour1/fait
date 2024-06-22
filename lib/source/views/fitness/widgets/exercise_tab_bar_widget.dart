import 'package:fait/source/api/api_response.dart';
import 'package:fait/source/providers/exercise/exercise_provider.dart';
import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/fitness/exercise_response_body/exercise_response_body.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_search_view.dart';
import '../views/filter_screen/exercises_filter_screen.dart';
import '../views/fitness_screen.dart';
import 'exercise_item_widget.dart';

class ExerciseTabBarWidget extends ConsumerStatefulWidget {
  const ExerciseTabBarWidget({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  ConsumerState<ExerciseTabBarWidget> createState() =>
      _ExerciseTabBarWidgetState();
}

class _ExerciseTabBarWidgetState extends ConsumerState<ExerciseTabBarWidget> {
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     ref.watch(exerciseProvider).getExercises();
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final exerciseViewModel = ref.watch(exerciseProvider).exerciseResponse;

    // return exerciseViewModel.status != Status.completed
    //     ? const Center(child: CircularProgressIndicator())
    //     :
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
                child: CustomSearchView(
                    autofocus: false,
                    controller: widget.searchController,
                    hintText: "Search")),
            const SizedBox(width: 8),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    builder: (_) => const ExercisesFilterScreen());
              },
              child: Icon(
                Icons.filter_alt_rounded,
                color: theme.colorScheme.tertiary,
              ),
            )
          ],
        ),
        SizedBox(height: 20.h),
        Text("Exercises",
            style: TextStyle(
              color: theme.colorScheme.tertiary,
              fontSize: 32.fSize,
            )),
        SizedBox(height: 20.h),
        // TODO: after make provider
        ExerciseItemWidget(
          exercises: exercises,
          // exercises: exerciseViewModel.data!,
        ),
      ],
    );
  }
}

List<ExerciseResponseBody> exercises = [
  ExerciseResponseBody(
    id: 1,
    name: "Push Up",
    image:
        "https://images.squarespace-cdn.com/content/v1/58501b0cf5e23149e5589e12/1585601917653-J791ZN5ZWSK565NIZSS1/1_WZmDgcJO40Va5mVgdfbz7g%402x.jpeg",
    steps: 12,
    isInFavorite: true,
  ),
  ExerciseResponseBody(
    id: 2,
    name: "Squat",
    image:
        "https://static.strengthlevel.com/images/exercises/bodyweight-squat/bodyweight-squat-800.jpg",
    steps: 10,
    isInFavorite: false,
  ),
  ExerciseResponseBody(
    id: 3,
    name: "Plank",
    image: "https://fitnessprogramer.com/wp-content/uploads/2021/02/plank.gif",
    steps: 30,
    isInFavorite: true,
  ),
  ExerciseResponseBody(
    id: 4,
    name: "Lunges",
    image:
        "https://cdn.shopify.com/s/files/1/1497/9682/files/4.Split_Squat_Lunges.jpg?v=1672764672",
    steps: 8,
    isInFavorite: false,
  ),
  ExerciseResponseBody(
    id: 5,
    name: "Burpees",
    image:
        "https://thebaldbrothers.com/wp-content/uploads/2019/12/Burpees-How-to-.jpg.webp",
    steps: 15,
    isInFavorite: true,
  ),
  ExerciseResponseBody(
    id: 6,
    name: "Mountain Climbers",
    image:
        "https://i0.wp.com/muscu-street-et-crossfit.fr/wp-content/uploads/2022/06/Muscles-Mountain-Climber.002.jpeg?resize=1024%2C576&ssl=1",
    steps: 20,
    isInFavorite: false,
  ),
  ExerciseResponseBody(
    id: 7,
    name: "Jumping Jacks",
    image:
        "https://fitnessvolt.com/wp-content/uploads/2021/09/Star-Jumps-Muscles-Worked.jpg",
    steps: 25,
    isInFavorite: true,
  ),
];
