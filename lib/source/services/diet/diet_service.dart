import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fait/source/api/api_response.dart';
import 'package:fait/source/models/diet/diet_model.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../utils/constants.dart';

class DietService {
  final _internetChecker = InternetConnectionChecker();
  final _dio = Dio();

  Future<ApiResponse<List<DietModel>>> getDiets() async {
    try {
      if (await _internetChecker.hasConnection) {
        final response = await _dio.get(
          "${baseUrl2}Diet",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization":
                  bearerToken,
            },
          ),
        );
        log(response.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (response.data.isEmpty) {
            return ApiResponse.error("No data found", response.statusCode);
          }
          final diets =
              response.data.map((e) => DietModel.fromJson(e)).toList();
          return ApiResponse.completed(diets);
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
