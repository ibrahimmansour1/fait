import 'package:fait/source/models/fitness/fitness_plan_model.dart';
import 'package:fait/source/services/fitness/fitness_plan_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/api_response.dart';

final fitnessPlanProvider = ChangeNotifierProvider<FitnessPlanNotifier>((ref) {
  return FitnessPlanNotifier(ref);
});

class FitnessPlanNotifier extends ChangeNotifier {
  final Ref ref;
  late ApiResponse<FitnessPlanModel> fitnessPlanResponse;
  final fitnessPlanService = FitnessPlanService();
  FitnessPlanNotifier(this.ref) {
    fitnessPlanResponse = ApiResponse.loading("Loading");
  }

  getFitnessPlan() {
    fitnessPlanService.getFitnessPlan().then((value) {
      if (value is FitnessPlanModel) {
        fitnessPlanResponse = ApiResponse.completed(value);
      } else {
        fitnessPlanResponse = ApiResponse.error(value, 404);
      }
      notifyListeners();
    });
    return fitnessPlanResponse;
  }
}
