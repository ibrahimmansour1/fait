import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fait/source/api/api_response.dart';
import 'package:fait/source/models/fitness/fitness_plan_model.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../utils/constants.dart';

class FitnessPlanService {
  final _intenetChecker = InternetConnectionChecker();
  final _dio = Dio();

  Future<ApiResponse<FitnessPlanModel>> getFitnessPlan() async {
    try {
      if (await _intenetChecker.hasConnection) {
        final response = await _dio.get(
          "${baseUrl}FitnessPlan?pageIndex=0&pageSize=1",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization":
                  "Basic ${base64Encode(utf8.encode("$authUsername:$authPassword"))}",
            },
          ),
        );
        log(response.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (response.data.isEmpty) {
            return ApiResponse.error("No data found", response.statusCode);
          }
          final fitnessPlanModel = FitnessPlanModel.fromJson(response.data[0]);
          return ApiResponse.completed(fitnessPlanModel);
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

  Future<ApiResponse<FitnessPlanModel>> getFitnessPlanOverview(int id) async {
    try {
      if (await _intenetChecker.hasConnection) {
        final response = await _dio.get(
          "${baseUrl}FitnessPlan/$id",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization":
                  "Basic ${base64Encode(utf8.encode("$authUsername:$authPassword"))}",
            },
          ),
        );
        log(response.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (response.data.isEmpty) {
            return ApiResponse.error("No data found", response.statusCode);
          }
          final fitnessPlanModel = FitnessPlanModel.fromJson(response.data);
          return ApiResponse.completed(fitnessPlanModel);
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
