import 'package:fait/source/models/fitness/fitness_plan_model.dart';
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
  final fitnessPlanService = FitnessPlanService();
  FitnessPlanNotifier(this.ref) {
    fitnessPlanResponse = ApiResponse.loading("Loading");
  }

  ApiResponse<FitnessPlanModel> getFitnessPlan() {
    fitnessPlanResponse = ApiResponse.loading("Loading");
    notifyListeners();
    fitnessPlanService.getFitnessPlan().then((value) {
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
}
