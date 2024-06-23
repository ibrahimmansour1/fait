import 'package:fait/source/api/api_response.dart';
import 'package:fait/source/services/profile/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/toast_message.dart';
import '../../models/profile/profile_model.dart';

final profileProvider = ChangeNotifierProvider<ProfileNotifier>((ref) {
  return ProfileNotifier(ref);
});

class ProfileNotifier extends ChangeNotifier {
  Ref ref;
  final _profileService = ProfileService();
  late ApiResponse<ProfileModel> profileResponse;
  late ApiResponse<Map<String, dynamic>> avatarPicturesResponse;
  ProfileNotifier(this.ref) {
    profileResponse = ApiResponse.loading("loading");
    avatarPicturesResponse = ApiResponse.error("Not Initialized", 0);
  }

  ApiResponse<ProfileModel> getProfile(String userId) {
    profileResponse = ApiResponse.loading("Loading");
    notifyListeners();
    _profileService.getProfile(userId).then((value) {
      if (value.status == Status.completed) {
        profileResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        profileResponse = value;
      }
      notifyListeners();
    });
    return profileResponse;
  }

  Future<ApiResponse<Map<String, dynamic>>> updateProfilePicture(
      String userId, String imagePath) {
    return _profileService
        .updateProfilePicture(userId, imagePath)
        .then((value) {
      if (value.status == Status.completed) {
        return value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        return value;
      }
    });
  }

  ApiResponse<Map<String, dynamic>> getAvatarPictures(
      String userId, String imagePath) {
    avatarPicturesResponse = ApiResponse.loading("Loading");
    notifyListeners();
    _profileService.getAvatarPictures(userId, imagePath).then((value) {
      if (value.status == Status.completed) {
        avatarPicturesResponse = value;
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        avatarPicturesResponse = value;
      }
      notifyListeners();
    });
    return avatarPicturesResponse;
  }
}
