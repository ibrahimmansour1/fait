import 'package:fait/source/models/fitness/exercise_response_body_by_name_or_id/exercise_response_body_by_name_or_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/toast_message.dart';
import '../../api/api_response.dart';
import '../../services/exercise/exercise_service.dart';

final exerciseProvider = ChangeNotifierProvider<ExerciseNotifier>((ref) {
  return ExerciseNotifier(ref);
});

class ExerciseNotifier extends ChangeNotifier {
  final Ref ref;
  late ApiResponse<ExerciseResponseBodyByNameOrId> exerciseResponse;
  final exerciseService = ExerciseService();
  ExerciseNotifier(this.ref) {
    exerciseResponse = ApiResponse.loading("Loading");
  }

  ApiResponse<ExerciseResponseBodyByNameOrId> getExerciseByIdOrName(
      {int? id, String? name}) {
    exerciseResponse = ApiResponse.loading("Loading");
    notifyListeners();
    exerciseService.getExerciseByIdOrName(id: id, name: name).then((value) {
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
    });
    return exerciseResponse;
  }
}
