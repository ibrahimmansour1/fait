import 'dart:io';

import 'package:fait/source/models/fitness/wrong_step_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/toast_message.dart';
import '../../api/api_response.dart';
import '../../services/exercise/wrong_step_service.dart';

final wrongStepProvider = ChangeNotifierProvider<WrongStepNotifier>((ref) {
  return WrongStepNotifier(ref);
});

class WrongStepNotifier extends ChangeNotifier {
  final Ref ref;
  late ApiResponse<WrongStepModel> wrongStepResponse;
  final _wrongStepService = WrongStepService();
  WrongStepNotifier(this.ref) {
    wrongStepResponse = ApiResponse.loading("Loading");
  }

  ApiResponse<WrongStepModel> getWrongStepData({int? id}) {
    wrongStepResponse = ApiResponse.loading("Loading");
    notifyListeners();
    _wrongStepService.getWrongStepData(id: id).then((value) async {
      if (value.status == Status.completed) {
        final tempDir = await getTemporaryDirectory();

        final File model3DFile =
            await File('${tempDir.path}/model3D.glb').create();

        model3DFile.writeAsBytesSync(value.data!.model3D! as List<int>);

        value.data!.model3D = model3DFile.path;

        wrongStepResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        wrongStepResponse = value;
      }
      notifyListeners();
    });
    return wrongStepResponse;
  }
}
