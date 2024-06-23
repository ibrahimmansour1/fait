import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fait/source/api/api_response.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../utils/constants.dart';

class UserService {
  final _internetChecker = InternetConnectionChecker();
  final _dio = Dio();

  Future<ApiResponse<Map<String, dynamic>>> login(
      String username, String password,
      {String? deviceToken}) async {
    try {
      if (await _internetChecker.hasConnection) {
        final response = await _dio.post(
          "${newBaseUrl}Auth/login",
          data: jsonEncode({
            "username": username,
            "deviceToken": deviceToken ?? "",
            "password": password,
          }),
          options: Options(
            headers: {
              "Content-Type": "application/json",
              // "Authorization": "Bearer $userToken",
            },
          ),
        );
        log(response.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (response.data.isEmpty) {
            return ApiResponse.error("No data found", response.statusCode);
          }
          // final userModel = UserModel.fromJson(response.data);

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
