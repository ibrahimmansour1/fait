import 'package:fait/source/api/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/constants.dart';
import '../../../utils/toast_message.dart';
import '../../services/register/user_service.dart';

final userProvider = ChangeNotifierProvider<UserNotifier>((ref) {
  return UserNotifier(ref);
});

class UserNotifier extends ChangeNotifier {
  Ref ref;
  final _userService = UserService();
  late ApiResponse<Map<String, dynamic>> loginResponse;
  UserNotifier(this.ref) {
    loginResponse = ApiResponse.loading("loading");
  }

  ApiResponse<Map<String, dynamic>> login(String username, String password,
      {String? deviceToken}) {
    loginResponse = ApiResponse.loading("Loading");
    notifyListeners();
    _userService
        .login(username.trim(), password.trim(),
            deviceToken: deviceToken?.trim())
        .then((value) {
      if (value.status == Status.completed) {
        userId = loginResponse.data!["id"];
        userToken = loginResponse.data!["token"];

        loginResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        loginResponse = value;
      }
      notifyListeners();
    });
    return loginResponse;
  }
}
