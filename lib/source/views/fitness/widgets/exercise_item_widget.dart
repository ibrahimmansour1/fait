import 'package:fait/source/models/fitness/exercise_response_body/exercise_response_body.dart';
import 'package:fait/source/providers/exercise/exercise_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../api/api_response.dart';
import '../views/exercise_info_screen.dart';
import 'exercise_card_widget.dart';

class ExerciseItemWidget extends StatelessWidget {
  final List<ExerciseResponseBody> exercises;
  const ExerciseItemWidget({
    super.key,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Consumer(
            builder: (context, ref, child) => ExerciseCardWidget(
              exerciseModel: exercises[index],
              replacable: false,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    builder: (_) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp)async {
                        ref
                            .watch(exerciseByIdOrNameProvider)
                            .getExerciseByIdOrName(id: exercises[index].id);
                      });
                      final exerciseByIdViewModel =  ref
                          .watch(exerciseByIdOrNameProvider)
                          .exerciseByIdOrNameResponse;
                      return exerciseByIdViewModel.status != Status.completed
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ExerciseInfoScreen(
                              tryIt: true,
                              exercise: exerciseByIdViewModel.data!,
                            );
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}
