import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fait/source/api/api_response.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../utils/constants.dart';
import '../../models/profile/profile_model.dart';

class ProfileService {
  final _internetChecker = InternetConnectionChecker();
  final _dio = Dio();

  Future<ApiResponse<ProfileModel>> getProfile(String userId) async {
    try {
      if (await _internetChecker.hasConnection) {
        final response = await _dio.get(
          "${newBaseUrl}User/$userId/profile",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $userToken",
            },
          ),
        );
        log(response.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (response.data.isEmpty) {
            return ApiResponse.error("No data found", response.statusCode);
          }
          final profileModel = ProfileModel.fromJson(response.data);
          return ApiResponse.completed(profileModel);
        } else {
          return ApiResponse.error("Failed to load data", response.statusCode);
        }
      } else {
        return ApiResponse.error("No Internet Connection", 503);
      }
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(e.toString(), 0);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> updateProfilePicture(
      String userId, String imagePath) async {
    try {
      if (await _internetChecker.hasConnection) {
        final formData =
            FormData.fromMap({"File": MultipartFile.fromFileSync(imagePath)});
        final response = await _dio.post(
          "${newBaseUrl}User/$userId/Change-Image-Profile",
          data: formData,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $userToken",
            },
          ),
        );
        log(response.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (response.data.isEmpty) {
            return ApiResponse.error("No data found", response.statusCode);
          }

          if (!response.data["isSuccess"]) {
            return ApiResponse.error(
                response.data["errors"].toString(), response.statusCode);
          }

          return ApiResponse.completed(response.data);
        } else {
          return ApiResponse.error("Failed to load data", response.statusCode);
        }
      } else {
        return ApiResponse.error("No Internet Connection", 503);
      }
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(e.toString(), 0);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> getAvatarPictures(
      String userId, String imagePath) async {
    try {
      if (await _internetChecker.hasConnection) {
        final formData =
            FormData.fromMap({"File": MultipartFile.fromFileSync(imagePath)});
        final response = await _dio.post(
          "${newBaseUrl}User/$userId/Change-Image-Profile",
          data: formData,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $userToken",
            },
          ),
        );
        log(response.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (response.data.isEmpty) {
            return ApiResponse.error("No data found", response.statusCode);
          }

          return ApiResponse.completed(response.data);
        } else {
          return ApiResponse.error("Failed to load data", response.statusCode);
        }
      } else {
        return ApiResponse.error("No Internet Connection", 503);
      }
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(e.toString(), 0);
    }
  }
}
