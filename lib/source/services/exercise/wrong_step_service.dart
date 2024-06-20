import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../utils/constants.dart';
import '../../api/api_response.dart';
import '../../models/fitness/wrong_step_model.dart';

class WrongStepService {
  final _internetChecker = InternetConnectionChecker();
  final _dio = Dio();

  Future<ApiResponse<WrongStepModel>> getWrongStepData(
      {required Uint8List image}) async {
    try {
      if (await _internetChecker.hasConnection) {
        final formData = FormData.fromMap({
          "image": MultipartFile.fromBytes(image.toList(), filename: "image.jpg")
        });
        final response = await _dio.post(
          // "${baseUrl}/process_image",
          "http://192.168.227.137:5000/process_image",
          data: formData,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              // "Authorization":
              //     "Basic ${base64Encode(utf8.encode("$authUsername:$authPassword"))}",
            },
          ),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (response.data.isEmpty) {
            return ApiResponse.error("No data found", response.statusCode);
          }
          final data = jsonDecode(response.data);
          final wrongStepModel =
              WrongStepModel.fromJson(data[0]);
          return ApiResponse.completed(wrongStepModel);
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
