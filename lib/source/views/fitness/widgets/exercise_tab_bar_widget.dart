import 'package:fait/source/api/api_response.dart';
import 'package:fait/source/providers/exercise/exercise_provider.dart';
import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(exerciseProvider).getExercises();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final exerciseViewModel = ref.watch(exerciseProvider).exerciseResponse;

    return exerciseViewModel.status != Status.completed
        ? const Center(child: CircularProgressIndicator())
        : Column(
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
                          builder: (_) => ExercisesFilterScreen());
                    },
                    child: const Icon(
                      Icons.filter_alt_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Text("Exercises",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.fSize,
                  )),
              SizedBox(height: 20.h),
              // TODO: after make provider
              ExerciseItemWidget(
                exercises: exerciseViewModel.data!,
              ),
            ],
          );
  }
}
