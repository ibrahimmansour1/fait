import 'package:fait/source/models/workout/workout_exercises_body/workout_exercises_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/toast_message.dart';
import '../../api/api_response.dart';
import '../../models/fitness/muscle_model.dart';
import '../../models/workout/workout_response_body/workout_response_body.dart';
import '../../services/workout/workout_service.dart';

final workoutProvider = ChangeNotifierProvider<WorkoutNotifier>((ref) {
  return WorkoutNotifier(ref);
});

final workoutExerciseProvider =
    ChangeNotifierProvider<WorkoutExerciseNotifier>((ref) {
  return WorkoutExerciseNotifier(ref);
});

class WorkoutNotifier extends ChangeNotifier {
  final Ref ref;
  late ApiResponse<WorkoutResponseBody> workoutResponse;
  late ApiResponse<List<MuscleModel>> workoutMusclesResponse;
  final _workoutService = WorkoutService();
  WorkoutNotifier(this.ref) {
    workoutResponse = ApiResponse.loading("Loading");
    workoutMusclesResponse = ApiResponse.loading("Loading");
  }

  ApiResponse<WorkoutResponseBody> getWorkoutById({int? id}) {
    workoutResponse = ApiResponse.loading("Loading");
    notifyListeners();
    _workoutService.getWorkoutById(id: id).then((value) {
      if (value.status == Status.completed) {
        workoutResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        workoutResponse = value;
      }
      notifyListeners();
    });
    return workoutResponse;
  }

  ApiResponse<List<MuscleModel>> getWorkoutMuscles(int workoutId) {
    workoutMusclesResponse = ApiResponse.loading("Loading");
    notifyListeners();
    _workoutService.getWorkoutMuscles(workoutId).then((value) {
      if (value.status == Status.completed) {
        workoutMusclesResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        workoutMusclesResponse = value;
      }
      notifyListeners();
    });
    return workoutMusclesResponse;
  }

  // TODO: Just for testing
  generateMusclesDummyData() {
    workoutMusclesResponse = ApiResponse.completed(
      List.generate(
        10,
        (index) => index % 2 == 0
            ? MuscleModel(name: "Muscle $index", isMain: true)
            : MuscleModel(name: "Muscle $index", isMain: false),
      ),
    );
    notifyListeners();
  }
}

class WorkoutExerciseNotifier extends ChangeNotifier {
  final Ref ref;
  late ApiResponse<WorkoutExercisesBody> workoutExerciseResponse;
  final _workoutService = WorkoutService();
  WorkoutExerciseNotifier(this.ref) {
    workoutExerciseResponse = ApiResponse.loading("Loading");
  }

  ApiResponse<WorkoutExercisesBody> getWorkoutExercisesById({int? id}) {
    workoutExerciseResponse = ApiResponse.loading("Loading");
    notifyListeners();
    _workoutService.getWorkoutExercisesById(id: id).then((value) {
      if (value.status == Status.completed) {
        workoutExerciseResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        workoutExerciseResponse = value;
      }
      notifyListeners();
    });
    return workoutExerciseResponse;
  }
}
