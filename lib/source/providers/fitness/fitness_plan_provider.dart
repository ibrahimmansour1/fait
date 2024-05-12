import 'package:fait/source/models/fitness/fitness_plan_model.dart';
import 'package:fait/source/models/fitness/fitness_plan_workout_model.dart';
import 'package:fait/source/models/fitness/muscle_model.dart';
import 'package:fait/source/services/fitness/fitness_plan_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/toast_message.dart';
import '../../api/api_response.dart';

final fitnessPlanProvider = ChangeNotifierProvider<FitnessPlanNotifier>((ref) {
  return FitnessPlanNotifier(ref);
});

class FitnessPlanNotifier extends ChangeNotifier {
  final Ref ref;
  late ApiResponse<FitnessPlanModel> fitnessPlanResponse;
  late ApiResponse<FitnessPlanModel> fitnessPlanOverviewResponse;
  late ApiResponse<List<MuscleModel>> fitnessPlanMusclesResponse;
  late ApiResponse<List<FitnessPlanWorkoutModel>> fitnessPlanWorkoutsResponse;
  final _fitnessPlanService = FitnessPlanService();
  FitnessPlanNotifier(this.ref) {
    fitnessPlanResponse = ApiResponse.loading("Loading");
    fitnessPlanOverviewResponse = ApiResponse.loading("Loading");
    fitnessPlanMusclesResponse = ApiResponse.loading("Loading");
    fitnessPlanWorkoutsResponse = ApiResponse.loading("Loading");
  }

  ApiResponse<FitnessPlanModel> getFitnessPlan() {
    fitnessPlanResponse = ApiResponse.loading("Loading");
    notifyListeners();
    _fitnessPlanService.getFitnessPlan().then((value) {
      if (value.status == Status.completed) {
        fitnessPlanResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        fitnessPlanResponse = value;
      }
      notifyListeners();
    });
    return fitnessPlanResponse;
  }

  ApiResponse<FitnessPlanModel> getFitnessPlanOverview(int id) {
    fitnessPlanOverviewResponse = ApiResponse.loading("Loading");
    notifyListeners();
    _fitnessPlanService.getFitnessPlanOverview(id).then((value) {
      if (value.status == Status.completed) {
        fitnessPlanOverviewResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        fitnessPlanOverviewResponse = value;
      }
      notifyListeners();
    });
    return fitnessPlanOverviewResponse;
  }

  ApiResponse<List<MuscleModel>> getFitnessPlanMuscles(int fitnessPlanId) {
    fitnessPlanMusclesResponse = ApiResponse.loading("Loading");
    notifyListeners();
    _fitnessPlanService.getFitnessPlanMuscles(fitnessPlanId).then((value) {
      if (value.status == Status.completed) {
        fitnessPlanMusclesResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        fitnessPlanMusclesResponse = value;
      }
      notifyListeners();
    });
    return fitnessPlanMusclesResponse;
  }

  ApiResponse<List<FitnessPlanWorkoutModel>> getFitnessPlanWorkouts(
      int fitnessPlanId) {
    fitnessPlanWorkoutsResponse = ApiResponse.loading("Loading");
    notifyListeners();
    _fitnessPlanService.getFitnessPlanWorkouts(fitnessPlanId).then((value) {
      if (value.status == Status.completed) {
        fitnessPlanWorkoutsResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        fitnessPlanWorkoutsResponse = value;
      }
      notifyListeners();
    });
    return fitnessPlanWorkoutsResponse;
  }

  // TODO: Just for testing
  generateWorkoutsDummyData() {
    fitnessPlanWorkoutsResponse = ApiResponse.completed(
      List.generate(
        8,
        (index) => FitnessPlanWorkoutModel(
          name: "Workout $index",
          playDate: "2024-05-02T15:47:53.006Z",
          numberOfExercises: 3,
          weightLifted: 10,
          durationInMinutes: 32,
        ),
      ),
    );
    notifyListeners();
  }

  // TODO: Just for testing
  generateMusclesDummyData() {
    fitnessPlanMusclesResponse = ApiResponse.completed(
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
