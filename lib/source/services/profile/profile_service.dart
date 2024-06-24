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

  Future<ApiResponse> getAvatarPictures(String userId, String imagePath) async {
    try {
      log(imagePath);
      final formData =
          FormData.fromMap({"image": MultipartFile.fromFileSync(imagePath)});

      final response = await _dio.post(
        "http://192.168.88.150:8000/body_regression_3d",
        data: formData,
        options: Options(
          headers: {
            // Add your custom headers here if needed
          },
          responseType: ResponseType.bytes,
          followRedirects: false, // Disable automatic redirect following
          validateStatus: (status) {
            return status != null && (status == 307 || status < 400);
          },
        ),
      );

      if (response.statusCode == 307) {
        // Handle the redirect manually
        final newUrl = response.headers.value('location');
        if (newUrl != null) {
          final formData1 = FormData.fromMap(
              {"image": MultipartFile.fromFileSync(imagePath)});
          final redirectedResponse = await _dio.post(
            newUrl,
            data: formData1,
            options: Options(
              headers: {
                // Add your custom headers here if needed
              },
              responseType: ResponseType.bytes,
            ),
          );

          log(redirectedResponse.toString());
          if (redirectedResponse.statusCode == 200 ||
              redirectedResponse.statusCode == 201) {
            if (redirectedResponse.data.isEmpty) {
              return ApiResponse.error(
                  "No data found", redirectedResponse.statusCode);
            }

            return ApiResponse.completed(redirectedResponse.data);
          } else {
            return ApiResponse.error(
                "Failed to load data", redirectedResponse.statusCode);
          }
        } else {
          return ApiResponse.error(
              "Redirected URL not found", response.statusCode);
        }
      }

      log(response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data.isEmpty) {
          return ApiResponse.error("No data found", response.statusCode);
        }

        return ApiResponse.completed(response.data);
      } else {
        return ApiResponse.error("Failed to load data", response.statusCode);
      }
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(e.toString(), 0);
    }
  }
}
