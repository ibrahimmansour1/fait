import 'package:fait/source/api/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/toast_message.dart';
import '../../models/diet/diet_model.dart';
import '../../services/diet/diet_service.dart';

final dietsProvider = ChangeNotifierProvider<DietNotifier>((ref) {
  return DietNotifier(ref);
});

class DietNotifier extends ChangeNotifier{
  Ref ref;
  late ApiResponse<List<DietModel>> dietResponses;

  final _dietService = DietService();

  DietNotifier(this.ref) {
    dietResponses = ApiResponse.loading("Loading");
  }


  ApiResponse<List<DietModel>> getDiets() {
    dietResponses = ApiResponse.loading("Loading");
    notifyListeners();
    _dietService.getDiets().then((value) {
      if (value.status != Status.completed) {
        ToastMessage(
          bgColor: Colors.red,
          message:
          "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
      }
      dietResponses = value;
      
      notifyListeners();
    });
    return dietResponses;
  }
}
