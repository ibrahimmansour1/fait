import 'dart:typed_data';

import 'package:fait/source/api/api_response.dart';
import 'package:fait/source/services/profile/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/toast_message.dart';
import '../../models/profile/profile_model.dart';
import 'dart:io';
import 'package:image/image.dart' as img;

final profileProvider = ChangeNotifierProvider<ProfileNotifier>((ref) {
  return ProfileNotifier(ref);
});

class ProfileNotifier extends ChangeNotifier {
  Ref ref;
  final _profileService = ProfileService();
  late ApiResponse<ProfileModel> profileResponse;
  late ApiResponse avatarPicturesResponse;
  String? pastAvatarPicturePath;
  String? currentAvatarPicturePath;
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

  ApiResponse getAvatarPictures(String userId, File image) {
    avatarPicturesResponse = ApiResponse.loading("Loading");
    notifyListeners();
    String outputFilePath = image.path.replaceFirst("jpg", "png");
    _convertJpgToPng(image, outputFilePath);
    _profileService.getAvatarPictures(userId, outputFilePath).then((value) {
      if (value.status == Status.completed) {
        getTemporaryDirectory().then((dire) {
          final File bodyImageFile = File('${dire.path}/bodyImage.png');
          bodyImageFile.createSync();
          bodyImageFile.writeAsBytesSync(value.data!);
          _convertJpgToPng(bodyImageFile, bodyImageFile.path);
          if (pastAvatarPicturePath != null) {
            currentAvatarPicturePath = bodyImageFile.path;
          }
          pastAvatarPicturePath ??= bodyImageFile.path;
          avatarPicturesResponse = value..data = bodyImageFile.path;
          notifyListeners();
        });
      } else {
        ToastMessage(
          bgColor: Colors.red,
          message:
              "Error! ${value.message.toString()} || Status Code: ${value.errorCode.toString()}",
        ).show();
        avatarPicturesResponse = value;
        notifyListeners();
      }
      notifyListeners();
    });
    return avatarPicturesResponse;
  }

  void _convertJpgToPng(File jpgFile, String outputFilePath) {
    // Read the JPG file
    Uint8List imageBytes = jpgFile.readAsBytesSync();

    // Decode the image
    img.Image? jpgImage = img.decodeImage(imageBytes);

    if (jpgImage != null) {
      // Encode the image to PNG
      List<int> pngBytes = img.encodePng(jpgImage);

      // Save the PNG file
      File(outputFilePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(pngBytes);
      print('Converted to PNG: $outputFilePath');
    } else {
      print('Failed to decode JPG image.');
    }
  }
}
