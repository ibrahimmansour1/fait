import 'package:fait/source/models/workout/workout_exercises_body/workout_exercises_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/toast_message.dart';
import '../../api/api_response.dart';
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
  final workoutService = WorkoutService();
  WorkoutNotifier(this.ref) {
    workoutResponse = ApiResponse.loading("Loading");
  }

  ApiResponse<WorkoutResponseBody> getWorkoutById({int? id}) {
    workoutResponse = ApiResponse.loading("Loading");
    notifyListeners();
    workoutService.getWorkoutById(id: id).then((value) {
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
}

class WorkoutExerciseNotifier extends ChangeNotifier {
  final Ref ref;
  late ApiResponse<WorkoutExercisesBody> workoutExerciseResponse;
  final workoutService = WorkoutService();
  WorkoutExerciseNotifier(this.ref) {
    workoutExerciseResponse = ApiResponse.loading("Loading");
  }

  ApiResponse<WorkoutExercisesBody> getWorkoutExercisesById({int? id}) {
    workoutExerciseResponse = ApiResponse.loading("Loading");
    notifyListeners();
    workoutService.getWorkoutExercisesById(id: id).then((value) {
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
