import 'package:fait/source/models/fitness/exercise_response_body_by_name_or_id/exercise_response_body_by_name_or_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/toast_message.dart';
import '../../api/api_response.dart';
import '../../models/fitness/exercise_response_body/exercise_response_body.dart';
import '../../services/exercise/exercise_service.dart';

final exerciseByIdOrNameProvider =
    ChangeNotifierProvider<ExerciseByIdOrNameNotifier>((ref) {
  return ExerciseByIdOrNameNotifier(ref);
});

final exerciseProvider = ChangeNotifierProvider<ExerciseNotifier>((ref) {
  return ExerciseNotifier(ref);
});

class ExerciseNotifier extends ChangeNotifier {
  final Ref ref;
  late ApiResponse<List<ExerciseResponseBody>>
      exerciseResponse; // Change this line
  final exerciseService = ExerciseService();
  ExerciseNotifier(this.ref) {
    exerciseResponse = ApiResponse.loading("Loading");
  }

  Future<ApiResponse<List<ExerciseResponseBody>>> getExercises() async {
    // Change this line
    exerciseResponse = ApiResponse.loading("Loading");
    notifyListeners();
    try {
      final value = await exerciseService.getExercises();
      if (value.status == Status.completed) {
        exerciseResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        exerciseResponse = value;
      }
      notifyListeners();
    } catch (e) {
      exerciseResponse = ApiResponse.error(e.toString(), 0);
      notifyListeners();
    }
    return exerciseResponse;
  }
}

class ExerciseByIdOrNameNotifier extends ChangeNotifier {
  final Ref ref;
  late ApiResponse<ExerciseResponseBodyByNameOrId> exerciseByIdOrNameResponse;
  final exerciseService = ExerciseService();
  ExerciseByIdOrNameNotifier(this.ref) {
    exerciseByIdOrNameResponse = ApiResponse.loading("Loading");
  }

  ApiResponse<ExerciseResponseBodyByNameOrId> getExerciseByIdOrName(
      {int? id, String? name}) {
    exerciseByIdOrNameResponse = ApiResponse.loading("Loading");
    notifyListeners();
    exerciseService.getExerciseByIdOrName(id: id, name: name).then((value) {
      if (value.status == Status.completed) {
        exerciseByIdOrNameResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        exerciseByIdOrNameResponse = value;
      }
      notifyListeners();
    });
    return exerciseByIdOrNameResponse;
  }
}
